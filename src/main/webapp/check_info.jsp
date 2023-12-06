<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>

<section> 
<%@ include file = "dbconn.jsp" %>

<h1>도서 정보 목록</h1>
        <% 
        ResultSet rs = null;
        PreparedStatement pstmt = null;
 
        int sum =0;
        
    	 String sql = "select count(*) from bookinfo830";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 if(rs.next()) {
    		 sum=rs.getInt(1);
    	 }
    	 %>
    	 
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;총 <%=sum %>권
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>도서코드</th>
    <th>저자</th>
    <th>도서명</th>
    <th>구분</th>
</tr>

<% 
     int no =0;
    
     try{
    	 sql = "select*from bookinfo830";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String bookno = rs.getString("bookno");
    		 String author= rs.getString("author");
    		 String bookname = rs.getString("bookname");

    		 no++;
%>

<tr>
    <td><%=no %> </td>
    <td><%=bookno %> </td>
    <td><%=author %> </td>
    <td><%=bookname %> </td>

    <td>
     <a href="update_info.jsp?bookno=<%=bookno %>"> 수정</a>/
    
     <a href="delete_info.jsp?bookno=<%=bookno %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    </td>
</tr>

<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>