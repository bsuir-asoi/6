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
		ID = Request("ID")		
		rs.Open "Select * from stud where id = " & ID, con, 3, 3		
	Case "ADD"
		rs.Open "Select * from stud", con, 3, 3	
		ID = rs.RecordCount
		NAME = Request.Form("s_name")
		GROUP = Request.Form("s_group")	
		AGE = Request.Form("s_age")
		PROGRESS = Request.Form("s_progress")
		PHOTO = Request.Form("s_photo")
		if rs.eof = false then 
			rs.movelast			
		end if
		rs.AddNew
		rs("name") = NAME
		rs("group") = GROUP
		rs("age") = AGE
		rs("progress") = PROGRESS
		rs("photo") = PHOTO
		rs.Update
		rs.Requery
		rs.MoveLast	
		Response.Redirect "db.asp" 
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

<html>
<head>
	<style type="text/css">
		#photo{
		height:200px;
		align:middle;
		}
	</style>
</head>

<body background="bkg-blu.jpg">
<h1><center><font color=3f3f3f>Добавление студента</font></center></h1>
<br>


<form name="db_add" action="db_add.asp" method="post">
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
						<td><input type="Text" size=20 name="s_id" id="s_id" value=<%=strID%>></td>
					</tr>
					<tr>
						<td>Имя студента:</td>
						<td><input type="Text" size=20 name="s_name" id="s_name" id="test" value=<%=strName%>></td>
					</tr>
					<tr>
						<td>Группа:</td>
						<td><input type="Text" size=20 name="s_group" id="s_group" value=<%=strGroup%>></td>
					</tr>
					<tr>
						<td>Возраст:</td> 
						<td><input type="Text" size=20 name="s_age" id="s_age" value=<%=strAge%>></td>
					</tr>
					<tr>
						<td>Успеваемость:</td> 
						<td><input type="Text" size=20 name="s_progress" id="s_progress" value=<%=strProgress%>></td>
					</tr>
					<tr>
						<td>Фото:</td> 
						<td><input type="Text" size=20 name="s_photo" id="s_photo" value=<%=strPhoto%>></td>
					</tr>	
				
				<!--</table>
			</td>
		</tr>-->
	</table>
	
	<table align="center">
		<tr>
			<td>		
					<input type=hidden name="Action" value="ADD">							
					<input type=submit value = "Добавить">	
					<input type=reset value = "Сброс">
			</td>	
		</tr>	
	</table>
</form>
<table align="center">
	<tr>
		<td>	
			<form action="db.asp">
			<input type=submit value = "Вернуться">
			</form>
		</td>	
	</tr>	
</table>
</body>
</html>