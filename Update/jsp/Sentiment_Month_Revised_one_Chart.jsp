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
               Sentiment_Month_Revised_one smro=new Sentiment_Month_Revised_one();
               HashMap<String, int[]> data_smro = new HashMap<>();
               data_smro=smro.getSentiment();
                   
                   
            %>   
           <script type="text/javascript">
            function generateChartData() {          
                chartData_smonth = [];

               <%
               Set set_smro = data_smro.entrySet();
     
                 Iterator i_smro = set_smro.iterator();
                while (i_smro.hasNext()) {
                    Map.Entry me_smro = (Map.Entry)i_smro.next();
                    
                    int[] array_smro = new int[3];
                    array_smro=(int[])me_smro.getValue();
                    
                %>
                    var month = "<%=me_smro.getKey()%>";
                    var orderValue = "<%=array_smro[0]%>";
                    var posCount = "<%=array_smro[1]%>";
                    var negCount = "<%=array_smro[2]%>";
                    
                      chartData_smonth.push({month: month, Orders: orderValue, PositiveSentiments: posCount , NegativeSentiments:negCount});
            <%}%>
            
                return chartData_smonth;
            }
        </script>
                <!-- amCharts javascript code -->
                  
		<script type="text/javascript">
                    var chartData_smonth = generateChartData();
                    function Customer_Sentiment_Month_DoubleLineChart(){
	                AmCharts.makeChart("chartdiv4", {
                    "type": "serial",
                    "theme": "none",
                    "pathToImages": "http://www.amcharts.com/lib/3/images/",
                    "legend": {
                        "useGraphSettings": true
                    },
                    "dataProvider": chartData_smonth,
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
                    "categoryField": "month",
                    "categoryAxis": {
                        "axisColor": "#DADADA",
                        "minorGridEnabled": true
                    }
                });
}
		</script>
      
	</body>
</html>