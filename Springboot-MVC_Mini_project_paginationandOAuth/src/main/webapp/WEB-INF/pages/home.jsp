<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="sp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <title><sp:message code="home.title"/></title>
</head>

<body style="background-color:#f4f4f4; font-family:Arial;">

    <!-- Title -->
    <h1 style="color:red; text-align:center;">
        <sp:message code="home.title"/>
    </h1>

    <br><br>

   <!-- Show Report Link -->
<h1 style="color:blue; text-align:center;">
    <a href="report" style="text-decoration:none; color:blue;">
        <img src="<c:url value='/image/home.jpg'/>" 
             alt="Home" style="vertical-align:middle; margin-right:10px; width:50px; height:50px;">
        <sp:message code="view.report" text="Show Report"/>
    </a>
</h1>

      <!-- Logout -->
    <a href="<c:url value='/logout'/>" 
   style="float:right; color:red; font-weight:bold; text-decoration:none;">
   <sp:message code="home.logout" text="Logout"/>
</a>
    <br><br>

      <div class="d-flex flex-column align-items-center mt-4">
    <b><sp:message code="lang.choose" text="Choose Language:"/></b>
    <div class="mt-2 text-center">
        <a href="?lang=fr_FR">French</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="?lang=hi_IN">Hindi</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="?lang=te_IN">Telugu</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="?lang=en_US">English</a>
    </div>
</div>
      

    <h4 class="text-center text-secondary mt-3">
        Current Locale: ${pageContext.response.locale}
    </h4>

    
</body>
</html>
