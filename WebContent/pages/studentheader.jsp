<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


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
<link
	href="<%=request.getContextPath()%>/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="<%=request.getContextPath()%>/bower_components/datatables-responsive/css/dataTables.responsive.css"
	rel="stylesheet">

<!-- DataTables JavaScript -->
<script
	src="<%=request.getContextPath()%>/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script
	src="<%=request.getContextPath()%>/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
	
<%@ include file="studentsidebar.jsp" %>
		
<!-- Navigation -->
	
<div id="wrapper">
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
			
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-messages">
					<li><a href="#">
							<div>
								<strong>John Smith</strong> <span class="pull-right text-muted">
									<em>Yesterday</em>
								</span>
							</div>
							<div>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Pellentesque eleifend...</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<strong>John Smith</strong> <span class="pull-right text-muted">
									<em>Yesterday</em>
								</span>
							</div>
							<div>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Pellentesque eleifend...</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
						<div>
								<strong>John Smith</strong> <span class="pull-right text-muted">
									<em>Yesterday</em>
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
			
			<li class="dropdown"  data-toggle="modal" onclick="remarks()">
			
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
			<i class="fa fa-bell fa-fw"></i> 
			<span class = "badge" style="background-color:#d43f3a;height:1.7rem;width:2rem;border-radius: 50%;"><%=request.getAttribute("countNotification")%></span><i class="fa fa-caret-down"></i>
			</a>
			
				<ul class="dropdown-menu dropdown-alerts">
					<c:forEach var="row" items="${notification}">
						<li><a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i> Remarks
									<c:out value="${row.remark}"></c:out>
									<span class="pull-right text-muted small"></span>
							
								</div>


						</a></li>
					</c:forEach>
				</ul> 
			
				<!--/.dropdown-alerts>

			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>

				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i>${sessionScope.usertype}</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
					<li class="divider"></li>
					<li><a
						href="<%=request.getContextPath()%>/LoginController?logout=true"><i
							class="fa fa-sign-out fa-fw"></i>Logout</a></li>
				</ul> <!-- /.dropdown-user -->
				
				
				
				</li>
		</ul>
</nav>
<%@ include file="studentDashboard.jsp"%>
			<!-- /.dropdown -->
	<div class="modal fade" id="myModal" role="dialog" >
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
											<form action="">
  												<div class="col-lg-18">
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
																	<th>Remark</th>
																	<th>Date</th>
																	
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
	function remarks() {
				$.ajax({
            method:"GET",
			url:"<%=request.getContextPath()%>/Student/Notification?StudentNotification=remarks",
	        success:function(data){
	    	//alert(data);
    	var formdata= data.split(",");

//     	$.each(formdata, function(key, value) { 
//     		 alert(key[0].value); 
//     		});
    		  $("<tr><td>"+formdata[0]+"</td>"+"<td>"+formdata[1]+"</td></tr>"+"<tr><td>"+formdata[2]+"</td>"+"<td>"+formdata[3]+"</td></tr>").appendTo('tbody');
    	 $('#myModal').modal();	
			
	        }		
	});
		
	}
</script>

	