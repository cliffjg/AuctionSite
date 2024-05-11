<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Model.Auction" %>
<%@ page import="userpackage.Model.Users" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>login</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abel&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito&amp;display=swap">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/-Login-form-Page-BS4--Login-form-Page-BS4.css">
    <link rel="stylesheet" href="assets/css/Div-Overlay-Black.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark-Multi-Column-icons.css">
    <link rel="stylesheet" href="assets/css/Signup-page-with-overlay.css">
</head>

<body style="background: rgb(225,225,225);">


	<%ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users"); %>
	
	
	<jsp:include page="header.jsp" />

<!--     <nav class="navbar navbar-expand-md bg-body py-3">
        <div class="container"><a class="navbar-brand d-flex align-items-center" href="productPage.html"><span class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon"><img style="height: 32px;width: 32px;background: var(--bs-body-bg);" src="assets/img/auction.png"></span><span style="color: #404040;">AuctionUp</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item d-flex flex-row justify-content-center align-items-center" style="margin-right: 20px;color: #404040;"><a class="nav-link" href="newAuction.html" style="margin-left: 0px;color: rgba(0,0,0,0.65);"><img style="width: 10px;height: 10px;color: #404040;" src="assets/img/plus.png"><span style="color: #404040;margin-left: 5px;">New Auction</span></a></li>
                    <li class="nav-item d-flex d-md-flex flex-row justify-content-center align-items-center justify-content-md-center align-items-md-center" style="margin-right: 20px;"><a class="nav-link d-flex justify-content-center align-items-center" href="messagePage.html" style="margin-left: 0px;color: #404040;"><img style="width: 12px;height: 12px;margin-right: 5px;color: #404040;" src="assets/img/mail.png"><span style="color: #404040;">Messages</span>
                            <div style="height: 20px;width: 0px;color: rgb(64, 64, 64);margin-left: 10px;border: 1px solid #404040 ;"></div>
                        </a></li>
                    <li class="nav-item d-flex d-md-flex flex-row justify-content-center align-items-center justify-content-md-center align-items-md-center">
                        <div class="nav-item dropdown"><a aria-expanded="false" data-bs-toggle="dropdown" href="#" style="text-decoration: none;"><span style="margin-right: 5px;color: #404040;">Alice</span><span style="margin-right: 10px;color: #404040;">Smith</span><img class="rounded-circle" alt="woman in white crew neck shirt smiling" style="width: 32px;height: 32px;" src="assets/img/photo-1580489944761-15a19d654956-1.jpg"></a>
                            <div class="dropdown-menu dropdown-menu-end"><a href="profilePage.html" style="padding-top: 4px;padding-bottom: 4px;padding-right: 16px;padding-left: 16px;color: var(--bs-navbar-active-color);text-decoration-line: none;">Profile</a><a class="dropdown-item" href="#">Settings</a><a class="dropdown-item" href="index.html">Logout</a></div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav> -->
    <div class="d-inline-flex flex-column align-content-start flex-wrap flex-sm-shrink-1" style="width: 100%;height: 30px;background: rgb(44,47,50);overflow: scroll;overflow-y: hidden;"><label class="form-label" data-bss-hover-animate="pulse" style="color: var(--bs-body-bg);margin-left: 50px;margin-right: 20px;font-family: Abel, sans-serif;font-weight: bold;margin-top: 5px;padding-right: 10px;padding-left: 10px;height: 100%;"><span style="background-color: rgb(43, 47, 50);">My Auctions</span></label><label class="form-label" data-bss-hover-animate="pulse" style="color: var(--bs-body-bg);margin-left: 20px;margin-right: 20px;font-family: Abel, sans-serif;font-weight: bold;margin-top: 5px;padding-right: 10px;padding-left: 10px;height: 100%;"><span style="background-color: rgb(43, 47, 50);">My Bids/Favorites</span></label><label class="form-label" data-bss-hover-animate="pulse" style="color: var(--bs-body-bg);margin-left: 20px;margin-right: 20px;font-family: Abel, sans-serif;font-weight: bold;font-size: 16px;margin-top: 5px;"><span style="background-color: rgb(43, 47, 50);">Community Auctions</span></label></div>
    <div class="container-fluid">
        <div class="card shadow" style="border-radius: 0px;">
            <div class="card-header py-3">
                <p class="text-primary m-0 fw-bold"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-pencil-square">
                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"></path>
                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"></path>
                    </svg>&nbsp;Create Message</p>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6 text-nowrap">
                        <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable"><label class="form-label">Show&nbsp;<select class="d-inline-block form-select form-select-sm">
                                    <option value="10" selected="">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>&nbsp;</label></div>
                    </div>
                    <div class="col-md-6">
                        <div class="text-md-end dataTables_filter" id="dataTable_filter"><label class="form-label"><input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search"></label></div>
                    </div>
                </div>
                <div class="table-responsive table mt-2" id="dataTable-1" role="grid" aria-describedby="dataTable_info">
                    <table class="table my-0" id="dataTable">
                        <thead>
                            <tr>
                                <th>Sender</th>
                                <th>Message</th>
                                <th>Date/Time</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><img class="rounded-circle me-2" width="30" height="30" src="assets/img/avatars/avatar1.jpeg">Airi Satou</td>
                                <td style="color: var(--bs-table-color);">Can you provide detailed information about the vehicle's make, model, year, and mileage?</td>
                                <td>2008/11/28</td>
                            </tr>
                            <tr>
                                <td><img class="rounded-circle me-2" width="30" height="30" src="assets/img/avatars/avatar2.jpeg">Angelica Ramos</td>
                                <td>What condition is the vehicle in, and are there any known issues or defects?</td>
                                <td>2009/10/09<br></td>
                            </tr>
                            <tr>
                                <td><img class="rounded-circle me-2" width="30" height="30" src="assets/img/avatars/avatar3.jpeg">Ashton Cox</td>
                                <td>Can you describe the vehicle's service history and any maintenance or repairs that have been done?</td>
                                <td>2009/01/12<br></td>
                            </tr>
                            <tr>
                                <td><img class="rounded-circle me-2" width="30" height="30" src="assets/img/avatars/avatar4.jpeg">Bradley Greer</td>
                                <td>Are there any photos available, both interior and exterior, that show the vehicle's current condition?</td>
                                <td>2012/10/13<br></td>
                            </tr>
                            <tr>
                                <td><img class="rounded-circle me-2" width="30" height="30" src="assets/img/avatars/avatar5.jpeg">Brenden Wagner</td>
                                <td>What is the starting bid or reserve price for the vehicle?</td>
                                <td>2011/06/07<br></td>
                            </tr>
                            <tr>
                                <td><img class="rounded-circle me-2" width="30" height="30" src="assets/img/avatars/avatar1.jpeg">Brielle Williamson</td>
                                <td>Are there any additional fees or charges that the winning bidder will need to pay?</td>
                                <td>2012/12/02<br></td>
                            </tr>
                            <tr>
                                <td><img class="rounded-circle me-2" width="30" height="30" src="assets/img/avatars/avatar2.jpeg">Bruno Nash<br></td>
                                <td>Can you specify the auction end date and time, as well as any extended bidding rules?</td>
                                <td>2011/05/03<br></td>
                            </tr>
                            <tr>
                                <td><img class="rounded-circle me-2" width="30" height="30" src="assets/img/avatars/avatar3.jpeg">Caesar Vance</td>
                                <td>Is the vehicle available for inspection before the auction ends, and if so, how can I arrange it?</td>
                                <td>2011/12/12<br></td>
                            </tr>
                            <tr>
                                <td><img class="rounded-circle me-2" width="30" height="30" src="assets/img/avatars/avatar4.jpeg">Cara Stevens</td>
                                <td style="background: var(--bs-table-bg);">What are the terms of sale, including payment methods accepted and pickup or delivery options?</td>
                                <td>2011/12/06<br></td>
                            </tr>
                            <tr>
                                <td><img class="rounded-circle me-2" width="30" height="30" src="assets/img/avatars/avatar5.jpeg">Cedric Kelly</td>
                                <td>Can you extend the auction?</td>
                                <td>2012/03/29<br></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td><strong>Sender</strong></td>
                                <td><strong>Message</strong></td>
                                <td><strong>Date/Time</strong></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <div class="row">
                    <div class="col-md-6 align-self-center">
                        <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing 1 to 10 of 27</p>
                    </div>
                    <div class="col-md-6">
                        <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                            <ul class="pagination">
                                <li class="page-item disabled"><a class="page-link" aria-label="Previous" href="#"><span aria-hidden="true">Â«</span></a></li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" aria-label="Next" href="#"><span aria-hidden="true">Â»</span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
    <jsp:include page="footer.jsp" />
    
    
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/countDownTimer.js"></script>
    <script src="assets/js/newCountDownTimers.js"></script>
</body>

</html>