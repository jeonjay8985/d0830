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

<h1>도서 대출 정보 조회</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>대출번호</th>
    <th>고객성명</th>
    <th>도서코드</th>
    <th>도서명</th>
    <th>대출일자</th>
    <th>반납일자</th>
    <th>대출상태</th>
    <th>등급</th>
    <th>관리</th>
 
    
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
     int no =0;
     try{
    	 String sql = "select b.lentno, b.custname, b.bookno, a.bookname, to_char(outdate, 'yyyy-mm-dd'), to_char(indate, 'yyyy-mm-dd'), b.status, b.class from bookinfo830 a, reservation0830 b where a.bookno=b.bookno";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String lentno = rs.getString("lentno");
    		 String custname= rs.getString("custname");
    		 String bookno = rs.getString("bookno");
    		 String bookname = rs.getString("bookname");
    		 String outdate = rs.getString(5);
    		 String indate = rs.getString(6);
    		 String status = rs.getString("status");
    		 String clas = rs.getString("class");
    		 
    		no++;
%>
<tr>
    <td><%=no %> </td>
    <td><a href = "update_records.jsp?id=<%=lentno %>"><%=lentno %></a> </td>
    <td><%=custname %> </td>
    <td><%=bookno %> </td>
    <td><%=bookname %> </td>
    <td><%=outdate %> </td>
    <td><%=indate %> </td>
    <td><%=status %> </td>
    <td><%=clas %> </td>
    <td>
    <a href="delete_info.jsp?bookno=<%=bookno %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    </td>
</tr>

<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 10  align = center>
    <input id=bt1 type="button" value="도서정보 추가" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="insert_records.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>