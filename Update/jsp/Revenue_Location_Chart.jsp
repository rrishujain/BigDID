<%-- 
    Document   : barChartItem
    Created on : 25 Jan, 2015, 2:17:58 PM
    Author     : cignex
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bigdid.model.*"%>
<%@page import="com.bigdid.controller.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <%
            Revenue_Location_Controller RLC = new Revenue_Location_Controller();
        	HashMap<String,Integer> location = new HashMap<String,Integer>();
            location = RLC.getLocationRevenue();
           
        %>

        
        <script type="text/javascript">
            function generateChartData() {          
                chartData1 = [];

               <%
                Iterator it = location.entrySet().iterator();
                while (it.hasNext()) {
                    Map.Entry pairs = (Map.Entry)it.next();
                    System.out.println(pairs.getKey() + " = " + pairs.getValue());
                %>
                    var name = "<%=pairs.getKey()%>";
                    var revenue = "<%=pairs.getValue()%>";
                    
                      chartData1.push({location: name, revenue: revenue});
            <%}%>
            
                return chartData1;
            }
        </script>
        <title>JSP Page</title>

    </head>
    <body>
        
        <script src="../js/amcharts.js" type="text/javascript"></script>
        <script src="../js/serial.js" type="text/javascript"></script>



        <script type="text/javascript">

            var chartData1 = generateChartData();
function Revenue_Location_Chart(){
            var chart1 = AmCharts.makeChart("chartdiv1", {
        "type": "serial",
                    "theme": "none",
                    "dataProvider":chartData1,
                    "valueAxes": [{
                            "gridColor": "#FFFFFF",
                            "gridAlpha": 0.2,
                            "dashLength": 0,
                            "id": "ValueAxis-1",
                            "title": "Revenue($)"
                        }],
                    "titles": [
                        {
                            "id": "Title-1",
                            "size": 15,
                            "text": "Revenue Analysis"
                        }
                    ],
                    "gridAboveGraphs": true,
                    "startDuration": 1,
                    "graphs": [{
                            "balloonText": "[[category]]: <b>[[value]]</b>",
                            "fillAlphas": 0.8,
                            "lineAlpha": 0.2,
                            "type": "column",
                            "valueField": "revenue"
                        }],
                    "chartCursor": {
                        "categoryBalloonEnabled": false,
                        "cursorAlpha": 0,
                        "zoomable": false
                    },
                    "categoryField": "location",
                    "categoryAxis": {
                        "gridPosition": "start",
                        "labelRotation": 90,
                        "gridAlpha": 0,
                        "tickPosition": "start",
                        "tickLength": 20
                    },
                    "exportConfig": {
                        "menuTop": 0,
                        "menuItems": [{
                                "icon": '/lib/3/images/export.png',
                                "format": 'png'
                            }]
                    }
            });

}
        </script>
        
    </body>
</html>
