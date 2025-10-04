package com.example.StudentManagement.controller;

import com.example.StudentManagement.model.Class;
import com.example.StudentManagement.model.Student;
import com.example.StudentManagement.repository.ClassRepository;
import com.example.StudentManagement.repository.StudentRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "StudentController", value = {
        "/student/display",
        "/student/add",
        "/student/view-update",
        "/student/update",
        "/student/delete",
        "/student/search",
        "/student/sort",
        "/student/pagination",
})

public class StudentController extends HttpServlet {
    ClassRepository classRepository = new ClassRepository();
    StudentRepository studentRepository = new StudentRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        if (uri.contains("display")) {
            display(req, resp);
        } else if (uri.contains("delete")) {
            delete(req, resp);
        } else if (uri.contains("view-update")) {
            viewUpdate(req, resp);
        } else if (uri.contains("search")) {
            search(req, resp);
        } else if (uri.contains("sort")) {
            sort(req, resp);
        } else if (uri.contains("pagination")) {
            pagination(req, resp);
        }
    }

    private void pagination(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer page = 0;
        Integer pageSize = 5;
        if (req.getParameter("page") != null && !req.getParameter("page").isEmpty()) {
            page = Integer.valueOf(req.getParameter("page"));
        }

        req.setAttribute("listStudent", studentRepository.pagination(page, pageSize));
        req.setAttribute("listClass", classRepository.getAll());
        req.setAttribute("page", page);
        req.getRequestDispatcher("/student/display.jsp").forward(req, resp);
    }

    private void sort(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listStudent", studentRepository.sortByGPA());
        req.setAttribute("listClass", classRepository.getAll());
        req.getRequestDispatcher("/student/display.jsp").forward(req, resp);
    }

    private void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        req.setAttribute("listStudent", studentRepository.searchByFullName(fullName));
        req.setAttribute("listClass", classRepository.getAll());
        req.getRequestDispatcher("/student/display.jsp").forward(req, resp);
    }

    private void viewUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        req.setAttribute("listStudent", studentRepository.detailStudent(id));
        req.setAttribute("listClass", classRepository.getAll());
        req.getRequestDispatcher("/student/view-update.jsp").forward(req, resp);
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        studentRepository.deleteStudent(id);
        resp.sendRedirect(req.getContextPath() + "/student/display");
    }

    private void display(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listClass", classRepository.getAll());
        req.setAttribute("listStudent", studentRepository.getAll());
        req.getRequestDispatcher("/student/display.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        if (uri.contains("add")) {
            add(req, resp);
        } else if (uri.contains("update")) {
            update(req, resp);
        }
    }

    private void update(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        String studentCode = req.getParameter("studentCode");
        String fullName = req.getParameter("fullName");
        String gender = req.getParameter("gender");
        Float gpa = Float.valueOf(req.getParameter("gpa"));
        Boolean isActive = Boolean.valueOf(req.getParameter("isActive"));

        Integer idClass = Integer.valueOf(req.getParameter("idClass"));
        Class classEntity = classRepository.detailClass(idClass);

        Student student = new Student(id, studentCode, fullName, gender, gpa, isActive, classEntity);
        studentRepository.updateStudent(student);
        resp.sendRedirect(req.getContextPath() + "/student/display");
    }

    private void add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String studentCode = req.getParameter("studentCode");
        String fullName = req.getParameter("fullName");
        String gender = req.getParameter("gender");
        Float gpa = Float.valueOf(req.getParameter("gpa"));
        Boolean isActive = Boolean.valueOf(req.getParameter("isActive"));

        Integer idClass = Integer.valueOf(req.getParameter("idClass"));
        Class classEntity = classRepository.detailClass(idClass);

        Student student = new Student(null, studentCode, fullName, gender, gpa, isActive, classEntity);
        studentRepository.addStudent(student);
        resp.sendRedirect(req.getContextPath() + "/student/display");
    }
}
