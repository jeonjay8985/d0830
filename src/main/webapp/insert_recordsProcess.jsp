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
    PreparedStatement pstmt = null;
    //ResultSet rs = null;
    String lentno = request.getParameter("lentno");
    String custname = request.getParameter("custname");
    String bookno = request.getParameter("bookno");
    //String bookname = request.getParameter("bookname");
    String outdate = request.getParameter("outdate");
    String indate = request.getParameter("indate");
    String status = request.getParameter("status");
    String clas = request.getParameter("class");
    
    try {
    	String sql = "insert into reservation0830 values(?,?,?,?,?,?,?)";
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, lentno);
    	pstmt.setString(2, custname);
    	pstmt.setString(3, bookno);
    	//pstmt.setString(4, bookname);
    	pstmt.setString(4, outdate);
    	pstmt.setString(5, indate);
    	pstmt.setString(6, status);
    	pstmt.setString(7, clas);
    	
    	pstmt.executeUpdate();
    	
    	//재고 마이너스, 상품코드를 읽어서 재고를 가져와 빼기해줌
    	
    	//int stock=0;
    	//sql="select unitsInstock from product0822 where productId=?";
    	
    	 %>
      <script>
      alert("저장 완료되었습니다");
      location.href="check_records.jsp";
      </script>
      <%

    }catch(Exception e) {
    	System.out.println("등록 오류:" +e.getMessage());
    }
%>

</body>
</html>