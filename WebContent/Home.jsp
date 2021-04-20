<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LetsPlaySudoku</title>
<link rel="stylesheet" type="text/css" title="Style" href="style.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
</head>

<body onload="loadmatrix()">

<nav class="navbar navbar-expand-md navbar-dark bg-dark">
          <div class="navbar-brand">
              	<p class="brand">Sudoku</p>
          </div>
          <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarmenu">
              	<span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarmenu">
	            <div class="navbar-nav ml-auto" >
		                <div class="nav-item">
		                    	<a href="#playsudoku" class="nav-link">Play</a>
		                </div>
		                <div class="nav-item">
		                    	<a href="#generatesudoku" class="nav-link">Generate</a>
		                </div>
	            </div>
          </div>
</nav>

<script type="text/javascript">	
	function showsolution()
	{
		var element=document.getElementById('sudokusolution');
		element.style.display="block";
		element.style.visibility="visible";
	}
	
	function loadmatrix()
	{
		for(var i=1;i<=81;i++)
			{
					var element=document.getElementById(i);
					if(element!=null && element.value!="")
						element.classList.add("disable");
			}
	}
</script>


<div class="container">
	<div class=""><h1>Welcome!!</h1></div>
</div>

<div class="container sudokucontainer" id="playsudoku">
	<div class="row">
		<div class="col-md-4">
				<div class="generatebox">
					<h1>Play Sudoku</h1>
					<h5 class="description">Select the number of Unkown numbers in the sudoku board.If there are more than one solution for the given board,you can give any one valid answer.</h5>
					
					<form action="sudokucontroller" method="get">
						<div class="form-group">
								<label for="known">No of Unknown elements</label> 
								<input type="number" class="form-control" required pattern="^[1-81]{1}" title="[1-81]" id="known" name="known"></input>
						</div>
						<div class="form-group">
							<input type="hidden" name="command" value="generate"></input>
							<button type="submit" name="submit" class="btn btn-success formbutton" value="submit">Generate Sudoku</button>	
						</div>
					</form>
					
					<div class="form-group ml-auto">
						<button type="submit" name="submit" class="btn btn-warning formbutton" value="solution" onclick="showsolution()">Show Solution</button>	
					</div>	
				</div>
		</div>

	<div class="col-md-4 sudokuboard">
		<div id="statusbox" class=""></div>
		<form action="sudokucontroller" method="get">
			<table class="sudokutable">
				<tr>
					<td><input type="text" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" class="oddgrid" name="1" id="1" value="${mat[0][0]}"></input></td>
					<td><input type="text" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" class="oddgrid" name="2" id="2" value="${mat[0][1]}"></input></td>
					<td><input type="text" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" class="oddgrid" name="3" id="3" value="${mat[0][2]}"></input></td> 
					
					<td><input type="text"  required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" class="evengrid" name="4" id="4" value="${mat[0][3]}"></input></td>
					<td><input type="text" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" class="evengrid" name="5" id="5" value="${mat[0][4]}"></input></td>
					<td><input type="text" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" class="evengrid" name="6" id="6" value="${mat[0][5]}"></input></td>
					 
					<td><input type="text" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" class="oddgrid" name="7" id="7" value="${mat[0][6]}"></input></td>
					<td><input type="text" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" class="oddgrid" name="8" id="8" value="${mat[0][7]}"></input></td>
					<td><input type="text" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" class="oddgrid" name="9" id="9" value="${mat[0][8]}"></input></td>
				</tr>
				<tr>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="10" id="10" value="${mat[1][0]}"></input></td>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="11" id="11" value="${mat[1][1]}"></input></td>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="12" id="12" value="${mat[1][2]}"></input></td> 
					
					<td ><input class="evengrid"  required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="13" id="13" value="${mat[1][3]}"></input></td>
					<td ><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="14" id="14" value="${mat[1][4]}"></input></td>
					<td ><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="15" id="15" value="${mat[1][5]}"></input></td>
					 
					<td><input  class="oddgrid"  required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="16" id="16" value="${mat[1][6]}"></input></td>
					<td><input   class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="17" id="17" value="${mat[1][7]}"></input></td>
					<td><input class="oddgrid"  required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="18" id="18" value="${mat[1][8]}"></input></td>
				</tr>
				<tr>
					<td><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="19" id="19" value="${mat[2][0]}"></input></td>
					<td><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="20" id="20" value="${mat[2][1]}"></input></td>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="21" id="21" value="${mat[2][2]}"></input></td> 
					
					<td ><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="22" id="22" value="${mat[2][3]}"></input></td>
					<td><input  class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="23" id="23" value="${mat[2][4]}"></input></td>
					<td ><input class="evengrid"  required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="24" id="24" value="${mat[2][5]}"></input></td>
					 
					<td><input  class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="25" id="25" value="${mat[2][6]}"></input></td>
					<td ><input  class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="26" id="26" value="${mat[2][7]}"></input></td>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="27" id="27" value="${mat[2][8]}"></input></td>
				</tr>
				<tr>
					<td><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="28" id="28" value="${mat[3][0]}"></input></td>
					<td ><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="29" id="29" value="${mat[3][1]}"></input></td>
					<td ><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="30" id="30" value="${mat[3][2]}"></input></td>
					
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="31" id="31" value="${mat[3][3]}"></input></td>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="32" id="32" value="${mat[3][4]}"></input></td>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="33" id="33" value="${mat[3][5]}"></input></td> 
					
					<td ><input class="evengrid"  required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="34" id="34" value="${mat[3][6]}"></input></td>
					<td><input   class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="35" id="35" value="${mat[3][7]}"></input></td>
					<td ><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="36" id="36" value="${mat[3][8]}"></input></td>
				</tr>
				<tr>
					<td ><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="37" id="37" value="${mat[4][0]}"></input></td>
					<td ><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="38" id="38" value="${mat[4][1]}"></input></td>
					<td ><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="39" id="39" value="${mat[4][2]}"></input></td> 
					
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="40" id="40" value="${mat[4][3]}"></input></td>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="41" id="41" value="${mat[4][4]}"></input></td>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="42" id="42" value="${mat[4][5]}"></input></td>
					 
					<td><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="43" id="43" value="${mat[4][6]}"></input></td>
					<td ><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="44" id="44" value="${mat[4][7]}"></input></td>
					<td><input  class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="45" id="45" value="${mat[4][8]}"></input></td>
				</tr>
				<tr>
					<td><input  class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="46" id="46" value="${mat[5][0]}"></input></td>
					<td><input class="evengrid"  required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="47" id="47" value="${mat[5][1]}"></input></td>
					<td><input class="evengrid"  name="48" id="48" value="${mat[5][2]}"></input></td>
					
					<td><input  class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="49" id="49" value="${mat[5][3]}"></input></td>
					<td><input class="oddgrid"  required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="50" id="50" value="${mat[5][4]}"></input></td>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="51" id="51" value="${mat[5][5]}"></input></td> 
					
					<td ><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="52" id="52" value="${mat[5][6]}"></input></td>
					<td><input  class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="53" id="53" value="${mat[5][7]}"></input></td>
					<td><input  class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="54" id="54" value="${mat[5][8]}"></input></td>
				</tr>
				<tr>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="55" id="55" value="${mat[6][0]}"></input></td>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="56" id="56" value="${mat[6][1]}"></input></td>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="57" id="57" value="${mat[6][2]}"></input></td> 
					
					<td><input  class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="58" id="58" value="${mat[6][3]}"></input></td>
					<td><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="59" id="59" value="${mat[6][4]}"></input></td>
					<td><input class="evengrid"  required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="60" id="60" value="${mat[6][5]}"></input></td>
					 
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="61" id="61" value="${mat[6][6]}"></input></td>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="62" id="62" value="${mat[6][7]}"></input></td>
					<td ><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="63" id="63" value="${mat[6][8]}"></input></td>
				</tr>
				<tr>
					<td><input  class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="64" id="64" value="${mat[7][0]}"></input></td>
					<td><input  class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="65" id="65" value="${mat[7][1]}"></input></td>
					<td><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="66" id="66" value="${mat[7][2]}"></input></td> 
					
					<td><input  class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="67" id="67" value="${mat[7][3]}"></input></td>
					<td><input  class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="68" id="68" value="${mat[7][4]}"></input></td>
					<td><input  class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="69" id="69" value="${mat[7][5]}"></input></td>
					 
					<td><input  class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="70" id="70" value="${mat[7][6]}"></input></td>
					<td><input  class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="71" id="71" value="${mat[7][7]}"></input></td>
					<td><input class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="72" id="72" value="${mat[7][8]}"></input></td>
				</tr>
				<tr>
					<td><input  class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="73" id="73" value="${mat[8][0]}"></input></td>
					<td><input  class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="74" id="74" value="${mat[8][1]}"></input></td>
					<td><input class="oddgrid"  required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="75" id="75" value="${mat[8][2]}"></input></td> 
					
					<td><input class="evengrid"  required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="76" id="76" value="${mat[8][3]}"></input></td>
					<td><input  class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="77" id="77" value="${mat[8][4]}"></input></td>
					<td><input class="evengrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9"  name="78" id="78" value="${mat[8][5]}"></input></td>
					 
					<td><input  class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="79" id="79" value="${mat[8][6]}"></input></td>
					<td><input  class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="80" id="80" value="${mat[8][7]}"></input></td>
					<td><input  class="oddgrid" required pattern="[1-9]{1}" title="Enter a digit from 1 to 9" name="81" id="81" value="${mat[8][8]}"></input></td>
				</tr>
			</table>
			<br>
				<div class="form-group">
					<input type="hidden" name="command" value="checkanswer"></input>
				</div>
					<div class="form-group">
						<button type="submit" class="btn btn-info formbutton">Submit</button>
					</div>
					<div class="form-group">
						<button type="reset" class="btn btn-info formbutton">Clear Field</button>
					</div>		
		</form>
	</div>
	
		<div class="col-md-4">
			<div id="sudokusolution">
					<table class="sudokusolutiontable">
					<% int i=82; %>
						<c:forEach var="tempsolution" items="${solution}">
							<tr>
								<c:forEach var="solu" items="${tempsolution}">
									<td><input type="text" value="${solu}" id="<%="s1"+i%>" style="pointer-events:none;background-color:#D6EAF8;"></input></td>
									<% i++; %>
								</c:forEach>
							</tr>
						</c:forEach>
					</table>		
				</div>
		</div>	
	</div>
</div>
<br><br>

<script type="text/javascript">
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		const status = urlParams.get('status')
		if(status=="wrong")
		{
				var element=document.getElementById("statusbox")
				element.innerHTML="Wrong-Try again!";
				document.getElementById("statusbox").classList.add("alert");
				document.getElementById("statusbox").classList.add("alert-danger");
		}
		else if(status=="correct")
		{
			document.getElementById("statusbox").innerHTML="Success!!";
			document.getElementById("statusbox").classList.add("alert");
			document.getElementById("statusbox").classList.add("alert-success");
		}
</script>


<div class="container sudokucontainer" id="generatesudoku">
	<div class="row">
		<div class="col-md-4 playcontainer">
				<div class="playbox">
					<h1>Generate Sudoku</h1>
					<p class="description">Select the number of Unkown numbers in the sudoku board.If there are more than one solution for the given board,you can give any one valid answer.</p>
					<div class="form-group">
						<button type="button" class="btn btn-info formbutton" onclick="resetfield()">Clear Field</button>
					</div>		
			</div>
		</div>
		
		<div class="col-md-4 sudokuboard">
			<div id="solvebox" class=""></div>
			<form action="sudokucontroller" method="get">
			<table class="sudokutable">
				<tr>
					<td><input type="text"  class="oddgrid" name="100" id="100" value="${mat1[0][0]}"  pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input type="text"  class="oddgrid" name="101" id="101" value="${mat1[0][1]}"  pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input type="text" class="oddgrid" name="102" id="102" value="${mat1[0][2]}"  pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td> 
					
					<td><input type="text"  class="evengrid" name="103" id="103" value="${mat1[0][3]}"  pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input type="text"  class="evengrid" name="104" id="104" value="${mat1[0][4]}"  pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input type="text" class="evengrid" name="105" id="105" value="${mat1[0][5]}"  pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					 
					<td><input type="text"  title="[1-9]"  class="oddgrid" name="106" id="106" value="${mat1[0][6]}"  pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input type="text"  title="[1-9]"  class="oddgrid" name="107" id="107" value="${mat1[0][7]}"  pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input type="text"  title="[1-9]" class="oddgrid" name="108" id="108" value="${mat1[0][8]}"  pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
				</tr>
				<tr>
					<td ><input class="oddgrid"  title="[1-9]"  name="110" id="110" value="${mat1[1][0]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="oddgrid"  title="[1-9]"  name="111" id="111" value="${mat1[1][1]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="oddgrid"  title="[1-9]"  name="112" id="112" value="${mat1[1][2]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td> 
					
					<td ><input class="evengrid"   title="[1-9]" name="113" id="113" value="${mat1[1][3]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="evengrid"  title="[1-9]"  name="114" id="114" value="${mat1[1][4]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="evengrid"  title="[1-9]"  name="115" id="115" value="${mat1[1][5]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					 
					<td><input  class="oddgrid"  title="[1-9]" name="116" id="116" value="${mat1[1][6]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input   class="oddgrid"  title="[1-9]"  name="117" id="117" value="${mat1[1][7]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input class="oddgrid"  title="[1-9]"  name="118" id="118" value="${mat1[1][8]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
				</tr>
				<tr>
					<td><input class="oddgrid"  name="120" id="120" value="${mat1[2][0]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input class="oddgrid"  name="121" id="121" value="${mat1[2][1]}"  pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="oddgrid" name="122" id="122" value="${mat1[2][2]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td> 
					
					<td ><input class="evengrid" name="123" id="123" value="${mat1[2][3]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input  class="evengrid" name="124" id="124" value="${mat1[2][4]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="evengrid"  name="125" id="125" value="${mat1[2][5]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					 
					<td><input  class="oddgrid" name="126" id="126" value="${mat1[2][6]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input  class="oddgrid" name="127" id="127" value="${mat1[2][7]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="oddgrid" name="128" id="128" value="${mat1[2][8]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
				</tr>
				<tr>
					<td><input class="evengrid"  name="130" id="130" value="${mat1[3][0]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="evengrid" name="131" id="131" value="${mat1[3][1]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="evengrid" name="132" id="132" value="${mat1[3][2]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					
					<td ><input class="oddgrid" name="133" id="133" value="${mat1[3][3]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="oddgrid" name="134" id="134" value="${mat1[3][4]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="oddgrid" name="135" id="135" value="${mat1[3][5]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td> 
					
					<td ><input class="evengrid"  name="136" id="136" value="${mat1[3][6]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input   class="evengrid" name="137" id="137" value="${mat1[3][7]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="evengrid" name="138" id="138" value="${mat1[3][8]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
				</tr>
				<tr>
					<td ><input class="evengrid" name="140" id="140" value="${mat1[4][0]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="evengrid"  name="141" id="141" value="${mat1[4][1]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="evengrid" name="142" id="142" value="${mat1[4][2]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td> 
					
					<td ><input class="oddgrid" name="143" id="143" value="${mat1[4][3]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="oddgrid" name="144" id="144" value="${mat1[4][4]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="oddgrid" name="145" id="145" value="${mat1[4][5]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					 
					<td><input class="evengrid"  name="146" id="146" value="${mat1[4][6]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="evengrid" name="147" id="147" value="${mat1[4][7]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input  class="evengrid"  name="148" id="148" value="${mat1[4][8]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
				</tr>
				<tr>
					<td><input  class="evengrid" name="150" id="150" value="${mat1[5][0]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input class="evengrid"  name="151" id="151" value="${mat1[5][1]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input class="evengrid"  name="152" id="152" value="${mat1[5][2]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					
					<td><input  class="oddgrid" name="153" id="153" value="${mat1[5][3]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input class="oddgrid"  name="154" id="154" value="${mat1[5][4]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="oddgrid"  name="155" id="155" value="${mat1[5][5]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td> 
					
					<td ><input class="evengrid" name="156" id="156" value="${mat1[5][6]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input  class="evengrid" name="157" id="157" value="${mat1[5][7]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input  class="evengrid"  name="158" id="158" value="${mat1[5][8]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
				</tr>
				<tr>
					<td ><input class="oddgrid" name="160" id="160" value="${mat1[6][0]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="oddgrid" name="161" id="161" value="${mat1[6][1]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="oddgrid" name="162" id="162" value="${mat1[6][2]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td> 
					
					<td><input  class="evengrid" name="163" id="163" value="${mat1[6][3]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input class="evengrid"  name="164" id="164" value="${mat1[6][4]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input class="evengrid"  name="165" id="165" value="${mat1[6][5]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					 
					<td ><input class="oddgrid" name="166" id="166" value="${mat1[6][6]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="oddgrid" name="167" id="167" value="${mat1[6][7]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td ><input class="oddgrid" name="168" id="168" value="${mat1[6][8]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
				</tr>
				<tr>
					<td><input  class="oddgrid"  name="170" id="170" value="${mat1[7][0]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input  class="oddgrid" name="171" id="171" value="${mat1[7][1]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input class="oddgrid" name="172" id="172" value="${mat1[7][2]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td> 
					
					<td><input  class="evengrid" name="173" id="173" value="${mat1[7][3]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input  class="evengrid"  name="174" id="174" value="${mat1[7][4]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input  class="evengrid" name="175" id="175" value="${mat1[7][5]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					 
					<td><input  class="oddgrid" name="176" id="176" value="${mat1[7][6]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input  class="oddgrid" name="177" id="177" value="${mat1[7][7]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input class="oddgrid" name="178" id="178" value="${mat1[7][8]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
				</tr>
				<tr>
					<td><input  class="oddgrid" name="180" id="180" value="${mat1[8][0]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input  class="oddgrid" name="181" id="181" value="${mat1[8][1]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input class="oddgrid"  name="182" id="182" value="${mat1[8][2]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td> 
					
					<td><input class="evengrid"  name="183" id="183" value="${mat1[8][3]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input  class="evengrid" name="184" id="184" value="${mat1[8][4]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input class="evengrid"  name="185" id="185" value="${mat1[8][5]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					 
					<td><input  class="oddgrid" name="186" id="186" value="${mat1[8][6]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input  class="oddgrid" name="187" id="187" value="${mat1[8][7]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
					<td><input  class="oddgrid" name="188" id="188" value="${mat1[8][8]}" pattern="^[1-9]{1}$|^\s*$" title="Enter a digit from 1 to 9"></input></td>
				</tr>
			</table>
			<br>
				<div class="form-group">
					<input type="hidden" name="command" value="solve"></input>
				</div>
				<div class="form-group">
						<button type="submit" class="btn btn-info formbutton">Solve</button>
				</div>	
		</form>
		</div>
			<div class="col-md-4">
			<div id="sudokusolvesolution">
					<table class="sudokusolvesolutiontable">
					<% int j=89; %>
						<c:forEach var="tempsolvedsolution" items="${solvedboardsolution}">
							<tr>
								<c:forEach var="solvedsolu" items="${tempsolvedsolution}">
									<td><input type="text" value="${solvedsolu}" id="<%="s2"+j%>" style="pointer-events:none;background-color:#D6EAF8;"></input></td>
									<% j++; %>
								</c:forEach>
							</tr>
						</c:forEach>
					</table>		
				</div>
			</div>
	</div>
</div>
<br><br>
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<h1>About Sudoku</h1>
			<p>The popular Japanese puzzle game Sudoku is based on the logical placement of numbers. An online game of logic, Sudoku does not require any calculation nor special math skills all that is needed are brains and concentration.</p>
			<p>The goal of Sudoku is to fill a 9×9 grid with numbers so that each row, column and 3×3 section contain all of the digits between 1 and 9. As a logic puzzle, Sudoku is also an excellent brain game. If you play Sudoku daily, you will soon start to see improvements in your concentration and overall brain power. Start a game now.</p>
		</div>
		<div class="col-md-6">
			<h1>How to play Sudoku</h1>
			<p>The goal of Sudoku is to fill in a 9×9 grid with digits so that each column, row, and 3×3 section contain the numbers between 1 to 9. At the beginning of the game, the 9×9 grid will have some of the squares filled in. Your job is to use logic to fill in the missing digits and complete the grid. Do not forget, a move is incorrect if:</p>
			<ul>
				<li>Any row contains more than one of the same number from 1 to 9</li>
				<li>Any column contains more than one of the same number from 1 to 9</li>
				<li>Any 3×3 grid contains more than one of the same number from 1 to 9</li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<h1>Sudoku Tips</h1>
			<p>Sudoku is a fun puzzle game once you get the hang of it. At the same time, learning to play Sudoku can be a bit intimidating for beginners. So, if you are a complete beginner, here are a few Sudoku tips that you can use to improve your Sudoku skills.</p>
			<ul>
				<li>Tip 1: Look for rows, columns of 3×3 sections that contain 5 or more numbers. Work through the remaining empty cells, trying the numbers that have not been used. In many cases, you will find numbers that can only be placed in one position considering the other numbers that are already in its row, column, and 3×3 grid.</li>
				<li>Tip 2: Break the grid up visually into 3 columns and 3 rows. Each large column will have 3, 3×3 grids and each row will have 3, 3×3 grids. Now, look for columns or grids that have 2 of the same number. Logically, there must be a 3rd copy of the same number in the only remaining 9-cell section. Look at each of the remaining 9 positions and see if you can find the location of the missing number.</li><br>
			</ul>
		</div>
	</div>
</div>

<div class="container">
	<p>Now that you know a little more about Sudoku, play and enjoy this free online game.</p>
</div>
<script type="text/javascript">
		const solve = urlParams.get('solve')
		if(solve=="wrong")
		{
				document.getElementById("solvebox").innerHTML="Your sudoku board is invalid-Try Again!";
				document.getElementById("solvebox").classList.add("alert");
				document.getElementById("solvebox").classList.add("alert-danger");
		}
		else if(solve=="success")
		{
			var element=document.getElementById('sudokusolvesolution');
			element.style.display="block";
			element.style.visibility="visible";
			document.getElementById("solvebox").innerHTML="I solved it<br>It was an interesting game!";
			document.getElementById("solvebox").classList.add("alert");
			document.getElementById("solvebox").classList.add("alert-success");
		}
		
		function resetfield()
		{
			for(var i=0;i<9;i++)
				for(var j=0;j<9;j++)
					{
						var k="1"+""+i+""+j;
						var element=document.getElementById(k);
						element.value="";
					}
		}
</script>

</body>
</html>