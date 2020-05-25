<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Parking Management System</title>

  <!-- Custom fonts for this template-->
  <link href="login_css/all.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="login_css/sb-admin-2.min.css" rel="stylesheet">
  <link href="DashBoard/dist/sweetalert/sweetalert2.css">
  
  <!-- Angular file -->
  <script type="text/javascript" src="angular.js"></script>
  <script type="text/javascript" src="Script.js"></script>
  <script type="text/javascript" src="DashBoard/dist/sweetalert/sweetalert2.all.min.js"></script>	
  
</head>

<body class="bg-gradient-primary">
  
<div class="container" ng-app="myapp" ng-controller="mycontroller">
	<div class="row justify-content-center">
	 <div class="col-xl-6 col-lg-6 col-md-9">
		<div class="card o-hidden border-0 shadow-lg my-2">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-12">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Change Password</h1>
                  </div>
                  <form class="user">
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" placeholder="Create Password" ng-model="user_password">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" placeholder="confirm password" ng-model="confirm_password">
                    </div>
                    <hr>
                    <a href="" class="btn btn-primary btn-user btn-block" ng-click="forgot_password_update()">Submit</a>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
	 </div>
	</div>
</div>

  <!-- Bootstrap core JavaScript-->
  <script src="login_js/jquery.min.js"></script>
  <script src="login_js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="login_js/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="login_js/sb-admin-2.min.js"></script>
</body>
</html>
