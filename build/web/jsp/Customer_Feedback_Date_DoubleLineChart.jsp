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
<%  
                 long count[] = new long[7];
long sentiment[][] = new long[13][5];
                 String dates[] = new String[5];
                 Customer_Sentiment_Date_Controller CSD = new Customer_Sentiment_Date_Controller();
                 sentiment = CSD.sentiments();
                 count = CSD.orders();
                 dates = CSD.dates();
            
                 Customer_Feedback_Date_Controller CFDC = new Customer_Feedback_Date_Controller();
                 long feedback_date[][] = new long[6][10];
                 feedback_date = CFDC.feedback();
            %>                <!-- amCharts javascript code -->
		<script type="text/javascript">
                    function Customer_Feedback_Date_DoubleLineChart(){
	                 AmCharts.makeChart("chartdiv5",
                        {
                            "type": "serial",
                            "columnWidth": 0.3,
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
                                    "text": "Amazon Comparative Analysis By Date"
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
                            "dataProvider": [
                                {
                                    "category": "<%=dates[0]%>",
                                    "column-1": <%=feedback_date[0][0]%>,
                                    "column-2": <%=feedback_date[0][1]%>,
                                    "column-3": <%=feedback_date[0][2]%>,
                                    "column-4": <%=feedback_date[0][3]%>,
                                    "positive": <%=sentiment[0][0]%>,
                                    "negative":<%=sentiment[0][1]%>,
                                },
                                {
                                    "category": "<%=dates[1]%>",
                                    "column-1": <%=feedback_date[1][0]%>,
                                    "column-2": <%=feedback_date[1][1]%>,
                                    "column-3": <%=feedback_date[1][2]%>,
                                    "column-4": <%=feedback_date[1][3]%>,
                                    "positive": <%=sentiment[1][0]%>,
                                    "negative":<%=sentiment[1][1]%>,
                                },
                                {
                                    "category": "<%=dates[2]%>",
                                    "column-1": <%=feedback_date[2][0]%>,
                                    "column-2": <%=feedback_date[2][1]%>,
                                    "column-3": <%=feedback_date[2][2]%>,
                                    "column-4": <%=feedback_date[2][3]%>,
                                    "positive": <%=sentiment[2][0]%>,
                                    "negative":<%=sentiment[2][1]%>,
                                },
                                {
                                    "category": "<%=dates[3]%>",
                                    "column-1": <%=feedback_date[3][0]%>,
                                    "column-2": <%=feedback_date[3][1]%>,
                                    "column-3": <%=feedback_date[3][2]%>,
                                    "column-4": <%=feedback_date[3][3]%>,
                                    "positive": <%=sentiment[3][0]%>,
                                    "negative":<%=sentiment[3][1]%>,
                                }
                            ]
                        }
                );


}
		</script>
	</body>
</html>