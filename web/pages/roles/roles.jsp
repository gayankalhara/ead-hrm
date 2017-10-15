<%@page import="java.util.List"%>
<%@page import="app.models.Role"%>
<%@page import="java.util.Iterator"%>
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
        <li><a href="#">Roles</a></li>
    </ul>
    <%     if (session.getAttribute("RC") != null) {
            
    %>
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <strong>Completed!</strong> <%=session.getAttribute("RC")%>
    </div>
    <%session.setAttribute("RC", null);  }
    %>
    
    <div>
        <a href="createRole" class="btn btn-large btn-primary">Create New</a>
    </div>
    <br>
    <div class="row-fluid sortable">		
        <div class="box span12">
            <div class="box-header" data-original-title>
                <h2><i class="halflings-icon white user"></i><span class="break"></span>Roles</h2>
                <div class="box-icon">
                    <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>         
                </div>
            </div>
            <div class="box-content">
                <table class="table table-striped table-bordered bootstrap-datatable datatable">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Title</th>
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

                                <a class="btn btn-info" href="editRole?id=<%=id%>">
                                    <i class="halflings-icon white edit"></i>  
                                </a>
                               
                            </td>
                        </tr>


                        <%}%>

                    </tbody>
                </table>            
            </div>
        </div><!--/span-->

    </div><!--/row-->


</div>

<%@include  file="../common/footer.html" %>
