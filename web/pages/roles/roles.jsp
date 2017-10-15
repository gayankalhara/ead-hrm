<%@page import="java.util.List"%>
<%@page import="app.models.Role"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>

<section class="content">
    <div class="container-fluid">
        <div class="block-header">
            <h2>EMPLOYEE ROLES</h2>
        </div>
        <%     if (session.getAttribute("RC") != null) {

        %>
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Completed!</strong> <%=session.getAttribute("RC")%>
        </div>
        <%session.setAttribute("RC", null);  }
        %>

        <div>
            <a href="createRole" class="btn btn-lg btn-primary">Add New Role</a>
        </div>
        <br>
        <div class="row clearfix">
                    <!-- Task Info -->
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="card">
                            <div class="header">
                                <h2>List of Available Roles</h2>
                                <ul class="header-dropdown m-r--5">
                                    <li class="dropdown">
                                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                            <i class="material-icons">more_vert</i>
                                        </a>
                                        <ul class="dropdown-menu pull-right">
                                            <li><a href="javascript:void(0);">Refresh</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="body">
                                <div class="table-responsive">
                                    <table class="table table-hover dashboard-task-infos">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Job Title</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%Iterator itr;%>
                                            <% List<Role> data = (List<Role>) request.getAttribute("list");

                                            for (itr = data.iterator(); itr.hasNext();) {
                                                Role role = (Role) itr.next();
                                                long id = role.getId();
                                        %>
                                            <tr>
                                                <td><%=role.getId()%> </td>
                                                <td><%=role.getTitle()%></td>
                                                <td class="center">
                                                    <div class="icon-buttons">
                                                        <a href="editRole?id=<%=id%>" class="btn bg-light-green waves-effect">
                                                            <i class="material-icons">mode_edit</i>
                                                        </a>
                                                            
                                                        <a class="btn bg-red waves-effect">
                                                            <i class="material-icons">delete</i>
                                                        </a>
                                                    </div>

                                                </td>
                                            </tr>
                                            
                                            <%}%>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- #END# Task Info -->
                </div>
    </div>
</section>
                            
<%@include  file="../common/footer.jsp" %>
