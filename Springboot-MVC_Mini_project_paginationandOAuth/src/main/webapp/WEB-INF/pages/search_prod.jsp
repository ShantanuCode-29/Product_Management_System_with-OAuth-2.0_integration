<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<link rel="stylesheet" 
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" />

<div class="container mt-4">

    <!-- Title -->
    <h2 class="text-center text-primary mb-4">Search Product</h2>

    <!-- Search Form -->
    <div class="card shadow-lg p-4 mb-4">
        <frm:form modelAttribute="prod" action="search" method="post">

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label fw-bold">Product Name</label>
                    <frm:input path="name" class="form-control" placeholder="Enter product name"/>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">Category</label>
                    <frm:input path="category" class="form-control" placeholder="Enter product category"/>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label fw-bold">Sort By</label>
                    <select name="sortProp" class="form-select">
                        <option value="name">Name</option>
                        <option value="price">Price</option>
                        <option value="quantity">Quantity</option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">Order</label>
                    <select name="order" class="form-select">
                        <option value="true">Ascending</option>
                        <option value="false">Descending</option>
                    </select>
                </div>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary px-5">Search</button>
                <a href="search" class="btn btn-secondary px-4">Reset</a>
            </div>

        </frm:form>
    </div>

    <!-- Results Table -->
    <c:if test="${not empty prodList}">
        <h3 class="text-center text-success mb-3">Search Results</h3>

        <table class="table table-bordered table-hover text-center shadow-sm">
            <thead class="table-info">
                <tr>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${prodList}">
                    <tr class="text-primary fw-bold">
                        <td>${p.name}</td>
                        <td>${p.category}</td>
                        <td>${p.price}</td>
                        <td>${p.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty prodList}">
        <h4 class="text-center text-danger">No Products Found!</h4>
    </c:if>

    <!-- Back to Home -->
    <div class="text-center mt-4">
        <a href="./" class="btn btn-danger px-4">Home</a>
    </div>

</div>
