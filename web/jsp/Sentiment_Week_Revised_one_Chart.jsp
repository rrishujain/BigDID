<%@page import="com.bigdid.model.Sentiment_Week_Revised_one"%>
<%@page import="com.bigdid.model.Sentiment_Month_Revised_one"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.bigdid.model.Sentiment_Date_Revised_one"%>
<%@page import="com.bigdid.controller.Customer_Sentiment_Date_Revised_Controller"%>
<%@page import="java.util.ArrayList"%>

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
		
                
                 <%
               
               HashMap<String, int[]> data_swro = new HashMap<>();
               data_swro=(HashMap<String, int[]>)getServletContext().getAttribute("Sentiment_Week");
                   
                   
            %>  
           <script type="text/javascript">
            function generateChartData() {          
                chartData_sweek = [];

               <%
               Set set_swro = data_swro.entrySet();
     
                 Iterator i_swro = set_swro.iterator();
                while (i_swro.hasNext()) {
                    Map.Entry me_swro = (Map.Entry)i_swro.next();
                    
                    int[] array_swro = new int[3];
                    array_swro=(int[])me_swro.getValue();
                    
                %>
                    var week = "<%=me_swro.getKey()%>";
                    var orderValue = "<%=array_swro[0]%>";
                    var posCount = "<%=array_swro[1]%>";
                    var negCount = "<%=array_swro[2]%>";
                    
                      chartData_sweek.push({week: week, Orders: orderValue, PositiveSentiments: posCount , NegativeSentiments:negCount});
            <%}%>
            
                return chartData_sweek;
            }
        </script>
                <!-- amCharts javascript code -->
                  
		<script type="text/javascript">
                    var chartData_sweek = generateChartData();
                    function Customer_Sentiment_Week_DoubleLineChart(){
	                AmCharts.makeChart("chartdiv3", {
                    "type": "serial",
                    "theme": "none",
                    "pathToImages": "http://www.amcharts.com/lib/3/images/",
                    "legend": {
                        "useGraphSettings": true
                    },
                    "dataProvider": chartData_sweek,
                    "titles": [
                        {
                            "id": "Title-1",
                            "size": 15,
                            "text": "Comparative Analysis with Social Media Sentiments"
                        }
                    ],
                    "valueAxes": [{
                            "id": "v1",
                            "axisColor": "#229022",
                            "axisThickness": 2,
                            "gridAlpha": 0,
                            "title": "Sentiments",
                            "axisAlpha": 1,
                            "position": "left"
                        },  {
                            "id": "v3",
                            "axisColor": "#B0DE09",
                            "axisThickness": 2,
                            "gridAlpha": 0,
                            "offset": 50,
                            "title": "Orders",
                            "axisAlpha": 1,
                            "position": "right"
                        }],
                    "graphs": [{
                            "valueAxis": "v1",
                            "lineColor": "#229022",
                            "bullet": "round",
                            "bulletBorderThickness": 1,
                            "hideBulletsCount": 30,
                            "title": "Positive Sentiments",
                            "valueField": "PositiveSentiments",
                            "fillAlphas": 0
                        }, {
                            "valueAxis": "v2",
                            "lineColor": "#FF0000",
                            "bullet": "square",
                            "bulletBorderThickness": 1,
                            "hideBulletsCount": 30,
                            "title": "Negative Sentiments",
                            "valueField": "NegativeSentiments",
                            "fillAlphas": 0
                        }, {
                            "valueAxis": "v3",
                            "lineColor": "#B0DE09",
                            "bullet": "triangleUp",
                            "bulletBorderThickness": 1,
                            "hideBulletsCount": 30,
                            "title": "Total Orders",
                            "valueField": "Orders",
                            "fillAlphas": 0
                        }],
                    "chartScrollbar": {},
                    "chartCursor": {
                        "cursorPosition": "mouse"
                    },
                    "categoryField": "week",
                    "categoryAxis": {
                        "axisColor": "#DADADA",
                        "minorGridEnabled": true
                    }
                });
}
		</script>
<!--                	 <div id="chartdiv3" style="width: 100%; height: 400px; background-color: #FFFFFF;" ><script type="text/javascript">Customer_Sentiment_Week_DoubleLineChart();</script></div>			-->
	</body>
</html>