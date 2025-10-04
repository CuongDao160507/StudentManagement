<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Student Management - Update</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-lg">
        <div class="card-header bg-primary text-white">
            <h3 class="mb-0">Update Student</h3>
        </div>
        <div class="card-body">

            <form action="${pageContext.request.contextPath}/student/update" method="post" class="row g-3">

                <!-- ID -->
                <div class="col-md-6">
                    <label for="id" class="form-label">ID</label>
                    <input type="text" class="form-control" id="id" name="id" value="${listStudent.id}" readonly>
                </div>

                <!-- Student Code -->
                <div class="col-md-6">
                    <label for="studentCode" class="form-label">Student Code</label>
                    <input type="text" class="form-control" id="studentCode" name="studentCode" value="${listStudent.studentCode}">
                </div>

                <!-- Full Name -->
                <div class="col-md-6">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" value="${listStudent.fullName}">
                </div>

                <!-- Gender -->
                <div class="col-md-6">
                    <label for="gender" class="form-label">Gender</label>
                    <input type="text" class="form-control" id="gender" name="gender" value="${listStudent.gender}">
                </div>

                <!-- GPA -->
                <div class="col-md-6">
                    <label for="gpa" class="form-label">GPA</label>
                    <input type="text" class="form-control" id="gpa" name="gpa" value="${listStudent.gpa}">
                </div>

                <!-- Status -->
                <div class="col-md-6">
                    <label class="form-label">Status</label><br>
                    <div class="form-check form-check-inline">
                        <input type="radio" class="form-check-input" id="active" name="isActive" value="true"
                               <c:if test="${listStudent.isActive}">checked</c:if>>
                        <label class="form-check-label" for="active">Studying</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input type="radio" class="form-check-input" id="inactive" name="isActive" value="false"
                               <c:if test="${!listStudent.isActive}">checked</c:if>>
                        <label class="form-check-label" for="inactive">Graduated</label>
                    </div>
                </div>

                <!-- Class -->
                <div class="col-md-6">
                    <label for="idClass" class="form-label">Class</label>
                    <select class="form-select" id="idClass" name="idClass">
                        <c:forEach items="${listClass}" var="classEntity">
                            <option value="${classEntity.id}"
                                    <c:if test="${classEntity.id == listStudent.classEntity.id}">selected</c:if>>
                                    ${classEntity.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Submit -->
                <div class="col-12 mt-4">
                    <button type="submit" class="btn btn-success px-4">Update</button>
                </div>

            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
