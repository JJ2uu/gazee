<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="../../resources/css/adminReport.css"/>
<script>
    function loadCsOne() {
        const bagCsId = $("#bag_cs_id").text();
        $.ajax({
            url: "cs_one.do",
            type: "POST",
            data: {
                csId: bagCsId
            },
            success: function (result) {
                $('#cs_list').html(result);
            },
            error: function (xhr, status, error) {
                alert("에러 발생: " + error);
            }
        });
    }
</script>
<!DOCTYPE html>
<div class="details">
    <div class="recentOrders" id="cs_list">
        <div class="cardHeader">
            <span><h2>답변이 필요한 문의 목록</h2></span>
        </div>
        <table>
            <thead>
            <tr>
                <td>카테고리</td>
                <td>ID</td>
                <td>제목</td>
                <td>날짜</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${nonPagedNeedReplyList}" var="bag">
                <tr>
                    <p style="display: none" id="bag_cs_id">${bag.csId}</p>
                    <td>${bag.csCategory}</td>
                    <td>${bag.csWriter}</td>
                    <td><a href=# id="cs_list_title" onclick="loadCsOne()">${bag.csTitle} </a></td>
                    <td>${bag.csDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
