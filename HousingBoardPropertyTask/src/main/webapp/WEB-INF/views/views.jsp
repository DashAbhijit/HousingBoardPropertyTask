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
</head>
<body>
<div align="center" class="container">
		<div class="display-4  text-dark text-center mt-2">Registraion Details</div>

		<table class="table table-striped " border="1" id="tableId">

			<thead class="thead-dark">
				<tr>
					<th>SL#</th>
					<th>Name</th>
					<th>Email</th>
					<th>MobileNo</th>
					<th>Age</th>
					<th>Documents</th>
					<th>Housing Project</th>
					<th>Property Type</th>
					<th>Action</th>
				</tr>

			</thead>
			<tbody>
				<c:forEach items="${ListShowData}" var="applicant" varStatus="count">
					<tr>
						<td>${count.count}</td>
						<td>${applicant.name}</td>
						<td>${applicant.email}</td>
						<td>${applicant.mobileNo}</td>
						<td>${applicant.age}</td>
						<td>${applicant.idProve}</td>
						<td>${applicant.property.project.projectName}</td>
						<td>${applicant.property.propertyType}</td>
						<td><a href="./deleteApplicantForm?applicantId=${applicant.applicantId}"
							class="btn btn-danger">Delete</a></td>	

					</tr>
				</c:forEach>

			</tbody>

		</table>


	</div>


</body>
</html>