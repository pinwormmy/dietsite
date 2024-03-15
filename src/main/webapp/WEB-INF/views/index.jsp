<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>DietSite - 다이어트 사이트</title>
<style>
.boardList {
    border-collapse: collapse;
    overflow: hidden;
    margin: 10px 0 10px 0;
    width: 100%;
}
</style>
</head>
<body>
<%@include file="./include/header.jspf" %>
    <div class="section-inner">
        <div class="container">
            <%@include file="./include/sidebar.jspf" %>
            <div class="col-sm-3">
                <fieldset class="field1">
                    <legend><a href="/${boardTitle1}/list">${boardTitle1}</a></legend>
                    <table class="boardList" style="width: 100%;">
                        <c:forEach var="post" items="${postList1}">
                            <tr><td><a href="/${boardTitle1}/readPost?postNum=${post.postNum}">${post.title}</a></td></tr>
                        </c:forEach>
                    </table>
                </fieldset>
            </div>
            <div class="col-sm-3">
                <fieldset class="field2">
                    <legend><a href="/${boardTitle2}/list">${boardTitle2}</a></legend>
                    <table class="boardList" style="width: 100%;">
                        <c:forEach var="post" items="${postList2}">
                            <tr><td><a href="/${boardTitle2}/readPost?postNum=${post.postNum}">${post.title}</a></td></tr>
                        </c:forEach>
                    </table>
                </fieldset>
            </div>
            <div class="col-sm-3">
                <fieldset class="field3">
                    <legend><a href="/${boardTitle3}/list">${boardTitle3}</a></legend>
                    <table class="boardList" style="width: 100%;">
                        <c:forEach var="post" items="${postList3}">
                            <tr><td><a href="/${boardTitle3}/readPost?postNum=${post.postNum}">${post.title}</a></td></tr>
                        </c:forEach>
                    </table>
                </fieldset>
            </div>
        </div>
    </div>
</section>
<%@include file="./include/footer.jspf" %>
</body>
</html>
