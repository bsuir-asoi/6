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
<h1><center><font color=3f3f3f>ПОИСК</font></center></h1>
<br>


<form name="db" action="db_search_result.asp" method="post">
	<table border="0" align="center">
		<tr>
		</tr>	
		<tr>
			<td colspan=2>		
				Поиск по студентам:			
			</td>	
		</tr>					
		<tr>
			<td colspan=2>
				<select name="stdnt_menu" size="1">				
					<option value="stud.id">ID студента</option>
					<option value="name">ФИО</option>
					<option value="grp">Группа</option>
					<option value="age">Возраст</option>
					<option value="progress">Успеваемость</option>
				</select>
			</td>	
		</tr>
		
		<tr>
			<td colspan=2>
				<Input type = "TextField" name = "search_field" value = "" size = 20>
			</td>
		</tr>		

	</table>
	
	<table align="center">
		<tr>
			<td>		
					<input type=hidden name="Action" value="OPEN">							
					<input type=submit value = "Поиск">	
					<input type=reset value = "Сброс">
			</td>	
		</tr>	
	</table>
</form>

<form name="db" action="db_search_result.asp" method="post">
	<table border="0" align="center">
		<tr>
			<td colspan=2>		
				Поиск по библиотеке:			
			</td>	
		</tr>					
		<tr>
			<td colspan=2>
				<select name="lbr_menu" size="1">
					<option value="library.id">ID студента</option>
					<option value="author">Автор</option>
					<option value="title">Название книги</option>
				</select>
			</td>	
		</tr>
		
		<tr>
			<td colspan=2>
				<Input type = "TextField" name = "search_field" value = "" size = 20>
			</td>
		</tr>		

	</table>
	
	<table align="center">
		<tr>
			<td>		
					<input type=hidden name="Action" value="OPEN">							
					<input type=submit value = "Поиск">	
					<input type=reset value = "Сброс">
			</td>	
		</tr>	
	</table>
</form>

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