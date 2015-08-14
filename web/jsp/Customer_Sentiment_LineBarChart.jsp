<%-- 
    Document   : Customer_Sentiment_LineBarChart
    Created on : 2 Feb, 2015, 5:19:19 PM
    Author     : cignex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <div id="chartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
       
        <!-- amCharts javascript sources -->
        <script src="../js/amcharts.js" type="text/javascript"></script>
        <script src="../js/serial.js" type="text/javascript"></script>
        
        <script type="text/javascript">
            AmCharts.makeChart("chartdiv",
                    {
                        "type": "serial",
                        
                        "pathToImages": "http://cdn.amcharts.com/lib/3/images/",
                        "categoryField": "category",
                        "startDuration": 1,
                        "categoryAxis": {
                            "gridPosition": "start"
                        },
                        "trendLines": [],
                        "graphs": [
                            {
                                "balloonText": "[[title]] of [[category]]:[[value]]",
                                "fillAlphas": 1,
                                "id": "AmGraph-1",
                                "title": "Bad",
                                "type": "column",
                                "valueField": "column-1",
                                "valueAxis": "ValueAxis-1"
                            },
                            {
                                "balloonText": "[[title]] of [[category]]:[[value]]",
                                "fillAlphas": 1,
                                "id": "AmGraph-2",
                                "title": "Good",
                                "type": "column",
                                "valueField": "column-2",
                                "valueAxis": "ValueAxis-1"
                            },
                            {
                                "balloonText": "[[title]] of [[category]]:[[value]]",
                                "fillAlphas": 1,
                                "id": "AmGraph-3",
                                "title": "Average",
                                "type": "column",
                                "valueField": "column-3",
                                "valueAxis": "ValueAxis-1"
                            },
                            {
                                "balloonText": "[[title]] of [[category]]:[[value]]",
                                "fillAlphas": 1,
                                "id": "AmGraph-4",
                                "title": "Excellent",
                                "type": "column",
                                "valueField": "column-4",
                                "valueAxis": "ValueAxis-1"
                            },
                            {
                                "valueAxis": "v1",
                                "lineColor": "#000000",
                                "bullet": "round",
                                "bulletBorderThickness": 1,
                                "hideBulletsCount": 30,
                                "title": "red line",
                                "valueField": "visits",
                                        "fillAlphas": 0
                            }, {
                                "valueAxis": "v2",
                                "lineColor": "#000000",
                                "bullet": "square",
                                "bulletBorderThickness": 1,
                                "hideBulletsCount": 30,
                                "title": "yellow line",
                                "valueField": "hits",
                                        "fillAlphas": 0
                            }, {
                                "valueAxis": "v3",
                                "lineColor": "#000000",
                                "bullet": "triangleUp",
                                "bulletBorderThickness": 1,
                                "hideBulletsCount": 30,
                                "title": "green line",
                                "valueField": "views",
                                        "fillAlphas": 0
                            }
                            
                        ],
                        "guides": [],
                        
                        "valueAxes": [{
                                "id":"v1",
                                "axisColor": "#FF6600",
                                "axisThickness": 2,
                                "gridAlpha": 0,
                                "axisAlpha": 1,
                                "position": "left"
                            }, {
                                "id":"v2",
                                "axisColor": "#FCD202",
                                "axisThickness": 2,
                                "gridAlpha": 0,
                                "axisAlpha": 1,
                                "position": "left"
                            }, {
                                "id":"v3",
                                "axisColor": "#B0DE09",
                                "axisThickness": 2,
                                "gridAlpha": 0,
                                "offset": 50,
                                "axisAlpha": 1,
                                "position": "right"
                            },{
                                "id": "ValueAxis-1",
                                "stackType": "regular",
                                "title": "Revenue"
                            }],
                        "allLabels": [],
                        "balloon": {},
                        "legend": {
                            "useGraphSettings": true
                        },
                        "titles": [
                            {
                                "id": "Title-1",
                               
                                "text": "Survey"
                            }
                        ],
                        "dataProvider": [
                            {
                                "category": "1",
                                "column-1": 3,
                                "column-2": 5,
                                "column-3": 5,
                                "column-4": 8,
                                "visits": 8,
                                "hits":5,
                                "views": 5
                            },
                           {
                                "category": "1",
                                "column-1": 3,
                                "column-2": 5,
                                "column-3": 11,
                                "column-4": 8,
                                "visits": 12,
                                "hits":5,
                                "views": 8
                            },
                                    {
                                "category": "1",
                                "column-1": 12,
                                "column-2": 5,
                                "column-3": 42,
                                "column-4": 6,
                                "visits": 8,
                                "hits":11,
                                "views": 17
                            },
                                    {
                                "category": "1",
                                "column-1": 3,
                                "column-2": 22,
                                "column-3": 12,
                                "column-4": 12,
                                "visits": 65,
                                "hits":5,
                                "views": 23
                            }
                        ]
                    }
            );
        </script>
    </body>
</html>
