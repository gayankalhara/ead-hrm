<%@page import="java.util.List"%>
<%@page import="app.models.Role"%>
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
                                <h2>Add New Employee</h2>
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
                                <form action="createEmployeeSubmit" method="post">
                                    <fieldset>
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" class="form-control" id="name" name="name"  required>
                                                <label class="form-label" for="name">Name</label>
                                            </div>
                                        </div>
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" class="form-control datepicker" id="dob" name="dob" value="" placeholder="Date of Birth" required>
                                            </div>
                                        </div>
                                        <%Iterator itr;%>
                                        <% List<Role> data = (List<Role>) request.getAttribute("list");
                                        %>
                                        <div class="form-group">
                                            <label class="control-label" for="selectError">Role</label>
                                            <div class="controls">
                                                <select class="form-control" id="role" name="role" data-rel="chosen" required>
                                                    <option value="" selected disabled>Select a role from the list...</option>
                                                    <%
                                                        for (itr = data.iterator(); itr.hasNext();) {
                                                            Role role = (Role) itr.next();
                                                            long id = role.getId();
                                                            String titile = role.getTitle();
                                                    %>
                                                    <option value="<%=id%>"><%=titile%></option>
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

<!-- Moment Plugin Js -->
<script src="./assets/plugins/momentjs/moment.js"></script>

<!-- Bootstrap Material Datetime Picker Plugin Js -->
<script src="./assets/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>

<!-- Select Plugin Js -->
<script src="./assets/plugins/bootstrap-select/js/bootstrap-select.js"></script>

<script>
    
    $(function () {
        $('.datepicker').bootstrapMaterialDatePicker({
            format: 'DD/MM/YYYY',
            clearButton: true,
            weekStart: 1,
            time: false
        });
    });
</script>