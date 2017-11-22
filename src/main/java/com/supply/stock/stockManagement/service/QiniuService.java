package com.supply.stock.stockManagement.service;

import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
 
@Service("qiniuService")
public class QiniuService {
	// 设置好账号的ACCESS_KEY和SECRET_KEY
	String ACCESS_KEY = "37UMIRjcJ7GuWAdyMkzl9zAG4tEFH4bJl1kN4hTe";
	String SECRET_KEY = "5q4d3KbG5R7KMOxzgLIy2aqEnRFaK_g3JHii_zoD";
	// 要上传的空间
	String bucketname = "stockmanagement";
	// 上传到七牛后保存的文件名
	//String key = "hello.jpg";
	// 上传文件的路径
	//String FilePath = "D:\\wooyun\\hello.jpg";

	// 密钥配置
	Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);

	Configuration cfg = new Configuration(Zone.zone0());
	// 创建上传对象
	UploadManager uploadManager = new UploadManager(cfg);

	String upToken = auth.uploadToken(bucketname);


	public boolean upload(MultipartFile file, String key) {
		try {
			// 调用put方法上传
			Response res = uploadManager.put(file.getBytes(), key, upToken);
			// 打印返回的信息
			System.out.println(res.bodyString());
			return true;
		} catch (QiniuException e) {
			Response r = e.response;
			// 请求失败时打印的异常的信息
			System.out.println(r.toString());
			try {
				// 响应的文本信息
				System.out.println(r.bodyString());
			} catch (QiniuException e1) {
				// ignore
			}
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}

}