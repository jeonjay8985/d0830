<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function changesubmit()/*이벤트이름*/ {
    //alert("경고");
	document.frm.submit();//form이름 frm 
 }

function check() {
	/* if(document.frm.lentno .value==""){
		alert("대출번호를 입력하세요");
		document.frm.lentno .focus(); 
		return false;           
	} */
	if(document.frm.custname.value==""){
		alert("성명을 입력하세요");
		document.frm.custname.focus();
		return false;  
	}

	if(document.frm.bookno.value==""){
		alert("도서코드를 입력하세요");
		document.frm.bookno.focus(); 
		return false;  
	}
	if(document.frm.bookname.value==""){
		alert("도서이름을 입력하세요");
		document.frm.bookname.focus(); 
		return false;  
	}
	if(document.frm.outdate.value==""){
		alert("대출일자를 입력하세요");
		document.frm.outdate.focus(); 
		return false;  
	}
	if(document.frm.indate.value==""){
		alert("반납일자를 입력하세요");
		document.frm.indate.focus(); 
		return false;  
	}
	

	frm.action="insert_recordsProcess.jsp";
	


	//document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>도서 대출 예약 정보 등록 화면</h1>
<%@ include file = "dbconn.jsp" %>


<%
    int sel=0;   //반납 여부 체크 변수 초기화
    ResultSet rs=null;
    PreparedStatement pstmt=null;
        
    //String lentno =request.getParameter("lentno"); //대출번호 입력시 칸 사라짐 방지
    String custname=request.getParameter("custname"); 
    String bookno = request.getParameter("bookno");
    String outdate = request.getParameter("outdate");
    String indate = request.getParameter("indate");
    String status = request.getParameter("status");
    String clas = request.getParameter("class");
    String bookname = "";
    
    /* if(lentno  == null) {
    	lentno ="";
    } */
    if(custname == null) {
    	custname ="";
    }
    if(status  == null) {
    	status ="";
    }
    if(clas == null) {
    	clas ="";
    }
    if(outdate == null) {
    	outdate ="";
    }
    if(indate == null) {
    	indate ="";
    }
    if(bookno == null) {
    	bookno="";  //bookno 초기화
    }else{
    
     try{
    	  String sql = "select bookname from bookinfo830 where bookno=?";
    	  pstmt=conn.prepareStatement(sql);
    	  pstmt.setString(1, bookno);
    	    	  rs=pstmt.executeQuery();
		  if(rs.next()){
			  bookname=rs.getString(1);
			  
		  }
    	  }catch(Exception e) {
    	    System.out.println("에러" + e.getMessage());
        }
    }
    

 %>


<form name="frm" method="post" action="insert_records.jsp" method="post">
<table border=1 id="tab2">
<tr> 

<% 
   String sql = "select max(lentno) from reservation0830";
   pstmt=conn.prepareStatement(sql);
   rs=pstmt.executeQuery();
   int lentno = 0;
   if(rs.next()) {
	   lentno = rs.getInt(1)+1;
   }
%>
      <th>대출번호</th>
      <td width=33%><input type="text" name="lentno"  value="<%=lentno %>" id=in1></td>
      <th>고객성명</th>
      <td><input type="text" name="custname"  value="<%=custname %>" id=in1></td>
</tr>

<tr> 
      <th>도서코드</th>
      <td width=33%><input type="text" name="bookno" value="<%=bookno %>" id=in1 onchange="changesubmit();"></td>
      <th>도서이름</th>
      <td><input type="text" name="bookname" value="<%=bookname %>" id=in1></td>
</tr>

<tr> 
      <th>대출일자</th>
      <td width=33%><input type="text" name="outdate" value="<%=outdate %>"  id=in1></td>
      <th>반납일자</th>
      <td><input type="text" name="indate" id=in1 value="<%=indate %>" onchange="changesubmit();"
           <%if(indate == "") {sel=1;}else {sel=0;}%>></td>
           
</tr>

<tr> 
      <th>대출상태</th>
      <td width=33%>
         <input type="Radio" name="status" value="1" onchange="changesubmit();"
             <%if(sel==1) {%>checked<%}%>>대출
         <input type="Radio" name="status" value="2" onchange="changesubmit();"
             <%if(sel==0) {%>checked<%}%>>반납
      </td>
      
       <th>등급</th>
       <td>
      <select name = "class" id=in3>
      <option value ="S" <% if(clas.equals("S")){ %>selected <%}%>> S</option>
      <option value ="A" <% if(clas.equals("A")){ %>selected <%}%>> A</option>
      <option value ="B" <% if(clas.equals("B")){ %>selected <%}%>> B</option>
      <option value ="C" <% if(clas.equals("C")){ %>selected <%}%>> C</option>
      </select>
     </td>
</tr>


<tr>
    <td colspan = 4 align = center>
    
    <input id=bt1 type="submit" value="저장" onclick="check()">
    <input id=bt2 type="reset" value="취소" > 
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>


</body>
</html>