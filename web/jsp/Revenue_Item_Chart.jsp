<%@page import="java.util.ArrayList"%>
<%@page import="com.bigdid.model.*"%>
<%@page import="com.bigdid.controller.*"%>
<%--<%@page import="Model.Item_revenue"%>--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


         <%
        Revenue_Item_Controller ric = new Revenue_Item_Controller();
        ArrayList<String> item_ric = new ArrayList<String>();
        item_ric = (ArrayList < String >)getServletContext().getAttribute("Item");
        ArrayList<Integer> rev_ric = new ArrayList<Integer>();
        rev_ric =(ArrayList < Integer >)getServletContext().getAttribute("Revenue_Item");
        %>

        <script type="text/javascript">
            
        function generateChartData() {
                chartData = [];

            <% for (int i=0; i<item_ric.size(); i++) { %>
                var name_ric = "<%=item_ric.get(i)%>";
                var revenue_ric =<%=rev_ric.get(i)%>;
                chartData.push({item_ric: name_ric, revenue_ric: revenue_ric});
            <% } %>
                return chartData;
            }
        </script>
        </head>
    <body>
       
        <script src="../js/amcharts.js" type="text/javascript"></script>
        <script src="../js/serial.js" type="text/javascript"></script>

        <script type="text/javascript">
     
    var chartdata = generateChartData();
           function Revenue_Item(){     
    
            var chart = AmCharts.makeChart("chartdiv2", {
                    "type": "serial",
                    "theme": "none",
                    "dataProvider": chartdata,
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
                            "text": "Itemwise Revenue"
                        }
                    ],
                    "gridAboveGraphs": true,
                    "startDuration": 1,
                    "graphs": [{
                            "balloonText": "[[category]]: <b>[[value]]</b>",
                            "fillAlphas": 0.8,
                            "lineAlpha": 0.2,
                            "type": "column",
                            "valueField": "revenue_ric"
                        }],
                    "chartCursor": {
                        "categoryBalloonEnabled": false,
                        "cursorAlpha": 0,
                        "zoomable": false
                    },
                    "categoryField": "item_ric",
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
