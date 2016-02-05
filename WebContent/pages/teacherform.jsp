<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

   <html>
   <body>
      <%@ include file="../pages/studentheader.jsp"%>
    <%@ include file="../pages/studentsidebar.jsp"%>
    
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
												
												<th>FirstName</th>
												<th>LastName</th>
												<th>PhoneNo</th>
												<th>Email</th>
												

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
									
													<td><c:out value="${row.firstname}"></c:out></td>
													<td><c:out value="${row.lastname}"></c:out></td>
													<td><c:out value="${row.phonenumber}"></c:out></td>
													<td><c:out value="${row.email }"></c:out></td>
													
													<td><button type="button" class="fa fa-plus-circle"
															data-toggle="modal" data-target="#myModal"></button>
														<button type="button" class="fa fa-pencil-square-o" 
															onclick="getId(${row.id})"></button>
														<button value="BUT">
															<a href="<%=request.getContextPath()%>/AddTeacher?delete=trash&id=${row.id}" class="fa fa-trash"></a>
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
											<form action="<%=request.getContextPath()%>/AddTeacher"
												method="get" id="modalform">

												<div class="form-group">
													<label>FirstName:</label> <input class="form-control"
														name="firstname" placeholder="Enter text" id="enroll">
												</div>

												<div class="form-group">
													<label>LastName:</label> <input class="form-control"
														name="lastname" placeholder="Enter text" id="firstname">
												</div>
												<div class="form-group">
													<label>Phone No:</label> <input class="form-control"
														name="phonenumber" placeholder="Enter text" id="lastname">
												</div>

												<div class="form-group">
													<label>Email:</label> <input class="form-control"
														name="email" placeholder="Enter text" id="phone">
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
					<h4 class="modal-title">Edit Modal Header</h4>
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
												action="<%=request.getContextPath()%>/TeacherEditController"
												method="get">

												<div class="form-group">
													<label>FirstName:</label> <input class="form-control"
														name="firstname2" placeholder="Enter text" id="firstname2">
												</div>
												<div class="form-group">
													<label>LastName:</label> <input class="form-control"
														name="lastname2" placeholder="Enter text" id="lastname2">
														<input type="hidden" name="id" id="Id">
												</div>
												<div class="form-group">
													<label>Phone Number:</label> <input class="form-control"
														name="phone2" placeholder="Enter text" id="phone2">
												</div>

												
												<div class="form-group">
													<label>Email:</label> <input class="form-control"
														name="email2" placeholder="Enter text" id="email2">
													<input type="hidden" name="id" id="Id">
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
		url:"<%=request.getContextPath()%>/TeacherEditController?id="+id,
		success:function(data){
			alert(data);
		var formdata=data.split(",");
		
		var firstname=formdata[0];
		var lastname=formdata[1];
		var phone=formdata[2];
		var email=formdata[3];
		
		$("#Id").val(id);
		$("#firstname2").val(firstname);
		$("#lastname2").val(lastname);
		$("#phone2").val(phone);	
		$("#email2").val(email);
		
			$("#myEditModal").modal();
		}
		
		
		
		});
		
		
		
	}
    	
		
	</script>
	
</body>
</html>					
										