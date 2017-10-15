<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../common/headerWithMenu.jsp" %>
<div id="content" class="span10">

    <ul class="breadcrumb">
        <li>
            <i class="icon-home"></i>
            <a href="index.html">Home</a> 
            <i class="icon-angle-right"></i>
        </li>
        <li><a href="#">Create New Role</a></li>
    </ul>

    <div class="row-fluid sortable">
        <div class="box span12">
            <div class="box-header" data-original-title>
                <h2><i class="halflings-icon white edit"></i><span class="break"></span>Create New Role</h2>
                <div class="box-icon">
                    <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                </div>
            </div>
            <div class="box-content">
                <form class="form-horizontal" action="createRoleSubmit" method="post">
                    <fieldset>
                        <div class="control-group">
                            <label class="control-label" for="typeahead">Role Title </label>
                            <div class="controls">
                                <input type="text" class="span6 typeahead" id="title" name="title"  required>
                            </div>
                        </div>
                        
                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <a  href="roles" class="btn">Cancel</a>
                        </div>
                    </fieldset>
                </form>   

            </div>
        </div><!--/span-->

    </div><!--/row-->
</div>

<%@include  file="../common/footer.html" %>