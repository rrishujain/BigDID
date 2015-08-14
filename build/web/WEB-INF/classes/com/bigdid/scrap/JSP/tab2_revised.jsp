
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
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
                Customer_Feedback_Amazon();
                Customer_Feedback_Ebay();
                Customer_Feedback_Walmart();
                Competitor_Prices_Chart();
                Promotional_Offers();

                //$("#chartdiv1,#chartdiv2").hide();
                if (($("#chart4").val() == "five") && ($("#chart3").val() == "five")) {
                    //alert("1");
                    $("#chartdiv3").hide();
                    $("#chartdiv4").hide();
                    $("#chartdiv5").hide();
                    $("#chartdiv6").hide();
                    $("#chartdiv7").hide();
                    $("#chartdiv2").show();
                    Customer_Sentiment_Date_DoubleLineChart();
                    //alert("11");

                }
                else if (($("#chart4").val() == "six") && ($("#chart3").val() == "five")) {
                    //     alert("2");
                    $("#chartdiv2").hide();
                    $("#chartdiv4").hide();
                    $("#chartdiv5").hide();
                    $("#chartdiv6").hide();
                    $("#chartdiv7").hide();
                    $("#chartdiv3").show();
                    Customer_Sentiment_Week_DoubleLineChart();

                    //      alert("22");

                }

                else if (($("#chart4").val() == "seven") && ($("#chart3").val() == "five")) {
                    //alert("1");
                    $("#chartdiv2").hide();
                    $("#chartdiv3").hide();
                    $("#chartdiv5").hide();
                    $("#chartdiv6").hide();
                    $("#chartdiv7").hide();
                    $("#chartdiv4").show();
                    Customer_Sentiment_Month_DoubleLineChart();
                    //alert("11");

                }

                $("#chart4").change(function () {
                    if (($(this).val() == "five") && ($("#chart3").val() == "five")) {
                        //      alert("1");
                        $("#chartdiv3").hide();
                        $("#chartdiv4").hide();
                        $("#chartdiv5").hide();
                        $("#chartdiv6").hide();
                        $("#chartdiv7").hide();
                        $("#chartdiv2").show();
                        Customer_Sentiment_Date_DoubleLineChart();
                        //       alert("11");

                    }
                    else if (($(this).val() == "six") && ($("#chart3").val() == "five")) {
                        //      alert("2");
                        $("#chartdiv2").hide();
                        $("#chartdiv4").hide();
                        $("#chartdiv5").hide();
                        $("#chartdiv6").hide();
                        $("#chartdiv7").hide();
                        $("#chartdiv3").show();
                        Customer_Sentiment_Week_DoubleLineChart();

                        //      alert("22");

                    }
                    else if (($(this).val() == "seven") && ($("#chart3").val() == "five")) {
                        //      alert("2");
                        $("#chartdiv2").hide();
                        $("#chartdiv3").hide();
                        $("#chartdiv5").hide();
                        $("#chartdiv6").hide();
                        $("#chartdiv7").hide();
                        $("#chartdiv4").show();
                        Customer_Sentiment_Month_DoubleLineChart();

                        //      alert("22");

                    }
                    else if (($(this).val() == "five") && ($("#chart3").val() == "six")) {
                        //      alert("1");
                        $("#chartdiv3").hide();
                        $("#chartdiv4").hide();
                        $("#chartdiv2").hide();
                        $("#chartdiv6").hide();
                        $("#chartdiv7").hide();
                        $("#chartdiv5").show();
                        Customer_Feedback_Date_DoubleLineChart();
                        //       alert("11");

                    }
                    else if (($(this).val() == "six") && ($("#chart3").val() == "six")) {
                        //      alert("2");
                        $("#chartdiv2").hide();
                        $("#chartdiv4").hide();
                        $("#chartdiv5").hide();
                        $("#chartdiv3").hide();
                        $("#chartdiv7").hide();
                        $("#chartdiv6").show();
                        Customer_Feedback_Week_DoubleLineChart();

                        //      alert("22");

                    }
                    else if (($(this).val() == "seven") && ($("#chart3").val() == "six")) {
                        //      alert("2");
                        $("#chartdiv2").hide();
                        $("#chartdiv3").hide();
                        $("#chartdiv5").hide();
                        $("#chartdiv6").hide();
                        $("#chartdiv4").hide();
                        $("#chartdiv7").show();
                        Customer_Feedback_Month_DoubleLineChart();

                        //      alert("22");

                    }

                });

                $("#chart3").change(function () {
                    if (($(this).val() == "five") && ($("#chart4").val() == "five")) {
                        //      alert("1");
                        $("#chartdiv3").hide();
                        $("#chartdiv4").hide();
                        $("#chartdiv5").hide();
                        $("#chartdiv6").hide();
                        $("#chartdiv7").hide();
                        $("#chartdiv2").hide();
                        $("#chartdiv5").show();
                        Customer_Feedback_Date_DoubleLineChart();
                        //       alert("11");

                    }
                    if (($(this).val() == "five") && ($("#chart4").val() == "six")) {
                        //      alert("2");
                        $("#chartdiv2").hide();
                        $("#chartdiv4").hide();
                        $("#chartdiv5").hide();
                        $("#chartdiv6").hide();
                        $("#chartdiv7").hide();
                        $("#chartdiv3").show();
                        Customer_Sentiment_Week_DoubleLineChart();

                        //      alert("22");

                    }
                    if (($(this).val() == "five") && ($("#chart4").val() == "seven")) {
                        //      alert("2");
                        $("#chartdiv2").hide();
                        $("#chartdiv3").hide();
                        $("#chartdiv5").hide();
                        $("#chartdiv6").hide();
                        $("#chartdiv7").hide();
                        $("#chartdiv4").show();
                        Customer_Sentiment_Month_DoubleLineChart();

                        //      alert("22");

                    }

                    if (($(this).val() == "six") && ($("#chart4").val() == "five")) {
                        //      alert("2");
                        $("#chartdiv2").hide();
                        $("#chartdiv3").hide();
                        $("#chartdiv4").hide();
                        $("#chartdiv6").hide();
                        $("#chartdiv7").hide();
                        $("#chartdiv5").show();
                        Customer_Feedback_Date_DoubleLineChart();

                        //      alert("22");

                    }
                    if (($(this).val() == "six") && ($("#chart4").val() == "six")) {
                        //      alert("2");
                        $("#chartdiv2").hide();
                        $("#chartdiv3").hide();
                        $("#chartdiv5").hide();
                        $("#chartdiv4").hide();
                        $("#chartdiv7").hide();
                        $("#chartdiv6").show();
                        Customer_Feedback_Week_DoubleLineChart();

                        //      alert("22");

                    }
                    if (($(this).val() == "six") && ($("#chart4").val() == "seven")) {
                        //      alert("2");
                        $("#chartdiv2").hide();
                        $("#chartdiv3").hide();
                        $("#chartdiv5").hide();
                        $("#chartdiv6").hide();
                        $("#chartdiv4").hide();
                        $("#chartdiv7").show();
                        Customer_Feedback_Month_DoubleLineChart();

                        //      alert("22");

                    }




                });

            });
        </script>

    </head>
    <body>
        <h1 class="logo">
    Keep<br/>
    Calm<br/>
    and<br/>
    Stack<br/>
    Overflow
</h1>
    <center><img src="../Images/Logo.png"
                 style="width:20%; height:17%;"     
                 ></center>
    <!--        <div>Tab 1- Internal Analysis</div>-->
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


    <div id="chartdiv_amazon" 
         style="background-color:#FFFFFF;
         width:32%; 
         height:40%;
         margin-top: 3%;
         margin-bottom: 1%;
         border:1%;
         border: solid #a1a1a1;
         margin-left: 0;
         margin-right: 0;
         float:left;"><%@include file="Customer_Feedback_Amazon.jsp" %></div>

    <div id="chartdiv_ebay" 
         style="background-color:#FFFFFF;
         width:32%; 
         height:40%;
         margin-top: 3%;
         margin-bottom: 1%;
         border:1%;
         border: solid #a1a1a1;
         margin-left: 1%;
         margin-right: 1%;
         float: left;"><%@include file="Customer_Feedback_Ebay.jsp" %></div>

    <div id="chartdiv_walmart" 
         style="background-color:#FFFFFF;
         width:32%; 
         height:40%;
         margin-top: 3%;
         margin-bottom: 1%;
         border:1%;
         border: solid #a1a1a1;
         margin-left: 0;
         margin-right: 0;
         float:left;"><%@include file="Customer_Feedback_Walmart.jsp" %></div>


    <div id="chartdiv1" 
         style="background-color:#FFFFFF;
         width:46%; 
         height:70%;
         margin-bottom: 2%;
         border:1%;
         border: solid #a1a1a1;
         float:left;"><%@include file="Competitor_Prices_Chart.jsp" %></div>


    <div style="background-color:#FFFFFF;
         width:52%; 
         height:70%;
         margin-bottom: 2%;
         border:1%;
         border: solid #a1a1a1;
         float:right;">

        <table><tr><td>
                    <div style="background-color:#FFFFFF;">

                        <form>
                            <!--            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  -->
                            Social Media Sentiment By:
                            <select name="chart3" size="1"
                                    id="chart3"
                                    target="_parent._top"
                                    onmouseclick="this.focus()"
                                    style="background-color:#ffffff">

                                <option value>Choose Chart</option>
                                <option value="five" selected="selected">Order</option>
                                <option value="six">Feedback</option>

                            </select>
                        </form>
                    </div>
                </td><td>
                    <div       style="background-color:#FFFFFF;


                               "><form>
                            <!--            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  -->
                            Display Data:
                            <select name="chart4" size="1"
                                    id="chart4"
                                    target="_parent._top"
                                    onmouseclick="this.focus()"
                                    style="background-color:#ffffff; ">

                                <option value>Choose Chart</option>
                                <option value="five" selected="selected">Date wise</option>
                                <option value="six">Week wise</option>
                                <option value="seven">Month wise</option>
                            </select>
                        </form>
                    </div>

                </td></tr></table>
 <div id="chartdiv2"
             style="background-color:#FFFFFF;
             width:90%; 
             height:90%;
             margin-bottom: 2%;
             float:right;
             ">
            <%@include file="Sentiment_Date_Revised_one_Chart.jsp" %>        
        </div>
        
        <div id="chartdiv3"
             style="background-color:#FFFFFF;
             width:90%; 
             height:90%;
             margin-bottom: 2%;
             float:right;
             ">
            <%@include file="Sentiment_Week_Revised_one_Chart.jsp" %>
        </div>
        <div id="chartdiv4"
             style="background-color:#FFFFFF;
             width:90%; 
             height:90%;
             margin-bottom: 2%;
             float:right;
             ">
            <%@include file="Sentiment_Month_Revised_one_Chart.jsp" %>        
        </div>
    </div>
         <div id="chartdiv_Promotion_Offers" 
         style="background-color:#FFFFFF;
         width:46%; 
         height:70%;
         margin-bottom: 2%;
         border:1%;
         border: solid #a1a1a1;
         float:left;"><%@include file="Promotional_Offers_Chart.jsp" %></div>
</body>
</html>