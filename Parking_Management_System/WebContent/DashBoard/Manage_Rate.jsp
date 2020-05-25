<%@include file="check_point.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Parking Managment System</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link href="dist/sweetalert/sweetalert2.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed" ng-app="DashBoard_app" ng-controller="DashBoard_contr" ng-init="select_Rate()">
<div class="wrapper">
  <!-- Navbar -->
   <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <div class="col-lg-11">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="index2.jsp" class="nav-link">DashBoard</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="add_category.jsp" class="nav-link">Category</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="add_Rate.jsp" class="nav-link">Rate</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="Add_parking_slot.jsp" class="nav-link">Parking Slot</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="add_parking_Details.jsp" class="nav-link">Parking</a>
      </li>
    </ul>
    </div>
    <div class="col-lg-1">
    	<a href="logout.jsp" class="nav-link">Logout</a>
    </div>
	<!-- Right navbar links -->
   
  </nav>
  <!-- /.navbar -->
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="" class="brand-link">
      <span class="brand-text font-weight-light" style="margin-left: 13px;">Welcome User</span>
    </a>


    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
     
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview menu-open">
            <!-- <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a> -->
            <ul class="nav nav-treeview">
              <li>
                <a href="./index2.jsp" class="nav-link">
                  <i class="nav-icon fas fa-tachometer-alt"></i>
                  <p>Dashboard</p>
                </a>
              </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
                <p>
                  Category
                  <i class="right fas fa-angle-left"></i>
                  <span class="badge badge-info right">2</span>
                </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="add_category.jsp" class="nav-link">
                  <i class="nav-icon far fa-circle text-danger"></i>
                  <p>Add Category</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="Manage_Category.jsp" class="nav-link">
                  <i class="nav-icon far fa-circle text-danger"></i>
                  <p>Manage Category</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="" class="nav-link active">
              <i class="fa fa-star"></i>
                <p>
                 Rates
                  <i class="right fas fa-angle-left"></i>
                  <span class="badge badge-info right">2</span>
                </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="add_Rate.jsp" class="nav-link">
                  <i class="nav-icon far fa-circle text-warning"></i>
                  <p>Add Rate</p>
                </a>
              </li>
              <li class="nav-item active">
                <a href="Manage_Rate.jsp" class="nav-link active">
                  <i class="nav-icon far fa-circle text-warning"></i>
                  <p>Manage Rate</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="" class="nav-link">
             <i class="nav-icon fas fa-table"></i>
                <p>
                 Parking Slot
                  <i class="right fas fa-angle-left"></i>
                  <span class="badge badge-info right">2</span>
                </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="Add_parking_slot.jsp" class="nav-link">
                  <i class="nav-icon far fa-circle text-info"></i>
                  <p>Add Parking Slot</p>
                </a>
              </li>
            </ul>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="manage_parking.jsp" class="nav-link">
                  <i class="nav-icon far fa-circle text-info"></i>
                  <p>Manage Slot</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
                <p>
                 Parking
                  <i class="right fas fa-angle-left"></i>
                  <span class="badge badge-info right">2</span>
                </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="add_parking_Details.jsp" class="nav-link">
                  <i class="nav-icon far fa-circle text-info"></i>
                  <p>Add Parking Details</p>
                </a>
              </li>
            </ul>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="manage_parking_Details.jsp" class="nav-link">
                  <i class="nav-icon far fa-circle text-info"></i>
                  <p>Manage Parking Details</p>
                </a>
              </li>
            </ul>
          </li> 
        </ul>
          </li>
         
        </ul> 
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Rate</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index2.jsp">Home</a></li>
              <li class="breadcrumb-item active">Manage Rate</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
	<div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-2">
            <a href="add_Rate.jsp"><button class="btn btn-block btn-primary"><i class="fa fa-plus"> Add Rate</i></button></a>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

	
	
  <div class="col-md-12">
	<!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Manage Rate</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
            	<div class="container">
	            	<div class="row" style="text-align: center;">
	            		<div class="col-1">
	            			<h5>Rate id</h5>		
	            		</div>
	            		<div class="col-2">
	            			<h5>Rate Name</h5>
	            		</div>
	            		<div class="col-2">
	            			<h5>Category</h5>		
	            		</div>
	            		<div class="col-2">
	            			<h5>Rate Type</h5>
	            		</div>
	            		<div class="col-1">
	            			<h5>Rate</h5>
	            		</div>
	            		<div class="col-1">
	            			<h5>Status</h5>
	            		</div>
	            		<div class="col-3">
	            			<h5>Action</h5>
	            		</div>
	            	</div>
	            	<div class="row" style="text-align: center;">
	            		<div class="col-1">
	            			<table class="table table-hover">
	            				<tr ng-repeat="x in Rate_data.Rate_id track by $index">
	            					<td>{{x}}</td>
	            				</tr>
	            			</table>		
	            		</div>
	            		<div class="col-2">
	            			<table class="table table-hover">
	            				<tr ng-repeat="x in Rate_data.Rate_name track by $index">
	            					<td>{{x}}</td>
	            				</tr>
	            			</table>
	            		</div>
	            		<div class="col-2">
	            			<table class="table table-hover">
	            				<tr ng-repeat="x in Rate_data.Category track by $index">
	            					<td>{{x}}</td>
	            				</tr>
	            			</table>		
	            		</div>
	            		<div class="col-2">
	            			<table class="table table-hover">
	            				<tr ng-repeat="x in Rate_data.Rate_type track by $index">
	            					<td>{{x}}</td>
	            				</tr>
	            			</table>
	            		</div>
	            		<div class="col-1">
	            			<table class="table table-hover">
	            				<tr ng-repeat="x in Rate_data.Rate track by $index">
	            					<td>{{x}}</td>
	            				</tr>
	            			</table>		
	            		</div>
	            		<div class="col-1">
	            			<table class="table table-hover">
	            				<tr ng-repeat="x in Rate_data.Status track by $index">
	            					<td>{{x}}</td>
	            				</tr>
	            			</table>
	            		</div>
	            		<div class="col-3">
	            			<table class="table table-hover">
	            				<tr ng-repeat="x in Rate_data.Rate_id track by $index">
	            					<td hidden="">{{x}}</td>
	            					<td><button class="btn btn-outline-success btn-sm" ng-click="update_Rate(x)" data-toggle="modal" data-target="#myModal"><i class="fas fa-edit"> Edit</i></button> 
	            					<button ng-click="delete_Rate(x)" class="btn btn-outline-danger btn-sm"><i class="fa fa-trash"> Delete</i></button></td>
	            				</tr>
	            			</table>		
	            		</div>
	            	</div>
            	</div>
              </div>
            <!-- /.card-body -->
		            <!-- Modal -->
						<div id="myModal" class="modal fade" role="dialog">
						  <div class="modal-dialog modal-lg">
							<!-- Modal content-->
						    <div class="modal-content">
						      <div class="modal-header">
						        <h4 class="modal-title">Update Rate</h4>
						      </div>
						      <div class="modal-body">
							 <form class="form-horizontal">
				                <div class="card-body">
				                <div class="form-group row">
				                    <label for="inputEmail3" class="col-sm-2 col-form-label">Rate id</label>
				                    <div class="col-sm-10">
				                      <input type="text" class="form-control" id="inputEmail3" disabled="disabled" value={{rate_id}}>
				                    </div>
				                  </div>
				                  <div class="form-group row">
				                    <label for="inputPassword3" class="col-sm-2 col-form-label">Rate Type</label>
				                    <div class="col-sm-10">
				                      <select class="form-control" ng-model="update_rate_type">
				                        <option selected="selected">Hourly</option>
				                        <option>Fixed</option>
				                      </select>
				                    </div>
				                  </div>
				                  <div class="form-group row">
				                   <label for="inputPassword3" class="col-sm-2 col-form-label">Rate</label>
				                    <div class="col-sm-10">
				                      <input type="text" class="form-control" ng-model="update_rate">
				                    </div>
				                  </div>
				                  <div class="form-group row">
				                   <label for="inputPassword3" class="col-sm-2 col-form-label">Status</label>
				                    <div class="col-sm-10">
				                      <select class="form-control" ng-model="update_status">
				                        <option selected="selected">Active</option>
				                        <option>Inactive</option>
				                      </select>
				                    </div>
				                  </div>
				                  <button class="btn btn-success swalDefaultSuccess" ng-click="rate_fun()">Save Change</button>
				                </div>
				                <!-- /.card-footer -->
				             </form>
						    </div>
						  </div>
						</div>
					</div>
					<!-- Model End's -->
          		</div>
          <!-- /.card -->
		</div>
	  </div>
	</section>
		
		
		
		
		
	</div>

  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
 <footer class="main-footer">
    <strong>Copyright &copy;</strong>
    All rights reserved.
    
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="dist/js/demo.js"></script>

<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="plugins/raphael/raphael.min.js"></script>
<script src="plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="plugins/jquery-mapael/maps/usa_states.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>

<!-- PAGE SCRIPTS -->
<script src="dist/js/pages/dashboard2.js"></script>
  <script type="text/javascript" src="../angular.js"></script>
  <script type="text/javascript" src="DashBoard_Script.js"></script>
   <script type="text/javascript" src="dist/sweetalert/sweetalert2.all.min.js"></script>	
</body>
</html>
