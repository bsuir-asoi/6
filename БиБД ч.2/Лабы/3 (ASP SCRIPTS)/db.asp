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
Dim con, rs, strID, strName, strGroup, strAge, strProgress, strPhoto, RC, dbStatus
Set con=Server.CreateObject("ADODB.Connection")
Set rs=Server.CreateObject("ADODB.RecordSEt")
con.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " & _
server.mappath("db/studdb.mdb")
if con.State=1 then
	dbStatus = "Подключено"
	Select Case Action
	Case "OPEN"
		rs.Open "Select * from stud", con, 3, 3	
	Case "BACK"
		rs.Open "Select * from stud", con, 3, 3
		Action = Request("Action")
		if (Request.Form("action") = "BACK" )   then
			Do While (Cint(rs.Fields("id")) <> Cint(Request.Form("id")) and not (rs.EOF))
				rs.MoveNext
				if (rs.EOF) then
					Exit Do
				end if
			Loop

			if(rs.BOF) then
				rs.MoveFirst
			Else
				rs.MovePrevious
				if(rs.BOF) then
					rs.MoveLast
				end if
			end if
			end if
	Case "NEXT"
		rs.Open "Select * from stud", con, 3, 3
		Action = Request("Action")
		if (Request.Form("Action") = "NEXT" and not(rs.EOF)) then
			Do While (Cint(rs.Fields("id")) <> Cint(Request.Form("id")))
				rs.MoveNext
				if (rs.EOF) then
					Exit Do
				end if
			Loop

			if(rs.EOF) then
				rs.MoveFirst
			Else
				rs.MoveNext
				if(rs.EOF) then
					rs.MoveFirst
				end if
		end if
		end if
	Case "DELETE"
		ID = Request("ID")	
		rs.Open "Select * from stud where id = " & ID, con, 3, 3
		rs.Delete
		rs.Update
		rs.Requery
		rs.Close
		rs.Open "Select * from stud", con, 3, 3
	End Select		
	if rs.EOF=false then 
		strID = rs("id")
		strName = rs("name")
		strGroup = rs("group")
		strAge = rs("age")
		strProgress = rs("progress")
		strPhoto = rs("photo")		
	else
		strName="???"
		strGroup="???"
		strAge="???"
		strProgress="???"
		strPhoto="???"
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
		<!--<tr>
			<td colspan=2>
				<table border="0" align="center">-->
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
					<tr>
						<td colspan="2">Фото:<br><img alt="foto" border="1" align="middle" id="photo" src="img/<%=strPhoto%>"></td>
					</tr>
				<!--</table>
			</td>
		</tr>-->
	</table>
</form>

<table align="center">
	<tr>
		<td>
			<form name="db_open" action="db.asp" method="post">
				<input type=hidden name="Action" value="OPEN">
				<input type=submit value = "Открыть БД">	
			</form>
		</td>
		<td>		
			<form name="db_back" action="db.asp" method="post">
				<input type=hidden name="Action" value="BACK">
				<input type=hidden name="ID" value=<%=strID%>>
				<input type=submit value = "Назад">	
			</form>
		</td>	
		<td>
			<form name="db_next" action="db.asp" method="post">
				<input type=hidden name="Action" value="NEXT">
				<input type=hidden name="ID" value=<%=strID%>>
				<input type=submit value = "Вперед">	
			</form>
		</td>
		<td>		
			<form name="db_add" action="db_add.asp" method="post">
				<input type=hidden name="Action" value="OPEN">
				<input type=hidden name="ID" value=<%=strID%>>				
				<input type=submit value = "Добавить">	
			</form>
		</td>
		<td>		
			<form name="db_edit" action="db_edit.asp" method="post">
				<input type=hidden name="Action" value="OPEN">
				<input type=hidden name="ID" value=<%=strID%>>
				<input type=submit value = "Обновить">	
			</form>
		</td>
		<td>		
			<form name="db_delete" action="db.asp" method="post">
				<input type=hidden name="Action" value="DELETE">
				<input type=hidden name="ID" value=<%=strID%>>
				<input type=submit value = "Удалить">	
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
				<input type=submit value = "Просмотреть книги студента">	
			</form>			
		</td>
	</tr>
</table>
<table align="center">		
	<tr>
		<td>
			<form name="db_search" action="db_search.asp" method="post">		
				<input type=submit value = "Поиск">	
			</form>			
		</td>
		<td>
			<form name="db_excel" action="db_excel.asp" method="post">				
				<input type=submit value = "Открыть в Excel">	
			</form>			
		</td>
		<td>
			<form name="db_word" action="db_word.asp" method="post">				
				<input type=submit value = "Открыть в Word">	
			</form>			
		</td>		
	</tr>	
</table>


</body>
</html>