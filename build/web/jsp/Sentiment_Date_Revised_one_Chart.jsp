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
              
               HashMap<String, int[]> data_sdro = new HashMap<>();
               data_sdro=(HashMap<String, int[]>)getServletContext().getAttribute("Sentiment_Date");
                   
                   
            %>   
           <script type="text/javascript">
            function generateChartData() {          
                chartData_sdate = [];

               <%
               Set set_sdro = data_sdro.entrySet();
     
                 Iterator i_sdro = set_sdro.iterator();
                while (i_sdro.hasNext()) {
                    Map.Entry me_sdro = (Map.Entry)i_sdro.next();
                    
                    int[] array_sdro = new int[3];
                    array_sdro=(int[])me_sdro.getValue();
                    
                %>
                    var date = "<%=me_sdro.getKey()%>";
                    var orderValue = "<%=array_sdro[0]%>";
                    var posCount = "<%=array_sdro[1]%>";
                    var negCount = "<%=array_sdro[2]%>";
                    
                      chartData_sdate.push({date: date, Orders: orderValue, PositiveSentiments: posCount , NegativeSentiments:negCount});
            <%}%>
            
                return chartData_sdate;
            }
        </script>
                <!-- amCharts javascript code -->
                  
		<script type="text/javascript">
                    var chartData_sdate = generateChartData();
                    function Customer_Sentiment_Date_DoubleLineChart(){
	                AmCharts.makeChart("chartdiv2", {
                    "type": "serial",
                    "theme": "none",
                    "pathToImages": "http://www.amcharts.com/lib/3/images/",
                    "legend": {
                        "useGraphSettings": true
                    },
                    "dataProvider": chartData_sdate,
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
                            "position": "right",
                            
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
                    "categoryField": "date",
                    "categoryAxis": {
                        "axisColor": "#DADADA",
                        "minorGridEnabled": true
                    }
                });
}
		</script>
  
	</body>
</html>