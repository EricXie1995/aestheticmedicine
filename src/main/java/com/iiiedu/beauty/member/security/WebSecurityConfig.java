package com.iiiedu.beauty.member.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.iiiedu.beauty.member.services.MemberOAuth2UserService;
import com.iiiedu.beauty.member.services.MemberServices;
import com.iiiedu.beauty.member.services.MemberUserDetailsService;



@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    @Autowired
    private MemberOAuth2UserService oauthUserService;

    @Autowired
    private MemberServices memberServices;

    @Bean
    public UserDetailsService userDetailsService(){ return  new MemberUserDetailsService();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Bean
    public PersistentTokenRepository persistentTokenRepository(){
        JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
        jdbcTokenRepository.setDataSource(dataSource);
//        jdbcTokenRepository.setCreateTableOnStartup(true);
        return jdbcTokenRepository;
    }


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/member/**", "/memberDetails/**").authenticated()
                .anyRequest().permitAll()
                .and()
                    .csrf().disable()
                    .formLogin()
                    .loginPage("/member/login")
                    .usernameParameter("memberAccount")
                    .passwordParameter("memberPwd")
                    .defaultSuccessUrl("/member/login")
                    .failureUrl("/member/login?error=true")
                    .permitAll()
                .and()
                    .logout().logoutSuccessUrl("/").permitAll()
                .and()
                    .rememberMe().tokenRepository(persistentTokenRepository())
                    .tokenValiditySeconds(3600)
                .and()
                    .oauth2Login().loginPage("/login").userInfoEndpoint().userService(oauthUserService)
                .and()
                    .successHandler(new AuthenticationSuccessHandler() {

                        @Override
                        public void onAuthenticationSuccess(HttpServletRequest httpServletRequest,
                                                            HttpServletResponse httpServletResponse,
                                                            Authentication authentication)
                                throws IOException, ServletException {
                            MemberOAuth2User oAuth2User = (MemberOAuth2User) authentication.getPrincipal();
                            memberServices.processOAuthPostLogin(oAuth2User.getEmail(), httpServletRequest.getSession());
                            httpServletResponse.sendRedirect("/beauty");
                        }
                    });

    }
}
