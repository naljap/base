package com.psh;


import com.psh.common.domain.User;
import com.psh.common.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.expression.SecurityExpressionHandler;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.expression.DefaultWebSecurityExpressionHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = false)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    UserService userService;

    @Override
    public void configure(WebSecurity web) throws Exception {

        // 미인증 대상 (리소스)
        web.ignoring().antMatchers("/webjars/**", "/css/**", "/js/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        // 여기에선 리소스 외 인증/비인증/인증권한등을 설정
    	// h2 console 설정
      http.csrf().disable();
      //httpSecurity.headers().frameOptions().disable();

        //http.httpBasic();
    	http.authorizeRequests()
    	    .expressionHandler(webExpressionHandler())
            //.antMatchers("/").permitAll()
            .antMatchers("/test/**").permitAll()
            //.antMatchers("/h2-console/**").permitAll()
            .antMatchers("/login").permitAll()
            //.antMatchers(HttpMethod.POST, "/api/user").permitAll()
            //.antMatchers(HttpMethod.DELETE, "/api/user/**").hasRole("ROOT")
            .antMatchers("/admin/**").hasRole("ADMIN")
            .antMatchers("/api/admin/**").hasRole("ADMIN")
            .antMatchers("/root/**").hasRole("ROOT")
            .antMatchers("/api/root/**").hasRole("ROOT")
            .anyRequest().authenticated();

        http.formLogin().loginProcessingUrl("/login")
            .loginPage("/login")
            .failureUrl("/login?error")
            //.defaultSuccessUrl("/", true)
            .usernameParameter("userid").passwordParameter("password")
            .and();
        http.logout()
            .logoutRequestMatcher(new AntPathRequestMatcher("/logout**"))
            .logoutSuccessUrl("/login");
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(new AuthenticationProvider() {
            @Override
            public Authentication authenticate(Authentication authentication) throws AuthenticationException {
                String userid = (String) authentication.getPrincipal();
                String providedPassword = (String) authentication.getCredentials();

//                try {
//                    CrowdClient client = new RestCrowdClientFactory().newInstance(OsinfraUtil.CROWD_URL, OsinfraUtil.CROWD_ID, OsinfraUtil.CROWD_PASSWD);
//                    com.atlassian.crowd.model.user.User crowdUser = client.authenticateUser(userid, providedPassword);
//
//                    User user = userService.findOne(userid);
//                    if (user == null) {
//                        User newUser = new User();
//                        newUser.setUserid(userid);
//                        newUser.setName(crowdUser.getName());
//                        newUser.setDisplayname(crowdUser.getDisplayName());
//                        newUser.setFirstname(crowdUser.getFirstName());
//                        newUser.setLastname(crowdUser.getLastName());
//                        newUser.setEmail(crowdUser.getEmailAddress());
//                        userService.create(newUser);
//                    }
//
//                } catch(UserNotFoundException e) {
//                    throw new BadCredentialsException("존재하지 않는 AD 계정입니다. 아이디를 확인해 주세요.");
//                } catch(InvalidAuthenticationException e) {
//                    throw new BadCredentialsException("비밀번호가 틀렸습니다. " + authentication.getPrincipal() + " 계정의 비밀번호를 확인해 주세요.");
//                }
//                catch(Exception e) {
//                    throw new BadCredentialsException("Crowd 서버와 통신이 되지 않습니다. 담당자에게 문의하세요.");
//                }

                User user = userService.findOne(userid);
                return new UsernamePasswordAuthenticationToken(user, null, AuthorityUtils.createAuthorityList(user.getRole()));
            }

            @Override
            public boolean supports(Class<?> authentication) {
                return true;
            }
        });
    }

    /*
    @Configuration
    static class AuthenticationConfiguration extends GlobalAuthenticationConfigurerAdapter {
    	@Autowired
        UserDetailsService userDetailsService;

        @Bean
        PasswordEncoder passwordEncoder() {
            return new BCryptPasswordEncoder();
        }

        @Override
        public void init(AuthenticationManagerBuilder auth) throws Exception {
            auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
        }
    }
    */

    @Bean
    public RoleHierarchyImpl roleHierarchy() {
        RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
        roleHierarchy.setHierarchy("ROLE_ROOT > ROLE_ADMIN and ROLE_ADMIN > ROLE_USER");
        return roleHierarchy;
    }

    private SecurityExpressionHandler<FilterInvocation> webExpressionHandler() {
        DefaultWebSecurityExpressionHandler defaultWebSecurityExpressionHandler = new DefaultWebSecurityExpressionHandler();
        defaultWebSecurityExpressionHandler.setRoleHierarchy(roleHierarchy());
        return defaultWebSecurityExpressionHandler;
    }
}