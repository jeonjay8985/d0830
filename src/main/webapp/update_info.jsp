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
		alert("저자를 입력하세요");
		document.frm.author.focus(); 
		return false;  
	}
	if(document.frm.bookname.value==""){
		alert("도서이름을 입력하세요");
		document.frm.bookname.focus(); 
		return false;  
	}

	document.frm.submit(); 
}
</script>


</head>

<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>도서 정보 수정 화면</h1>
<%@ include file = "dbconn.jsp" %>
<%
   String bookno = request.getParameter("bookno"); 
   ResultSet rs=null;
   PreparedStatement pstmt = null;
   try{
	   String sql="select * from bookinfo830 where bookno=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, bookno); 
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String author = rs.getString("author");
		   String bookname = rs.getString("bookname");

		   
%>
<form name="frm" method="post" action="update_infoProcess.jsp">
<table border=1 id="tab2">

<tr> 
      <th>도서코드</th>
      <td><input type="text" name="bookno" value="<%=bookno%>"id=in1></td>
</tr>

<tr> 
      <th>저자</th>
      <td><input type="text" name="author" value="<%=author%>" id=in1></td>
</tr>

<tr> 
      <th>도서이름</th>
      <td><input type="text" name="bookname" value="<%=bookname%>" id=in1></td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="수정" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
<%
	   }
    }catch(Exception e){
 	  System.out.println("수정 실패" +e.getMessage());
   }
%>

</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>