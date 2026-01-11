<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<h1 style="color:red; text-align:center;">Update Product</h1>

<frm:form modelAttribute="prod" method="post" action="edit">
    <frm:hidden path="id"/>

    <table align="center" bgcolor="cyan">
        <tr>
            <td>Name:</td>
            <td>
                <frm:input path="name"/>
                <frm:errors path="name" cssStyle="color:red;"/>
            </td>
        </tr>

        <tr>
            <td>Category:</td>
            <td>
                <frm:input path="category"/>
                <frm:errors path="category" cssStyle="color:red;"/>
            </td>
        </tr>

        <tr>
            <td>Price:</td>
            <td>
                <frm:input path="price"/>
                <frm:errors path="price" cssStyle="color:red;"/>
            </td>
        </tr>

        <tr>
            <td>Quantity:</td>
            <td>
                <frm:input path="quantity"/>
                <frm:errors path="quantity" cssStyle="color:red;"/>
            </td>
        </tr>

        <tr>
            <td><input type="submit" value="Update Product"/></td>
            <td><input type="reset" value="Cancel"/></td>
        </tr>
    </table>

    <a href="<c:url value='/logout'/>" style="float:right; color:red; font-weight:bold;">Logout</a>
</frm:form>
