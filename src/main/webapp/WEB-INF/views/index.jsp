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
                <fieldset class="terran-field">
                    <legend><a href="/"> [테란 네트워크]</a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/terranBoard/readPost?postNum=2">테란 종족특성</a></td></tr>
                        <tr><td><a href="/tVsZBoard/readPost?postNum=2">선엔베 업테란 운영</a></td></tr>
                        <tr><td><a href="/tVsZBoard/readPost?postNum=3">투배럭 아카데미 운영</a></td></tr>
                        <tr><td><a href="/tVsZBoard/readPost?postNum=4">개사기 8배럭 완막</a></td></tr>
                        <tr><td><a href="/tVsZBoard/readPost?postNum=5">111 전략</a></td></tr>
                        <tr><td><a href="/tVsPBoard/readPost?postNum=9">업테란 운영법</a></td></tr>
                        <tr><td><a href="/tVsPBoard/readPost?postNum=3">타이밍 찌르기 정리</a></td></tr>
                        <tr><td><a href="/tVsPBoard/readPost?postNum=4">안티 캐리어 빌드</a></td></tr>
                        <tr><td><a href="/tVsPBoard/readPost?postNum=5">정석. 배럭더블 운영</a></td></tr>
                        <tr><td><a href="/tVsTBoard/readPost?postNum=2">기본 정석 운영은?</a></td></tr>
                        <tr><td><a href="/tVsTBoard/readPost?postNum=3">그래도 빨리 끝내려면?</a></td></tr>
                        <tr><td><a href="/tVsTBoard/readPost?postNum=4">원팩원스타 전략</a></td></tr>
                        <tr><td><a href="/tVsTBoard/readPost?postNum=5">후반 운영법</a></td></tr>
                    </table>
                </fieldset>
            </div>
            <div class="col-sm-3">
                <fieldset class="zerg-field">
                    <legend><a href="/"> [저그 네트워크]</a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/zergBoard/readPost?postNum=2">저그 종족특성</a></td></tr>
                        <tr><td><a href="/zVsTBoard/readPost?postNum=3">투해처리 뮤탈 후 하이브</a></td></tr>
                        <tr><td><a href="/zVsTBoard/readPost?postNum=4">4드론...</a></td></tr>
                        <tr><td><a href="/zVsTBoard/readPost?postNum=5">초반 빌드 분기 정리</a></td></tr>
                        <tr><td><a href="/zVsTBoard/readPost?postNum=6">뮤탈짤짤이 공략</a></td></tr>
                        <tr><td><a href="/zVsPBoard/readPost?postNum=2">973빌드 사용법</a></td></tr>
                        <tr><td><a href="/zVsPBoard/readPost?postNum=3">5해처리 히드라 운영</a></td></tr>
                        <tr><td><a href="/zVsPBoard/readPost?postNum=4">하이브 운영에 대해..</a></td></tr>
                        <tr><td><a href="/zVsPBoard/readPost?postNum=5">5뮤탈 운영법</a></td></tr>
                        <tr><td><a href="/zVsZBoard/readPost?postNum=2">초반빌드 상성 정리</a></td></tr>
                        <tr><td><a href="/zVsZBoard/readPost?postNum=3">뮤짤로 스커지 잡기</a></td></tr>
                        <tr><td><a href="/zVsZBoard/readPost?postNum=4">4드론 대신 쓸 날먹빌드</a></td></tr>
                        <tr><td><a href="/zVsZBoard/readPost?postNum=5">빌드상성 극복하기</a></td></tr>
                    </table>
                </fieldset>
            </div>
            <div class="col-sm-3">
                <fieldset class="protoss-field">
                    <legend><a href="/"> [프로토스 네트워크] </a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/protossBoard/readPost?postNum=2">프로토스 종족특성</a></td></tr>
                        <tr><td><a href="/pVsTBoard/readPost?postNum=2">안전한 23넥 아비터 운영</a></td></tr>
                        <tr><td><a href="/pVsTBoard/readPost?postNum=3">극혐? 대각생넥캐리어!</a></td></tr>
                        <tr><td><a href="/pVsTBoard/readPost?postNum=4">전진로보 전략</a></td></tr>
                        <tr><td><a href="/pVsTBoard/readPost?postNum=5">최신 운영법</a></td></tr>
                        <tr><td><a href="/pVsZBoard/readPost?postNum=2">선게이트 운영법</a></td></tr>
                        <tr><td><a href="/pVsZBoard/readPost?postNum=3">973 찌르기 대응법</a></td></tr>
                        <tr><td><a href="/pVsZBoard/readPost?postNum=5">포지더블 운영법</a></td></tr>
                        <tr><td><a href="/pVsZBoard/readPost?postNum=4">커공발 운영법</a></td></tr>
                        <tr><td><a href="/pVsPBoard/readPost?postNum=2">기어리버 운영법</a></td></tr>
                        <tr><td><a href="/pVsPBoard/readPost?postNum=4">빌드 상성 정리</a></td></tr>
                        <tr><td><a href="/pVsPBoard/readPost?postNum=5">2게이트 대처법</a></td></tr>
                        <tr><td><a href="/pVsPBoard/readPost?postNum=6">3게이트 드라군</a></td></tr>
                    </table>
                </fieldset>
            </div>
        </div>
    </div>
</section>
<%@include file="./include/footer.jspf" %>
</body>
</html>
