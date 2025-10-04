<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">

    <h1 class="text-center mb-4">📚 Student Management</h1>

    <!-- Add Student Form -->
    <div class="card shadow mb-4">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Add Student</h5>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/student/add" method="post" class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Student Code</label>
                    <input type="text" name="studentCode" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="fullName" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Gender</label>
                    <input type="text" name="gender" class="form-control">
                </div>
                <div class="col-md-6">
                    <label class="form-label">GPA</label>
                    <input type="number" step="0.1" name="gpa" class="form-control">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Status</label><br>
                    <div class="form-check form-check-inline">
                        <input type="radio" name="isActive" value="true" class="form-check-input" id="active1">
                        <label for="active1" class="form-check-label">Studying</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input type="radio" name="isActive" value="false" class="form-check-input" id="active2">
                        <label for="active2" class="form-check-label">Graduated</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Class Name</label>
                    <select name="idClass" class="form-select">
                        <c:forEach items="${listClass}" var="classEntity">
                            <option value="${classEntity.id}">${classEntity.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-12 text-end">
                    <button class="btn btn-success">Submit</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Search -->
    <form action="${pageContext.request.contextPath}/student/search" method="get" class="d-flex mb-3">
        <input type="text" name="fullName" class="form-control me-2" placeholder="🔍 Search by full name...">
        <button class="btn btn-outline-primary">Search</button>
    </form>

    <div class="mb-3">
        <a href="${pageContext.request.contextPath}/student/sort" class="btn btn-warning">Sort By GPA</a>
    </div>

    <!-- Student Table -->
    <div class="card shadow">
        <div class="card-header bg-dark text-white">
            <h5 class="mb-0">📋 Student List</h5>
        </div>
        <div class="card-body">
            <table class="table table-hover table-striped align-middle">
                <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Class Name</th>
                    <th>Student Code</th>
                    <th>Full Name</th>
                    <th>Gender</th>
                    <th>GPA</th>
                    <th>Status</th>
                    <th class="text-center">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listStudent}" var="stu">
                    <tr>
                        <td>${stu.id}</td>
                        <td>${stu.classEntity.name}</td>
                        <td>${stu.studentCode}</td>
                        <td>${stu.fullName}</td>
                        <td>${stu.gender}</td>
                        <td>${stu.gpa}</td>
                        <td>
                            <span class="badge ${stu.isActive ? 'bg-success' : 'bg-secondary'}">
                                    ${stu.isActive ? 'Studying' : 'Graduated'}
                            </span>
                        </td>
                        <td class="text-center">
                            <a href="${pageContext.request.contextPath}/student/view-update?id=${stu.id}" class="btn btn-sm btn-info text-white">Update</a>
                            <a href="${pageContext.request.contextPath}/student/delete?id=${stu.id}" class="btn btn-sm btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Pagination -->
    <div class="d-flex justify-content-between mt-3">
        <a href="${pageContext.request.contextPath}/student/pagination?page=${page - 1}" class="btn btn-outline-secondary">⬅ Prev</a>
        <a href="${pageContext.request.contextPath}/student/pagination?page=${page + 1}" class="btn btn-outline-secondary">Next ➡</a>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
