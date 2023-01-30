<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>FotoProj - My Bills</title>
<link rel="apple-touch-icon"
	href="../css/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="../css/app-assets/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600"
	rel="stylesheet">

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="../css/app-assets/vendors/css/vendors.min.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->
<link rel="stylesheet" type="text/css"
	href="../css/app-assets/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="../css/app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css"
	href="../css/app-assets/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="../css/app-assets/css/components.css">
<link rel="stylesheet" type="text/css"
	href="../css/app-assets/css/themes/dark-layout.css">
<link rel="stylesheet" type="text/css"
	href="../css/app-assets/css/themes/semi-dark-layout.css">

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="../css/app-assets/css/core/menu/menu-types/horizontal-menu.css">
<link rel="stylesheet" type="text/css"
	href="../css/app-assets/css/core/colors/palette-gradient.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
	href="../css/assets/css/style.css">
<!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body
	class="horizontal-layout horizontal-menu dark-layout 2-columns  navbar-floating footer-static  "
	data-open="hover" data-menu="horizontal-menu" data-col="2-columns"
	data-layout="dark-layout">

	<!-- BEGIN: Header-->
	<nav
		class="header-navbar navbar-expand-lg navbar navbar-with-menu navbar-fixed navbar-brand-center">
		<div class="navbar-header d-xl-block d-none">
			<ul class="nav navbar-nav flex-row">
				<li class="nav-item"><a class="navbar-brand" href="/Foto">
						<div class="brand-logo"></div>
				</a></li>
			</ul>
		</div>
		<div class="navbar-wrapper">
			<div class="navbar-container content">
				<div class="navbar-collapse" id="navbar-mobile">
					<div
						class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
						<ul class="nav navbar-nav">
							<li class="nav-item mobile-menu d-xl-none mr-auto"><a
								class="nav-link nav-menu-main menu-toggle hidden-xs" href=""><i
									class="ficon feather icon-menu"></i></a></li>
						</ul>
					</div>
					<ul class="nav navbar-nav float-right">
						<li class="nav-item d-none d-lg-block"><a
							class="nav-link nav-link-expand"><i
								class="ficon feather icon-maximize"></i></a></li>
						<c:choose>
							<c:when test="${!empty user}">
								<li class="dropdown dropdown-user nav-item"><a
									class="dropdown-toggle nav-link dropdown-user-link" href=""
									data-toggle="dropdown">
										<div class="user-nav d-sm-flex d-none">
											<span class="user-name text-bold-600">${user.username }</span>
											<span class="user-status">Available</span>
										</div> <span><img class="round"
											src="../css/app-assets/images/portrait/small/avatar-s-11.jpg"
											alt="avatar" height="40" width="40"></span>
								</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item"
											href="/Foto/users/account_settings.jsp"> <i
											class="feather icon-user"></i> Edit Profile
										</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="/Foto/usercontroller/logout"><i
											class="feather icon-power"></i> Logout</a>
									</div></li>
							</c:when>
							<c:otherwise>
								<li><a href="/Foto/login/login.jsp" class="btn btn-primary"
									style="margin-top: 10px; margin-left: 10px">Login</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!-- END: Header-->


	<!-- BEGIN: Main Menu-->
	<div class="horizontal-menu-wrapper">
		<div
			class="header-navbar navbar-expand-sm navbar navbar-horizontal floating-nav navbar-dark navbar-without-dd-arrow navbar-shadow menu-border"
			role="navigation" data-menu="menu-wrapper">
			<div class="navbar-header">
				<ul class="nav navbar-nav flex-row">
					<li class="nav-item mr-auto"><a class="navbar-brand"
						href="/">
							<div class="brand-logo"></div>
							<h2 class="brand-text mb-0">FotoProj</h2>
					</a></li>
					<li class="nav-item nav-toggle"><a
						class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i
							class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i><i
							class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary"
							data-ticon="icon-disc"></i></a></li>
				</ul>
			</div>
			<!-- Horizontal menu content-->
			<div class="navbar-container main-menu-content"
				data-menu="menu-container">
				<!-- include css/includes/mixins-->
				<ul class="nav navbar-nav" id="main-menu-navigation"
					data-menu="menu-navigation">

					<c:if test="${!empty user }">
						<li class="dropdown nav-item" data-menu="dropdown"><a
							class="dropdown-toggle nav-link" href="" data-toggle="dropdown"><i
								class="feather icon-shopping-cart"></i><span data-i18n="Orders">Orders</span></a>
							<ul class="dropdown-menu">
								<li data-menu=""><a class="dropdown-item" href="/Foto/ordercontroller/prepareCreateOrder"
									data-toggle="dropdown" data-i18n="Create new order"><i
										class="feather icon-file"></i>Create new order</a></li>
								<li data-menu=""><a class="dropdown-item" href="/Foto/ordercontroller/myOrders"
									data-toggle="dropdown" data-i18n="My orders"><i
										class="feather icon-file-text"></i>My orders</a></li>
								<c:if test="${roleid == 1 }">
									<li data-menu=""><a class="dropdown-item" href="/Foto/ordercontroller/allOrders"
										data-toggle="dropdown" data-i18n="All Orders"><i
											class="feather icon-file-text"></i>All Orders</a></li>
								</c:if>
							</ul></li>
					</c:if>

					<li class="dropdown nav-item" data-menu="dropdown"><a
						class="dropdown-toggle nav-link" href="" data-toggle="dropdown"><i
							class="feather icon-list"></i><span data-i18n="Pricelist">Pricelist</span></a>
						<ul class="dropdown-menu">
							<li data-menu=""><a class="dropdown-item" href="/Foto/pricelistcontroller/getPricelist"
								data-toggle="dropdown" data-i18n="Pricelist"><i
									class="feather icon-list"></i>Pricelist</a></li>
						</ul></li>

					<c:if test="${!empty user }">
						<li class="dropdown nav-item" data-menu="dropdown"><a
							class="dropdown-toggle nav-link" href="" data-toggle="dropdown"><i
								class="feather icon-file-text"></i><span data-i18n="Bills">Bills</span></a>
							<ul class="dropdown-menu">
								<li data-menu=""><a class="dropdown-item" href="/Foto/billcontroller/getMyBills"
									data-toggle="dropdown" data-i18n="My Bills"><i
										class="feather icon-file-text"></i>My Bills</a></li>
								<c:if test="${roleid == 1 }">
									<li data-menu=""><a class="dropdown-item" href="/Foto/billcontroller/getAllBills"
										data-toggle="dropdown" data-i18n="All Bills"><i
											class="feather icon-file-text"></i>All Bills</a></li>
								</c:if>
							</ul></li>
					</c:if>
					
					<c:if test="${!empty user }">
						<c:if test="${roleid == 1 }">
							<li class="dropdown nav-item" data-menu="dropdown"><a
								class="dropdown-toggle nav-link" href="" data-toggle="dropdown"><i
									class="feather icon-user"></i><span data-i18n="Users">Users</span></a>
								<ul class="dropdown-menu">
									<li data-menu=""><a class="dropdown-item"
										href="/Foto/usercontroller/viewAllUsers"
										data-toggle="dropdown" data-i18n="All Users"><i
											class="feather icon-user"></i>All Users</a></li>
								</ul></li>
						</c:if>
					</c:if>

				</ul>
			</div>
		</div>
	</div>
	<!-- END: Main Menu-->

	<!-- BEGIN: Content-->
	<div class="app-content content">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper">
			<div class="content-header row">
				<div class="content-header-left col-md-9 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h2 class="content-header-title float-left mb-0">Bills</h2>
							<div class="breadcrumb-wrapper col-12">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="/Foto">Home</a></li>
									<li class="breadcrumb-item active">My Bills</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="content-body">
				<!-- Basic Tables start -->
				<div class="row" id="basic-table">
					<div class="col-12">
						<div class="card">
							<div class="card-content">
								<div class="card-body">
									<p class="card-text"></p>
									<!-- Table with outer spacing -->
									<div class="table-responsive">
										<table class="table table-striped mb-0">
											<thead>
												<tr>
													<th>BILL ID</th>
													<th>PRICE</th>
													<th>ORDER ID</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${bills }" var="b">
												<tr>
													<th scope="row">${b.billId }</th>
													<td>${b.price } RSD</td>
													<td>${b.orderId }</td>
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
				<!-- Basic Tables end -->
			</div>
		</div>
	</div>
	<!-- END: Content-->

	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<!-- BEGIN: Vendor JS-->
	<script src="../css/app-assets/vendors/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script src="../css/app-assets/vendors/js/ui/jquery.sticky.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script src="../css/app-assets/js/core/app-menu.js"></script>
	<script src="../css/app-assets/js/core/app.js"></script>
	<script src="../css/app-assets/js/scripts/components.js"></script>
	<!-- END: Theme JS-->

	<!-- BEGIN: Page JS-->
	<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>