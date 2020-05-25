var DashBoard_app=angular.module("DashBoard_app", []);
DashBoard_app.controller("DashBoard_contr", function ($scope, $http,$window) {
	$scope.rate_id;
	$scope.slot_id;
	$scope.parking_details_id;
	var button = "Add";
	$scope.rate_fun = function () {
		if(button == "Add"){
			toastr.options = {
					  "closeButton": true,
					  "debug": false,
					  "newestOnTop": false,
					  "progressBar": false,
					  "positionClass": "toast-top-center",
					  "preventDuplicates": false,
					  "onclick": null,
					  "showDuration": "300",
					  "hideDuration": "1000",
					  "timeOut": "1800",
					  "extendedTimeOut": "1000",
					  "showEasing": "swing",
					  "hideEasing": "linear",
					  "showMethod": "fadeIn",
					  "hideMethod": "fadeOut"
					};
			if($scope.Rate_name == null | $scope.Rate_name == ""){
				toastr["warning"]("Please Enter Rate Name", "Warning");
			}else if($scope.Category == null | $scope.Category == ""){
				toastr["warning"]("Please Select Category", "Warning");
			}else if($scope.Rate_type == null | $scope.Rate_type == ""){
				toastr["warning"]("Please Select Rate type", "Warning");
			}else if($scope.Rate == null | $scope.Rate == ""){
				toastr["warning"]("Please Enter Rate", "Warning");
			}else if($scope.action == null | $scope.action == ""){
				toastr["warning"]("Please Enter Action", "Warning");
			}else{
				$http.post("BackEnd_Page.jsp?Rate_name=" + $scope.Rate_name + "&Category=" + $scope.Category + "&Rate_type=" + $scope.Rate_type + "&Rate=" + $scope.Rate + "&action=" + $scope.action + "&Unique_id=" + "Add_Rate").then(function(response) {
					$scope.ret=response.data.ret;
					if($scope.ret == "success"){
						Swal.fire({
							  position: 'top-end',
							  icon: 'success',
							  title: 'Rate Details Saved Successfully',
							  showConfirmButton: false,
							  timer: 1500
							});
					}else{
						Swal.fire({
							  icon: 'error',
							  title: 'Oops...',
							  text: 'Rate Details Not Saved',
						});
					}
				});
			}
		}else if(button == "update_parking_details"){
			$http.post("Parking_slot_Backend.jsp?checking_id=" + 'update_Details_of_parking' + "&parking_details_id=" + $scope.parking_details_id + "&check_out=" + $scope.check_out + "&paid_status=" + $scope.paid_status).then(function (response) {
				$scope.ret=response.data.ret;
				if($scope.ret == "Success"){
					Swal.fire({
						  title: 'Details Updated Successfully',
						  icon: 'success',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: 'ok'
					}).then(function (result) {
						if (result.value) {
							$window.location.href = "manage_parking_Details.jsp";
						}
					});
				}else{
					Swal.fire({
						  position: 'top-end',
						  icon: 'error',
						  title: 'OOPs....',
						  text: 'Server Error....',
						  showConfirmButton: false,
						  timer: 1500
						});
				}
			});
		}else if(button == "update_slot"){
			if($scope.update_slot_name == null | $scope.update_slot_name == ""){
				Swal.fire({
					  icon: 'info',
					  title: 'Please Enter Slot Name',
					  timer: 1200
					});
			}else if($scope.update_slot_status == null | $scope.update_slot_status == ""){
				Swal.fire({
					  icon: 'info',
					  title: 'Please Select Slot Status',
					  timer: 1200
					});
			}else if($scope.update_slot_Availability == null | $scope.update_slot_Availability == ""){
				Swal.fire({
					  icon: 'info',
					  title: 'Please Select Slot Availability',
					  timer: 1200
					});
			}else{
				$http.post("Parking_slot_Backend.jsp?checking_id=" + 'update_parking_slot' + "&slot_id=" + $scope.slot_id + "&update_slot_name=" + $scope.update_slot_name + "&update_slot_status=" + $scope.update_slot_status + "&update_slot_Availability=" + $scope.update_slot_Availability).then(function (response) {
					var ret=response.data.ret;
					if(ret == "Success"){
						Swal.fire({
							  title: 'Slot Updated Successfully',
							  icon: 'success',
							  showCancelButton: false,
							  confirmButtonColor: '#3085d6',
							  confirmButtonText: 'ok'
						}).then(function (result) {
							if (result.value) {
								$window.location.href = "manage_parking.jsp";
							}
						});
					}else{
						Swal.fire({
							  position: 'top-end',
							  icon: 'error',
							  title: 'OOPs....',
							  text: 'Server Error....',
							  showConfirmButton: false,
							  timer: 1500
							});
					}
				});
			}
		}else{
			if($scope.update_rate_type == null | $scope.update_rate_type == ""){
				Swal.fire({
					  icon: 'info',
					  title: 'Please Select Rate Type',
					  showConfirmButton: false,
					  timer: 1200
					});
			}else if($scope.update_rate == null | $scope.update_rate == ""){
				Swal.fire({
					  icon: 'info',
					  title: 'Please Enter Rate',
					  showConfirmButton: false,
					  timer: 1200
					});
			}else if($scope.update_status == null | $scope.update_status == ""){
				Swal.fire({
					  icon: 'info',
					  title: 'Please Select Status',
					  showConfirmButton: false,
					  timer: 1200
					});
			}else{
				$http.post("BackEnd_Page.jsp?Unique_id=" + 'update_Rate' + "&update_status=" + $scope.update_status + "&update_rate=" + $scope.update_rate + "&update_rate_type=" + $scope.update_rate_type + "&rate_id=" + $scope.rate_id).then(function (response) {
					var ret=response.data.ret;
					if(ret == "success"){
						Swal.fire({
							  title: 'Data Updated Successfully',
							  icon: 'success',
							  showCancelButton: false,
							  confirmButtonColor: '#3085d6',
							  confirmButtonText: 'ok'
						}).then(function (result) {
							if (result.value) {
								$window.location.href = "Manage_Rate.jsp";
							}
						});
					}else{
						Swal.fire({
							  position: 'top-end',
							  icon: 'error',
							  title: 'OOPs....',
							  text: 'Server Error....',
							  showConfirmButton: false,
							  timer: 1500
							});
					}
				});
			};
		};
	};
	$scope.select_Rate = function () {
		$http.post("BackEnd_Page.jsp?Unique_id=" + "Select_Rate").then(function (response) {
			$scope.Rate_data = response.data;
		});
	};
	$scope.delete_Rate = function (value) {
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
					$http.post("BackEnd_Page.jsp?Unique_id=" + "delete_Rate" + "&value=" + value).then(function (response) {
						$scope.ret = response.data.ret;
						if($scope.ret == "Success"){
							  Swal.fire(
								      'Deleted!',
								      'Your file has been deleted.',
								      'success'
								  );
								  $scope.select_Rate();
						}else{
							Swal.fire(
								      'Deleted!',
								      'Server Error',
								      'info'
								);
						};
					});
				}
			});
	};
	$scope.category_name_for_rate = function() {
		$http.post("BackEnd_Page.jsp?Unique_id=" + "name_for_rate").then(function (response) {
			$scope.Rate_for_data_name=response.data.list;
		});
	};
	$scope.manage_parking_fun = function () {
		if($scope.slot_name == null | $scope.slot_name == ""){
			Swal.fire({
				  icon: 'info',
				  title: 'Please Enter Slot Name',
				  showConfirmButton: false,
				  timer: 900
				});
		}else if($scope.Rate_name == null | $scope.Rate_name == ""){
			Swal.fire({
				  icon: 'info',
				  title: 'Please Select Rate Name',
				  showConfirmButton: false,
				  timer: 900
				});
		}else if($scope.Rate == null | $scope.Rate == ""){
			Swal.fire({
				  icon: 'info',
				  title: 'Please Select Rate',
				  showConfirmButton: false,
				  timer: 900
				});
		}else if($scope.slot_status == null | $scope.slot_status == ""){
			Swal.fire({
				  icon: 'info',
				  title: 'Please Select Slot Status',
				  showConfirmButton: false,
				  timer: 900
				});
		}else if($scope.slot_availability == null | $scope.slot_availability == ""){
			Swal.fire({
				  icon: 'info',
				  title: 'Please Select Slot availability',
				  showConfirmButton: false,
				  timer: 900
				});
		}else{
			$http.post("Parking_slot_Backend.jsp?slot_name=" + $scope.slot_name + "&slot_status=" + $scope.slot_status + "&Rate_name=" + $scope.Rate_name + "&Rate=" + $scope.Rate + "&slot_availability=" + $scope.slot_availability + "&checking_id=" + "add_slot").then(function (response) {
				$scope.ret=response.data.ret;
				if($scope.ret == "success"){
					Swal.fire({
						  position: 'top-end',
						  icon: 'success',
						  title: 'Slot Booked',
						  showConfirmButton: false,
						  timer: 1500
						});
				}else{
					Swal.fire({
						  position: 'top-end',
						  icon: 'error',
						  title: 'OOPs....',
						  text: 'Server Error....',
						  showConfirmButton: false,
						  timer: 1500
						});
				}
			});
		}
	};
	$scope.select_parking_slot = function () {
		$http.post("Parking_slot_Backend.jsp?checking_id=" + "select_slot").then(function (response) {
			 $scope.data_list=response.data;
		});
	};
	$scope.Rate_name_for_parking = function () {
		$http.post("Parking_slot_Backend.jsp?checking_id=" + "Rate_name_for_parking").then(function (response) {
			$scope.list_of_name_rate=response.data;
		});
	};
	$scope.parking_slot_delete = function (value) {
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
					$http.post("Parking_slot_Backend.jsp?checking_id=" + "delete_parking_slot" + "&value=" + value).then(function(response) {
						$scope.ret=response.data.ret;
							if($scope.ret == "Success"){
							  Swal.fire(
								      'Deleted!',
								      'Your file has been deleted.',
								      'success'
								  );
								  $scope.select_parking_slot();
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
	$scope.select_slot_for_Parking_Detail = function () {
		$http.post("Parking_slot_Backend.jsp?checking_id=" + "select_slot_of_active").then(function (response) {
			 $scope.data_list_of_slot_name=response.data;
		});
		$scope.Rate_name_for_parking();
	};
	
	$scope.add_parking_details = function () {
		if($scope.slot == null | $scope.slot == ""){
			Swal.fire({
				  icon: 'info',
				  title: 'Please Select Slot',
				  showConfirmButton: false,
				  timer: 1200
				});
		}else if($scope.category == null | $scope.category == ""){
			Swal.fire({
				  icon: 'info',
				  title: 'Please Select category',
				  showConfirmButton: false,
				  timer: 1200
				});
		}else if($scope.rate == null | $scope.rate == ""){
			Swal.fire({
				  icon: 'info',
				  title: 'Please Select Rate',
				  showConfirmButton: false,
				  timer: 1200
				});
		}else{
			$http.post("Parking_slot_Backend.jsp?checking_id=" + "insert_parking_details" + "&slot=" + $scope.slot + "&category=" + $scope.category + "&rate=" + $scope.rate).then(function (response) {
				$scope.ret=response.data.ret;
				if($scope.ret == "success"){
					Swal.fire({
						  position: 'top-end',
						  icon: 'success',
						  title: 'Saved Parking Details',
						  showConfirmButton: false,
						  timer: 1500
						});
					$http.post("Parking_slot_Backend.jsp?checking_id=" + "updating_parking_details" + "&slot=" + $scope.slot);
				}else{
					Swal.fire({
						  position: 'top-end',
						  icon: 'error',
						  title: 'OOPs....',
						  text: 'Server Error....',
						  showConfirmButton: false,
						  timer: 1500
						});
				}
			});
		}
	};
	$scope.select_parking_main_Details = function () {
		$http.post("Parking_slot_Backend.jsp?checking_id=" + "selecting_parking_main_details").then(function (response) {
			$scope.parking_Details=response.data;
		});
	};
	$scope.delete_parking_details = function (value) {
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
					$http.post("Parking_slot_Backend.jsp?checking_id=" + "deleting_parking_main_details" + "&value=" + value).then(function(response) {
						$scope.ret=response.data.ret;
						if($scope.ret == "Success"){
							  Swal.fire(
								      'Deleted!',
								      'Your Details has been deleted.',
								      'success'
								  );
								  $scope.select_parking_main_Details();
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
	$scope.update_Rate = function (value) {
		$scope.rate_id = value;
		button = "update";
	};
	$scope.update_parking_slot = function (value) {
		$scope.slot_id = value;
		button = "update_slot";
	};
	$scope.update_parking_details = function (value) {
		$scope.parking_details_id = value;
		button = "update_parking_details";
	};
	$scope.print_function = function (val,printSectionId) {
		if(val == "No"){
			Swal.fire({
				  icon: 'info',
				  title: 'Payment Is Not Done',
				  text: "You Can't Print Recipt",
				  showConfirmButton: false,
				  timer: 3000
				});
		}else{
				var innerContents = document.getElementById(printSectionId).innerHTML;
		        var popupWinindow = window.open('', '_blank', 'width=800,height=600,scrollbars=no,menubar=no,toolbar=no,location=no,status=no,titlebar=no');
		        popupWinindow.document.open();
		        popupWinindow.document.write('<html><head><link rel="stylesheet" type="text/css" href="style.css" /></head><body onload="window.print()">' + innerContents + '</html>');
		        popupWinindow.document.close();
		}
	};
	$scope.dashboard_select = function () {
		var i,sum = 0;
		$http.post("Parking_slot_Backend.jsp?checking_id=" + "select_slot").then(function (response) {
			$scope.count=response.data.count;
			$scope.parking_Details=response.data;
			
		});
		$http.post("Parking_slot_Backend.jsp?checking_id=" + "select_slot_of_active").then(function (response) {
			 $scope.count_yes=response.data.count_yes;
		});
		
	};
});