<%@page import="com.bigdid.controller.Feedback_Order_Months_Controller"%>
<%@page import="com.bigdid.controller.Feedback_Order_Weeks_Controller"%>
<%@page import="com.bigdid.controller.Feedback_Order_Days_Controller"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="com.bigdid.model.Sentiment_Date_Revised_one"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.bigdid.model.Feedback_Order_Days"%>
<%@page import="com.bigdid.controller.Customer_Feedback_Date_Controller"%>
<%@page import="com.bigdid.controller.Customer_Sentiment_Month_Controller"%>
<%@page import="com.bigdid.controller.Customer_Sentiment_Week_Controller"%>
<%@page import="com.bigdid.controller.Customer_Sentiment_Date_Controller"%>
<!DOCTYPE html>
<html>
    <head>
        <title>chart created with amCharts | amCharts</title>
        <meta name="description" content="chart created using amCharts live editor" />

        <!-- amCharts javascript sources -->
        <script src="../js/amcharts.js" type="text/javascript"></script>
        <script src="../js/serial.js" type="text/javascript"></script>

    </head>
    <body>
        <%Feedback_Order_Months_Controller fomc=new Feedback_Order_Months_Controller();
        fomc.getFeedback();
        HashMap<String, int[]> finalDataSet_fomc = new HashMap<String, int[]>();
        finalDataSet_fomc=fomc.getFeedback();
        %>       
        
         <script type="text/javascript">
            function generateChartData() {          
                chartData_month = [];

               <%
                Set set_fomc = finalDataSet_fomc.entrySet();
        // Get an iterator
       Iterator i_fomc = set_fomc.iterator();
       
        // Display elements
        while (i_fomc.hasNext()) {
           int[] array_fomc = new int[7];
           
            Map.Entry me_fomc = (Map.Entry) i_fomc.next();
            System.out.print(me_fomc.getKey() + ": ");
            array_fomc = (int[]) me_fomc.getValue();
            
                    
                %>
                    var month = "<%=me_fomc.getKey()%>";
                    var excellent = "<%=array_fomc[0]%>";
                    var good = "<%=array_fomc[1]%>";
                    var average = "<%=array_fomc[2]%>";
                    var bad = "<%=array_fomc[3]%>";
                    var orderValue = "<%=array_fomc[4]%>";
                    var posCount = "<%=array_fomc[5]%>";
                    var negCount = "<%=array_fomc[6]%>";
                    
                    
                      chartData_month.push({month: month, bad: bad, positive: posCount , negative:negCount, average :average, good: good, excellent: excellent});
            <%}%>
            
                return chartData_month;
            }
        </script>
        <!-- amCharts javascript code -->
        <script type="text/javascript">
                var chartData_month = generateChartData();
            function Customer_Feedback_Month_DoubleLineChart() {
                AmCharts.makeChart("chartdiv7",
                        {
                            "type": "serial",
                            "columnWidth": 0.3,
                            "pathToImages": "http://cdn.amcharts.com/lib/3/images/",
                            "categoryField": "month",
                            
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
                                    "valueField": "bad",
                                    "valueAxis": "ValueAxis-1"
                                },
                                {
                                    "balloonText": "[[title]] of [[category]]:[[value]]",
                                    "fillAlphas": 1,
                                    "id": "AmGraph-2",
                                    "title": "Good",
                                    "type": "column",
                                    "valueField": "good",
                                    "valueAxis": "ValueAxis-1"
                                },
                                {
                                    "balloonText": "[[title]] of [[category]]:[[value]]",
                                    "fillAlphas": 1,
                                    "id": "AmGraph-3",
                                    "title": "Average",
                                    "type": "column",
                                    "valueField": "average",
                                    "valueAxis": "ValueAxis-1"
                                },
                                {
                                    "balloonText": "[[title]] of [[category]]:[[value]]",
                                    "fillAlphas": 1,
                                    "id": "AmGraph-4",
                                    "title": "Excellent",
                                    "type": "column",
                                    "valueField": "excellent",
                                    "valueAxis": "ValueAxis-1"
                                },
                                {
                                    "valueAxis": "v1",
                                    "lineColor": "#FF0000",
                                    "bullet": "round",
                                    "bulletBorderThickness": 1,
                                    "hideBulletsCount": 30,
                                    "title": "Negative Sentiments",
                                    "valueField": "negative",
                                    "fillAlphas": 0
                                }, {
                                    "valueAxis": "v2",
                                    "lineColor": "#229022",
                                    "bullet": "square",
                                    "bulletBorderThickness": 1,
                                    "hideBulletsCount": 30,
                                    "title": "Positive Sentiments",
                                    "valueField": "positive",
                                    "fillAlphas": 0
                                },
                            ],
                            "titles": [
                                {
                                    "id": "Title-1",
                                    "size": 15,
                                    "text": "Comparative Analysis with Social Media Sentiments"
                                }
                            ],
                            "guides": [],
                            "valueAxes": [{
                                    "id": "v1",
                                    "axisColor": "#FF0000",
                                    "axisThickness": 2,
                                    "gridAlpha": 0,
                                    "title": "Negative Sentiments",
                                    "axisAlpha": 1,
                                    "position": "right"
                                }, {
                                    "id": "v2",
                                    "axisColor": "#229022",
                                    "axisThickness": 2,
                                    "gridAlpha": 0,
                                    "title": "Positive Sentiments",
                                    "axisAlpha": 1,
                                    "position": "left"
                                }],
                            "allLabels": [],
                            "balloon": {},
                            "legend": {
                                "useGraphSettings": true
                            },
                            "dataProvider":chartData_month
                        }
                );


            }
        </script>
<!--              <div id="chartdiv7" style="width: 100%; height: 400px; background-color: #FFFFFF;" ><script type="text/javascript">Customer_Feedback_Month_DoubleLineChart();</script></div>-->

    </body>
</html>