<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>5_1_JavaBean</title>
	<!-- 
		date: 3/24/2021
		name: Yeeun Kim
		content: JavaBean
	-->
</head>
<body>
	<h3>1. JSP JavaBean</h3>
	
	<h3>sign up</h3>
	<form action="./5_2_UseBean.jsp" method="get">
		<table border="1">
			<tr>
				<td>Name</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td>
					<label><input type="radio" name="gender" value="1"/>M</label>
					<label><input type="radio" name="gender" value="2"/>F</label>
				</td>
			</tr>
			<tr>
				<td>Hobby</td>
				<td>
					<label><input type="checkbox" name="hobby" value="music" />Listening to music</label>
					<label><input type="checkbox" name="hobby" value="hiking" />Hiking</label>
					<label><input type="checkbox" name="hobby" value="reading" />Reading</label>
					<label><input type="checkbox" name="hobby" value="cooking" />Cooking</label>
					<label><input type="checkbox" name="hobby" value="movie" />Watching movies</label>
				</td>
			</tr>
			<tr>
				<td>Address</td>
				<td>
					<select name="addr">
						<option value="seoul">Seoul</option>
						<option value="pusan">Pusan</option>
						<option value="jeju">Jeju</option>
						<option value="daegu">Daegu</option>
						<option value="incheon">Incheon</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="submit" /></td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>