<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn.jsp" %>
<%
   //request.setCharacterEncording("utf-8"); //한글 깨지면 추가
   String bookno  = request.getParameter("bookno");   //사원번호(id) 데이터
   String author = request.getParameter("author");
   String bookname = request.getParameter("bookname");
   System.out.println("book :"+bookname);
   
   
   PreparedStatement pstmt = null;
   try{
      String sql = "update bookinfo830 set author=?, bookname=? where bookno=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(3, bookno);    
      pstmt.setString(1, author);  
      pstmt.setString(2, bookname);

      pstmt.executeUpdate();
      %>
      <script>
       alert("수정 성공");
       location.href="check_info.jsp";
      </script>
      <%
   }catch(Exception e) {
	   System.out.println("수정 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
   
%>

</body>
</html>