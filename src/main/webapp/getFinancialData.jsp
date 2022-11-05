<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Financial Data Report</title>
<style type="text/css">
	#financialTable {
	  font-family: Arial, Helvetica, sans-serif;
	  border-collapse: collapse;
	  width: 100%;
	}
	
	#financialTable td, #financialTable th {
	  border: 1px solid #ddd;
	  padding: 8px;
	}
	
	#financialTable tr:nth-child(even){background-color: #f2f2f2;}
	
	#financialTable tr:hover {background-color: #ddd;}
	
	#financialTable th {
	  padding-top: 12px;
	  padding-bottom: 12px;
	  text-align: left;
	  background-color: #04AA6D;
	  color: white;
	}
</style>

</head>


<body>

<h1 style = "color:green;" > Generate a Financial Report </h1>

<form name="Financial Symbol" method=post action=GetFinancialData> 
	Select a financial symbol to report on: 
	<select name=finSym id=finSym>
		<option value="none" selected disabled hidden>Select an Option</option>
		<option value=aapl>Apple</option>
		<option value=nio>Nio Inc</option>
		<option value=tsla>Tesla</option>
	</select>
	<input type=submit value=Report />
</form>


<h3> Key Properties of  for: <%=request.getAttribute("finSym")%> </h3>
<ul id="financialList"></ul>
<table id="financialTable">
    <tr>
    	<th> Metric </th>
    	<th> raw </th>
    	<th> fmt </th>
    	<th> longfmt </th>
    	
    </tr>
</table>

</body>
<script>
	function spawnRows(key,value) {
		console.log(typeof value)
		if (typeof value != 'object') {
			var list = document.getElementById("financialList");
			var listItem = document.createElement('li');
			listItem.innerHTML = key + ": " + value;
			list.appendChild(listItem);
		}
		else {
			var table = document.getElementById("financialTable");
			var row = document.createElement('tr');
			var tdMetric = document.createElement('td'); 
			tdMetric.innerHTML = key;
			var tdRaw = document.createElement('td'); 
			tdRaw.innerHTML = value.raw  == undefined ? '' : value.raw;
			var tdFmt = document.createElement('td'); 
			tdFmt.innerHTML = value.fmt == undefined ? '' : value.fmt;
			var tdLFmt = document.createElement('td'); 
			tdLFmt.innerHTML = value.longFmt == undefined ? '' : value.longFmt;
			
			row.appendChild(tdMetric)
			row.appendChild(tdRaw)
			row.appendChild(tdFmt)
			row.appendChild(tdLFmt)
			table.appendChild(row)
		}
	}

	
	function traverse(o,func) {
	    for (var i in o) {
	        func.apply(this,[i,o[i]]);
	    }
	}
	console.log(<%=request.getAttribute("data")%>.quoteSummary.result[0].financialData)
	traverse(<%=request.getAttribute("data")%>.quoteSummary.result[0].financialData,spawnRows);

</script>
</html>