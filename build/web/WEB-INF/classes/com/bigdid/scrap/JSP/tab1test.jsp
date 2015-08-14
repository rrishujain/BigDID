
<%@page import="com.mongodb.DB"%>
<%@page import="com.bigdid.model.*"%>
<%@page import="com.bigdid.controller.*"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>

<html>
    <head>
        

        <title >Cignex Datamatics</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="../js/amcharts.js"></script>
        <script type="text/javascript" src="../js/pie.js"></script>      
        <script src="../js/serial.js" type="text/javascript"></script>
        <script type="text/javascript" src="http://www.amcharts.com/lib/3/themes/none.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

         
       
        <script type="text/javascript">
        
            $(document).ready(function () {
                //$("#chartdiv1,#chartdiv2").hide();
                if ($("#chart1").val() == "one") {
                    //alert("1");
                    $("#chartdiv2").hide();
                    $("#chartdiv1").show();
                    
                    Revenue_Location_Chart();
                    //alert("11");

                }
                if ($("#chart1").val() == "two") {
                    //     alert("2");
                    $("#chartdiv1").hide();
                    $("#chartdiv2").show();
                   
                    Revenue_Item();
                    //      alert("22");

                }

                $("#chart1").change(function () {
                    if ($(this).val() == "one") {
                        //      alert("1");
                        $("#chartdiv2").hide();
                        $("#chartdiv1").show();
                       Revenue_Location_Chart();
                        //       alert("11");

                    }
                    if ($(this).val() == "two") {
                        //      alert("2");
                        $("#chartdiv1").hide();
                        $("#chartdiv2").show();
                        Revenue_Item();

                        //      alert("22");

                    }
                });

                if ($("#chart2").val() == "three") {
                    //     alert("3");
                    $("#chartdiv4").hide();
                    $("#chartdiv3").show();
                    Customer_Feedback_Chart();
                    //     alert("33");

                }
                if ($("#chart2").val() == "four") {
                    //         alert("4");
                    $("#chartdiv3").hide();
                    $("#chartdiv4").show();
                    Customer_Return_Percentage_Chart();

                    //        alert("44");

                }

                $("#chart2").change(function () {
                    if ($(this).val() == "three") {
                        //      alert("1");
                        $("#chartdiv4").hide();
                        $("#chartdiv3").show();
                         Customer_Feedback_Chart();
                        //       alert("33");

                    }
                    if ($(this).val() == "four") {
                        //       alert("44");
                        $("#chartdiv3").hide();
                        $("#chartdiv4").show();
                        Customer_Return_Percentage_Chart();

                        //       alert("44");

                    }
                });

            });
        </script>

    </head>
    <body>
<%counters c1=new counters();%>
<div id="logo">
                <img src="../Images/Logo.png" style="width:20%; height:17%; margin-left:40%">
                </div>

                <div>
                <form action="../logout1" method="GET">
                <input type="submit" class="styled-button-1"
                       onclick="index.jsp"
                       value="Logout"
                       style="margin-left: 90%;
                       background: #f90;
                        color: #fff;
                        box-shadow: 0 6px #dd8500;
                        -webkit-transition: none;
                        -moz-transition: none;
                        transition: none;
                        border-radius: 50%;
                        width: 80px;
                        height: 60px;
                        padding: 0;        
                        "/>
                </form>   
               
                </form>   
                </div>        
<!--    <center><img src="../Images/Logo.png"
                 style="width:20%; height:17%;"     
                 ></center>
            <div>Tab 1- Internal Analysis</div>-->
    <table>
        <tr>
            <td>   
                <a href="tab1.jsp"><input type="image" src="../Images/Tab1.png"
                                          width="220" height="50"  onmousedown="this.src = '../Images/Tab1Pressed.png'"
                                          onmouseup="this.src = '../Images/Tab1.png'" name="Tab1"> </a>
            </td>

            <td>   
                <a href="tab2.jsp"><input type="image" src="../Images/Tab2.png"
                                          width="220" height="50" onClick="tab2.jsp" onMouseDown="this.src = '../Images/Tab2Pressed.png'"
                                          onmouseup="this.src = '../Images/Tab2.png'" name="Tab2"> </a>
            </td>
        </tr>
    </table>
<center>
<TABLE BORDER="0" cellpadding="0" CELLSPACING="0">
<TR>

<TD  width="140" height="80" background="../Images/NewFeedbacks.png" VALIGN="bottom">

<FONT COLOR="white"><b><center><%=c1.getFeedbackCount()%></b></center></FONT></TD><td>        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>  
<TD  width="140" height="80" background="../Images/NewOrders.png" VALIGN="bottom">

<FONT COLOR="white"><b><center><%=c1.getOrderCount()%></b></center></FONT></TD><td>    &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  </td>  
<TD  width="150" height="80" background="../Images/SocialImpressions.png" VALIGN="bottom">

<FONT COLOR="white"><b><center><%=c1.getSocialImpressionsCount()%></b></center></FONT></TD><td>      &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   </td> 
<TD  width="140" height="80" background="../Images/TotalRevenue.png" VALIGN="bottom">

<FONT COLOR="white"><b><center><%=c1.getRevenueTotal()%></b></center></FONT></TD><td>      &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  </td>  

</TR>
</TABLE>
</center>


<!--
    <form>
        <br></br>

         Buttons <center>
            <table>
                <tr>    
                    <td>    

                        <table>
                            <tr>
                                <td WIDTH="221" HEIGHT="300" BACKGROUND="../Images/Tab1.png" VALIGN="bottom" width="175" height="80" onMouseDown="this.src = '../Images/NewFeedbacksPressed.png'"
                               onmouseup="this.src = '../NewFeedbacks.png'" name="NewFeedbacks">
                                    <FONT SIZE="+1" COLOR="yellow">Joe Burns at Work</FONT>
                        &nbsp; &nbsp; &nbsp; 
                        <input type="image" src="../Images/NewFeedbacks.png"
                               width="175" height="80" onMouseDown="this.src = '../Images/NewFeedbacksPressed.png'"
                               onmouseup="this.src = '../NewFeedbacks.png'" name="NewFeedbacks"> 
                        </td>
                        </tr>
                        </table>
                    </td>
                    <td> 
                        &nbsp; &nbsp; &nbsp; 
                        <input type="image" src="../Images/NewOrders.png"
                               width="175" height="80" onMouseDown="this.src = '../Images/NewOrdersPressed.png'"
                               onmouseup="this.src = '../NewOrders.png'" name="NewOrders"> 
                    </td> 
                    <td> &nbsp; &nbsp; &nbsp; 
                        <input type="image" src="../Images/SocialImpressions.png"
                               width="175" height="80" onMouseDown="this.src = '../Images/SocialImpressionsPressed.png'"
                               onmouseup="this.src = '../Images/SocialImpressions.png'" name="SocialImpressions"> 
                    </td> 
                    <td> 
                        &nbsp; &nbsp; &nbsp; 
                        <input type="image" src="../Images/TotalRevenue.png"
                               width="175" height="80" onMouseDown="this.src = '../Images/TotalRevenuePressed.png'"
                               onmouseup="this.src = '../Images/TotalRevenue.png'" name="TotalRevenue"> 
                    
                </tr><tr><td><center><font color="red"><b><%=c1.getFeedbackCount()%></center></td></font><td><center><font color="blue"><b><%=c1.getOrderCount()%></center></td></font><td><center><font color="orange"><b><%=c1.getSocialImpressionsCount()%></center></td></font><td><center><font color="purple"><b><%=c1.getRevenueTotal()%></center></td></font>
                    </tr>
            </table>
        </center>
    </form>    
    
            
            -->
  

</body>
</html>