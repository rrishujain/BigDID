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
                long count_csd[]=new long[7];
                long sentiment_csd[][]=new long[13][5];
                String dates_csd[] = new String[5];
                Customer_Sentiment_Date_Controller csd = new Customer_Sentiment_Date_Controller();
                sentiment_csd=csd.sentiments();
                count_csd= csd.orders();
                dates_csd = csd.dates();
            %>      
                <!-- amCharts javascript code -->
		<script type="text/javascript">
                    function Customer_Sentiment_Date_DoubleLineChart(){
	                AmCharts.makeChart("chartdiv2", {
                    "type": "serial",
                    "theme": "none",
                    "pathToImages": "http://www.amcharts.com/lib/3/images/",
                    "legend": {
                        "useGraphSettings": true
                    },
                    "dataProvider": [
                        {
                            "date": "<%=dates_csd[0]%>",
                            "Positive Sentiments":<%=sentiment_csd[0][0]%>,
                            "Negative Sentiments": <%=sentiment_csd[0][1]%>,
                            "Orders": <%=count_csd[0]%>
                        },
                        {
                            "date": "<%=dates_csd[1]%>",
                            "Positive Sentiments":<%=sentiment_csd[1][0]%>,
                            "Negative Sentiments": <%=sentiment_csd[1][1]%>,
                            "Orders": <%=count_csd[1]%>
                        },
                        {
                            "date": "<%=dates_csd[2]%>",
                            "Positive Sentiments":<%=sentiment_csd[2][0]%>,
                            "Negative Sentiments": <%=sentiment_csd[2][1]%>,
                            "Orders": <%=count_csd[2]%>
                        },
                        {
                            "date": "<%=dates_csd[3]%>",
                            "Positive Sentiments":<%=sentiment_csd[3][0]%>,
                            "Negative Sentiments": <%=sentiment_csd[3][1]%>,
                            "Orders": <%=count_csd[3]%>
                        }
                    ],
                    "titles": [
                        {
                            "id": "Title-1",
                            "size": 15,
                            "text": "Amazon Feedback Analysis By Date"
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
                        }, {
                            "id": "v2",
                            "axisColor": "#FF0000",
                            "axisThickness": 2,
                            "gridAlpha": 0,
                            "title": "Sentiments",
                            "axisAlpha": 1,
                            "position": "left"
                        }, {
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
                            "valueField": "Positive Sentiments",
                            "fillAlphas": 0
                        }, {
                            "valueAxis": "v2",
                            "lineColor": "#FF0000",
                            "bullet": "square",
                            "bulletBorderThickness": 1,
                            "hideBulletsCount": 30,
                            "title": "Negative Sentiments",
                            "valueField": "Negative Sentiments",
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