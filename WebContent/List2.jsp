<%@page import="java.awt.Button"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
} /* 브라우저별 기본 여백 차이가 있기에 작성한다. */
body {
	font-size: 9pt;
}

td {
	font-size: 9pt;
}

a {
	cusor: pointer;
	color: #000000;
	text-decoration: none;
	font-size: 9pt;
	line-height: 150%;
}

a:HOVER, a:ACTIVE {
	font-size: 9pt;
	color: #F28011;
	text-decoration: underline;
}
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
	style="overflow-y: auto;" bgcolor="gray">
	<%@ page contentType="text/html; charset=UTF-8"%>
	<%
		request.setCharacterEncoding("utf-8");
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		String _year = request.getParameter("year");
		String _month = request.getParameter("month");
		if (_year != null)
			year = Integer.parseInt(_year);
		if (_month != null)
			month = Integer.parseInt(_month);
		now.set(year, month - 1, 1); //출력할 년도, 월로 설정
		year = now.get(Calendar.YEAR); //변화된 년, 월
		month = now.get(Calendar.MONTH) + 1;
		int end = now.getActualMaximum(Calendar.DAY_OF_MONTH); //해당월의 마지막 날짜
		int w = now.get(Calendar.DAY_OF_WEEK); //1~7(일~토)
		int date=Integer.parseInt(request.getParameter("date"));
	%>
	<table width="100%" height="100%" border="1" cellspacing="0"
		cellpadding="0">
		<!--전체 테이블 시작  -->
		<tr height="70" align="center">
			<td colspan="2">헤더 영역</td>
		</tr>
		<tr>
		<!--오른쪽  -->
		<td width="80%" rowspan="2"><%=month%>월<%=date %>일 일정
			<table>
				<tr>
				<td><img alt="" src="images/jisu.jpg" width="50px" height="50px"></td><td>노는게 제일좋아 진경아 온천가자</td></tr>
				<tr><td>잇ㅐ키 뭐하는 새키지?</td><td><img alt="" src="images/jin.jpg" width="50px" height="50px" ></td></tr>
				<tr><td>나도 같이 놀자</td><td><img alt="" src="images/lee.jpg" width="50px" height="50px" ></td></tr>
				<tr><td>공부좀 해요</td><td><img alt="" src="images/tae.jpg" width="50px" height="50px" ></td></tr>
			</table>
		</td>
			<td>
				<!--왼쪽  -->
				<table width="20%" height="100%" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<!--전체적인 달력 테이블  -->
							<table width="100%" height="100%">
								<!--년/달  -->
								<table width="210" border="0" cellpadding="1" cellspacing="2">
									<tr height="30">
										<td align="center"><a
											href="List2.jsp?year=<%=year%>&month=<%=month - 1%>">◀</a> <b><%=year%>年
												<%=month%>月</b> <a
											href="List2.jsp?year=<%=year%>&month=<%=month + 1%>">▶</a></td>
										<td><button onclick="location.href='List2.jsp'">today</button></td>
									</tr>
								</table>

								<!--월~금,날짜 -->
								<table width="210" border="0" cellpadding="2" cellspacing="1"
									bgcolor="#cccccc">
									<tr height="25">
										<td align="center" bgcolor="#e6e4e6"><font color="red">일</font></td>
										<td align="center" bgcolor="#e6e4e6">월</td>
										<td align="center" bgcolor="#e6e4e6">화</td>
										<td align="center" bgcolor="#e6e4e6">수</td>
										<td align="center" bgcolor="#e6e4e6">목</td>
										<td align="center" bgcolor="#e6e4e6">금</td>
										<td align="center" bgcolor="#e6e4e6"><font color="blue">토</font></td>
									</tr>
									<%
										int newLine = 0;
										//1일이 어느 요일에서 시작하느냐에 따른 빈칸 삽입
										out.println("<tr height='25'>");
										for (int i = 1; i < w; i++) {
											out.println("<td bgcolor='#ffffff'>&nbsp;</td>");
											newLine++;
										}

										String fc, bg;
										for (int i= 1; i <= end; i++) {
											
											fc = (newLine == 0) ? "red" : (newLine == 6 ? "blue" : "#000000");
											bg = "#ffffff";
											out.println("<td align='center' bgcolor=" + bg +
												"><font color=" + fc + ">" +
											"<div onclick=location.href='List.jsp?date="+ i + "'>"+
												i+"</div></font></td>");
											newLine++;
											if (newLine == 7 && date != end) {
												out.println("</tr>");
												out.println("<tr height='25'>");
												newLine = 0;
											}
										}
										while (newLine > 0 && newLine < 7) {
											out.println("<td bgcolor='ffffff'>&nbsp;</td>");
											newLine++;
										}
										out.println("</tr>");
									%>
								</table>
							</table>
						</td>
						
					<tr height="80">
						<td><img alt="" src="images/jin2.jpg" width="100%" height="400">
						</td>
					</tr>
					</td>
				</table>
		</tr>
	</table>
</body>
</html>