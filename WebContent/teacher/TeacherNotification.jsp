<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
        
   
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>     
<div id="wrapper">
			 <%@ include file="studentheader.jsp"%>
             <%@ include file="teachersidebar.jsp"%>
		<div class="row">
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">Teacher Details</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form action="<%=request.getContextPath() %>/sendNotification" method="get" id="modalform">

									<div class="form-group">
										<label>Select:</label> <select id="id" name="id"
											onchange="getNames()">
											<c:forEach var="row" items="${List}">
												<option value=<c:out value="${row.id}" ></c:out>><c:out
														value="${row.name}" /></option>
											</c:forEach>
										</select>

									</div>

									<div class="col-lg-6">
										<div class="panel panel-default">
											<div class="panel-heading">Student Table</div>
											<div class="panel-body">
												<div class="panel-body">
													<div class="dataTable_wrapper">
														<table
															class="table table-striped table-bordered table-hover"
															id="dataTables-example">
															<thead>
																<tr>
																	<th>Checked</th>
																	<th>EnrollmentNumber</th>
																	<th>FirstName</th>
																</tr>
															</thead>
															<tbody>

															</tbody>

														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
							</div>

							<div class="form-group">
										<label>Remarks:</label> <input class="form-control"
											name="remark" placeholder="Enter text">
											<input type="hidden" name="str"/>
									</div>
									<div class="form-group">
										<input type="button" name="submit_but" id="submit_but" value="Submit" class="btn btn-default">

									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
			
											

	<script type="text/javascript">
	var str="";
	$(document).ready(function() {
		$("#submit_but").on("click", function() {
			$("tbody tr.item input:checkbox:checked").each(function() { // if <tr> exist
				str += $(this).parent().parent().find("td:eq(1)").html()+",";

			});
			
		});
	});
function getNames(){

$.ajax({

method:"GET",
url:"<%=request.getContextPath()%>/teacher/NotificationController?id="+$('#id').val()+"&operation=fetchStudentForClass",
success:function(data){
// 	alert(data);
	var myjson = data;
	
// 	 alert(value.enrollment+value.firstname);
	$.each($.parseJSON(myjson), function(key,value){

		var enroll = value.enrollment;
		var name = value.firstname;
// 		$("tr.item").each(function(i, tr){
// 			var seen = {};
// 			if($("tr.item").length > 0) {   //  entry exist or not
// 				$("tr.item").each(function() {
// 					//console.log($(this).html());
// 				    var txt = $(this).find('td').eq(1).text();
// 				    console.log(txt);
// 				   // console.log("|" +  txt + "|" + enroll + "|");
// 				    if (enroll == txt){
// 				    	console.log("TRUE");
// 				    } else {
// 				    	alert("hii");
// 				    	$('<tr class="item"><td><input type="checkbox"></td>'+'<td>'+enroll+'</td>'+'<td>'+name+'</td></tr>').appendTo('tbody');}
// 				    }
// 				);      						
// 			} else {
				
				$('<tr class="item"><td><input type="checkbox" id="identy"></td>'+'<td>'+enroll+'</td>'+'<td>'+name+'</td></tr>').appendTo('tbody');
		//	}
		
// 	
	
});
	}
});
}
	
	
</script>

</body>
</html>