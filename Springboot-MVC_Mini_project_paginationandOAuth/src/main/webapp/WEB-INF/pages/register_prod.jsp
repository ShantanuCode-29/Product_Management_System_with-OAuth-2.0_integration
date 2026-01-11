<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="sp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title><sp:message code="home.title"/></title>

<style>
    .error {
        color: red;
        font-size: 13px;
        font-weight: bold;
        display: block;
        margin-top: 3px;
    }
</style>
</head>

<body style="background-color:#f0f8ff; font-family:Arial;">

<h1 style="color:red; text-align:center;">
    <sp:message code="home.title"/>
</h1>
<br>

<!-- Show Success Message (If any) -->
<c:if test="${not empty register}">
    <p style="color:green; text-align:center; font-weight:bold;">
        ${register}
    </p>
</c:if>

<form:form modelAttribute="newprod" method="post" action="add">

    <table border="1" align="center" bgcolor="cyan" cellpadding="8" style="border-collapse:collapse;">

        <tr>
            <td><sp:message code="prod.register.name"/></td>
            <td>
                <form:input path="name"/>
                <form:errors path="name" cssClass="error"/>
            </td>
        </tr>

        <tr>
            <td><sp:message code="prod.register.category"/></td>
            <td>
                <form:input path="category"/>
                <form:errors path="category" cssClass="error"/>
            </td>
        </tr>

        <tr>
            <td><sp:message code="prod.register.price"/></td>
            <td>
                <form:input path="price"/>
                <form:errors path="price" cssClass="error"/>
            </td>
        </tr>

        <tr>
            <td><sp:message code="prod.register.quantity"/></td>
            <td>
                <form:input path="quantity"/>
                <form:errors path="quantity" cssClass="error"/>
            </td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="submit"
                       value="<sp:message code='prod.register.btn'/>"
                       style="background-color:green; color:white; padding:6px 15px; border:none; border-radius:5px;"/>
                &nbsp;&nbsp;
                <input type="reset"
                       value="<sp:message code='prod.register.cancel'/>"
                       style="background-color:red; color:white; padding:6px 15px; border:none; border-radius:5px;"/>
            </td>
        </tr>
    </table>

    <br>
    <a href="<c:url value='/logout'/>"
       style="float:right; color:red; font-weight:bold; text-decoration:none;">
       Logout
    </a>

</form:form>

<br><br>

<p align="center">
    <a href="?lang=fr_FR">French</a>&nbsp;&nbsp;&nbsp;
    <a href="?lang=hi_IN">Hindi</a>&nbsp;&nbsp;&nbsp;
    <a href="?lang=te_IN">Telugu</a>&nbsp;&nbsp;&nbsp;
    <a href="?lang=en_US">English</a>
</p>

<hr>

<h2 style="color:red; text-align:center;">
    <sp:message code="home.title"/> — Current Locale: ${pageContext.response.locale}
</h2>

<hr>
<h1 style="color:blue;text-align:center"><a href="./">home</a></h1>

</body>
</html>
