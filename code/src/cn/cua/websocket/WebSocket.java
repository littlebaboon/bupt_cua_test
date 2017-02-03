package cn.cua.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.Endpoint;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerApplicationConfig;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.server.ServerEndpointConfig;

import cn.cua.utils.MessageUtil;


@ServerEndpoint(value="/WebSocketDemo",configurator=GetHttpSessionConfigurator.class)
public class WebSocket{
	private static final Map<HttpSession,WebSocket> onlineUsers = new HashMap<HttpSession, WebSocket>();
    private HttpSession httpSession;
    private Session session;
    boolean isCustomer;//是客服还是客户
    boolean isOffline = false;//是否在线
    //所有在线客服所对应的客户数
    private List<Integer> service_customerNum = new ArrayList<Integer>();
    //当前所有在线的客服列表
    private List<WebSocket> currentCusservice = new ArrayList<WebSocket>();
    //如果是客服端，需要当前连接的客户
    List<WebSocket> customers = new ArrayList<WebSocket>();
    //如果是客户端，需要当前连接的客服
    WebSocket cusservice;
    //名称
    String name;
    String businessId;//记录客服所属的商家或客户所浏览产品所属商家

	@OnOpen
	public void handleOpen(Session session, EndpointConfig config) {
		this.session = session;
		this.httpSession = (HttpSession) config.getUserProperties().get(
				HttpSession.class.getName());
		businessId = (String) httpSession.getAttribute("businessId");
		if (httpSession.getAttribute("usrType") == "1") {
			System.out.println("现在建立连接的是客户");
			name = "客户" + this.session.getId();
			boolean assigned = false;
			isCustomer = true;
			// 获取所有在线客服连接用户数
			int i = 0;
			WebSocket currentSocket = new WebSocket();
			for (HttpSession key : onlineUsers.keySet()) {
				currentSocket = onlineUsers.get(key);
				if (!currentSocket.isCustomer && currentSocket.businessId.equals(businessId)) {
					currentCusservice.add(currentSocket);
					service_customerNum.add(currentCusservice.get(i).customers.size());
					System.out.println(currentCusservice.get(i).name + "客户数为"
							+ currentCusservice.get(i).customers.size());
					i++;
				}
			}
			int currentCusserviceNum = currentCusservice.size();
			int tempCustorNum[] = new int[currentCusserviceNum];
			for (int serviceNumber = 0; serviceNumber < currentCusserviceNum; serviceNumber++) {
				tempCustorNum[serviceNumber] = service_customerNum.get(serviceNumber);
			}
			// 将客户分配给合适的客服
			int selectedService = 0;
			selectedService = getCusservicePos(tempCustorNum);
			assigned = isAssigned(selectedService);
			// 没有被分配到客服
			if (!assigned) {
				String content = MessageUtil.sendContent(
						MessageUtil.NOTASSIGNED, name);
				System.out.println("当前还没有客服");
				try {
					session.getBasicRemote().sendText(content);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else{// 被分配到了客服
				//customerNum[selectedService]++;
				service_customerNum.set(selectedService, (service_customerNum.get(selectedService)+1));
				currentCusservice.get(selectedService).customers.add(this);// 把当前用户加入客服的用户列表中
				cusservice = currentCusservice.get(selectedService);
				System.out.println("cusservice" + cusservice.name);
				assigned = true;
				currentSocket = cusservice;
				try {
					String content = MessageUtil.sendContent(
							MessageUtil.NEWCUSTOMER, name);
					currentSocket.session.getBasicRemote().sendText(content);
					content = MessageUtil.sendContent(MessageUtil.ASSIGNSUPPORT,
							currentSocket.name);
					session.getBasicRemote().sendText(content);
					content = MessageUtil
							.sendContent(MessageUtil.NEWCUSTOMER, name);
					session.getBasicRemote().sendText(content);
				} catch (IOException e) {
					e.printStackTrace();
				}
				onlineUsers.put(httpSession, this);
				System.out.println("当前在线人数：" + onlineUsers.size());
			}
		}
		if (httpSession.getAttribute("usrType") == "2") {
			System.out.println("现在建立连接的是客服，名字是"
					+ httpSession.getAttribute("usrName"));
			name = (String) this.httpSession.getAttribute("usrName");
			onlineUsers.put(httpSession, this);
			System.out.println("当前在线人数：" + onlineUsers.size());
			isCustomer = false;
			// 告诉客服他自己的名字
			String content = MessageUtil.sendContent(MessageUtil.NEWSUPPORT,
					name);
			try {
				session.getBasicRemote().sendText(content);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@OnMessage
	public void handleMessage(String message, Session session) {
		WebSocket connectedSocket = null;
		// 找到当前发消息来的socket
		for (HttpSession key : onlineUsers.keySet()) {
			WebSocket currentSocket = onlineUsers.get(key);
			if (currentSocket.session.equals(session)) {
				connectedSocket = currentSocket;
				break;
			}
		}
		// 如果消息来自客户
		if (connectedSocket.isCustomer) {
			HashMap<String, String> messageMap = MessageUtil
					.getMessage(message);
			String mapContent = messageMap.get("content");
			try {
				String content = MessageUtil.sendToSupport(MessageUtil.MESSAGE,
						connectedSocket.name, mapContent);
				connectedSocket.cusservice.session.getBasicRemote().sendText(
						content);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {// 如果消息来自客服
			HashMap<String, String> messageMap = MessageUtil
					.getMessage(message);
			if (messageMap.get("type").equals("message")) {// 如果发的是消息
				for (WebSocket customer : connectedSocket.customers) {
					if (customer.name.equals(messageMap.get("toname"))) {
						String content = MessageUtil.sendContent(
								MessageUtil.MESSAGE, messageMap.get("content"));
						try {
							customer.session.getBasicRemote().sendText(content);
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
	}

	@OnClose
	public void handleClose() {
		if (this.isCustomer) {// 断开连接的是客户
			isOffline = true;
			if (cusservice != null) {
				if (!cusservice.isOffline) {// 客服还没断线
					String content = MessageUtil.sendContent(
							MessageUtil.USERLOGOUT, this.name);
					try {
						this.cusservice.session.getBasicRemote().sendText(
								content);
					} catch (IOException e) {
						e.printStackTrace();
					}
					for (int i = 0; i < cusservice.customers.size(); i++) {// 从客服的客户列表中删除当前的客户
						if (cusservice.customers.get(i).name.equals(this.name)) {
							cusservice.customers.remove(i);
							break;
						}
					}
				}
			}
		} else {// 断开连接的是客服
			isOffline = true;
			String content = MessageUtil.sendContent(MessageUtil.USERLOGOUT,
					this.name);
			for (WebSocket customer : customers) {// 告诉连接的客户客服断开连接了
				try {
					customer.session.getBasicRemote().sendText(content);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		onlineUsers.remove(this.httpSession);// 从set中删除
		this.httpSession.removeAttribute("usrType");
		this.httpSession.removeAttribute("usrName");
		this.httpSession.removeAttribute("businessId");
	}

	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}

	// 给用户分配客服
	public int getCusservicePos(int originArr[]) {
		try {
			int origin[] = new int[originArr.length];
			for (int i = 0; i < originArr.length; i++) {
				origin[i] = originArr[i];
			}
			for (int m = 0; m < origin.length; m++) {
				System.out.println("第" + m + "为" + origin[m]);
			}
			int i = 0;
			originArr = makeMinHeap(originArr, originArr.length);
			int min = originArr[0];
			int posi = 1;
			for (i = 0; i < origin.length; i++) {
				if (min == origin[i]) {
					posi = i;
					break;
				}
			}
			System.out.println("======最小的数为" + min + "======");
			System.out.println("=======位置为" + posi + "======");
			return posi;
		} catch (Exception ex) {
			return -1;
		}
	}
	
	//判断客服是否分配成功
	public boolean isAssigned(int cusservicenum){
		if(cusservicenum < 0){//没有被分配到客服
			return false;
		}else{
			if(currentCusservice.get(cusservicenum).customers.size() < 2)
				return true;
			else
				return false;
		}
	}
	/**
	 * 删除小顶堆的堆顶，重新自顶向下，重新建成小顶堆
	 * 
	 * @param a
	 *            小顶堆数组
	 * @param n
	 *            节点个数
	 * @return 小顶堆数组
	 */
	public static int[] minHeapDeleteNumber(int a[], int n) {
		// 将a[0]与a[n-1]互换
		int temp = a[0];
		a[0] = a[n - 1];
		a[n - 1] = temp;

		// 节点个数-1
		return minHeapFixdown(a, 0, n - 1);
	}

	/**
	 * 将以编号i为根节点的子树变成符合小顶堆性质
	 * 
	 * @param a
	 *            数组
	 * @param i
	 *            父节点
	 * @param n
	 *            节点个数
	 * @return 小顶堆数组
	 */
	public static int[] minHeapFixdown(int[] a, int i, int n) {
		if (n == 1)
			return a;
		int f_node = i;
		// 做孩子节点
		int c_node = f_node * 2 + 1;
		// 直至孩子节点编号<节点数n,不断循环
		while (c_node < n) {
			int temp = a[f_node];

			// 如果右节点存在且比左节点小,将childNode变为右子节点的编号
			// 孩子节点转化为有孩子节点
			if (c_node + 1 < n && a[c_node + 1] < a[c_node])
				c_node++;
			// 如果孩子节点大于父节点，停止
			if (a[c_node] >= temp)
				break;
			// 父节点取孩子节点的值
			a[f_node] = a[c_node];
			a[c_node] = temp;
			// 以该孩子节点为父节点
			f_node = c_node;
			c_node = f_node * 2 + 1;
		}
		return a;
	}

	/**
	 * 将数组化成二叉堆
	 * 
	 * @param a
	 * @param n
	 * @return
	 */
	public static int[] makeMinHeap(int[] a, int n) {
		for (int i = n / 2 - 1; i >= 0; i--)
			a = minHeapFixdown(a, i, n);
		return a;
	}

	public static void arrayToString(int[] a, int n) {
		String s = "";
		for (int i = 0; i < n; i++) {
			s = s + a[i] + ",";
		}
		s = s.substring(0, s.length() - 1);
		System.out.println(s);
	}

}