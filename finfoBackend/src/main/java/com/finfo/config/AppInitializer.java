package com.finfo.config;

import javax.servlet.ServletContext;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRegistration.Dynamic;  

import org.springframework.web.WebApplicationInitializer;  
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;  
import org.springframework.web.servlet.DispatcherServlet;  

import com.finfo.schedular.DataReaderWriter;

public class AppInitializer implements WebApplicationInitializer{

	@Override
		public void onStartup(ServletContext servletContext) throws ServletException {  
	        AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();  
	        ctx.register(AppConfig.class);  
	        ctx.setServletContext(servletContext);    
	        Dynamic dynamic = servletContext.addServlet("dispatcher", new DispatcherServlet(ctx));  
	        dynamic.addMapping("/");  
	        dynamic.setLoadOnStartup(1);
	        DataReaderWriter dataReaderWriter = new DataReaderWriter();
	        dataReaderWriter.readData();
	}

}
