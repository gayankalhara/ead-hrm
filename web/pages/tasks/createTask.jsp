<%@page import="app.models.Employee"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../common/headerWithMenu.jsp" %>
<div id="content" class="span10">

    <ul class="breadcrumb">
        <li>
            <i class="icon-home"></i>
            <a href="index.html">Home</a> 
            <i class="icon-angle-right"></i>
        </li>
        <li><a href="#">Create New Task</a></li>
    </ul>

    <div class="row-fluid sortable">
        <div class="box span12">
            <div class="box-header" data-original-title>
                <h2><i class="halflings-icon white edit"></i><span class="break"></span>Create New Task</h2>
                <div class="box-icon">
                    <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                </div>
            </div>
            <div class="box-content">
                <form class="form-horizontal" action="createTask" method="post">
                    <fieldset>


                        <div class="control-group">
                            <label class="control-label" for="selectError">Priority</label>
                            <div class="controls">
                                <select id="pro" name="pro"  required>
                                    <option value="" selected disabled> -- please select a priority -- </option>
                                    <option value="Low">Low</option>
                                    <option value="Medium">Medium</option>
                                    <option value="High">High</option>

                                </select>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="typeahead">Description</label>
                            <div class="controls">
                                <textarea  id="description" name="description" minlength="10" maxlength="200" required></textarea>
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
                                    %>
                                    <option  value="<%=id%>"><%=name%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>


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
