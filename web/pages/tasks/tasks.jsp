<%@page import="app.models.Task"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../common/headerWithMenu.jsp" %>
<!-- start: Content -->

<div id="content" class="span10">


    <ul class="breadcrumb">
        <li>
            <i class="icon-home"></i>
            <a href="index.html">Home</a> 
            <i class="icon-angle-right"></i>
        </li>
        <li><a href="#">Tasks</a></li>
    </ul>
    <%     if (session.getAttribute("TC") != null) {
            
    %>
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <strong>Completed!</strong> <%=session.getAttribute("TC")%>
    </div>
    <%session.setAttribute("TC", null);  }
    %>
    
    <div>
        <a href="createTask" class="btn btn-large btn-primary">Create New</a>
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
                            <th>Description</th>
                            <th>Employee Name</th>
                            <th>Priority</th>
                            <th>Actions</th>
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
                                
                                String pro = task.getProirity();
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
                                <span class="label label-success"><%=pro%></span>
                                <%}%>
                                 <% if(pro.equals("Medium")){%>
                                <span class="label label-warning"><%=pro%></span>
                                <%}%>
                                 <% if(pro.equals("High")){%>
                                <span class="label label-important"><%=pro%></span>
                                <%}%>
                            </td>
                            <td class="center">

                                <a class="btn btn-info" href="editTask?id=<%=id%>">
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




















<!--<div id="content" class="span10">


    <ul class="breadcrumb">
        <li>
            <i class="icon-home"></i>
            <a href="index.html">Home</a> 
            <i class="icon-angle-right"></i>
        </li>
        <li><a href="#">Tasks</a></li>
    </ul>

    <div>
        <a class="btn btn-large btn-primary">Create New</a>
    </div>
    <br>

    <div class="row-fluid">

        <div class="span12">
            <h1>Tasks</h1>

            <div class="priority high"><span>high priority</span></div>

            <div class="task high">
                <div class="desc">
                    <div class="title">Lorem Ipsum</div>
                    <div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
                </div>
                <div class="time">
                    <div class="date">Jun 1, 2012</div>
                    <div> 1 day</div>
                </div>
            </div>
            <div class="task high">
                <div class="desc">
                    <div class="title">Lorem Ipsum</div>
                    <div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
                </div>
                <div class="time">
                    <div class="date">Jun 1, 2012</div>
                    <div>1 day</div>
                </div>
            </div>
            <div class="task high">
                <div class="desc">
                    <div class="title">Lorem Ipsum</div>
                    <div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
                </div>
                <div class="time">
                    <div class="date">Jun 1, 2012</div>
                    <div> 1 day</div>
                </div>
            </div>
            <div class="task high last">
                <div class="desc">
                    <div class="title">Lorem Ipsum</div>
                    <div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
                </div>
                <div class="time">
                    <div class="date">Jun 1, 2012</div>
                    <div>1 day</div>
                </div>
            </div>

            <div class="priority medium"><span>medium priority</span></div>

            <div class="task medium">
                <div class="desc">
                    <div class="title">Lorem Ipsum</div>
                    <div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
                </div>
                <div class="time">
                    <div class="date">Jun 1, 2012</div>
                    <div> 1 day</div>
                </div>
            </div>
            <div class="task medium last">
                <div class="desc">
                    <div class="title">Lorem Ipsum</div>
                    <div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
                </div>
                <div class="time">
                    <div class="date">Jun 1, 2012</div>
                    <div> 1 day</div>
                </div>
            </div>

            <div class="priority low"><span>low priority</span></div>

            <div class="task low">
                <div class="desc">
                    <div class="title">Lorem Ipsum</div>
                    <div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
                </div>
                <div class="time">
                    <div class="date">Jun 1, 2012</div>
                    <div> 1 day</div>
                </div>
            </div>
            <div class="task low">
                <div class="desc">
                    <div class="title">Lorem Ipsum</div>
                    <div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
                </div>
                <div class="time">
                    <div class="date">Jun 1, 2012</div>
                    <div> 1 day</div>
                </div>
            </div>
            <div class="task low">
                <div class="desc">
                    <div class="title">Lorem Ipsum</div>
                    <div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
                </div>
                <div class="time">
                    <div class="date">Jun 1, 2012</div>
                    <div> 1 day</div>
                </div>
            </div>
            <div class="task low">
                <div class="desc">
                    <div class="title">Lorem Ipsum</div>
                    <div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
                </div>
                <div class="time">
                    <div class="date">Jun 1, 2012</div>
                    <div> 1 day</div>
                </div>
            </div>
            <div class="task low">
                <div class="desc">
                    <div class="title">Lorem Ipsum</div>
                    <div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
                </div>
                <div class="time">
                    <div class="date">Jun 1, 2012</div>
                    <div> 1 day</div>
                </div>
            </div>
            <div class="task low">
                <div class="desc">
                    <div class="title">Lorem Ipsum</div>
                    <div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
                </div>
                <div class="time">
                    <div class="date">Jun 1, 2012</div>
                    <div> 1 day</div>
                </div>
            </div>
            <div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-content">
                    <ul class="list-inline item-details">
                        <li><a href="http://themifycloud.com">Admin templates</a></li>
                        <li><a href="http://themescloud.org">Bootstrap themes</a></li>
                    </ul>
                </div>
            </div>
            <div class="clearfix"></div>		

        </div>

                <div class="span5 noMarginLeft">
        
                    <div class="dark">
        
                        <h1>Timeline</h1>
        
                        <div class="timeline">
        
                            <div class="timeslot">
        
                                <div class="task">
                                    <span>
                                        <span class="type">appointment</span>
                                        <span class="details">
                                            Dennis Ji at Bootstrap Metro Dashboard HQ
                                        </span>
                                        <span>
                                            remaining time
                                            <span class="remaining">
                                                3h 38m 15s
                                            </span>	
                                        </span> 
                                    </span>
                                    <div class="arrow"></div>
                                </div>							
                                <div class="icon">
                                    <i class="icon-map-marker"></i>
                                </div>
                                <div class="time">
                                    3:43 PM
                                </div>	
        
                            </div>
        
                            <div class="clearfix"></div>
        
                            <div class="timeslot alt">
        
                                <div class="task">
                                    <span>
                                        <span class="type">phone call</span>
                                        <span class="details">
                                            Dennis Ji
                                        </span>
                                        <span>
                                            remaining time
                                            <span class="remaining">
                                                3h 38m 15s
                                            </span>	
                                        </span>
                                    </span>
                                    <div class="arrow"></div>
                                </div>
                                <div class="icon">
                                    <i class="icon-phone"></i>
                                </div>
                                <div class="time">
                                    3:43 PM
                                </div>	
        
                            </div>
        
                            <div class="timeslot">
        
                                <div class="task">
                                    <span>
                                        <span class="type">mail</span>
                                        <span class="details">
                                            Dennis Ji
                                        </span>
                                        <span>
                                            remaining time
                                            <span class="remaining">
                                                3h 38m 15s
                                            </span>	
                                        </span> 
                                    </span>
                                    <div class="arrow"></div>
                                </div>
                                <div class="icon">
                                    <i class="icon-envelope"></i>
                                </div>
                                <div class="time">
                                    3:43 PM
                                </div>	
        
                            </div>
        
                            <div class="timeslot alt">
        
                                <div class="task">
                                    <span>
                                        <span class="type">deadline</span>
                                        <span class="details">
                                            Fixed bugs
                                        </span>
                                        <span>
                                            remaining time
                                            <span class="remaining">
                                                3h 38m 15s
                                            </span>	
                                        </span> 
                                    </span>
                                    <div class="arrow"></div>
                                </div>
                                <div class="icon">
                                    <i class="icon-calendar"></i>
                                </div>
                                <div class="time">
                                    3:43 PM
                                </div>	
        
                            </div>
        
                            <div class="timeslot">
        
                                <div class="task">
                                    <span>
                                        <span class="type">appointment</span>
                                        <span class="details">
                                            Dennis Ji at Bootstrap Metro Dashboard HQ
                                        </span>
                                        <span>
                                            remaining time
                                            <span class="remaining">
                                                3h 38m 15s
                                            </span>	
                                        </span> 
                                    </span>
                                    <div class="arrow"></div>
                                </div>							
                                <div class="icon">
                                    <i class="icon-map-marker"></i>
                                </div>
                                <div class="time">
                                    3:43 PM
                                </div>	
        
                            </div>
        
                            <div class="clearfix"></div>
        
                            <div class="timeslot alt">
        
                                <div class="task">
                                    <span>
                                        <span class="type">skype call</span>
                                        <span class="details">
                                            Dennis Ji
                                        </span>
                                        <span>
                                            remaining time
                                            <span class="remaining">
                                                3h 38m 15s
                                            </span>	
                                        </span>
                                    </span>
                                    <div class="arrow"></div>
                                </div>
                                <div class="icon">
                                    <i class="icon-phone"></i>
                                </div>
                                <div class="time">
                                    3:43 PM
                                </div>	
        
                            </div>
        
                            <div class="timeslot">
        
                                <div class="task">
                                    <span>
                                        <span class="type">mail</span>
                                        <span class="details">
                                            Dennis Ji
                                        </span>
                                        <span>
                                            remaining time
                                            <span class="remaining">
                                                3h 38m 15s
                                            </span>	
                                        </span> 
                                    </span>
                                    <div class="arrow"></div>
                                </div>
                                <div class="icon">
                                    <i class="icon-envelope"></i>
                                </div>
                                <div class="time">
                                    3:43 PM
                                </div>	
        
                            </div>
        
                            <div class="timeslot alt">
        
                                <div class="task">
                                    <span>
                                        <span class="type">project deadline</span>
                                        <span class="details">
                                            Fixed bugs
                                        </span>
                                        <span>
                                            remaining time
                                            <span class="remaining">
                                                3h 38m 15s
                                            </span>	
                                        </span> 
                                    </span>
                                    <div class="arrow"></div>
                                </div>
                                <div class="icon">
                                    <i class="icon-calendar"></i>
                                </div>
                                <div class="time">
                                    3:43 PM
                                </div>	
        
                            </div>
        
                            <div class="timeslot">
        
                                <div class="task">
                                    <span>
                                        <span class="type">mail</span>
                                        <span class="details">
                                            Dennis Ji
                                        </span>
                                        <span>
                                            remaining time
                                            <span class="remaining">
                                                3h 38m 15s
                                            </span>	
                                        </span> 
                                    </span>
                                    <div class="arrow"></div>
                                </div>
                                <div class="icon">
                                    <i class="icon-envelope"></i>
                                </div>
                                <div class="time">
                                    3:43 PM
                                </div>	
        
                            </div>
        
                        </div>
                    </div>
        
                </div>	

    </div>-->

    <%@include  file="../common/footer.html" %>