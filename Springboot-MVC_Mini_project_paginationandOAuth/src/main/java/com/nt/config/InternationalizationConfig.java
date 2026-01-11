
	package com.nt.config;

	import java.util.Locale;
	import org.springframework.context.annotation.Bean;
	import org.springframework.context.annotation.Configuration;
	import org.springframework.web.servlet.LocaleResolver;
	import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
	import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
	import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
	import org.springframework.web.servlet.i18n.SessionLocaleResolver;

	@Configuration
	public class InternationalizationConfig implements WebMvcConfigurer {

	    @Bean(name = "localeResolver")
	     LocaleResolver createSLresolver() {
	        SessionLocaleResolver resolver = new SessionLocaleResolver();
	        resolver.setDefaultLocale(new Locale("en", "US")); // ✅ compatible
	        return resolver;
	    }

	    @Bean
	     LocaleChangeInterceptor localeChangeInterceptor() {
	        LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
	        interceptor.setParamName("lang");
	        return interceptor;
	    }

	    @Override
	    public void addInterceptors(InterceptorRegistry registry) {
	        registry.addInterceptor(localeChangeInterceptor());
	    }
	}


