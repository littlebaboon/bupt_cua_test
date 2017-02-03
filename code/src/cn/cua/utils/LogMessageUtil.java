package cn.cua.utils;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;



public class LogMessageUtil {
	public static void log(String message) throws IOException{
		URL pathURL = LogMessageUtil.class.getClassLoader().getResource("");
		String path = pathURL.toString();
		path = path.replace("file:/", "");
		path = path.replace("WEB-INF/classes/", "");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = df.format(new Date());
		File file = new File(path+"/log_good.txt");
		if(!file.exists()){
			//file.createNewFile();
		}
		FileWriter writer = new FileWriter(file, true);  
		String logContent = time + " --- " + message + "\n\r";
		writer.write(logContent);
		writer.close();
	}
}
