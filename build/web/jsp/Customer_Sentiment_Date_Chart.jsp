<%@page import="com.bigdid.model.*"%>
<%@page import="com.bigdid.controller.*"%>
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
		<div id="chartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
                
                <%
                 int sentiment[][]=new int[13][5];
                Customer_Sentiment_Date_Controller CSM = new Customer_Sentiment_Date_Controller();
                sentiment=CSM.sentiments();
               

                %>
                <!-- amCharts javascript code -->
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
							"bullet": "round",
							"id": "AmGraph-1",
							"title": "positive",
							"valueField": "column-1"
						},
						{
							"balloonText": "[[title]] of [[category]]:[[value]]",
							"bullet": "square",
							"id": "AmGraph-2",
							"title": "negative",
							"valueField": "column-2"
						}
					],
					"guides": [],
					"valueAxes": [
						{
							"id": "ValueAxis-1",
							"title": "Axis title"
						}
					],
					"allLabels": [],
					"balloon": {},
					"legend": {
						"useGraphSettings": true
					},
					"titles": [
						{
							"id": "Title-1",
							"size": 15,
							"text": "Chart Title"
						}
					],
					"dataProvider": [
						{
							"category": "Today",
							"column-1": <%=sentiment[0][0]%>,
							"column-2": <%=sentiment[0][1]%>
						},
                                                        {
							"category": "Today-1",
							"column-1": <%=sentiment[1][0]%>,
							"column-2": <%=sentiment[1][1]%>
						},
                                                {
							"category": "Today-2",
							"column-1": <%=sentiment[2][0]%>,
							"column-2": <%=sentiment[2][1]%>
						},
                                                {
							"category": "Today-3",
							"column-1": <%=sentiment[3][0]%>,
							"column-2": <%=sentiment[3][1]%>
						}        
					]
				}
			);
		</script>
	</body>
</html>