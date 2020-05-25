var app=angular.module("myapp",[]);
app.controller("mycontroller", function($scope, $http, $window) {
	$scope.id;
	var ret;
	var button = "Add";
	$scope.emp_login = function() {
		if ($scope.emp_email == null | $scope.emp_email == "") {
			Swal.fire({
				  icon: 'info',
				  title: 'Please Enter Email',
				  showConfirmButton: false,
				  timer: 700
				});
		}else if($scope.emp_password == null | $scope.emp_password == ""){
			Swal.fire({
				  icon: 'info',
				  title: 'Please Enter Password',
				  showConfirmButton: false,
				  timer: 700
				});
		}else{
			$http.post("login_dackend.jsp?emp_email=" + $scope.emp_email + "&emp_password=" + $scope.emp_password + "&unique_id=" + 'dashboard_login').then(function(response) {
				$scope.ret=response.data.ret;
				if($scope.ret == "Admin"){
					$window.location.href = "DashBoard/index2.jsp";
				}else if($scope.ret == "employee"){
					$window.location.href = "DashBoard/index2.jsp";
				}else{
					Swal.fire({
						  icon: 'error',
						  title: 'Oops...',
						  text: 'Invalid Email or Password',
						});
				}
			});
		}
	};
	$scope.category_submit = function () {
		if(button == "Add"){
			if($scope.Category_name == null){
				Swal.fire({
					  icon: 'info',
					  title: 'Please Enter Category name',
					  showConfirmButton: false,
					  timer: 1500
					});
			}else if($scope.Category_status == null){
				Swal.fire({
					  icon: 'info',
					  title: 'Please Select Status',
					  showConfirmButton: false,
					  timer: 1500
					});
			}else{
				$http.post("BackEnd_Page.jsp?Category_name=" + $scope.Category_name + "&Category_status=" + $scope.Category_status + "&Unique_id=" + "Add_category").then(function (response) {
					$scope.ret=response.data.ret;
					if($scope.ret == "success"){
						Swal.fire({
							  position: 'top-end',
							  icon: 'success',
							  title: 'Category Added Successfully',
							  showConfirmButton: false,
							  timer: 1500
							});
					}else{
						Swal.fire({
							  icon: 'error',
							  title: 'Oops...',
							  text: 'Category Not Added This Time',
						});
					}
				});
			}
		}else{
				$http.post("BackEnd_Page.jsp?Unique_id=" + button + "&status=" + $scope.category_status2 + "&id=" + $scope.id).then(function (response) {
					var ret=response.data.ret;
					if(ret == "Success"){
						Swal.fire({
							  title: 'Status Updated Successfully',
							  icon: 'success',
							  showCancelButton: false,
							  confirmButtonColor: '#3085d6',
							  confirmButtonText: 'ok'
						}).then(function (result) {
							if (result.value) {
								$window.location.href = "Manage_Category.jsp";
							}
						});
					}
				});
			
		}
	};
	$scope.select_category = function () {
		$http.post("BackEnd_Page.jsp?Unique_id=" + "Select_category").then(function (response) {
			$scope.catetory_data = response.data;
		});
	};
	$scope.delete_category = function (value) {
		Swal.fire({
			  title: 'Are you sure?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then(function (result) {
				if (result.value) {
					$http.post("BackEnd_Page.jsp?Unique_id=" + "delete_category" + "&value=" + value).then(function (response) {
						$scope.ret = response.data.ret;
						if($scope.ret == "Success"){
							Swal.fire(
								      'Deleted!',
								      'Your file has been deleted.',
								      'success'
							);
							$scope.select_category();
						}else{
							Swal.fire(
								      'Deleted!',
								      'Server Error',
								      'info'
								);
						}
					});
				}
			});
	};
	$scope.update_category = function (category_id) {
		$scope.id = category_id;
		button = "update_category";
	};	
	$scope.forgot_password = function () {
		if($scope.forgot_email == null | $scope.forgot_email == ""){
			Swal.fire({
				  icon: 'info',
				  title: 'Please Enter Email',
				  showConfirmButton: false,
				  timer: 900
				});
		}else{
			$http.post("login_dackend.jsp?forgot_email=" + $scope.forgot_email + "&unique_id=" + 'forgot_password').then(function (response) {
					ret=response.data.ret;
					if(ret == "yes"){
						$window.location.href = "forgot_password.jsp";
					}else if(ret == "no"){
						Swal.fire({
							  icon: 'error',
							  title: 'Enter Email is Not in Database',
							  showConfirmButton: true,
						});
					}
			});
		}
	};
	
	$scope.forgot_password_update = function () {
		if($scope.user_password == null | $scope.user_password == ""){
			Swal.fire({
				  icon: 'info',
				  title: 'Please Enter Password',
				  showConfirmButton: false,
				  timer: 900
			});
		}else if($scope.confirm_password == null | $scope.confirm_password == ""){
			Swal.fire({
				  icon: 'info',
				  title: 'Please Enter Confirm Password',
				  showConfirmButton: false,
				  timer: 900
			});
		}else if($scope.user_password == $scope.confirm_password){
			$http.post("login_dackend.jsp?user_password=" + $scope.user_password + "&unique_id=" + 'update_password').then(function (response) {
				ret=response.data.ret;
				if(ret == "success"){
					Swal.fire({
						  title: 'Password Change Successfully',
						  icon: 'success',
						  confirmButtonColor: '#3085d6',
					}).then(function (result) {
						$window.location.href = "index.html";
					});
				}else{
					alert("password is Not change");
				}
			});
		}else{
			Swal.fire({
				  icon: 'info',
				  title: 'Password is not Same Enter Again',
				  showConfirmButton: true
			});
			$scope.user_password = "";
			$scope.confirm_password = "";
			
		}
	};
});