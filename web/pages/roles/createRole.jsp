<%@page import="app.models.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>

<section class="content">
    <div class="container-fluid">
        <div class="row clearfix">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="card">
                            <div class="header">
                                <h2>Add New Role</h2>
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
                                <form action="createRoleSubmit" method="post">
                                    <fieldset>
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" class="form-control" id="title" name="title"  required>
                                                <label class="form-label" for="title">Role Title</label>
                                            </div>
                                        </div>                                     

                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-primary">Save</button>
                                            <a  href="roles" class="btn">Cancel</a>
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