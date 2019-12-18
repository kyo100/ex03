<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>주소목록</h1>
	<form name="frm" action="list">
		<select name="key">
			<option value="name" <c:out value="${key=='name'?'selected':''}"/>>이름</option>
			<option value="address" <c:out value="${key=='address'?'selected':''}"/>>주소
		</select>
		<input type="text" name="word" value="${word}">
		<input type="submit" value="검색">
		<input type="hidden" name="page" value="${page}">
		검색수:${total}
	</form>
	<table border=1 width=700>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
			<th>전화</th>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.id}</td>
				<td>${vo.name}</td>
				<td>${vo.address}</td>
				<td>${vo.tel}</td>
			</tr>
		</c:forEach>
	</table>
	<button onClick="funPre()">◀</button>
	<button onClick="funNext()">▶</button>
	<span id="paging"></span>
</body>
<script>
	var page=${page};
	var totpage=${totpage};
	$("#paging").html(page + "/" + totpage);
	
	function funPre(){
		if(page > 1){
			page=page-1;
			frm.page.value=page;	
			$("#paging").html(page + "/" + totpage);
			frm.submit();
		}
	}
	function funNext(){
		if(page < totpage){
			page=page+1;
			frm.page.value=page;
			$("#paging").html(page + "/" + totpage);
			frm.submit();
		}
	}
</script>
</html>