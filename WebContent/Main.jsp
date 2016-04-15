
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.util.Calendar"%>
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
	String email=request.getParameter("email");
	int date = 0;
%>
<style type="text/css">
* { padding: 0px; margin: 0px; } /* 브라우저별 기본 여백 차이가 있기에 작성한다. */
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

<script type="text/javascript">
	var year = document.getElementById("select_year").innerHTML;
	var month = document.getElementById("select_month").innerHTML;
	var date = date.innerHTML;
	function onload_fn() {
		calendar(2016, 1);
	}
	function getValue(date) {
		year = document.getElementById("select_year").innerHTML;
		month = document.getElementById("select_month").innerHTML;
		date = date.innerHTML;
		alert(year + '년 ' + month + '월 ' + date + '일 ');
	}
	function calendar(year, month) {
		var tags = "<table cellspacing='0' border='1' onclick='cal();' style='cursor:pointer'>";
		tags += "<tr><th>일</th><th>월</th><th> 화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr><tr>";
		var date = new Date();
		date.setFullYear(year, month, 1);
		var day = date.getDay();
		for (var i = 0; i < day; i++) {
			tags += '<td></td>';
		}
		while (date.getMonth() == month) {
			if (date.getDate() != 1 && date.getDay() == 0) {
				tags += '</tr><tr>';
			}
			tags += '<td onclick="getValue(this)">' + date.getDate() + '</td>';
			date.setDate(date.getDate() + 1);
		}
		var days = date.getDay();
		if (days != 0) {
			var last = 6 - days + 1;
			for (var i = 0; i < last; i++) {
				tags += '<td></td>';
			}
		}
		tags += '</tr></table>';
		var c = document.getElementById("test");
		c.innerHTML = tags;
	}
	function before_month() {
		var year = window.document.getElementById("select_year");
		var month = window.document.getElementById("select_month");
		if (month.innerHTML == 1) {
			month.innerHTML = 12;
			year.innerHTML = parseInt(year.innerHTML) - 1;
		} else {
			month.innerHTML = parseInt(month.innerHTML) - 1;
		}
		calendar(year.innerHTML, parseInt(month.innerHTML) - 1);
	}
	function after_month() {
		var year = window.document.getElementById("select_year");
		var month = window.document.getElementById("select_month");
		if (month.innerHTML == 12) {
			month.innerHTML = 1;
			year.innerHTML = parseInt(year.innerHTML) + 1;
		} else {
			month.innerHTML = parseInt(month.innerHTML) + 1;
		}
		calendar(year.innerHTML, parseInt(month.innerHTML) - 1);
	}
</script>
<title>Insert title here</title>
</head>
<body onload="onload_fn()">
	<table width="100%" height="100%" border="1" cellspacing="0"
		cellpadding="0">
		<tr align="center">
			<td style="font-size: 16; font-weight: bold; padding-left: 10;"
				align="left"><%=email%>님 환영합니다. <input type="button" name="logout"
				value="로그아웃"> <input type="text"
				style="width: 120; height: 20; border: 1px solid #aaaaaa;">
				<input type="button" name="검색" value="검색">
			</td>
		</tr>
		<tr align="center">
			<td>
				<table width="100%" border="1" cellspacing="0" cellpadding="0">
					<tr>
						<td width="15%" valign="top" id="leftmenutd" align="center">
							<input type="submit" name="일정" value="일정쓰기" onclick="location.href='WriteForm.jsp?email=<%=email%>'">
							<input type="button" name="페이지" value="마이페이지" onclick="location.href='Mypage.jsp?email=<%=email%>'"><br><br>
							<div style='cursor:pointer'>
								<span onclick="before_month();">◀</span>
								<span id="select_year">2016</span>년
								<span id="select_month">1</span> 월 
								<span onclick="after_month();">▶</span>
								<p>
								<div id='test'></div>
							</div>
						</td>
						<td width="85%">
							<br />&nbsp;<br />

							<center>
								<table width="210" border="0" cellpadding="1" cellspacing="2">
									<tr height="30">
										<td align="center">
										<a href="Main.jsp?year=<%=year%>&month=<%=month - 1%>&email=<%=email %>">◀</a>
										<b><%=year%>년  <%=month%>월</b>
										<a href="Main.jsp?year=<%=year%>&month=<%=month + 1%>&email=<%=email %>">▶</a></td>
									</tr>
								</table>

								<table width="210" border="0" cellpadding="2" cellspacing="1"
									bgcolor="#cccccc" style='cursor:pointer'>
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
										String getData = "02,07,21,29";
										int newLine = 0;
										//1일이 어느 요일에서 시작하느냐에 따른 빈칸 삽입
										out.println("<tr height='25'>");
										for (int i = 1; i < w; i++) {
											out.println("<td bgcolor='#ffffff'>&nbsp;</td>");
											newLine++;
										}

										String fc, bg, cg;
										String checkDay = "";
										for (date = 1; date <= end; date++) {

											fc = (newLine == 0) ? "red" : (newLine == 6 ? "blue" : "#000000");
											bg = "#ffffff";
											cg = "#B2CCFF";

											if (date < 10) {
												checkDay = "0" + date;
											} else {
												checkDay = Integer.toString(date);
											}
											if (getData.indexOf(checkDay) > -1) {
									%>
									<td align='center' bgcolor="#B2CCFF"
										onclick="location.href='WriteForm2.jsp?year=<%=year%>&month=<%=month%>&date=<%=date%>'">
										<%
											out.println("<font color=" + fc + ">" + date + "</font></td>");
												} else {
										%>
									
									<td align='center' bgcolor=" #ffffff "
										onclick="location.href='WriteForm2.jsp?year=<%=year%>&month=<%=month%>&date=<%=date%>'">
										<%
											out.println("<font color=" + fc + ">" + date + "</font></td>");
												}
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
							</center>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr align="center">
			<td style="border-top: 1px solid #cccccc; font-weight: bold;"><b>check
					- make</b></td>
		</tr>
	</table>
</body>
</html>