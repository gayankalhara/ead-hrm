<%@page import="java.util.List"%>
<%@page import="app.models.Employee"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>

<section class="content">
    <div class="container-fluid">
        <div class="row clearfix">
                    <!-- Task Info -->
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="card">
                            <div class="header">
                                <h2>Create New Task</h2>
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
                                <form action="createTask" method="post">
                                    <fieldset>
                                        <div class="form-group">
                                            <label class="form-label" for="selectError">Priority</label>
                                            <div class="controls">
                                                <select id="pro" name="pro" required>
                                                    <option value="" selected disabled>Select Priority...</option>
                                                    <option value="Low">Low</option>
                                                    <option value="Medium">Medium</option>
                                                    <option value="High">High</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <textarea id="description" name="description" rows="4" class="form-control no-resize"></textarea>
                                                <label class="form-label" for="name">Description</label>
                                            </div>
                                        </div>
                                                
                                        <%Iterator itr;%>
                                        <% List data = (List<Employee>) request.getAttribute("list");
                                        %>
                                        <div class="form-group">
                                            <label class="form-label" for="selectError">Assignee</label>
                                            <div class="controls">
                                                <select class="form-control" id="emp" name="emp" data-rel="chosen" >
                                                    <option value="0" selected> None </option>
                                                    <%
                                                        for (itr = data.iterator(); itr.hasNext();) {
                                                            Employee emp = (Employee) itr.next();
                                                            long id = emp.getId();
                                                            String name = emp.getName();
                                                    %>
                                                    <option  value="<%=id%>"><%=name%></option>
                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-primary">Save</button>
                                            <a  href="employees" class="btn">Cancel</a>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- #END# Task Info -->
                </div>
    </div>
</section>
                                               
<%@include  file="../common/footer.jsp" %>

<!-- Select Plugin Js -->
<script src="./assets/plugins/bootstrap-select/js/bootstrap-select.js"></script>