<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


        <%
            if (session.getAttribute("username") != null) {
                response.sendRedirect("home");
            }

        %>
        

