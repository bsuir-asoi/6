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
	backTO = Request("back")
	if backTO = "db_search_result.asp" then
		sID = Request("sID")
		param = Request("PARAM")
		search_field = Request("SEARCH_FIELD")
	else
		backTO = "db.asp"
	end if
	Select Case Action
	Case "OPEN"
		ID = Request("ID")	
		rs.Open "Select * from library where id = " & ID, con, 3, 3	
		bookID = 1
	Case "BACK"
		ID = Request("ID")	
		bookID = Request("BOOKID")
		rs.Open "Select * from library where id = " & ID, con, 3, 3
		if not rs.EOF then
			RC = rs.RecordCount
			if bookID = 1 then
				bookID = rs.RecordCount
				rs.MoveLast
			else
				bookID = bookID - 1
				count = 1
				do while count < CLng(bookID)
				rs.MoveNext
				count = count + 1
				loop
			end if
		end if	
	Case "NEXT"
		ID = Request("ID")	
		bookID = Request("BOOKID")		
		rs.Open "Select * from library where id = " & ID, con, 3, 3
		if not rs.EOF then		
			RC = rs.RecordCount
			if (CLng(bookID) = RC) then
				bookID = 1
				rs.MoveFirst
			else
				bookID = bookID + 1
				count = 1
				do while count < CLng(bookID)
				rs.MoveNext
				count = count + 1
				loop			
			end if
		end if		
	Case "DELETE"
		ID = Request("ID")	
		bookID = Request("BOOKID")		
		rs.Open "Select * from library where id = " & ID, con, 3, 3
		if not rs.EOF then
			RC = rs.RecordCount
			rs.MoveFirst
			if bookID > 1 then
				count = 1
				do while count < CLng(bookID)
				rs.MoveNext
				count = count + 1
				loop
			end if
			rs.Delete
			rs.Update
			rs.Requery
			rs.Close
			rs.Open "Select * from library where id = " & ID, con, 3, 3		
			bookID = 1
		end if				
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




<form name="db_lib">
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
						<td><input type="Text" size=40 name="author" value=<%=strAuthor%> readonly></td>
					</tr>
					<tr>
						<td>Название:</td>
						<td><input type="Text" size=40 name="title" value=<%=strTitle%> readonly></td>
					</tr>
				<!--</table>
			</td>
		</tr>-->
	</table>
</form>

<table align="center">
	<tr>
		<td>		
			<form name="db_lib_back" action="db_lib.asp" method="post">
				<input type=hidden name="Action" value="BACK">
				<input type=hidden name="ID" value=<%=strID%>>
				<input type=hidden name="BOOKID" value=<%=bookID%>>
				<input type=hidden name="back" value=<%=backTO%>>
				<input type=hidden name="sID" value=<%=sID%>>
				<input type=hidden name="PARAM" value=<%=param%>>
				<input type=hidden name="SEARCH_FIELD" value=<%=search_field%>>					
				<input type=submit value = "Назад">	
			</form>
		</td>	
		<td>
			<form name="db_lib_next" action="db_lib.asp" method="post">
				<input type=hidden name="Action" value="NEXT">
				<input type=hidden name="ID" value=<%=strID%>>
				<input type=hidden name="BOOKID" value=<%=bookID%>>	
				<input type=hidden name="back" value=<%=backTO%>>				
				<input type=hidden name="sID" value=<%=sID%>>
				<input type=hidden name="PARAM" value=<%=param%>>
				<input type=hidden name="SEARCH_FIELD" value=<%=search_field%>>	
				<input type=submit value = "Вперед">	
			</form>
		</td>
		<td>		
			<form name="db_add" action="db_lib_add.asp" method="post">
				<input type=hidden name="Action" value="OPEN">
				<input type=hidden name="ID" value=<%=strID%>>	
				<input type=hidden name="back" value=<%=backTO%>>				
				<input type=hidden name="sID" value=<%=sID%>>
				<input type=hidden name="PARAM" value=<%=param%>>
				<input type=hidden name="SEARCH_FIELD" value=<%=search_field%>>	
				<input type=submit value = "Добавить">	
			</form>
		</td>
		<td>		
			<form name="db_delete" action="db_lib.asp" method="post">
				<input type=hidden name="Action" value="DELETE">
				<input type=hidden name="ID" value=<%=strID%>>
				<input type=hidden name="BOOKID" value=<%=bookID%>>	
				<input type=hidden name="back" value=<%=backTO%>>				
				<input type=hidden name="sID" value=<%=sID%>>
				<input type=hidden name="PARAM" value=<%=param%>>
				<input type=hidden name="SEARCH_FIELD" value=<%=search_field%>>	
				<input type=submit value = "Удалить">	
			</form>
		</td>
	</tr>
</table>
<table align="center">
	<tr>
		<td>	
			<form action="<%=backTO%>" method="post">
			<%if backTO = "db_search_result.asp" then%>
			<input type=hidden name="Action" value="MOVETO">
			<%else%>
			<input type=hidden name="Action" value="OPEN">
			<%end if%>
			<input type=hidden name="sID" value=<%=sID%>>
			<input type=hidden name="PARAM" value=<%=param%>>
			<input type=hidden name="SEARCH_FIELD" value=<%=search_field%>>	
			<input type=submit value = "Вернуться">
			</form>
		</td>	
	</tr>	
</table>

</body>
</html>