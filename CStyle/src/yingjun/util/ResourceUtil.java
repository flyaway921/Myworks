package yingjun.util;

import java.util.ResourceBundle;

/**
 * 项目参数工具类

 */
public class ResourceUtil {

	private static final ResourceBundle bundle = ResourceBundle.getBundle("config");



	/**
	 * 获得上传表单域的名称
	 * 
	 * @return
	 */
	public static final String getUploadFieldName() {
		return bundle.getString("uploadFieldName");
	}

	/**
	 * 获得上传文件的最大大小限制
	 * 
	 * @return
	 */
	public static final long getUploadFileMaxSize() {
		return Long.valueOf(bundle.getString("uploadFileMaxSize"));
	}

	/**
	 * 获得允许上传文件的扩展名

	 */
	public static final String getUploadFileExts() {
		return bundle.getString("uploadFileExts");
	}
	/**
	 * 获得允许上传图片的扩展名

	 */
	public static final String getImagesFileExts() {
		return bundle.getString("imageFileExt");
	}
	
	
	
	/**
	 * 获得上传文件要放到那个目录
	 * 
	 */
	public static final String getUploadDirectory() {
		return bundle.getString("uploadDirectory");
	}

}
