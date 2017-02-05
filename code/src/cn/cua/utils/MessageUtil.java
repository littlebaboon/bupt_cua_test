package cn.cua.utils;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.google.gson.Gson;

public class MessageUtil {
	
	public final static String TYPE = "type";
	public final static String DATA = "data";
	public final static String MESSAGE = "message";
	public final static String ASSIGNSUPPORT = "assignsupport";
	public final static String NOTASSIGNED = "notassigned";
	public final static String NEWSUPPORT = "newsupport";
	public final static String NEWCUSTOMER = "newcustomer";
	public final static String CUSTOMERNAME = "customername";
	public final static String USER = "user";
	public final static String USERLOGOUT = "userlogout";
	

	public static HashMap<String,String> getMessage(String msg) {
		JSONObject jsonObject = JSONObject.fromObject(msg);
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("type", jsonObject.get("type").toString());
		map.put("fromname", jsonObject.get("fromname").toString());
		map.put("toname", jsonObject.get("toname").toString());
		map.put("content", jsonObject.get("content").toString());
		return map;
	}

	public static String sendContent(String type, String content) {
		Map<String,Object> userMap = new HashMap<String,Object>();
		userMap.put(MessageUtil.TYPE, type);
		userMap.put(MessageUtil.DATA, content);
		Gson gson = new Gson();
		String jsonMsg = gson.toJson(userMap);
		return jsonMsg;
	}
	
	public static String sendToSupport(String type, String customername, String content) {
		Map<String,Object> userMap = new HashMap<String,Object>();
		userMap.put(MessageUtil.TYPE, type);
		userMap.put(MessageUtil.CUSTOMERNAME, customername);
		userMap.put(MessageUtil.DATA, content);
		Gson gson = new Gson();
		String jsonMsg = gson.toJson(userMap);
		return jsonMsg;
	}
}
