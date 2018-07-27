<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type " content="text/html; charset=ISO-8859-1">
    <script src="webjars/jquery/3.3.1-1/jquery.min.js"></script>
    <script src="webjars/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <title>WebJars Demo</title>
    <link rel="stylesheet"
          href="webjars/bootstrap/4.1.0/css/bootstrap.min.css" />


</head>
<body>
<div class="container"><br/>
    <div class="alert alert-success">
        <strong>Success!</strong> It is working as we expected.
    </div>
</div>

<div class="container">

        <h2>Employees</h2>
        <!--Search Form -->
        <form action="/employee" method="get" id="seachEmployeeForm" role="form" >
            <input type="hidden" id="searchAction" name="searchAction" value="searchByName"/>
            <div class="form-group col-xs-5">
                <input type="text" name="employeeName" id="employeeName" class="form-control" required="true"
                       placeholder="Type the Name or Last Name of the employee"/>
            </div>
            <button type="submit" class="btn btn-info">
                <span class="glyphicon glyphicon-search"></span> Search
            </button>
            <br></br>
            <br></br>
        </form>

    <h2>Article List</h2>
    <table class="table table-striped">
        <thead>
        <th scope="row">#ID</th>
        <th scope="row">Title</th>
        <th scope="row">Category</th>
        <th scope="row">Update</th>
        <th scope="row">Delete</th>
        </thead>
        <tbody>
        <c:url value="/newContact" var="newContact" />
        <c:forEach items="${resultObject}" var="person" >
            <tr>
                <td>${person.id }</td>
                <td>${person.firstName}</td>
                <td>${person.lastName}</td>
                <td>
                    <spring:url value="/editEmployee${person.id}" var="updateURL" />
                    <a class="btn btn-primary" href="${updateURL}" role="button" >Update</a>
                </td>
                <td>
                    <spring:url value="/deleteContact?id=${person.id}" var="deleteURL" />
                    <a class="btn btn-primary" href="${deleteURL}" role="button" >Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <spring:url value="/queryFindAllUsersJPA" var="queryFindAllUsersJPA" />
    <a class="btn btn-primary" href="${newContact}" role="button" >Add New Article</a>
</div>
</body>
</html>