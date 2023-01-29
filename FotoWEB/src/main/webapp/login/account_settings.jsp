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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Account Settings - Vuexy - Bootstrap HTML admin template</title>
    <link rel="apple-touch-icon" href="../css//app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="../css//app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="../css//app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="../css//app-assets/vendors/css/forms/select/select2.min.css">
    <link rel="stylesheet" type="text/css" href="../css//app-assets/vendors/css/pickers/pickadate/pickadate.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="../css//app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css//app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="../css//app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="../css//app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="../css//app-assets/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="../css//app-assets/css/themes/semi-dark-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="../css//app-assets/css/core/menu/menu-types/horizontal-menu.css">
    <link rel="stylesheet" type="text/css" href="../css//app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="../css//app-assets/css/plugins/forms/validation/form-validation.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="../css//assets/css/style.css">
    <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="horizontal-layout horizontal-menu dark-layout 2-columns  navbar-floating footer-static  " data-open="hover" data-menu="horizontal-menu" data-col="2-columns" data-layout="dark-layout">

    <!-- BEGIN: Header-->
    	<nav
		class="header-navbar navbar-expand-lg navbar navbar-with-menu navbar-fixed navbar-brand-center">
		<div class="navbar-header d-xl-block d-none">
			<ul class="nav navbar-nav flex-row">
				<li class="nav-item"><a class="navbar-brand"
					href="/Foto">
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
							class="ficon feather icon-maximize"></i></a>
						</li>
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
										<a class="dropdown-item" href="/Foto/login/account_settings.jsp"> <i
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

    <!-- BEGIN: Main Menu-->
    <div class="horizontal-menu-wrapper">
        <div class="header-navbar navbar-expand-sm navbar navbar-horizontal floating-nav navbar-dark navbar-without-dd-arrow navbar-shadow menu-border" role="navigation" data-menu="menu-wrapper">
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
                            <h2 class="content-header-title float-left mb-0">Account Settings</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/Foto">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active"> Account Settings
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <!-- account setting page start -->
                <section id="page-account-settings">
                    <div class="row">
                        <!-- left menu section -->
                        <div class="col-md-3 mb-2 mb-md-0">
                            <ul class="nav nav-pills flex-column mt-md-0 mt-1">
                                <li class="nav-item">
                                    <a class="nav-link d-flex py-75 active" id="account-pill-general" data-toggle="pill" href="#account-vertical-general" aria-expanded="true">
                                        <i class="feather icon-globe mr-50 font-medium-3"></i>
                                        General
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link d-flex py-75" id="account-pill-password" data-toggle="pill" href="#account-vertical-password" aria-expanded="false">
                                        <i class="feather icon-lock mr-50 font-medium-3"></i>
                                        Change Password
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- right content section -->
                        <div class="col-md-9">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane active" id="account-vertical-general" aria-labelledby="account-pill-general" aria-expanded="true">
                                                <form novalidate action="/Foto/usercontroller/updateUser" method="post">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <label for="account-username">Username</label>
                                                                    <input type="text" class="form-control" name="username" placeholder="Username" value="${username }" required data-validation-required-message="This username field is required">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <label for="account-name">First Name</label>
                                                                    <input type="text" class="form-control" name="firstname" placeholder="First Name" value="${firstname }" required data-validation-required-message="This name field is required">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <label for="account-name">Last Name</label>
                                                                    <input type="text" class="form-control" name="lastname" placeholder="Last Name" value="${lastname }" required data-validation-required-message="This name field is required">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <label for="account-e-mail">E-mail</label>
                                                                    <input type="email" class="form-control" name="email" placeholder="Email" value="${email }" required data-validation-required-message="This email field is required">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="controls">
                                                        <c:if test="${!empty porukaUpdateSucc }">
															<p style="color: green;">${porukaUpdateSucc }</p>
														</c:if>
                                                        </div>
                                                        <div class="col-12 d-flex flex-sm-row flex-column justify-content-end">
                                                            <button type="submit" class="btn btn-primary mr-sm-1 mb-1 mb-sm-0">Save
                                                                changes</button>
                                                            <button type="reset" class="btn btn-outline-warning">Cancel</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="tab-pane fade " id="account-vertical-password" role="tabpanel" aria-labelledby="account-pill-password" aria-expanded="false">
                                                <form novalidate action="/Foto/usercontroller/changePassword" method="post">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <label for="account-old-password">Old Password</label>
                                                                    <input type="password" class="form-control" name="oldpassword" required placeholder="Old Password" data-validation-required-message="This old password field is required">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <label for="account-new-password">New Password</label>
                                                                    <input type="password" name="newpassword" class="form-control" placeholder="New Password" required data-validation-required-message="The password field is required" minlength="6">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <label for="account-retype-new-password">Retype New
                                                                        Password</label>
                                                                    <input type="password" class="form-control" required name="renewpassword" data-validation-match-match="password" placeholder="New Password" data-validation-required-message="The Confirm password field is required" minlength="6">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="controls">
                                                        	<c:choose>
																<c:when test="${!empty porukaPassWr }">
																	<p style="color: red;">${porukaPassWr }</p>
																</c:when>
																<c:otherwise>
																	<p style="color: green;">${porukaPassSucc }</p>
																</c:otherwise>
															</c:choose>
                                                        </div>
                                                        <div class="col-12 d-flex flex-sm-row flex-column justify-content-end">
                                                            <button type="submit" class="btn btn-primary mr-sm-1 mb-1 mb-sm-0">Save
                                                                changes</button>
                                                            <button type="reset" class="btn btn-outline-warning">Cancel</button>
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
                </section>
                <!-- account setting page end -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
    <footer class="footer footer-static footer-dark navbar-shadow">
        <p class="clearfix blue-grey lighten-2 mb-0"><span class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; 2020<a class="text-bold-800 grey darken-2" href="https://1.envato.market/pixinvent_portfolio" target="_blank">Pixinvent,</a>All rights Reserved</span><span class="float-md-right d-none d-md-block">Hand-crafted & Made with<i class="feather icon-heart pink"></i></span>
            <button class="btn btn-primary btn-icon scroll-top" type="button"><i class="feather icon-arrow-up"></i></button>
        </p>
    </footer>
    <!-- END: Footer-->


    <!-- BEGIN: Vendor JS-->
    <script src="../css//app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="../css//app-assets/vendors/js/ui/jquery.sticky.js"></script>
    <script src="../css//app-assets/vendors/js/forms/select/select2.full.min.js"></script>
    <script src="../css//app-assets/vendors/js/forms/validation/jqBootstrapValidation.js"></script>
    <script src="../css//app-assets/vendors/js/pickers/pickadate/picker.js"></script>
    <script src="../css//app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
    <script src="../css//app-assets/vendors/js/extensions/dropzone.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="../css//app-assets/js/core/app-menu.js"></script>
    <script src="../css//app-assets/js/core/app.js"></script>
    <script src="../css//app-assets/js/scripts/components.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="../css//app-assets/js/scripts/pages/account-setting.js"></script>
    <!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>