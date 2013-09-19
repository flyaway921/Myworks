package yingjun.test;


import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;

import java.util.UUID;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import yingjun.dao.impl.BaseDaoImpl;
import yingjun.dto.UserDTO;
import yingjun.model.Meau;
import yingjun.service.MeauServiceI;
import yingjun.service.UserServiceI;
import yingjun.util.Encrypt;




public class SpringTest    {
	ArrayList<String> filelist = new ArrayList<String>(); 
	
	
	
	@Test
	public void scanfile() {
		
		refreshFileList("D:\\tomcat6\\webapps\\CStyle\\filelibs");
	}

	public  void refreshFileList(String strPath) {
	   
		File dir = new File(strPath);
		File[] files = dir.listFiles();

		if (files == null)
			return;
		for (int i = 0; i < files.length; i++) {
			if (files[i].isDirectory()) {
				refreshFileList(files[i].getAbsolutePath());
			} else {
				String strFileName = files[i].getAbsolutePath();
				System.out.println("---" + strFileName);
				filelist.add(files[i].getAbsolutePath());
			}
		}
	 }
	
	
	
	@Test
	public void TestBigDecimal(){
	
		System.out.println(BigDecimal.valueOf(1));
		System.out.println(BigDecimal.valueOf(2));
	}

	
	
	@Test
	public void sshtestuser(){	
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		UserServiceI userService=(UserServiceI)ac.getBean("userService");
		for(int i=0;i<50;i++){
		UserDTO u=new UserDTO();
		u.setId(UUID.randomUUID().toString());
		u.setName(i+"");
		u.setCreatedatetime(new Date());
		u.setModifydatetime(new Date());
		u.setPwd(Encrypt.e("yingjun"));
		userService.add(u);
		}
	}
	
	@Test
	public void sshtestmeau(){	
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		BaseDaoImpl<Meau> meauService=(BaseDaoImpl<Meau>)ac.getBean("meauDao");
		
	    Meau m=new Meau();
		m.setId("yhgl");
		m.setText("用户管理");
		m.setSeq(1);
		meauService.save(m);
		
	    Meau m1=new Meau();
	    m1.setId("bkgl");
		m1.setText("版块管理");
		m1.setSeq(3);
		meauService.save(m1);
		
	    Meau m2=new Meau();
	    m2.setId("xtgl");
		m2.setText("系统管理");
		m2.setSeq(2);
		meauService.save(m2);
		
	    Meau m3=new Meau();
	    m3.setId("sjcgl");
		m3.setText("数据池管理");
		m3.setSeq(4);
		meauService.save(m3);
	
	    Meau m4=new Meau();
	    m4.setId("yhxx");
		m4.setText("用户信息");
		m4.setPmenu(m);
		m4.setSeq(1);
		meauService.save(m4);
		
		  Meau m5=new Meau();
		  m5.setId("qxgl");
		  m5.setText("权限管理");
	      m5.setPmenu(m);
	      m5.setSeq(2);
		  meauService.save(m5);
		  
		  Meau m6=new Meau();
		  m6.setId("xscg");
		  m6.setText("学术成果");
	      m6.setPmenu(m1);
	      m6.setSeq(1);
		  meauService.save(m6);
		  
		  Meau m7=new Meau();
		  m7.setId("tlsq");
		  m7.setText("讨论社区");
	      m7.setPmenu(m1);
	      m7.setSeq(2);
		  meauService.save(m7);
		  
		  Meau m8=new Meau();
		  m8.setId("spzq");
		  m8.setText("视频专区");
	      m8.setPmenu(m1);
	      m8.setSeq(3);
		  meauService.save(m8);
		  
		  Meau m9=new Meau();
		  m9.setId("xsbd");
		  m9.setText("学术榜单");
	      m9.setPmenu(m1);
	      m9.setSeq(4);
		  meauService.save(m9);
		  
		  Meau m10=new Meau();
		  m10.setId("xslw");
		  m10.setText("学术论文");
	      m10.setPmenu(m6);
	      m10.setSeq(1);
		  meauService.save(m10);
		  
		  Meau m11=new Meau();
		  m11.setId("kybg");
		  m11.setText("科研报告");
	      m11.setPmenu(m6);
	      m11.setSeq(2);
		  meauService.save(m11);
		  
		  Meau m12=new Meau();
		  m12.setId("sytphb");
		  m12.setText("摄影/图片/海报");
	      m12.setPmenu(m6);
	      m12.setSeq(4);
		  meauService.save(m12);
		  
		  Meau m13=new Meau();
		  m13.setId("jyjc");
		  m13.setText("经验教程");
	      m13.setPmenu(m6);
	      m13.setSeq(3);
		  meauService.save(m13);
		  
		  Meau m14=new Meau();
		  m14.setId("yrzp");
		  m14.setText("软/硬件作品");
	      m14.setPmenu(m6);
	      m14.setSeq(5);
		  meauService.save(m14);
		  
		  Meau m15=new Meau();
		  m15.setId("xxsh");
		  m15.setText("学习生活");
	      m15.setPmenu(m7);
	      m15.setSeq(1);
		  meauService.save(m15);
		  
		  Meau m16=new Meau();
		  m16.setId("qzjy");
		  m16.setText("求职经验");
	      m16.setPmenu(m7);
	      m16.setSeq(2);
		  meauService.save(m16);

		  Meau m17=new Meau();
		  m17.setId("kyjy");
		  m17.setText("考研经验");
	      m17.setPmenu(m7);
	      m17.setSeq(3);
		  meauService.save(m17);

		  Meau m18=new Meau();
		  m18.setId("cyjl");
		  m18.setText("创业交流");
	      m18.setPmenu(m7);
	      m18.setSeq(4);
		  meauService.save(m18);
		  
		  Meau m19=new Meau();
		  m19.setId("zlgx");
		  m19.setText("资料共享");
	      m19.setPmenu(m7);
	      m19.setSeq(7);
		  meauService.save(m19);
  
		  Meau m20=new Meau();
		  m20.setId("xwss");
		  m20.setText("新闻时事");
	      m20.setPmenu(m7);
	      m20.setSeq(5);
		  meauService.save(m20);
		  
		  Meau m21=new Meau();
		  m21.setId("tpxc");
		  m21.setText("图片相册");
	      m21.setPmenu(m7);
	      m21.setSeq(6);
		  meauService.save(m21);
		  
		  Meau m22=new Meau();
		  m22.setId("spjc");
		  m22.setText("教程视频");
	      m22.setPmenu(m8);
	      m22.setSeq(1);
		  meauService.save(m22);
		  
		  Meau m23=new Meau();
		  m23.setId("qtsp");
		  m23.setText("其他视频");
	      m23.setPmenu(m8);
	      m23.setSeq(2);
		  meauService.save(m23);
		  
		  Meau m24=new Meau();
		  m24.setId("xscgbd");
		  m24.setText("学术成果榜单");
	      m24.setPmenu(m9);
	      m24.setSeq(2);
		  meauService.save(m24);
		  
		  Meau m25=new Meau();
		  m25.setId("tlqbd");
		  m25.setText("讨论版块榜单");
	      m25.setPmenu(m9);
	      m25.setSeq(3);
		  meauService.save(m25);
		  
		  Meau m26=new Meau();
		  m26.setId("zbd");
		  m26.setText("总榜单");
	      m26.setPmenu(m9);
	      m26.setSeq(1);
		  meauService.save(m26);
		  
		  Meau m27=new Meau();
		  m27.setId("cdgl");
		  m27.setText("菜单管理");
	      m27.setPmenu(m2);
	      m27.setSeq(1);
		  meauService.save(m27);
	}
	

}
