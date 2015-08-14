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
        <%Feedback_Order_Weeks_Controller fowc=new Feedback_Order_Weeks_Controller();
        fowc.getFeedback();
        HashMap<String, int[]> finalDataSet_fowc = new HashMap<String, int[]>();
        finalDataSet_fowc=fowc.getFeedback();
        %>       
        
         <script type="text/javascript">
            function generateChartData() {          
                chartData_week = [];

               <%
                Set set_fowc = finalDataSet_fowc.entrySet();
        // Get an iterator
       Iterator i_fowc = set_fowc.iterator();
       
        // Display elements
        while (i_fowc.hasNext()) {
           int[] array_fowc = new int[7];
           
            Map.Entry me_fowc = (Map.Entry) i_fowc.next();
            System.out.print(me_fowc.getKey() + ": ");
            array_fowc = (int[]) me_fowc.getValue();
            
                    
                %>
                    var week = "<%=me_fowc.getKey()%>";
                    var excellent = "<%=array_fowc[0]%>";
                    var good = "<%=array_fowc[1]%>";
                    var average = "<%=array_fowc[2]%>";
                    var bad = "<%=array_fowc[3]%>";
                    var orderValue = "<%=array_fowc[4]%>";
                    var posCount = "<%=array_fowc[5]%>";
                    var negCount = "<%=array_fowc[6]%>";
                    
                    
                      chartData_week.push({week: week, bad: bad, positive: posCount , negative:negCount, average :average, good: good, excellent: excellent});
            <%}%>
            
                return chartData_week;
            }
        </script>
        <!-- amCharts javascript code -->
        <script type="text/javascript">
                var chartData_week = generateChartData();
            function Customer_Feedback_Week_DoubleLineChart() {
                AmCharts.makeChart("chartdiv6",
                        {
                            "type": "serial",
                            "columnWidth": 0.3,
                            "pathToImages": "http://cdn.amcharts.com/lib/3/images/",
                            "categoryField": "week",
                            
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
                            "dataProvider":chartData_week
                        }
                );


            }
        </script>
              <div id="chartdiv6" style="width: 100%; height: 400px; background-color: #FFFFFF;" ><script type="text/javascript">Customer_Feedback_Week_DoubleLineChart();</script></div>

    </body>
</html>