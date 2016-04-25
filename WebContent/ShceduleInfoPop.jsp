<%@ page language="java" contentType="text/html; charset=UTF-8"    
    pageEncoding="UTF-8"
    import="project.*"
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="comm.css">

<%	
	String email = request.getParameter("email");
	String year = request.getParameter("year");
	String _Seq = request.getParameter("seq");
	String _Getdate = request.getParameter("getdate");
%>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

	var _seq = "<%=_Seq%>";
	var _getdate = "<%=_Getdate%>";

	$(function(){
		
		$("#add_date").val(_getdate);
		$("#hdAdd_date").val(_getdate);
		
		if(_seq > 0){
			//상세화면설정
			fnViewSet("V");
			
			<%
				Schedule sc = new Schedule();
				ScheduleDao sd = ScheduleDao.getInstance();
				sc = sd.selectInfo(Integer.parseInt(_Seq));				
			%>
			
			//상세정보
			$("#lblWriter").text("<%=sc.getWriter()%>");
			$("#lblTitle").text("<%=sc.getTitle()%>");
			$("#lblDate").text("<%=sc.getReg_day()%>");
			$("#lblContent").text("<%=sc.getContent()%>");
			
			//수정정보
			$("input[name='writer']").val("<%=sc.getWriter()%>");
			$("input[name='title']").val("<%=sc.getTitle()%>");
			$("textarea[name='content']").val("<%=sc.getContent()%>");
		
		}
		else{
			//등록화면설정
			fnViewSet("I");
		}
		
		$("#btnModifyView").click(function(){
			fnViewSet("I");
			$("#btnBack").css("display","");
			$("#btnClose").css("display","none");
		});
		
	});
	
	function fnViewSet(type){
		if(type == "V"){
			$("#addTable").css("display","none");
			$("#ViewTable").css("display","");
		}
		else{
			$("#addTable").css("display","");
			$("#ViewTable").css("display","none");
		}
	}
	
</script>

</head>
<body>
	
	<form action="ShceduleInfoPopPro.jsp" method="post">
		<input type="hidden" name="seq" value="<%=Integer.parseInt(_Seq)%>">
		<!-- 상세테이블 -->
		<table id="ViewTable" border="1" style="display:none;">
			<caption>일정 상세</caption>
			<tr>
				<th>작성자:</th>
				<td>
					<lable id="lblWriter">작성자</lable>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<lable id="lblTitle">제목</lable>
				</td>
			</tr>
			<tr>
				<th>일정</th>
				<td>
					<lable id="lblDate">일정</lable>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<lable id="lblContent">내용</lable>
				</td>
			</tr>
			
			<tr id="modifyButton">
				<td colspan="2" align="center">
					<input id="btnModifyView" type="button" value="수정">
					<input type="button" onClick="self.close()" value="취소">
				</td>
			</tr>
		</table>
		
		<!-- 입력테이블 -->	
		<table id="addTable" border="1" style="display:none;">
			<caption>일정 작성</caption>
			<tr>
				<th>작성자:</th>
				<td>
					<input type="text" required="required" name="writer" value="<%=email%>">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" required="required" name="title">
				</td>
			</tr>
			<tr>
				<th>일정</th>
				<td>
					<input type="text" id="add_date" required="required" disabled="disabled"/>
					<input type="hidden" id="hdAdd_date" name="add_date" />
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" cols="40" name="content" required="required"></textarea>
				</td>
			</tr>
			<tr id="saveButton">
				<td colspan="2" align="center">
					<input type="submit" value="등록">
					<input id="btnBack" type="button" onClick="fnViewSet('V')" value="취소" style="display:none">
					<input id="btnClose" type="button" onClick="self.close()" value="취소">
				</td>				
			</tr>
			
		</table>
		
		
	</form>
</body>
</html>