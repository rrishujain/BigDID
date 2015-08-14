<%@page import="com.bigdid.controller.Customer_Feedback_Week_Controller"%>
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
                long count1_csw[]=new long[7];
                long sentiment1_csw[][]=new long[13][5];
                Customer_Sentiment_Week_Controller csw1 = new Customer_Sentiment_Week_Controller();
                sentiment1_csw=csw1.sentiments();
                count1_csw= csw1.orders();
                Customer_Feedback_Week_Controller cfwc = new Customer_Feedback_Week_Controller();
                long feedback_week_cfwc[][] = new long[6][10];
                feedback_week_cfwc = cfwc.feedback();
            
                %>
                <!-- amCharts javascript code -->
		<script type="text/javascript">
                 function Customer_Feedback_Week_DoubleLineChart() {

                AmCharts.makeChart("chartdiv6",
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
                                }

                            ],
                            "titles": [
                                {
                                    "id": "Title-1",
                                    "size": 15,
                                    "text": "Amazon Comparative Analysis By Week"
                                }
                            ],
                            "guides": [],
                            "valueAxes": [{
                                    "id": "v1",
                                    "axisColor": "#FF0000",
                                    "axisThickness": 2,
                                    "gridAlpha": 0,
                                    "axisAlpha": 1,
                                    "title": "Negative Sentiments",
                                    "position": "right"
                                }, {
                                    "id": "v2",
                                    "axisColor": "#229022",
                                    "axisThickness": 2,
                                    "gridAlpha": 0,
                                    "axisAlpha": 1,
                                    "title": "Positive Sentiments",
                                    "position": "left"
                                }],
                            "allLabels": [],
                            "balloon": {},
                            "legend": {
                                "useGraphSettings": true
                            },
                            "dataProvider": [
                                {
                                    "category": "Current Week",
                                    "column-1": <%=feedback_week_cfwc[0][0]%>,
                                    "column-2": <%=feedback_week_cfwc[0][1]%>,
                                    "column-3": <%=feedback_week_cfwc[0][2]%>,
                                    "column-4": <%=feedback_week_cfwc[0][3]%>,
                                    "positive": <%=sentiment1_csw[0][0]%>,
                                    "negative":<%=sentiment1_csw[0][1]%>,
                                },
                                {
                                    "category": "Last Week",
                                    "column-1": <%=feedback_week_cfwc[1][0]%>,
                                    "column-2": <%=feedback_week_cfwc[1][1]%>,
                                    "column-3": <%=feedback_week_cfwc[1][2]%>,
                                    "column-4": <%=feedback_week_cfwc[1][3]%>,
                                    "positive": <%=sentiment1_csw[1][0]%>,
                                    "negative":<%=sentiment1_csw[1][1]%>,
                                },
                                {
                                    "category": "Secondlast Week",
                                    "column-1": <%=feedback_week_cfwc[2][0]%>,
                                    "column-2": <%=feedback_week_cfwc[2][1]%>,
                                    "column-3": <%=feedback_week_cfwc[2][2]%>,
                                    "column-4": <%=feedback_week_cfwc[2][3]%>,
                                    "positive": <%=sentiment1_csw[2][0]%>,
                                    "negative":<%=sentiment1_csw[2][1]%>,
                                },
                                {
                                    "category": "Thirdlast Week",
                                    "column-1": <%=feedback_week_cfwc[3][0]%>,
                                    "column-2": <%=feedback_week_cfwc[3][1]%>,
                                    "column-3": <%=feedback_week_cfwc[3][2]%>,
                                    "column-4": <%=feedback_week_cfwc[3][3]%>,
                                    "positive": <%=sentiment1_csw[3][0]%>,
                                    "negative":<%=sentiment1_csw[3][1]%>,
                                }
                            ]
                        }
                );


            }

		</script>
	</body>
</html>