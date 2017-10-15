<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="common/headerLogin.jsp" %>

<div class="container-fluid-full">
    <div class="row-fluid">

        <div class="row-fluid">
            <div class="login-box">
                <div class="icons">

                </div>
                <h2>Login - Admin</h2>
                <form class="form-horizontal" action="login" method="post">
                    <fieldset>

                        <div class="input-prepend" title="Username">
                            <span class="add-on"><i class="halflings-icon user"></i></span>
                            <input class="input-large span10" name="username" id="username" type="text" placeholder="type username"/>
                        </div>
                        <div class="clearfix"></div>

                        <div class="input-prepend" title="Password">
                            <span class="add-on"><i class="halflings-icon lock"></i></span>
                            <input class="input-large span10" name="password" id="password" type="password" placeholder="type password"/>
                        </div>
                        <div class="clearfix"></div>

                        <div class="button-login">	
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                        <div class="clearfix"></div>

                </form>
                <%                    if (request.getAttribute("loginError") != null) {
                %>
                <div class="alert alert-error">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    <strong>Try again!</strong>  <%=request.getAttribute("loginError")%>
                </div>
                <%
                    }
                %>
                <hr>

            </div><!--/span-->

        </div><!--/row-->


    </div><!--/.fluid-container-->

</div><!--/fluid-row-->

<%@include  file="common/footer.html" %>
