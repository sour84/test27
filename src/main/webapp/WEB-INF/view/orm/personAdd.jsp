<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<page:template>
    <jsp:body>
        <c:url value="/saveContact" var="saveContact" />
               <div class="container">
            <form:form action="saveContact" method="post" modelAttribute="contactEntity">
                <table>
                    <form:hidden path="id"/>
                    <tr>
                        <td>Name:</td>
                        <td><form:input path="firstName" /></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><form:input path="lastName" /></td>
                    </tr>

                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Save"></td>
                    </tr>
                </table>
            </form:form>



    </jsp:body>
</page:template>