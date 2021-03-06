<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>School Management System</title>

<!-- Bootstrap Core CSS (automatic class) -->

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<div id="wrapper">
<%@ include file="studentheader.jsp" %>

				<!-- /.navbar-top-links -->
<%@ include file="studentsidebar.jsp" %>


					<!-- form -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Forms</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>

			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Basic Form Elements</div>
						<div class="panel-body">
							<div class="panel-body">
								<div class="dataTable_wrapper">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>EnrollmentNumber</th>
												<th>FirstName</th>
												<th>LastName</th>
												<th>PhoneNo</th>
												<th>Attendance</th>
												<th>Email</th>
												<th>Photo</th>

												<th><button type="button" class="fa fa-plus-circle"
														data-toggle="modal" data-target="#myModal"></button>
													<button type="button" class="fa fa-pencil-square-o"
														data-toggle="modal" data-target="#myModal"></button>
													<button type="button" class="fa fa-trash"></button></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="row" items="${List}">
												<tr>


													<td><c:out value="${row.enrollment }"></c:out>
													<td><c:out value="${row.firstname}"></c:out></td>
													<td><c:out value="${row.lastname}"></c:out></td>
													<td><c:out value="${row.phone}"></c:out></td>
													<td><c:out value="${row.attendance }"></c:out>
													<td><c:out value="${row.email }"></c:out>
													<td><img
														src="<%=request.getContextPath()%>/Photo?enrollment=${row.enrollment}"
														width="45px" height="45px"></img></td>
													<td><button type="button" class="fa fa-plus-circle"
															data-toggle="modal" data-target="#myModal"></button>
														<button type="button" class="fa fa-pencil-square-o"
															onclick="getId(${row.id})"></button>
														<button value="BUT">
															<a
																href="<%=request.getContextPath()%>/StudentController?delete=trash&id=${row.id}"
																class="fa fa-trash"></a>
														</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- My Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">Student Details</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-6">
											<form action="<%=request.getContextPath()%>/AddStudents"
												method="post" id="modalform" enctype="multipart/form-data">

												<div class="form-group">
													<label>Enrollment:</label> <input class="form-control"
														name="enrollment" placeholder="Enter text" id="enroll">
												</div>

												<div class="form-group">
													<label>FirstName:</label> <input class="form-control"
														name="firstname" placeholder="Enter text" id="firstname">
												</div>
												<div class="form-group">
													<label>LastName:</label> <input class="form-control"
														name="lastname" placeholder="Enter text" id="lastname">
												</div>

												<div class="form-group">
													<label>Phone Number:</label> <input class="form-control"
														name="phone" placeholder="Enter text" id="phone">
												</div>


												<div class="form-group">
													<label>Email:</label> <input class="form-control"
														name="email" placeholder="Enter text" id="email">
												</div>


												<div class="form-group">
													<label>Attendance:</label> <input class="form-control"
														name="attendance" placeholder="Enter text" id="attendance">
												</div>


												<div class="form-group">
													<label>Photo:</label> <input type="file" name="file_upload"
														value="upload" />
												</div>

												<div class="form-group">
													<input type="submit" name="insert" id="submit"
														class="btn btn-default">

												</div>

											</form>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- My Edit Modal -->
	<div class="modal fade" id="myEditModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">Student Details</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-6">
											<form
												action="<%=request.getContextPath()%>/StudentEditController"
												method="get">

												<div class="form-group">
													<label>FirstName:</label> <input class="form-control"
														name="firstname2" placeholder="Enter text" id="firstname2">
												</div>
												<div class="form-group">
													<label>LastName:</label> <input class="form-control"
														name="lastname2" placeholder="Enter text" id="lastname2">

												</div>
												<div class="form-group">
													<label>Phone Number:</label> <input class="form-control"
														name="phone2" placeholder="Enter text" id="phone2">
												</div>

												<div class="form-group">
													<label>Attendance:</label> <input class="form-control"
														name="att2" placeholder="Enter text" id="attendance2">
												</div>

												<div class="form-group">
													<label>Email:</label> <input class="form-control"
														name="email2" placeholder="Enter text" id="email2">
													<input type="hidden" name="id" id="Id">
												</div>

												<div class="form-group">
													<label>Photo:</label> <input type="file"
														name="file_upload_2" value="upload" />
												</div>

												<div class="form-group">
													<input type="submit" name="update_data_operation"
														value="update" class="btn btn-default">
												</div>

											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">

function getId(id){
	
	$.ajax({
		
		method:"GET",
		url:"<%=request.getContextPath()%>/EditStudents?id="+id,
		success: function(data){
		//	alert(data);
			var formdata =data.split(",");
			
			var name=formdata[0];
			var lname=formdata[1];
			var phone=formdata[2];
			var att=formdata[3];
			var email=formdata[4];
			
			$("#id").val(id);
			$("#firstname2").val(name);
			$("#lastname2").val(lname);
			$("#phone2").val(phone);
			$("#attendance2").val(att);
			$("#email2").val(email);
			$("#myEditModal").modal();
		} 
				
	});
	
}

$('document').ready(function(){
	$('#dataTables-example').DataTable({
		responsive:true
	});
	
		
});

</script>

</body>
</html>