package com.finfo.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.WebApplicationInitializer;

public class AppInitializer implements WebApplicationInitializer{

	@Override
	public void onStartup(ServletContext context) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Init...");
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		ctx.register(AppConfig.class);
		ctx.setServletContext(context);
		//context.addListener(new ContextLoaderListener(ctx));

		
		ServletRegistration.Dynamic servlet = context.addServlet(
                "dispatcher", new DispatcherServlet(ctx));
 
        servlet.setLoadOnStartup(1);
        servlet.addMapping("/");
	}

}
