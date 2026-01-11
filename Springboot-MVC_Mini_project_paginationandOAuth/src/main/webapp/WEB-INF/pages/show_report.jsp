<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="sp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" />

<div class="container mt-4">
    <!-- Title -->
    <h2 class="text-center text-primary mb-3">
        <sp:message code="home.subtitle"/>
    </h2>
    
      
    <!-- 🔍 Quick Search -->
<form action="search" method="post" class="mb-3">
    <input type="text"
           name="name"
           placeholder="Search by Name / Category"
           class="form-control"
           style="width: 300px; display: inline-block;"
           value="${prod.name}">           
    <button type="submit" class="btn btn-primary">Search</button>
    <a href="report" class="btn btn-secondary">Reset</a>
</form>
    

    <!-- Product Table -->
    <c:choose>
        <c:when test="${!empty productList.getContent()}">
            <table class="table table-hover table-bordered">
                <thead class="table-danger text-center">
                    <tr>
                        <th><sp:message code="prod.list.id"/></th>
                        <th><sp:message code="prod.list.name"/></th>
                        <th><sp:message code="prod.list.category"/></th>
                        <th><sp:message code="prod.list.price"/></th>
                        <th><sp:message code="prod.list.quantity"/></th>
                        <th><sp:message code="prod.list.action"/></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="prod" items="${productList.getContent()}">
                        <tr class="text-center text-primary">
                            <td>${prod.id}</td>
                            <td>${prod.name}</td>
                            <td>${prod.category}</td>
                            <td>${prod.price}</td>
                            <td>${prod.quantity}</td>
                            <td>
                                <a href="edit?pid=${prod.id}">
                                    <img src="image/edit.jpg" width="30" height="30" alt="Edit">
                                </a>
                                <a href="delete?pid=${prod.id}" 
                                   onclick="return confirm('Do you want to delete this product?');">
                                    <img src="image/delete.jpg" width="30" height="30" alt="Delete">
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Pagination -->
            <center class="mt-3">
                <c:if test="${productList.hasPrevious()}">
                    <a href="report?page=${productList.getPageable().getPageNumber()-1}">Previous</a>&nbsp;&nbsp;
                </c:if>

                <c:if test="${!productList.isFirst()}">
                    <a href="report?page=0">First</a>&nbsp;&nbsp;
                </c:if>

                <c:forEach var="i" begin="1" end="${productList.getTotalPages()}" step="1">
                    <a href="report?page=${i-1}">${i}</a>&nbsp;&nbsp;
                </c:forEach>

                <c:if test="${!productList.isLast()}">
                    <a href="report?page=${productList.getTotalPages()-1}">Last</a>&nbsp;&nbsp;
                </c:if>

                <c:if test="${productList.hasNext()}">
                    <a href="report?page=${productList.getPageable().getPageNumber()+1}">Next</a>
                </c:if>
            </center>
        </c:when>

        <c:otherwise>
            <h3 class="text-center text-danger">No products found!</h3>
        </c:otherwise>
    </c:choose>

    <!-- Add Product Link -->
  <div class="text-center mt-4"> <a href="add" class="text-decoration-none text-success fw-bold">
   <img src="image/add.jpg" width="40" height="50" alt="Add Product"> <sp:message code="prod.add.link" text="Add Product"/>
    </a> </div>
   
    

    <!-- Home and Messages -->
    <h1 class="text-center mt-4">
        <a href="./" style="color:red; text-decoration:none;">
            <sp:message code="home.link" text="Home"/>
        </a>
    </h1>

    <h3 class="text-center text-success">${register}</h3>
    <h3 class="text-center text-success">${msg}</h3>

    <!-- Logout -->
    <a href="<c:url value='/logout'/>" 
       style="float:right; color:red; font-weight:bold; text-decoration:none;">
       <sp:message code="home.logout" text="Logout"/>
    </a>

    <hr>

    <!-- 🌐 Language Switch -->
    <div class="text-center mt-3">
        <b><sp:message code="lang.choose" text="Choose Language:"/></b><br>
        <a href="?lang=fr_FR">French</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="?lang=hi_IN">Hindi</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="?lang=te_IN">Telugu</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="?lang=en_US">English</a>
    </div>

    <h4 class="text-center text-secondary mt-3">
        Current Locale: ${pageContext.response.locale}
    </h4>
</div>
