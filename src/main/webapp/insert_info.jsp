<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {

	if(document.frm.bookno.value==""){
		alert("도서코드를 입력하세요");
		document.frm.bookno.focus(); 
		return false;  
	}
	if(document.frm.author.value==""){
		alert("작가를 입력하세요");
		document.frm.author.focus(); 
		return false;  
	}
	if(document.frm.bookname.value==""){
		alert("도서이름을 입력하세요");
		document.frm.bookname.focus(); 
		return false;  
	}

	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>도서 정보 등록 화면</h1>
<%@ include file = "dbconn.jsp" %>
<form name="frm" method="post" action="insert_infoProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>도서코드</th>
      <td><input type="text" name="bookno" id=in1></td>
</tr>

<tr> 
      <th>저자</th>
      <td><input type="text" name="author" id=in1></td>
</tr>

<tr> 
      <th>도서이름</th>
      <td><input type="text" name="bookname" id=in1></td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="등록" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>