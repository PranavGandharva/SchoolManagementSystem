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
<link
	href="<%=request.getContextPath()%>/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="<%=request.getContextPath()%>/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="<%=request.getContextPath()%>/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.11.3.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	
	
	
    <!-- DataTables CSS -->
    <link href="<%=request.getContextPath()%>/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
	
	 <!-- DataTables Responsive CSS -->
    <link href="<%=request.getContextPath()%>/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

 <!-- DataTables JavaScript -->
    <script src="<%=request.getContextPath() %>/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath() %>/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">School Management
				System</a>
		</div>
		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-messages">
					<li><a href="#">
							<div>
								<strong>Pranav Gandharva</strong> <span
									class="pull-right text-muted"> <em>Yesterday</em>
								</span>
							</div>
							<div>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Pellentesque eleifend...</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<strong>Harsh Panchal</strong> <span
									class="pull-right text-muted"> <em>Yesterday</em>
								</span>
							</div>
							<div>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Pellentesque eleifend...</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<strong>Shweta Patel</strong> <span
									class="pull-right text-muted"> <em>Yesterday</em>
								</span>
							</div>
							<div>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Pellentesque eleifend...</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>Read
								All Messages</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-messages --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-tasks">
					<li><a href="#">
							<div>
								<p>
									<strong>Task 1</strong> <span class="pull-right text-muted">40%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="40" aria-valuemin="0"
										aria-valuemax="100" style="width: 40%">
										<span class="sr-only">40% Complete (success)</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>Task 2</strong> <span class="pull-right text-muted">20%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-info" role="progressbar"
										aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
										style="width: 20%">
										<span class="sr-only">20% Complete</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>Task 3</strong> <span class="pull-right text-muted">60%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-warning"
										role="progressbar" aria-valuenow="60" aria-valuemin="0"
										aria-valuemax="100" style="width: 60%">
										<span class="sr-only">60% Complete (warning)</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>Task 4</strong> <span class="pull-right text-muted">80%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-danger"
										role="progressbar" aria-valuenow="80" aria-valuemin="0"
										aria-valuemax="100" style="width: 80%">
										<span class="sr-only">80% Complete (danger)</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>See
								All Tasks</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-tasks --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-alerts">
					<li><a href="#">
							<div>
								<i class="fa fa-comment fa-fw"></i> New Comment <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
									class="pull-right text-muted small">12 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-envelope fa-fw"></i> Message Sent <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-tasks fa-fw"></i> New Task <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>See
								All Alerts</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-alerts --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> User
							Profile</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
					</li>
					<li class="divider"></li>
					<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
							Logout</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="Search...">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div> <!-- /input-group -->
					</li>
					<li><a href="index.html"><i class="fa fa-dashboard fa-fw"></i>
							Dashboard</a></li>
					<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
							Charts<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="flot.html">Flot Charts</a></li>
							<li><a href="morris.html">Morris.js Charts</a></li>
						</ul> <!-- /.nav-second-level --></li>
					<li><a href="tables.html"><i class="fa fa-table fa-fw"></i>
							Tables</a></li>
					<li><a href="forms.html"><i class="fa fa-edit fa-fw"></i>
							Forms</a></li>
					<li><a href="#"><i class="fa fa-wrench fa-fw"></i> UI
							Elements<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="panels-wells.html">Panels and Wells</a></li>
							<li><a href="buttons.html">Buttons</a></li>
							<li><a href="notifications.html">Notifications</a></li>
							<li><a href="typography.html">Typography</a></li>
							<li><a href="icons.html"> Icons</a></li>
							<li><a href="grid.html">Grid</a></li>
						</ul> <!-- /.nav-second-level --></li>
					<li><a href="#"><i class="fa fa-files-o fa-fw"></i> Sample
							Pages<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="blank.html">Blank Page</a></li>
							<li><a href="login.html">Login Page</a></li>
						</ul> <!-- /.nav-second-level --></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>
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
												<th>Id</th>
												<th>Year</th>
												<th>Name</th>

												<th><button type="button" class="fa fa-plus-circle" data-toggle="modal"
														data-target="#myModal"></button>
												<button type="button" class="fa fa-pencil-square-o"
														 data-toggle="modal"
														data-target="#myModal"></button>
													<button type="button" class="fa fa-trash"></button></th></thead>
													<tbody>
												<c:forEach var="row" items="${List}">
													<tr>
														<td><c:out value="${row.id}"></c:out></td>
														<td><c:out value="${row.year}"></c:out></td>
														<td><c:out value="${row.name}"></c:out></td>
														
														<td><button type="button" class="fa fa-plus-circle" data-toggle="modal"
														data-target="#myModal"></button>
												<button type="button"  class="fa fa-pencil-square-o" onclick="getId(${row.id})"></button>
													<button value="BUT" ><a href="<%=request.getContextPath()%>/ClassroomController?delete=trash&id=${row.id}" class="fa fa-trash"></a></button></td>
													</tr>
												</c:forEach>
											</tr>
												</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
												<form action="<%=request.getContextPath() %>/ClassroomAdd" method="get" id="modalform">
													
														<div class="form-group" >
															<label>Year:</label> <input class="form-control" name="year"
																placeholder="Enter text" id="year">
														</div>
														<div class="form-group">
															<label>Name:</label> <input class="form-control" name="name"
																placeholder="Enter text" id="name">
														</div>
														<div class="form-group">
															<input type="submit" name="add" id="submit" class="btn btn-default">
															
														</div>
													</div>

												</form>
												
											</div>
										</div>
									</div>

								</div>
								
								<script type="text/javascript">
								
								$('#modalform').on('submit', function(ev) {
									validation();
								});
							function validation(){
								
													
								$.ajax({
									  method: "GET",
									  url: "<%=request.getContextPath()%>/CheckValidClassroomAdd?"+$('#modalform').serialize(),
									  success:function(data){
										if(data==="valid"){
											alert("hiee");
											$('#myModal').modal({
										        show: 'hide'
										      }); 
										
											 return true;
										}
								else{
									alert("invalid");
									$('#myModal').modal('hide');
									return false;												
										}
									  }
								});
								return false;
								
							}	
								
								</script>
								
								
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		
<!-- 		edit form:- -->
		<div class="modal fade" id="myEditModal" role="dialog">
			<div class="modal-dialog">

		
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
												<form action="<%=request.getContextPath() %>/ClassroomEdit" method="get">
													
													
														<div class="form-group" >
															<label>Year:</label> <input class="form-control" name="year2"
																 id="year2">
														</div>
														<div class="form-group">
															<label>Name:</label> <input class="form-control" name="name2"
																 id="name2">
																<input type="hidden" name="id" id="Id">
														</div>
													
														<div class="form-group">
															<input type="submit" name="submit" value="operation" id="submit" class="btn btn-default">
															</div>
													</div>

												</form>
											</div>
										</div>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		
	$('document').ready(function() {
				
		$('#dataTables-example').DataTable({
			responsive:true
				
		});
	});
		
		function getId(id){
			
			
		$.ajax({
					  method: "GET",
					  url: "<%=request.getContextPath()%>/EditController?id="+id,
					  success: function(data) {
						  
					var xyz	=data.split(",");
				
						  var name=xyz[0];
						  var year=xyz[1];
						  
						$('#Id').val(id);  
						$('#name2').val(name);
						$('#year2').val(year);
						  
						$('#myEditModal').modal(); 		  
												
					  
					  }
					  			
					  
					});
				
		}
		
	
		
				
		</script>
		
		
		
		
		
		
		<script type="text/javascript">
		
		
		
			//     	var counter = 0;
			//  		var holder;
			//  		var isUpdateReq = false;
			// 		function showEditPage(counter) {
			//  						isUpdateReq = true;
			//  						holder = counter;
			//  					}

			//  			$('document').ready(function() {
			//  					$('#submit').click(function() {
			//  						if (!isUpdateReq) {
			//  							var submit = true;
			//  							var firstname = $('#firstname').val();
			//  							var lastname = $('#lastname').val();
			//  							var password = $('#password').val();
			// 							var email = $('#email').val();
			//  							var number = $('#number').val();
			//  							if (firstname == ''	|| lastname == '' || password == '' || email == '' || number == '') {
			// 								alert("please fill the field properly");
			//  								submit = false;
			//  							} 
			//  							if (submit) {
			//  									$('#dataTables-example').append('<tr id="1234"><td>'+firstname+ '</td>'
			//  										+ '<td>'+ lastname
			//  										+ '</td>'+ '<td>'
			//  										+ password+ '</td>'
			//  										+ '<td>'+ email
			//  										+ '<td>'+ number
			//  										+ '</td>'+ '<td>'
			//  										+ '<button type="button" class="fa fa-trash">'
			//  										+ '</button>'
			//  										+ '<button type="button" class="fa fa-pencil-square-o" data-toggle="modal" data-target="#myModal" onclick="showEditPage('
			//  									    + counter++
			//  										+ ')">'
			//  										+ '</button></td><tr>');
			//  								}
			//  							} else {
			//  						
			//var row = $(this).closest('tr').index() + 1; 
			//  							//	var fname=$('#firstname').val();
			//  							    var thisRow = "#dataTables-example tr:nth-child(" + holder + ")";

			//   								$('#dataTables-example tr').each(function () {
			//   		  							$('#dataTables-example tr:nth-child("'+holder+'").remove();
			//   								});
			// 								isUpdateReq = false;
			//  							}
			//  						});
			//  					});
		</script>
</body>
</html>