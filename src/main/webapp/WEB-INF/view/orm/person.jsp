<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<page:template>
	<jsp:body>
<c:url value="/queryFindAllUsersJPA" var="queryFindAllUsersJPA" />
<c:url value="/newContact" var="newContact" />
			<br>
			<h3>Persons List</h3>
		<a href="${queryFindAllUsersJPA}" class="list-group-item">Find All Users</a>
				<a href="${newContact}" class="list-group-item">New Users</a>
			<c:if test="${!empty resultObject}">
				<table class="table table-striped">
					<thead>
						<th scope="row">Person ID</th>
						<th scope="row">firstName</th>
						<th scope="row">lastName</th>
						<th scope="row">Edit</th>
						<th scope="row">Delete</th>
					</thead>
					<tbody>
					<c:forEach items="${resultObject}" var="person">
						<tr>
							<td>${person.id}</td>
							<td>${person.firstName}</td>
							<td>${person.lastName}</td>
							<td><a href="<c:url value='/edit?id=${person.id}' />" >Edit</a></td>
							<td><a href="<c:url value='deleteContact?id=${person.id}' />" >Delete</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</c:if>

		</div>
		<!-- /.container -->

	</jsp:body>
</page:template>