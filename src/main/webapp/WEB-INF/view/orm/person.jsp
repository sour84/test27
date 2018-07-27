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
				<table class="tg">
					<tr>
						<th width="80">Person ID</th>
						<th width="120">Person Name</th>
						<th width="120">Person Country</th>
						<th width="60">Edit</th>
						<th width="60">Delete</th>
					</tr>
					<c:forEach items="${resultObject}" var="person">
						<tr>
							<td>${person.id}</td>
							<td>${person.firstName}</td>
							<td>${person.lastName}</td>
							<td><a href="<c:url value='/edit/${person.id}' />" >Edit</a></td>
							<td><a href="<c:url value='deleteContact?id=${person.id}' />" >Delete</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>

		</div>
		<!-- /.container -->

	</jsp:body>
</page:template>