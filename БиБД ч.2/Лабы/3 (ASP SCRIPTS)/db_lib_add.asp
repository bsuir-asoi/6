<%
Action = Request("Action")
If Action = "" Then
	Action = "OPEN"
End If
Dim con, rs, strID, strTitle, strAuthor, bookID, RC, dbStatus
Set con=Server.CreateObject("ADODB.Connection")
Set rs=Server.CreateObject("ADODB.RecordSEt")
con.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " & _
server.mappath("db/studdb.mdb")
if con.State=1 then
	dbStatus = "Подключено"
	Select Case Action
	Case "OPEN"
		ID = Request("ID")
		rs.Open "Select * from library where id = " & ID, con, 3, 3	
		bookID = 1	
	Case "ADD"
		rs.Open "Select * from library", con, 3, 3		
		if rs.eof = false then 
			rs.movelast			
		end if
		rs.addnew
		rs("id") = Request.Form("id")
		rs("author") = Request.Form("author")
		rs("title") = Request.Form("title")		
		rs.Update
		rs.Requery
		rs.MoveLast		
		'Response.Redirect "db_lib.asp" 		
	End Select		
	if rs.EOF=false AND rs.BOF = false then 
		strID = rs("id")
		strTitle = rs("title")
		strAuthor = rs("author")
	else
		strID=ID
		strTitle="Отсутствует"
		strAuthor="Отсутствует"
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
<h1><center><font color=3f3f3f>Книги студента</font></center></h1>
<br>

<form name="db_lib_add" action="db_lib_add.asp" method="post">
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
						<td><input type="Text" size=20 name="id" value=<%=strID%> readonly></td>
					</tr>
					<tr style="display:none">
						<td><input type="Text" size=20 name="book_id" value=<%=bookID%> readonly></td>
					</tr>					
					<tr>
						<td>Автор:</td>
						<td><input type="Text" size=40 name="author" value=<%=strAuthor%>></td>
					</tr>
					<tr>
						<td>Название:</td>
						<td><input type="Text" size=40 name="title" value=<%=strTitle%>></td>
					</tr>
				<!--</table>
			</td>
		</tr>-->
	</table>
	
	<table align="center">
		<tr>
			<td>		
					<input type=hidden name="Action" value="ADD">							
					<input type=submit value = "Принять">	
					<input type=reset value = "Сброс">
			</td>	
		</tr>	
	</table>
</form>

<table align="center">
	<tr>
		<td>	
			<form action="db_lib.asp" method="post">
				<input type=hidden name="Action" value="OPEN">	
				<input type=hidden name="ID" value=<%=strID%>>
				<input type=submit value = "Вернуться">
			</form>
		</td>	
	</tr>	
</table>

</body>
</html>