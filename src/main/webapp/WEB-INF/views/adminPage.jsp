<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>DietSite - 관리자 페이지</title>
<style>
.leftbar-ul li a {
    color: white;
    font-size: 12px;
    font-weight: 500;
}
.page-navigation {
    text-align: center;
}
.admin-memberlist td {
    padding: 3px;
}
.page-list {
    display: flex;
    list-style: none;
    padding: 0;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<div class="section-inner">
    <div class="container">
        <%@include file="./include/sidebar.jspf" %>
        <div class="col-sm-9">
            <div class="media">
                <form action="/adminPage" method="get">
                    <div class="div-search">
                        회원검색>
                        <input type="text" name="keyword" value="${pageInfo.keyword}">
                        <button type="submit" style="visibility:hidden">검색</button>
                        <c:if test="${pageInfo.keyword != ''}">
                            <button type="button" class="pull btn btn-theme cancel-btn" onclick="location.href='/adminPage'" accesskey="c">검색취소(C)</button>
                        </c:if>
                        <hr>
                    </div>
                </form>
                <div class="container">
                    <table class="admin-memberlist">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>닉네임</th>
                                <th>실명</th>
                                <th>이메일</th>
                                <th>연락처</th>
                                <th>등급</th>
                                <th>가입일자</th>
                                <th>관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${memberList}" var="member">
                                <tr>
                                    <td>${member.id}</td>
                                    <td>${member.nickName}</td>
                                    <td>${member.realName}</td>
                                    <td>${member.email}</td>
                                    <td>${member.phone}</td>
                                    <td>${member.grade}</td>
                                    <td><fmt:formatDate value="${member.regDate}" pattern="yy.MM.dd"/></td>
                                    <td>
                                        <button style="margin: 0px;" onclick="location.href='/modifyMemberByAdmin?id=${member.id}'">수정</button>
                                        <button onclick="confirmDelete('${member.id}')">탈퇴</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty memberList}"><td colspan="8">조회 결과가 없습니다..</td></c:if>
                        </tbody>
                    </table>
                </div>
                <div class="container">
                    <nav>
                        <ul class="page-list">
                            <c:if test="${pageInfo.prevPageSetPoint != 0}">
                                <li class="page-item">
                                    <a class="page-link" href="/adminPage?recentPage=${pageInfo.prevPageSetPoint}&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="${pageInfo.pageBeginPoint}" end="${pageInfo.pageEndPoint}">
                                <c:choose>
                                    <c:when test="${i == pageInfo.recentPage}">
                                        <li><a class="page-link" href="/adminPage?recentPage=${i}&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a class="page-link" href="/adminPage?recentPage=${i}&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}">${i}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${pageInfo.nextPageSetPoint <= pageInfo.totalPage}">
                                <li class="page-item">
                                    <a href="/adminPage?recentPage=${pageInfo.nextPageSetPoint}&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
                <!-- 관리자 페이지의 일부 -->
                <div class="admin-board-name-change">
                    <h3>게시판 이름 변경</h3>
                    <table>
                        <tr>
                            <th>현재 게시판 이름</th>
                            <th>새 게시판 이름</th>
                            <th>작업</th>
                        </tr>
                        <c:forEach items="${boardList}" var="board">
                            <tr>
                                <td>${board.koreanTitle}</td>
                                <td><input type="text" id="newName-${board.boardTitle}" placeholder="새 이름 입력"></td>
                                <td>
                                    <button onclick="updateBoardName('${board.boardTitle}')">이름 변경</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>

<script>

function confirmDelete(id) {
    if(confirm("정말로 탈퇴시키겠습니까?")) {
        // AJAX 요청
        $.ajax({
            url: '/deleteMember',
            type: 'POST',
            data: { id: id },
            success: function(data) {
                // 응답 처리
                if(data.success) {
                    alert("탈퇴가 완료되었습니다.");
                    location.href = '/adminPage';
                } else {
                    alert("탈퇴 처리 중 오류가 발생했습니다.");
                }
            }
        });
    }
}

function updateBoardName(boardTitle) {
    const newName = document.getElementById(`newName-${boardTitle}`).value;
    fetch(`/updateBoardName`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            boardTitle: boardTitle,
            newName: newName
        })
    })
    .then(response => {
        if(response.ok) {
            alert('게시판 이름이 성공적으로 변경되었습니다.');
            location.reload(); // 페이지 새로고침으로 변경사항 반영
        } else {
            alert('게시판 이름 변경에 실패했습니다.');
        }
    })
    .catch(error => console.error('Error:', error));
}

</script>

</body>
</html>
