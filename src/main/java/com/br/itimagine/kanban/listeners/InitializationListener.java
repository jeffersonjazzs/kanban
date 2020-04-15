package com.br.itimagine.kanban.listeners;

import javax.persistence.EntityManager;
import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

import com.br.itimagine.kanban.dao.CompanyDAO;
import com.br.itimagine.kanban.dao.EmployeeDAO;
import com.br.itimagine.kanban.dao.ProjectDAO;
import com.br.itimagine.kanban.dao.TaskDAO;

/**
 * Inicializa objetos DAO prontos para uso.
 */
@WebListener()
public class InitializationListener implements ServletRequestListener {

	public void requestDestroyed(ServletRequestEvent servletRequestEvent) {

	}

	public void requestInitialized(ServletRequestEvent servletRequestEvent) {
		EntityManager entityManager = ConfigurationListener.createEntityManager();
		CompanyDAO companyDAO = new CompanyDAO(entityManager);
		EmployeeDAO employeeDAO = new EmployeeDAO(entityManager);
		ProjectDAO projectDAO = new ProjectDAO(entityManager);
		TaskDAO taskDAO = new TaskDAO(entityManager);
		ServletRequest request = servletRequestEvent.getServletRequest();
		request.setAttribute("companyDAO", companyDAO);
		request.setAttribute("employeeDAO", employeeDAO);
		request.setAttribute("projectDAO", projectDAO);
		request.setAttribute("taskDAO", taskDAO);
	}
}