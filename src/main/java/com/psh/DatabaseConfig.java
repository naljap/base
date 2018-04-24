package com.psh;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@Configuration
@Lazy
@EnableTransactionManagement
@MapperScan(basePackages = {"com.psh"})
class DatabaseConfig {

    @Autowired
    private Environment environment;

    @Autowired
    private ApplicationContext applicationContext;

    @Bean(destroyMethod = "close")
    public DataSource dataSource() {
        String jdbcDriver = environment.getProperty("spring.datasource.driver-class-name");
        String jdbcUrl = environment.getProperty("spring.datasource.url");
        String jdbcUsername = environment.getProperty("spring.datasource.username");
        String jdbcPassword = environment.getProperty("spring.datasource.password");

        org.apache.tomcat.jdbc.pool.DataSource dataSource = new org.apache.tomcat.jdbc.pool.DataSource();
        //BasicDataSource dataSource = new BasicDataSource();

        dataSource.setDriverClassName(jdbcDriver);
        dataSource.setUrl(jdbcUrl);
        dataSource.setUsername(jdbcUsername);
        dataSource.setPassword(jdbcPassword);
        dataSource.setValidationQuery("");
        dataSource.setConnectionProperties("");
        //dataSource.setPoolPreparedStatements(true);
        dataSource.setInitialSize(1); // 풀의 초기에 생성되는 커넥션의 개수
        dataSource.setMaxActive(10); // 커넥션 풀이 제공할 최대 커넥션의 개수
        dataSource.setMaxIdle(10); // 최소 보유 커넥션수
        dataSource.setMinIdle(10); // Idle 상태에 풀이 소유한 최소 커넥션 갯수
        dataSource.setMaxWait(10000); // 커넥션이 존재하지 않을 때, 커넥션을 얻기까지 대기하는 최대 대기시간
        dataSource.setRemoveAbandoned(true); // 유효하지 않는 커넥션의 제거 여부
        dataSource.setRemoveAbandonedTimeout(60); // 유효하지 않는 커넥션의 삭제시의 타임아웃

        return dataSource;
    }

    @Bean
    public PlatformTransactionManager transactionManager() {
        DataSourceTransactionManager transactionManager = new DataSourceTransactionManager(dataSource());
        transactionManager.setGlobalRollbackOnParticipationFailure(false);
        return transactionManager;
    }

    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
        sessionFactoryBean.setDataSource(dataSource());
        sessionFactoryBean.setConfigLocation(applicationContext.getResource("classpath:mybatis/mybatis-config.xml"));
        sessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/mapper/**/*.xml"));
        return sessionFactoryBean.getObject();
    }
}
