package kgmp.common.db;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SessionPool {
	private static SqlSessionFactory factory = getFactory();
	
	private static SqlSessionFactory getFactory() {
		SqlSessionFactory factory = null;
		try {//mybatis 자원을 얻음
			Reader reader = Resources.getResourceAsReader("kgmp/common/db/mybatis_config.xml");
			SqlSessionFactoryBuilder build = new SqlSessionFactoryBuilder();
			factory = build.build(reader);
			reader.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return factory;
	}
	
	
	public static SqlSession getSession() {
		SqlSession session = null;
		try {
			session = factory.openSession();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return session;
	}
}
