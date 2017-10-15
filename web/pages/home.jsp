<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<jsp:include page="common/headerWithMenu.jsp" />--%>
<%@include file="common/headerWithMenu.jsp" %>

<div id="content" class="span12">


    <ul class="breadcrumb">
        <li>
            <i class="icon-home"></i>
            <a href="index.html">Home</a> 
            <i class="icon-angle-right"></i>
        </li>
        <li><a href="#">Dashboard</a></li>
    </ul>

    <div class="row-fluid">

        <div class="span4 statbox purple" onTablet="span12" onDesktop="span4">
     
            <div class="number"><%=request.getAttribute("empCount")%><i class="icon-arrow-up"></i></div>
            <div class="title">count</div>
            <div class="footer">
                <a href="#"> Employees</a>
            </div>	
        </div>
        <div class="span4 statbox green" onTablet="span12" onDesktop="span4">
            <div class="number"><%=request.getAttribute("roleCount")%><i class="icon-arrow-up"></i></div>
            <div class="title">count</div>
            <div class="footer">
                <a href="#"> Roles</a>
            </div>
        </div>
        <div class="span4 statbox blue noMargin" onTablet="span12" onDesktop="span4">
            <div class="number"><%=request.getAttribute("taskCount")%><i class="icon-arrow-up"></i></div>
            <div class="title">count</div>
            <div class="footer">
                <a href="#"> Tasks</a>
            </div>
        </div>
 	

    </div>		

  


    <div class="row-fluid">

        <div class="widget blue span12" onTablet="span12" onDesktop="span12">

            <h2><span class="glyphicons globe"><i></i></span> Demographics - Tasks</h2>

            <hr>

            <div class="content">

                <div class="verticalChart">

                    <div class="singleBar">

                        <div class="bar">

                            <div class="value">
                                <span><%=request.getAttribute("lCount")%>%</span>
                            </div>

                        </div>

                        <div class="title">Low</div>

                    </div>

                    <div class="singleBar">

                        <div class="bar">

                            <div class="value">
                                <span><%=request.getAttribute("mCount")%>%</span>
                            </div>

                        </div>

                        <div class="title">Medium</div>

                    </div>

                    <div class="singleBar">

                        <div class="bar">

                            <div class="value">
                                <span><%=request.getAttribute("hCount")%>%</span>
                            </div>

                        </div>

                        <div class="title">High</div>

                    </div>

                   	

                    <div class="clearfix"></div>

                </div>

            </div>

        </div><!--/span-->


    </div>
</div>



<%@include  file="common/footer.html" %>