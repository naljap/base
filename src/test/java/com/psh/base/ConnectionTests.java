package com.psh.base;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import javax.sql.DataSource;
import java.sql.Connection;

@ActiveProfiles("local")
@RunWith(SpringRunner.class)
@SpringBootTest
public class ConnectionTests {

	@Autowired
	private DataSource ds;

	@Test
	public void contextLoads() {
	}

	@Test
	public void testConn() throws Exception {
		System.out.println("testConn before : " + ds);
		Connection conn = ds.getConnection();
		System.out.println("testConn before : " + ds);
		conn.close();
	}

}
