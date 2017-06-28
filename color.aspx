<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Web" %>

<%@ Page Language="C#" Debug="true" EnableEventValidation="false" %>
<!DOCTYPE html>
<html>
<head>
<title>Hex convert Dec </title>
<style>
input{
	text-align: center;
	font-size: 60px;
}

body {
    font-size: 60px;
}
</style>
<script>
	function replaceHex(){
		var r = dec2hex(document.getElementById("rdecs").value);
		var g = dec2hex(document.getElementById("gdecs").value);
		var b = dec2hex(document.getElementById("bdecs").value);
		
		if(r.length == 1)
			r = '0' + r;
		if(g.length == 1)
			g = '0' + g;
		if(b.length == 1)
			b = '0' + b;
			
		document.getElementById("rhexs").value = r;
		document.getElementById("ghexs").value = g;
		document.getElementById("bhexs").value = b;
		decs();
		
	}
	
	function dec2hex(d) {
		var hD = '0123456789ABCDEF';
		var h = hD.substr(d&15,1);
		while (d > 15) {
			d>>=4;
			h = hD.substr(d&15,1) + h;
		}
		return h;
	}
	
	function decs(){
		var r = document.getElementById("rhexs").value;
		var g = document.getElementById("ghexs").value;
		var b = document.getElementById("bhexs").value;
		
		document.getElementById("hexas").value = "#" + r + g + b;
	}
	
	function replaceDec(){
		var r = document.getElementById("rhexs").value;
		var g = document.getElementById("ghexs").value;
		var b = document.getElementById("bhexs").value;
		
		r = r.toUpperCase();
		g = g.toUpperCase();
		b = b.toUpperCase();
		
		document.getElementById("rhexs").value = r;
		document.getElementById("ghexs").value = g;
		document.getElementById("bhexs").value = b;
		
		document.getElementById("rdecs").value = parseInt(r, 16);
		document.getElementById("gdecs").value = parseInt(g, 16);
		document.getElementById("bdecs").value = parseInt(b, 16);
		
		decs();
	}
	
	function replaceAll(){
		var alls = document.getElementById("hexas").value;
		alls = alls.toUpperCase();
		document.getElementById("hexas").value = alls;
		
		var r = alls[1] + alls[2];
		var g = alls[3] + alls[4];
		var b = alls[5] + alls[6];
		
		document.getElementById("rhexs").value = r;
		document.getElementById("ghexs").value = g;
		document.getElementById("bhexs").value = b;
		
		replaceDec();	
	}
</script>
</head>
<body>
<table width="170px">
	<tr>
		<th></th>
		<th>DEC</th>
		<th>HEX</th>
	</tr>
	<tr>
		<td>R</td>
		<td><input id="rdecs" type="number" maxlength="3" min="0" max="255" value="01" onchange="replaceHex()" onkeyup="replaceHex()" /></td>
		<td><input id="rhexs" type="text" size="1" maxlength="2" value="00" onchange="replaceDec()" onkeyup="replaceDec()"></td>
	</tr>
	<tr>
		<td>G</td>
		<td><input id="gdecs" type="number" maxlength="3" min="0" max="255" value="01" onchange="replaceHex()" onkeyup="replaceHex()" /></td>
		<td><input id="ghexs" type="text" size="1" maxlength="2" value="00" onchange="replaceDec()" onkeyup="replaceDec()"/></td>
	</tr>
	<tr>
		<td>B</td>
		<td><input id="bdecs" type="number" maxlength="3" min="0" max="255" value="01" onchange="replaceHex()" onkeyup="replaceHex()"/></td>
		<td><input id="bhexs" type="text" size="1" maxlength="2" value="00" onchange="replaceDec()" onkeyup="replaceDec()"/></td>
	</tr>
	<tr>
		<td colspan="3"><input id="hexas" type="text" value="#000000" style="width:100%;" onchange="replaceAll()"/></td>
	</tr>
</table>
</body>
</html>