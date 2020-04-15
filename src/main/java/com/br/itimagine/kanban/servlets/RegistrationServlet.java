package com.br.itimagine.kanban.servlets;

import com.br.itimagine.kanban.dao.CompanyDAO;
import com.br.itimagine.kanban.dao.EmployeeDAO;
import com.br.itimagine.kanban.domain.Company;
import com.br.itimagine.kanban.domain.Employee;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Serves registration form.
 */
@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String nick = request.getParameter("nick");
		String password = request.getParameter("password");
		String avatar = request.getParameter("avatar");
		String companyName = request.getParameter("company");
		EmployeeDAO employeeDAO = (EmployeeDAO) request.getAttribute("employeeDAO");
		try {
			employeeDAO.getEmployeeByNick(nick);
			request.setAttribute("infoRegistration", "Nick: " + nick + " já existe.");
			doGet(request, response);
		} catch (NoResultException e) {
			Employee employee = new Employee();
			employee.setName(name);
			employee.setSurname(surname);
			employee.setNick(nick);
			password = employeeDAO.encodePassword(password);
			employee.setPassword(password);
			employee.setAvatar(avatar);
			if (employeeDAO.getCompany(companyName).size() == 0) {
				CompanyDAO companyDAO = (CompanyDAO) request.getAttribute("companyDAO");
				Company company = new Company();
				company.setName(companyName);
				companyDAO.insertCompany(company);
				employee.setCompany(company);
			} else {
				Company foundCompany = (Company) employeeDAO.getCompany(companyName).get(0);
				employee.setCompany(foundCompany);
			}
			if (employeeDAO.insertEmployee(employee)) {
				request.setAttribute("infoRegistration", "Parabéns! Você acabou de ingressar na Comunidade Kanban.");
				doGet(request, response);
			} else {
				request.setAttribute("infoRegistration", "Registro falhou.");
				doGet(request, response);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/WEB-INF/views/registration.jsp").forward(request, response);
	}
}
