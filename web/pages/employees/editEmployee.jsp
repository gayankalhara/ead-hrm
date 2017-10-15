<%@page import="java.util.ArrayList"%>
<%@page import="app.models.Task"%>
<%@page import="app.models.Employee"%>
<%@page import="app.models.Role"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../common/headerWithMenu.jsp" %>
<%    Employee emp = (Employee) request.getAttribute("emp");
%>
<div id="content" class="span10">

    <ul class="breadcrumb">
        <li>
            <i class="icon-home"></i>
            <a href="index.html">Home</a> 
            <i class="icon-angle-right"></i>
        </li>
        <li><a href="#">Edit Employee</a></li>
    </ul>

    <div class="row-fluid sortable">
        <div class="box span12">
            <div class="box-header" data-original-title>
                <h2><i class="halflings-icon white edit"></i><span class="break"></span>Edit Employee</h2>
                <div class="box-icon">
                    <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                </div>
            </div>
            <div class="box-content">
                <form class="form-horizontal" action="editEmployee" method="post">
                    <fieldset>
                        <div class="control-group">
                            <label class="control-label" for="typeahead">Name </label>
                            <div class="controls">
                                <input type="text" class="span6 typeahead" value="<%=emp.getName()%>" id="name" name="name"  required>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="date01">Date of Birth</label>
                            <div class="controls">
                                <input type="text" class="input-xlarge datepicker" id="dob" name="dob" value="<%=emp.getDateOfBirth()%>" required>
                            </div>
                        </div>
                        <%Iterator itr;%>
                        <% List<Role> data = (List<Role>) request.getAttribute("list");
                        %>
                        <div class="control-group">
                            <label class="control-label" for="selectError">Role</label>
                            <div class="controls">
                                <select id="role" name="role" data-rel="chosen" required>
                                    <option value="" selected disabled> -- please select a role -- </option>
                                    <%
                                        for (itr = data.iterator(); itr.hasNext();) {
                                            Role role = (Role) itr.next();
                                            long id = role.getId();
                                            String titile = role.getTitle();

                                            if (emp.getRole().getId() == id) {
                                    %>
                                    <option value="<%=id%>" selected><%=titile%></option>
                                    <%
                                    } else {
                                    %>
                                    <option value="<%=id%>"><%=titile%></option>
                                    <%
                                        }
                                    %>

                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <input type="hidden" value="<%=emp.getId()%>" name="id">
                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <a  href="employees" class="btn">Cancel</a>
                        </div>
                    </fieldset>
                </form>   

            </div>
        </div><!--/span-->

    </div><!--/row-->
</div>



<%@include  file="../common/footer.html" %>