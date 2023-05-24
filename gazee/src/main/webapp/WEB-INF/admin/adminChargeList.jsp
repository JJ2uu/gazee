<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="../../resources/css/adminCharge.css"/>
<html>
<div class="recentOrders">
    <div class="cardHeader">
        <span><h2>충전 목록</h2></span>
    </div>
    <table>
        <thead>
        <tr>
            <td>충전시각</td>
            <td>ID</td>
            <td>충전금액</td>
            <td>충전방법</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${chargeList}" var="bag">
            <tr>
                <td>${bag.transactionTime}</td>
                <td>${bag.memberId}</td>
                <td>
                    <fmt:formatNumber value="${bag.amount}" type="number" pattern="#,###"/>원
                </td>
                <td>${bag.payMethod}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</html>
