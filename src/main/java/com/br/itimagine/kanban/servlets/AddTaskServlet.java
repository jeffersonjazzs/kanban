package com.br.itimagine.kanban.servlets;

import com.br.itimagine.kanban.dao.CompanyDAO;
import com.br.itimagine.kanban.dao.EmployeeDAO;
import com.br.itimagine.kanban.dao.ProjectDAO;
import com.br.itimagine.kanban.dao.TaskDAO;
import com.br.itimagine.kanban.domain.Employee;
import com.br.itimagine.kanban.domain.Project;
import com.br.itimagine.kanban.domain.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Serves adding a new task to the project.
 */
@WebServlet("/addtask")
public class AddTaskServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        ProjectDAO projectDAO = (ProjectDAO) request.getAttribute("projectDAO");
        EmployeeDAO employeeDAO = (EmployeeDAO) request.getAttribute("employeeDAO");
        TaskDAO taskDAO = (TaskDAO) request.getAttribute("taskDAO");

        String category = request.getParameter("category");
        String content = request.getParameter("content");
        String nick = request.getParameter("nick");

        Employee employee = employeeDAO.getEmployeeByNick(nick);
        Employee employeeFromSession = (Employee) session.getAttribute("employee");
        Integer idProject = Integer.parseInt(request.getParameter("idProject"));
        Project project = projectDAO.getProjectForEmployee(idProject, employeeFromSession.getCompany().getId());

        Task task = new Task();
        task.setCategory(category);
        task.setContent(content);
        task.setEmployee(employee);
        task.setProject(project);

        if (taskDAO.insertTask(task)) {
            session.setAttribute("idProject", idProject);
            response.sendRedirect(request.getContextPath() + "/addtask?idProject=" + idProject);
        }
        else {
            request.setAttribute("infoTask", "The task wasn't added.");
            doGet(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("employee") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            request.setCharacterEncoding("UTF-8");
            ProjectDAO projectDAO = (ProjectDAO) request.getAttribute("projectDAO");
            CompanyDAO companyDAO = (CompanyDAO) request.getAttribute("companyDAO");
            Employee employee = (Employee) session.getAttribute("employee");

            Integer idProject = Integer.parseInt(request.getParameter("idProject"));
            Project project = projectDAO.getProjectForEmployee(idProject, employee.getCompany().getId());
            List employees = companyDAO.getEmployees(employee.getCompany().getId());

            request.setAttribute("employees", employees);
            request.setAttribute("project", project);

            request.getRequestDispatcher("/WEB-INF/views/addtask.jsp").forward(request, response);
        }
    }
}
