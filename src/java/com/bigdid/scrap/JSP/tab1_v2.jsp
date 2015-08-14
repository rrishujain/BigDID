

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

         
        <% 
                 HttpSession sess = request.getSession(false);
                 System.out.println("SESSION"+ sess.getAttribute("username"));
                 if(sess.getAttribute("username")== null && sess.getAttribute("password")==null){
                     response.sendRedirect("../index.jsp");
                 }
        
        %>
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

    <form>
        <br></br>

        <!-- Buttons --><center>
            <table>
                <tr>    
                    <td>    

                        
                        &nbsp; &nbsp; &nbsp; 
                        <input type="image" src="../Images/NewFeedbacks.png"
                               width="175" height="80" onMouseDown="this.src = '../Images/NewFeedbacksPressed.png'"
                               onmouseup="this.src = '../NewFeedbacks.png'" name="NewFeedbacks"> 
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
                    </td> <%counters c1=new counters();%>
                </tr><tr><td><center><font color="red"><b><%=c1.getFeedbackCount()%></center></td></font><td><center><font color="blue"><b><%=c1.getOrderCount()%></center></td></font><td><center><font color="orange"><b><%=c1.getSocialImpressionsCount()%></center></td></font><td><center><font color="purple"><b><%=c1.getRevenueTotal()%></center></td></font>
                    </tr>
            </table>
        </center>
    </form>    
    
            
            
  

     <!-- Filter 1 and filter 1 charts-->
    <div style="background-color:#FFFFFF;
        width:42%;
        border:1%;
        margin-top: 1%;
        border: solid #a1a1a1;
        float:left;">     
       
        <br>
        <center>
        <form>
            Revenue Break-up: 
            <select name="chart1" size="1"
                    id="chart1"
                    target="_parent._top"
                    onmouseclick="this.focus()"
                    style="background-color:#ffffff">
                <option value>Choose Chart</option>
                <option value="one" selected="selected">Revenue Break-up by Location</option>
                <option value="two">Revenue Break-up by Item</option>
            </select>
        </form>   
        </center>    
                    
            <div id="chartdiv1" 
                  style="background-color:#FFFFFF;
                  width:100%; 
                  height:50%;
                  margin-top: 1%;
                  float:left;
                  "><%@ include file="Revenue_Location_Chart.jsp" %></div>  

             <div id="chartdiv2" 
                  style="background-color:#FFFFFF;
                  width:100%; 
                  height:50%;
                  margin-top: 1%;
                  float:left;
                  "><%@ include file="Revenue_Item_Chart.jsp" %></div>   
   
    </div>
                    
    <!-- Filter 2 and filter 3 charts -->               
    <div style="background-color:#FFFFFF;
        float:right;
        padding-right: 1%;
        width:55%;
        border:1%;
        margin-left: 1%;
        margin-top: 1%;
        border: solid #a1a1a1;
        float:left;">     
       
        <br>
        <center>
            
<!--        <div style="background-color:#FFFFFF;
         float:right;
         padding-right: 1%;
         /*padding-right: 10%;*/
         ">-->
        <form>             
            Feedback/Return Analysis:
            <select name="chart2" size="1"
                    id="chart2"
                    target="_parent._top"
                    onmouseclick="this.focus()"
                    style="background-color:#ffffff">

                <option value>Choose Chart</option>
                <option value="three" selected="selected">Feedback Analysis</option>
                <option value="four">Return Analysis</option>
            </select>
        </form>
        </center>
    
    <div id="chartdiv3" 
         style="background-color:#FFFFFF;
         width:100%; 
         height:50%; 
         margin-top: 1%;
         margin-right: 0;
/*         border:1%;
         border: solid #a1a1a1;*/
         float:right;"><%@ include file="Customer_Feedback_Chart.jsp" %></div>

    <div id="chartdiv4" 
         style="background-color:#FFFFFF;
         width:100%; 
         height:50%; 
         margin-top: 1%;
         margin-right: 0;
/*         border:1%;
         border: solid #a1a1a1;*/
         float:right;"><%@ include file="Customer_Return_Percentage_Chart.jsp" %></div>
         
    </div>     

    <div id="chartdiv6" 
         style="background-color:#FFFFFF;
         width:42%; 
         height:55%; 
         margin-top: 1%;
         margin-bottom: 2%;
         border:0;
         border: solid #a1a1a1;
         float:left;"><%@ include file="Average_Value_Chart.jsp" %></div>   

    <div id="chartdiv5" 
         style="background-color:#FFFFFF;
         width:56%; 
         height:55%; 
         margin-top: 1%;
         margin-right: 0;
         margin-bottom: 2%;
         border:1%;
         border: solid #a1a1a1;
         float:right;"><%@ include file="Feedback_Location_Chart.jsp" %></div>

</body>
</html>

