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
               Customer_Sentiment_Date_Revised_Controller CSRC=new Customer_Sentiment_Date_Revised_Controller();
                ArrayList<Long> orderValue=new ArrayList<Long>();
                orderValue=CSRC.getOrderValues();
                 ArrayList<Long> positive=new ArrayList<Long>();
                 positive=CSRC.getPositiveCount();
                  ArrayList<Long> negative=new ArrayList<Long>();
                  negative=CSRC.getNegativeCount();
                   ArrayList<String> date=new ArrayList<String>();
                   date=CSRC.getDates();
                   
                   
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
                            "date": "<%=date.get(0)%>",
                            "Positive Sentiments":<%=positive.get(0)%>,
                            "Negative Sentiments": <%=negative.get(0)%>,
                            "Orders": <%=orderValue.get(0)%>
                        },
                        {
                            "date": "<%=date.get(1)%>",
                            "Positive Sentiments":<%=positive.get(1)%>,
                            "Negative Sentiments": <%=negative.get(1)%>,
                            "Orders": <%=orderValue.get(1)%>
                        },
                                {
                            "date": "<%=date.get(2)%>",
                            "Positive Sentiments":<%=positive.get(2)%>,
                            "Negative Sentiments": <%=negative.get(2)%>,
                            "Orders": <%=orderValue.get(2)%>
                        },
                                {
                            "date": "<%=date.get(3)%>",
                            "Positive Sentiments":<%=positive.get(3)%>,
                            "Negative Sentiments": <%=negative.get(3)%>,
                            "Orders": <%=orderValue.get(3)%>
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