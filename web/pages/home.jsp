<%@page import="java.util.List"%>
<%@page import="app.models.Task"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="common/header.jsp" %>

        <section class="content">
            <div class="container-fluid">
                <div class="block-header">
                    <h2>DASHBOARD</h2>
                </div>

                <!-- Widgets -->
                <div class="row clearfix">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="info-box bg-pink hover-expand-effect">
                            <div class="icon">
                                <i class="material-icons">group</i>
                            </div>
                            <div class="content">
                                <div class="text">Employees</div>
                                <div class="number count-to" data-from="0" data-to="<%=request.getAttribute("empCount")%>" data-speed="5" data-fresh-interval="20"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="info-box bg-cyan hover-expand-effect">
                            <div class="icon">
                                <i class="material-icons">security</i>
                            </div>
                            <div class="content">
                                <div class="text">Roles</div>
                                <div class="number count-to" data-from="0" data-to="<%=request.getAttribute("roleCount")%>" data-speed="5" data-fresh-interval="20"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="info-box bg-light-green hover-expand-effect">
                            <div class="icon">
                                <i class="material-icons">check_box</i>
                            </div>
                            <div class="content">
                                <div class="text">Tasks</div>
                                <div class="number count-to" data-from="0" data-to="<%=request.getAttribute("taskCount")%>" data-speed="5" data-fresh-interval="20"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #END# Widgets -->

                <div class="row clearfix">
                    <!-- Task Info -->
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="card">
                            <div class="header">
                                <h2>TASK DETAILS</h2>
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
    
    <%@include file="common/footer.jsp" %>