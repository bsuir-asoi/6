<html>
<head>
	<style type="text/css">
		#photo{
		height:200px;
		align:middle;
		}
	</style>
</head>
<%
Action = Request("Action")
If Action = "" Then
	Action = "OPEN"
End If
Dim con, rs, strID, strName, strGroup, strAge, strProgress, strPhoto, RC, dbStatus, sq
Set con=Server.CreateObject("ADODB.Connection")
Set rs=Server.CreateObject("ADODB.RecordSEt")
con.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " & _
server.mappath("db/studdb.mdb")
if con.State=1 then
	dbStatus = "Подключено"
	Select Case Action
	Case "OPEN"
		param = Request.Form("stdnt_menu")
		search_field = Request.Form("search_field")		
		if param = "" then
			param = Request.Form("lbr_menu")
			sq = "Select stud.* " _
			& "from stud " _
			& "inner join library on stud.id = library.id " _
			& "where " & param & " like " & "'%" + search_field + "%'"
		else
			sq = "Select * " _
			& "from stud " _
			& "where " & param & " like " & "'%" + search_field + "%'"			
		end if	
		
		rs.Open sq, con, 3, 3	
		sID = 1
	Case "BACK"
		sID = Request("sID")			
		param = Request.Form("PARAM")
		search_field = Request.Form("SEARCH_FIELD")
		if param = "library.id" OR param = "author" OR param = "title" then
			sq = "Select stud.* " _
			& "from stud " _
			& "inner join library on stud.id = library.id " _
			& "where " & param & " like " & "'%" + search_field + "%'"
		else
			sq = "Select * " _
			& "from stud " _
			& "where " & param & " like " & "'%" + search_field + "%'"			
		end if		
		rs.Open sq, con, 3, 3
		if not rs.EOF then
			RC = rs.RecordCount
			if sID = 1 then
				sID = rs.RecordCount
				rs.MoveLast
			else
				sID = sID - 1
				count = 1
				do while count < CLng(sID)
				rs.MoveNext
				count = count + 1
				loop
			end if
		end if			
	Case "NEXT"
		sID = Request("sID")			
		param = Request.Form("PARAM")
		search_field = Request.Form("SEARCH_FIELD")
		if param = "library.id" OR param = "author" OR param = "title" then
			sq = "Select stud.* " _
			& "from stud " _
			& "inner join library on stud.id = library.id " _
			& "where " & param & " like " & "'%" + search_field + "%'"
		else
			sq = "Select * " _
			& "from stud " _
			& "where " & param & " like " & "'%" + search_field + "%'"			
		end if			
		rs.Open sq, con, 3, 3
		if not rs.EOF then		
			RC = rs.RecordCount
			if (CLng(sID) = RC) then
				sID = 1
				rs.MoveFirst
			else
				sID = sID + 1
				count = 1
				do while count < CLng(sID)
				rs.MoveNext
				count = count + 1
				loop				
			end if
		end if	
	Case "MOVETO"
		sID = Request("sID")			
		param = Request.Form("PARAM")
		search_field = Request.Form("SEARCH_FIELD")
		if param = "library.id" OR param = "author" OR param = "title" then
			sq = "Select stud.* " _
			& "from stud " _
			& "inner join library on stud.id = library.id " _
			& "where " & param & " like " & "'%" + search_field + "%'"
		else
			sq = "Select * " _
			& "from stud " _
			& "where " & param & " like " & "'%" + search_field + "%'"			
		end if			
		rs.Open sq, con, 3, 3
		if not rs.EOF then
			RC = rs.RecordCount
			if sID = 1 then
				rs.MoveFirst
			else
				count = 1
				do while count < CLng(sID)
				rs.MoveNext
				count = count + 1
				loop
			end if
		end if	
	End Select		
	if rs.EOF=false then 
		strID = rs("id")
		strName = rs("name")
		strGroup = rs("group")
		strAge = rs("age")
		strProgress = rs("progress")
		strPhoto = rs("photo")		
	else
		strName="N\A"
		strGroup="N\A"
		strAge="N\A"
		strProgress="N\A"
		strPhoto="N\A"
	end if
else
dbStatus = "Не подключено"
end if
Set rs=Nothing
Set con= Nothing	
%>

<body background="bkg-blu.jpg">
<h1><center><font color=3f3f3f>База данных студентов</font></center></h1>
<br>


<form name="main">
	<table border="0" align="center">
		<tr>
			<td>
				<font>Статус БД:</font>
			</td>
			<td align="center"><font color=23d600><strong><%=dbStatus %></strong></font> <br> 
			</td>
		</tr>	
		<tr style="display:none">
			<td>ID студента:</td>
			<td><input type="Text" size=20 name="id" value=<%=strID%>></td>
		</tr>
		<tr>
			<td>Имя студента:</td>
			<td><input type="Text" size=20 name="name"value=<%=strName%> readonly></td>
		</tr>
		<tr>
			<td>Группа:</td>
			<td><input type="Text" size=20 name="group" value=<%=strGroup%> readonly></td>
		</tr>
		<tr>
			<td>Возраст:</td> 
			<td><input type="Text" size=20 name="age" value=<%=strAge%> readonly></td>
		</tr>
		<tr>
			<td>Успеваемость:</td> 
			<td><input type="Text" size=20 name="progress" value=<%=strProgress%> readonly></td>
		</tr>
		<tr>
			<td>Название фото:</td> 
			<td><input type="Text" size=20 name="s_photo" value=<%=strPhoto%> readonly></td>
		</tr>		
		<%if strPhoto <> "N\A" then%>
		<tr>
			<td colspan="2">Фото:<br><img alt="foto" border="1" align="middle" id="photo" src="img/<%=strPhoto%>"></td>
		</tr>
		<%end if%>
	</table>
</form>

<table align="center">
	<tr>
		<td>		
			<form name="db_back" action="db_search_result.asp" method="post">
				<input type=hidden name="Action" value="BACK">
				<input type=hidden name="sID" value=<%=sID%>>
				<input type=hidden name="PARAM" value=<%=param%>>
				<input type=hidden name="SEARCH_FIELD" value=<%=search_field%>>
				<input type=submit value = "Назад">	
			</form>
		</td>	
		<td>
			<form name="db_next" action="db_search_result.asp" method="post">
				<input type=hidden name="Action" value="NEXT">
				<input type=hidden name="sID" value=<%=sID%>>
				<input type=hidden name="PARAM" value=<%=param%>>
				<input type=hidden name="SEARCH_FIELD" value=<%=search_field%>>
				<input type=submit value = "Вперед">	
			</form>
		</td>
	</tr>
</table>
<table align="center">	
	<tr>
		<td>
			<form name="db_lib" action="db_lib.asp" method="post">
				<input type=hidden name="Action" value="OPEN">
				<input type=hidden name="ID" value=<%=strID%>>
				<input type=hidden name="sID" value=<%=sID%>>
				<input type=hidden name="PARAM" value=<%=param%>>
				<input type=hidden name="SEARCH_FIELD" value=<%=search_field%>>			
				<input type=hidden name="back" value="db_search_result.asp">					
				<input type=submit value = "Просмотреть книги студента">	
			</form>			
		</td>
	</tr>
</table>
<table align="center">
	<tr>
		<td>	
			<form action="db.asp" method="post">
			<input type=hidden name="Action" value="OPEN">
			<input type=submit value = "Вернуться">
			</form>
		</td>	
	</tr>	
</table>


</body>
</html>