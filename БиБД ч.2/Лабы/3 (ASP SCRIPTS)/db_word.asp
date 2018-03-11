<%
Set con=Server.CreateObject("ADODB.Connection")
Set rs=Server.CreateObject("ADODB.RecordSEt")
con.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " & _
server.mappath("db/studdb.mdb")
if con.State=1 then		
	rs.open "Select * from stud inner join library on stud.id = library.id", con, 3, 3
	Response.ContentType = "application/vnd.ms-word;charset=utf-8"
	Response.AddHeader "Content-Disposition", "attachment; filename=Stud.doc" 
	Response.AddHeader "Accept-Charset", "utf-8"
	Response.AddHeader "Content-Language", "en, ase, ru"
	if rs.eof <> true then
		response.write "<center><font color=3f3f3f>База данных студентов</font></center><br>"
		response.write "<table border=1>"
		%><strong><tr><td>ID студента</td><td>Имя</td><td>Группа</td><td>Возраст</td>
		<td>Успеваемость</td><td>Название фото</td>
		<td>Автор</td><td>Название книги</td></tr></strong><%
		while not rs.eof
			response.write "<tr><td>" & rs.fields("stud.id") & "</td><td>" & _
			rs.fields("name") & "</td><td>" & rs.fields("group") & "</td><td>" & _
			rs.fields("age") & "</td><td>" & rs.fields("progress") & "</td><td>" & _
			rs.fields("photo") & "</td><td>" & rs.fields("author") & "</td><td>" & _
			rs.fields("title") & "</td></tr>"
			rs.movenext
		wend
		response.write "</table>"
	end if
end if
%>