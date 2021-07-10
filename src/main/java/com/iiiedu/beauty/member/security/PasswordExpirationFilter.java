package com.iiiedu.beauty.member.security;

import com.iiiedu.beauty.model.Member;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@Component
public class PasswordExpirationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String requestURL = httpRequest.getRequestURI().toString();
        if(requestURL.endsWith(".png") || requestURL.endsWith(".jpg")
                || requestURL.endsWith(".css") || requestURL.endsWith(".js")
                || requestURL.endsWith(".woff2") || requestURL.endsWith("/change_password")){
            chain.doFilter(httpRequest,response);
            return;
        }
//        System.out.println("PasswordExpirationFilter: " + requestURL);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Object principal = null;
        if (authentication != null){
            principal = authentication.getPrincipal();
        }
        if(principal != null && principal instanceof MemberUserDetails){
            MemberUserDetails userDetails = (MemberUserDetails) principal;
            Member member = userDetails.getMember();

            if(member.isPasswordExpired()){
//                System.out.println("Member: " + member.getMemberName() + ": Password expired");
//                System.out.println("Last time password changed: " + member.getPasswordChangedTime());
//                System.out.println("Current time: " + new Date());

                HttpServletResponse httpResponse = (HttpServletResponse) response;
                String redirectURL = httpRequest.getContextPath() + "/change_password";
                httpResponse.sendRedirect(redirectURL);
            } else {
//                System.out.println("Member: " + member.getMemberName() + ": Password Not expired");
                chain.doFilter(request,response);
            }
        } else {
            chain.doFilter(request,response);
        }

    }

}
