<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
<link
	rel="https://cdnjs.datatables/1.12.1/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	background-color: #dadada;
}
</style>

</head>
<body>

	<div class="container mt-5">
		<div class="display-4 text-center">
			<strong><h2>Cable TV Registration Form</h2></strong>
			<hr>
		</div>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">ADD</a></li>
			<li><a class="btn btn-info" data-toggle="tab" href="#menu1">SHOW</a></li>


		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<div class="container">
					<form action="./savedata" method="post"
						enctype="multipart/form-data" onsubmit="return validation1()">
						<br> <br>

						<div class="row">
							<div class="form-group col-md-4">
								<label class="text-primary">Provider Name<span
									style="color: red">*</span> :
								</label> <select onchange="project_property_type()" id="projectId"
									name="projectName" class="form-control">
									<option value="0">-select-</option>
									<c:forEach items="${projectList}" var="projects">
										<option value='${projects.projectId}'>${projects.projectName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label class="text-primary">Subscription For <span
									style="color: red">*</span>:
								</label> <select onchange="property_cost()" id="propertyId"
									name="propertyName" class="form-control">
									<!-- <option value="0">-select-</option> -->


								</select>
							</div>
							<div class="form-group col-md-4">
								<label class="text-primary">Subscription Fee <span
									style="color: red">*</span> :
								</label> <input disabled="disabled" class="form-control" type="text"
									name="propertyCost" id="propertyCost">
							</div>

						</div>
						<div class="container"
							style="margin-top: 25px; border: 1px solid black; background-color: grey; border-radius: 5px">
							<fieldset>
								<strong><legend>Applicant Details:</legend></strong>
								<div class="row">
									<div class="form-group col-md-4">
										<label>Applicant Name <span style="color: red">*</span>
											:
										</label> <input type="text" name="name" id="name" class="form-control">
										<span id="customerNameEr" class="text-danger font-weight-bold"></span>
									</div>
									<div class="form-group col-md-4">
										<label>Email <span style="color: red">*</span> :
										</label> <input type="email" name="email" id="email"
											class="form-control"> <span id="passwordEr"
											class="text-danger font-weight-bold"></span>
									</div>
									<div class="form-group col-md-4">
										<label>Mobile No <span style="color: red">*</span>:
										</label> <input type="number" name="mobileNo" id="mobileNo"
											class="form-control"> <span id="repasswordEr"
											class="text-danger font-weight-bold"></span>
									</div>
								</div>

								<div class="row">

									<div class="form-group col-md-4">
										<label>Date of Birth <span style="color: red">*</span>:
										</label> <input type="Date" name="age" id="age" class="form-control">
										<span id="aadharNoEr" class="text-danger font-weight-bold"></span>
									</div>
									<div class="form-group col-md-4">
										<label>Gender <span style="color: red">*</span> :
										</label> <br> <input type="radio" name="gender" id="gentype"
											value="Female">Female <input type="radio"
											name="gender" id="gentype" value="Male" checked="checked">Male

									</div>
									<div class="form-group col-md-4">
										<label>Upload Id Proof <span style="color: red">*</span>
											:
										</label> <input type="file" name="idProve" id="idProve"
											class="form-control">
									</div>
								</div>



								<div align="center" class="mb-4">
									<input type="submit" value="Submit" class="btn btn-success">&nbsp;&nbsp;<input
										type="submit" value="Reset" class="btn btn-danger">
								</div>

							</fieldset>
						</div>
					</form>
				</div>

			</div>
			<div id="menu1" class="tab-pane fade">
				<!-- For Filter -->
				<div class="container">
					<form action="./search" >
						<br> <br>
						<div class="row">
							<div class="form-group col-md-4">
								<label class="text-primary">Provider Name:</label> <select onchange="subscriptionFor()"
									 id="projecttId" name="projectName" class="form-control">
									<option value="0">-select-</option>
									<c:forEach items="${projectList}" var="projects">
										<option value='${projects.projectId}'>${projects.projectName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label class="text-primary">Subscription For :
								</label> <select onchange="property_cost()" id="subscriptionId"
									name="propertyName" class="form-control">
									<!-- <option value="0">-select-</option> -->


								</select>
							</div>

						</div>
						<div>
							<input type="submit" value="Search" class="btn btn-success">
						</div>

					</form>
				</div>


				<!-- Table Data -------------------------------------------------------------------------------------------->
				<div align="center" class="container">
					<div class="display-4  text-dark text-center mt-2">Registraion
						Details</div>

					<table class="table table-striped " border="1" id="tableId">

						<thead class="thead-dark">
							<tr>
								<th>SL#</th>
								<th>Name</th>
								<th>Email</th>
								<th>MobileNo</th>
								<th>Age</th>
								<th>Regd.Date</th>
								<th>Documents</th>
								<th>Provider Name</th>
								<th>Subscription For</th>
								<th>Action</th>
							</tr>

						</thead>
						<tbody>
							<c:forEach items="${ListShowData}" var="applicant"
								varStatus="count">
								<tr>
									<td>${count.count}</td>
									<td>${applicant.name}</td>
									<td>${applicant.email}</td>
									<td>${applicant.mobileNo}</td>
									<td>${applicant.age}</td>
									<td>${applicant.date }</td>
									<td><a href="./downloadFile?applicantId=${applicant.applicantId}">${applicant.idName}</a></td>
									<td>${applicant.property.project.projectName}</td>
									<td>${applicant.property.propertyType}</td>
									<td><a
										href="./deleteApplicantForm?applicantId=${applicant.applicantId}"
										class="btn btn-danger"
										onclick="return confirm('Are you sure you want to delete this item?');">Delete</a></td>

								</tr>
							</c:forEach>

						</tbody>

					</table>


				</div>


			</div>

		</div>
	</div>

</body>





<script>
	$(document).ready(function() {
		$('#tableId').DataTable();
	});
</script>

<script type="text/javascript">
	function project_property_type() {

		var project = $("#projectId").val();

		$.ajax({
			type : "GET",
			url : "./getPropertyTypeByPrject",
			data : "projectId=" + project,
			success : function(response) {
				$("#propertyId").html(response);
			}
		});

	}


	function subscriptionFor() {
		

		var project = $("#projecttId").val();

		$.ajax({
			type : "GET",
			url : "./getPropertyTypeByPrject",
			data : "projectId=" + project,
			success : function(response) {
				$("#subscriptionId").html(response);
			}
		});

	}
	

	function property_cost() {
		var propertyId = $("#propertyId").val();
		$.ajax({
			type : "GET",
			url : "./getPropertyCost",
			data : "propertyId=" + propertyId,
			success : function(response) {
				$("#propertyCost").val(response);
				//$("#propertyCost").html(response);
			}

		});
	}
</script>

<script type="text/javascript">
	function validation1() {
		
		let name = document.getElementById("name").value;
		let email = document.getElementById("email").value;
		let mobile = document.getElementById("mobileNo").value;
		let imageId = document.getElementById("idProve").value;
		let letter = name.charAt(0);

		var validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
		var applicantCheck = /^[A-Za-z. ]{3,}$/;

		 /* if(applicantCheck.test(name)){
				document.getElementById("applicantNameEr").innerHTML = " ";
				}
			else{
				document.getElementById("applicantNameEr").innerHTML = " ** Applicant name must contains 3 character and only alphabets ";
				return false;
				}  */

		 if (name == "" || name.length < 3) {
			alert("name must contain some letter");
			return false;
		} else {
			if (isNaN(letter)) {
			} else {
				return false;
			}
		} 

		if (mobile.length == 10) {
			if (isNaN(mobile)) {
				alert("Enter valid mobile no");
				return false;
			}
		} else {
			alert("moblie number must be 10 digit");
			return false;
		}

		if (!(email.match(validRegex))) {
			alert("Enter a valid email");
			return false;
		}

		if (imageId == "") {
			alert("Upload a file");
			return false;
		}
		let dob1 = document.getElementById("age").value;
		var dob = new Date(dob1);  
	    //calculate month difference from current date in time  
	    var month_diff = Date.now() - dob.getTime();  
	      
	    //convert the calculated difference in date format  
	    var age_dt = new Date(month_diff);   
	      
	    //extract year from date      
	    var year = age_dt.getUTCFullYear();  
	      
	    //now calculate the age of the user  
	    var age = Math.abs(year - 1970);  
		if(age<18){
			alert("Age must be greater than 18 year");
			return false;
			}
			

		return true;

	}
</script>

<script type="text/javascript">

function validation() {
	let dob1 = document.getElementById("dob").value;
	var dob = new Date(dob1);  
    //calculate month difference from current date in time  
    var month_diff = Date.now() - dob.getTime();  
      
    //convert the calculated difference in date format  
    var age_dt = new Date(month_diff);   
      
    //extract year from date      
    var year = age_dt.getUTCFullYear();  
      
    //now calculate the age of the user  
    var age = Math.abs(year - 1970);  
	if(age<18){
		alert("Age must be greater than 18 year");
		return false;
		}

	return true;

}

</script>




</html>