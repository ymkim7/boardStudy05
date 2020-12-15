package kr.co.controller;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MySqlConnectionTest {
	
	private static final Logger logger = LoggerFactory.getLogger(MySqlConnectionTest.class);
	
	@Autowired
	private DataSource ds;
	
	@Test
	public void testConnection() throws Exception {
		
		try(Connection con = ds.getConnection()) {
			logger.info("\n MySQL 연결:" + con);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
