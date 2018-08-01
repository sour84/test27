<!DOCTYPE html >
<%@tag description="Template Site tag" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@attribute name="title" fragment="true" %>

<head>
    <script src="webjars/jquery/3.3.1-1/jquery.min.js"></script>
    <script src="webjars/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="webjars/select2/4.0.3/js/select2.min.js"></script>
    <link href="webjars/select2/4.0.3/css/select2.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="webjars/bootstrap/4.1.0/css/bootstrap.min.css" />
</head>
<body>
<c:url value="/file.html" var="file"/>
<c:url value="/jdbc.html" var="jdbc"/>
<c:url value="/email.html" var="email" />
<c:url value="/rest.html" var="rest" />
<c:url value="/orm.html" var="orm" />
<c:url value="/person.html" var="person" />

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">

        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <c:url value="/about.html" var="about"/>
                <li><a href="${about}">About</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tutorial<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="${file}">Загрузка файла PDF и Excel</a>
                        </li>
                        <li>
                            <a href="${jdbc}">JDBC c JDBCTemplates</a>
                        </li>
                        <li>
                            <a href="${email}">Работа с Java Mail API</a>
                        </li>
                        <li>
                            <a href="${rest}">Rest Services</a>
                        </li>
                        <li>
                            <a href="${orm}">Spring MVC и Hibernate 5</a>
                        </li>
                        <li>
                            <a href="${person}">person</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>


<jsp:doBody/>


</body>

</html>