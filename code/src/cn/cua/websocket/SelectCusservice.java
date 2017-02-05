package cn.cua.websocket;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * 小顶堆排序
 */
public class SelectCusservice {
	

	public int getCusservicePos (int originArr[]){
		int pos = 0;
		int origin[]=new int[originArr.length];
		for(int i=0;i<originArr.length;i++){
			origin[i]=originArr[i];
		}
		for(int m=0;m<origin.length;m++){
			System.out.println("第"+m+"为"+origin[m]);
		}
		int i = 0;
		originArr = makeMinHeap(originArr,originArr.length);
		int min = originArr[0];
		
		int posi=1;
		for(i=0;i<origin.length;i++){
			if(min==origin[i]){
				posi=i;
				break;
			}	
		}
		System.out.println("======最小的数为"+min+"======");
		System.out.println("=======位置为"+posi+"======");
		return posi;
	}
	

	/**
	 * 删除小顶堆的堆顶，重新自顶向下，重新建成小顶堆
	 * @param a 小顶堆数组
	 * @param n 节点个数
	 * @return 小顶堆数组
	 */
	public static int[] minHeapDeleteNumber(int a[], int n)  
	{  
		//将a[0]与a[n-1]互换
		int temp = a[0];
		a[0] = a[n-1];
		a[n-1] = temp;
		
		//节点个数-1
	    return minHeapFixdown(a,0,n - 1);
	}
	
	/**
	 * 将以编号i为根节点的子树变成符合小顶堆性质
	 * @param a 数组
	 * @param i 父节点
	 * @param n 节点个数
	 * @return 小顶堆数组
	 */
	public static int[] minHeapFixdown(int[] a,int i, int n){
		if(n==1) return a;
		int f_node = i;
		//做孩子节点
		int c_node = f_node*2+1;
		//直至孩子节点编号<节点数n,不断循环
		while(c_node<n){
			int temp = a[f_node];
			
			//如果右节点存在且比左节点小,将childNode变为右子节点的编号
			//孩子节点转化为有孩子节点
			if(c_node+1<n&&a[c_node+1]<a[c_node])
				c_node++;
			//如果孩子节点大于父节点，停止
			if(a[c_node]>=temp)
				break;
			//父节点取孩子节点的值
			a[f_node] = a[c_node];
			a[c_node] = temp;
			//以该孩子节点为父节点
			f_node = c_node;
			c_node = f_node*2+1;
		}
		return a;
	}
	/**
	 * 将数组化成二叉堆
	 * @param a
	 * @param n
	 * @return
	 */
	public static int[] makeMinHeap(int[] a, int n){
		for(int i = n/2-1; i>=0;i--)
			a = minHeapFixdown(a,i,n);
		return a;
	}
	public static void arrayToString(int[] a, int n){
		String s = "";
		for(int i = 0; i<n; i++){
			s = s+a[i]+",";
		}
		s = s.substring(0, s.length()-1);
		System.out.println(s);
	}
}
