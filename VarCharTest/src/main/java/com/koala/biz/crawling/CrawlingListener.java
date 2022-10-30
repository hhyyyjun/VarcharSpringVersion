package com.koala.biz.crawling;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.koala.biz.dao.CarDAO;
import com.koala.biz.vo.CarVO;


/**
 * Application Lifecycle Listener implementation class Crawling
 *
 */
@WebListener
public class CrawlingListener implements ServletContextListener {
	/**
	 * Default constructor. 
	 */
	public CrawlingListener() {
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent sce)  { 
	}
	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent sce)  { 
		ServletContext sc = sce.getServletContext();
		CarDAO cDAO = new CarDAO();
		System.out.println("TestListener : contextInitialized()에서 실행 중 : 톰캣 시작이 감지됨");
		System.out.println("크롤링 시작");
		if (!cDAO.hasSample(null)) { //DB에 데이터가 없다면
			Crawling.data(); //크롤링 메서드 실행
		}
		System.out.println("크롤링 작업 완료");
	}
}