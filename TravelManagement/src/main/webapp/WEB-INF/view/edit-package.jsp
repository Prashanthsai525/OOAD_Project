<%--
  Created by IntelliJ IDEA.
  User: Prashanth
  Date: 4/17/2023
  Time: 9:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Edit Package</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<header class="bg-dark text-white">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="" class="nav-link px-2 text-secondary">About Us</a></li>
                <li><a href="" class="nav-link px-2 text-secondary">Contact Us</a></li>
                <security:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
                    <li><a class="nav-link px-2 text-secondary" href="${pageContext.request.contextPath}/admin/users">See All User</a></li>
                </security:authorize>
                <security:authorize access="hasRole('ROLE_TRAVEL_AGENT') and isAuthenticated()">
                    <li><a class="nav-link px-2 text-secondary" href="${pageContext.request.contextPath}/user/addpackage">Add Package</a></li>
                    <li><a class="nav-link px-2 text-secondary" href="${pageContext.request.contextPath}/user/show-user-packages?userId=${user}">View Package</a></li>
                </security:authorize>
                <security:authorize access="hasRole('ROLE_TRAVELLER') and isAuthenticated()">
                    <li><a class="nav-link px-2 text-secondary" href="${pageContext.request.contextPath}/user/show-packages">See Package</a></li>
                </security:authorize>
            </ul>
            <div class="text-end">
                <a href="${pageContext.request.contextPath}/user/dashboard" class="btn btn-outline-warning mt-2">Profile</a>
                <c:url var="logoutUrl" value="/logout"/>
                <form action="${logoutUrl}"
                      method="post">
                    <input class="btn btn-outline-light mt-2" type="submit"
                           value="Log out" />
                    <input type="hidden"
                           name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                </form>
            </div>
        </div>
    </div>
</header>
    <div class="container">
        <form:form method="post" action="${pageContext.request.contextPath}/user/process-edit-package" modelAttribute="p">
            <form:input path="packageName"/>
            <form:input path="description"/>
            <form:input path="price"/><form:errors path="price"/>
            <form:input path="startDate"/>
            <form:input path="endDate"/>
            <form:hidden path="id"/>
            <form:button type="submit">Update</form:button>
        </form:form>
    </div>
</body>
</html>
