package com.psh;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@SpringBootApplication
//@EnableAutoConfiguration(exclude = { DataSourceTransactionManagerAutoConfiguration.class, DataSourceAutoConfiguration.class })
public class BaseApplication {

	public static void main(String[] args) {
		SpringApplication.run(BaseApplication.class, args);
	}

	/*
	 * MYCF : jsp 설정
	 */
	@Bean
 	public InternalResourceViewResolver setupViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/jsp/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	/*
	 * MYCF : restTemplate 설정
	 */
	@Bean
	public RestTemplate geRestTemplate() {
		return new RestTemplate();
	}

	/*
	 * MYCF : h2 console 설정
	 */
//	@Bean
//	ServletRegistrationBean h2servletRegistration(){
//		ServletRegistrationBean registrationBean = new ServletRegistrationBean( new WebServlet());
//		registrationBean.addUrlMappings("/console/*");
//		return registrationBean;
//	}

}
