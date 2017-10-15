<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect(request.getContextPath() + "/");
    }

%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <!-- start: Meta -->
        <meta charset="utf-8">
        <title>EAD </title>
        <!-- end: Meta -->

        <!-- start: Mobile Specific -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- end: Mobile Specific -->

        <!-- start: CSS -->
        <link id="bootstrap-style" href="./assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link id="base-style" href="./assets/css/style.css" rel="stylesheet">
        <link id="base-style-responsive" href="./assets/css/style-responsive.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
        <!-- end: CSS -->

        <link rel="shortcut icon" href="img/favicon.ico">

        <style type="text/css">
            body { background: url(./assets/img/bg-login.jpg) !important; }
        </style>



    </head>

    <body>
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="home"><span>EAD</span></a>

                    <!-- start: Header Menu -->
                    <div class="nav-no-collapse header-nav">
                        <ul class="nav pull-right">



                            <!-- start: User Dropdown -->
                            <li class="dropdown">
                                <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="halflings-icon white user"></i> Admin
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">

                                    <li><a href="logout"><i class="halflings-icon off"></i> Logout</a></li>
                                </ul>
                            </li>
                            <!-- end: User Dropdown -->
                        </ul>
                    </div>
                    <!-- end: Header Menu -->

                </div>
            </div>
        </div>
    </head>

<body>

    <div class="container-fluid-full">
        <div class="row-fluid">
            <div id="sidebar-left" class="span2">
                <div class="nav-collapse sidebar-nav">
                    <ul class="nav nav-tabs nav-stacked main-menu">
                        <li><a href="home"><i class="icon-bar-chart"></i><span class="hidden-tablet"> Dashboard</span></a></li>	
                        <li><a href="roles"><i class="halflings-icon white bookmark"></i><span class="hidden-tablet">Roles</span></a></li>
                        <li><a href="tasks"><i class="icon-tasks"></i><span class="hidden-tablet"> Tasks</span></a></li>
                        <li>
                            <a href="employees"><i class="halflings-icon white white user"></i><span class="hidden-tablet">Employees</span></a>

                        </li>
                    </ul>
                </div>
            </div>

