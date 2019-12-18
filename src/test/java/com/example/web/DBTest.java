package com.example.web;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.persistence.AddressDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })

public class DBTest {
	@Inject
	AddressDAO dao;
	
	@Test
	public void list(){
		int page=1;
		int start = (page-1)*10;
		String key="address";
		String word="��õ";
		dao.list(start, key, word);
	}
	@Test
	public void total(){
		dao.total();
	}
}
