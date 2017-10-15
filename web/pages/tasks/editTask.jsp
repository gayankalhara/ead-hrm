<%@page import="app.models.Task"%>
<%@page import="java.util.List"%>
<%@page import="app.models.Employee"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../common/headerWithMenu.jsp" %>

<%    Task task = (Task) request.getAttribute("task");
%>

<div id="content" class="span10">

    <ul class="breadcrumb">
        <li>
            <i class="icon-home"></i>
            <a href="index.html">Home</a> 
            <i class="icon-angle-right"></i>
        </li>
        <li><a href="#">Edit Task</a></li>
    </ul>

    <div class="row-fluid sortable">
        <div class="box span12">
            <div class="box-header" data-original-title>
                <h2><i class="halflings-icon white edit"></i><span class="break"></span>Edit Task</h2>
                <div class="box-icon">
                    <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                </div>
            </div>
            <div class="box-content">
                <form class="form-horizontal" action="editTask" method="post">
                    <fieldset>


                        <div class="control-group">
                            <label class="control-label" for="selectError">Priority</label>
                            <div class="controls">
                                <select id="pro" name="pro" value="<%=task.getProirity()%>" required>
                                    <%
                                        if (task.getProirity().equalsIgnoreCase("Low")) {

                                    %>
                                    <option value="Low" selected>Low</option>
                                    <% } else {
                                    %>
                                    <option value="Low">Low</option>
                                    <%  }
                                    %>


                                    <%
                                        if (task.getProirity().equalsIgnoreCase("Medium")) {

                                    %>
                                    <option value="Medium" selected>Medium</option>
                                    <% } else {
                                    %>
                                    <option value="Medium">Medium</option>
                                    <%  }
                                    %>

                                    <%
                                        if (task.getProirity().equalsIgnoreCase("High")) {

                                    %>
                                    <option value="High" selected>High</option>
                                    <% } else {
                                    %>
                                    <option value="High">High</option>
                                    <%  }
                                    %>


                                </select>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="typeahead">Description</label>
                            <div class="controls">
                                <textarea  id="description" name="description" minlength="10" maxlength="200" required><%=task.getDescription()%></textarea>
                            </div>
                        </div>

                        <%Iterator itr;%>
                        <% List data = (List<Employee>) request.getAttribute("list");
                        %>
                        <div class="control-group">
                            <label class="control-label" for="selectError">Assign to (Employee)</label>
                            <div class="controls">
                                <select  id="emp" name="emp" data-rel="chosen" >
                                    <option value="0" selected> None </option>
                                    <%
                                        for (itr = data.iterator(); itr.hasNext();) {
                                            Employee emp = (Employee) itr.next();
                                            long id = emp.getId();
                                            String name = emp.getName();
                                            if (task.getEmployee() != null) {
                                                if (task.getEmployee() != null && task.getEmployee().getId() == id) {
                                    %>
                                    <option  value="<%=id%>" selected><%=name%></option>
                                    <%
                                    } else {
                                    %>
                                    <option  value="<%=id%>"><%=name%></option>
                                    <%
                                        }

                                    } else {
                                    %>
                                    <option  value="<%=id%>"><%=name%></option>
                                    <%
                                            }
                                        }%>
                                </select>
                            </div>
                        </div>

                        <input type="hidden" name="id" value="<%=task.getId()%>">
                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <a  href="tasks" class="btn">Cancel</a>
                        </div>
                    </fieldset>
                </form>   

            </div>
        </div><!--/span-->

    </div><!--/row-->
</div>


<%@include  file="../common/footer.html" %>