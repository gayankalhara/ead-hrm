<%@page import="java.util.List"%>
<%@page import="app.models.Task"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>
<!-- start: Content -->

<section class="content">
    <div class="container-fluid">
        <div class="block-header">
            <h2>TASKS</h2>
        </div>
        <%     if (session.getAttribute("TC") != null) {

        %>
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Completed!</strong> <%=session.getAttribute("TC")%>
        </div>
        <%session.setAttribute("TC", null);  }
        %>

        <div>
            <a href="createTask" class="btn btn-lg btn-primary">Create New Task</a>
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
                                                <th>Id</th>
                                                <th>Description</th>
                                                <th>Employee Name</th>
                                                <th>Priority</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%Iterator itr;%>
                                            <% List<Task> data = (List<Task>) request.getAttribute("list");

                                                for (itr = data.iterator(); itr.hasNext();) {
                                                    Task task = (Task) itr.next();
                                                    long id = task.getId();
                                                    String ename = null;
                                                    if(task.getEmployee() != null){
                                                         ename = task.getEmployee().getName();
                                                    }

                                                    String pro = task.getPriority();
                                            %>
                                            <tr>

                                                <td><%=task.getId()%> </td>
                                                <td><%=task.getDescription()%></td>
                                                <td>
                                                    <%if(ename == null){%>  
                                                    <span class="label">Not Assigned</span>
                                                    <%}else {%>
                                                            <%=ename%>
                                                    <%}%>

                                                </td>
                                                <td>
                                                    <% if(pro.equals("Low")){%>
                                                    <span class="label bg-green"><%=pro%></span>
                                                    <%}%>
                                                     <% if(pro.equals("Medium")){%>
                                                    <span class="label bg-orange"><%=pro%></span>
                                                    <%}%>
                                                     <% if(pro.equals("High")){%>
                                                    <span class="label bg-red"><%=pro%></span>
                                                    <%}%>
                                                </td>
                                                <td class="center">
                                                    
                                                    <div class="icon-buttons">
                                                        <a class="btn bg-light-green waves-effect" href="editTask?id=<%=id%>">
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