<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<page:template>
    <jsp:body>
        <div class="container">
            <form:form action="saveContact" method="POST" modelAttribute="contactEntity">
                <input  type="hidden" id="idEmployee" name="idEmployee" value="${contactEntity.id}">
                <h2>Employee</h2>
                <div class="form-group col-xs-4">
                    <label for="firstName" class="control-label col-xs-4">Name:</label>
                    <input type="text" name="firstName" id="firstName" class="form-control" value="${contactEntity.firstName}" required="true" />

                    <label for="lastName" class="control-label col-xs-4">Last name:</label>                   
                    <input type="text" name="lastName" id="lastName" class="form-control" value="${contactEntity.lastName}" required="true"/>
                    <br></br>
                    <button type="submit" class="btn btn-primary  btn-md">Accept</button> 
                </div>

            </form:form>


        </div>
    </jsp:body>
</page:template>