package com.carportal.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	System.out.println("At Authen configure");
        auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
 
    	System.out.println("At Security configure");
        http
                .formLogin()
                    .loginPage("/loginForm")
                    .loginProcessingUrl("/loginForm")
                    .failureUrl("/login_error")
                    .permitAll()
                    .defaultSuccessUrl("/homepage", true)
                .and()
                .csrf()
                .and()
                .authorizeRequests()
                    .antMatchers("/").permitAll()
                    .antMatchers("/css/**").permitAll()
                    .antMatchers("/images/**").permitAll()
                    .antMatchers("/js/**").permitAll()
                    .antMatchers(HttpMethod.GET, "/favicon.*").permitAll()
                    .antMatchers(HttpMethod.GET, "/loginForm").permitAll()
                    .antMatchers(HttpMethod.GET, "/homepage").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.GET, "/userProfile").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.GET, "/carDetails").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.GET, "/userManagement").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/view").hasRole("Administrator")
                    .antMatchers(HttpMethod.POST, "/edit").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/delete").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/carManagement").hasRole("Administrator")
                    .antMatchers(HttpMethod.POST, "/edit_car").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/delete_car").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/deleteCar").hasRole("Users")
                .and()
                .logout()
                    .logoutSuccessUrl("/loginForm")
                    .invalidateHttpSession(true);
                  
    }
}
