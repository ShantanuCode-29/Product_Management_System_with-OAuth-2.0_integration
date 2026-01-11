package com.nt.config;

import javax.sql.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity http, UserDetailsService uds) throws Exception {

	    http
	        .authorizeHttpRequests(auth -> auth
	            .requestMatchers("/register", "/register-user", "/oauth2/**").permitAll()
	            .anyRequest().authenticated()
	        )
	        .formLogin(form -> form
	            .defaultSuccessUrl("/", true)  // After successful login → home
	            .permitAll()
	        )
	        .oauth2Login(oauth -> oauth
	            .defaultSuccessUrl("/", true)
	        )
	        .logout(logout -> logout
	            .logoutSuccessUrl("/login?logout")
	            .permitAll()
	        )
	        .csrf(csrf -> csrf.disable());

	    return http.build();
	}


    @Bean
    UserDetailsService userDetailsService(DataSource dataSource) {
        return new JdbcUserDetailsManager(dataSource);
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
