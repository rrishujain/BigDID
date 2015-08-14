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
        long count2_csm[] = new long[7];
        long sentiment2_csm[][] = new long[13][5];
        int month_csm[] = new int[6];
            Customer_Sentiment_Month_Controller csm = new Customer_Sentiment_Month_Controller();
            sentiment2_csm = csm.sentiments();
            count2_csm = csm.orders();
            month_csm = csm.months();

        %>
        <!-- amCharts javascript code -->
        <script type="text/javascript">
            function Customer_Sentiment_Month_DoubleLineChart()
            {


                AmCharts.makeChart("chartdiv4", {
                    "type": "serial",
                    "theme": "none",
                    "pathToImages": "http://www.amcharts.com/lib/3/images/",
                    "legend": {
                        "useGraphSettings": true
                    },
                    "dataProvider": [
                        {
                                    "month": <%=month_csm[0]%>,
                                    "Positive Sentiments":<%=sentiment2_csm[0][0]%>,
                                    "Negative Sentiments": <%=sentiment2_csm[0][1]%>,
                                    "Orders": <%=count2_csm[0]%>
                        },
                        {
                                    "month": <%=month_csm[1]%>,
                                    "Positive Sentiments":<%=sentiment2_csm[1][0]%>,
                                    "Negative Sentiments": <%=sentiment2_csm[1][1]%>,
                                    "Orders": <%=count2_csm[1]%>
                        },
                        {
                                    "month": <%=month_csm[2]%>,
                                    "Positive Sentiments":<%=sentiment2_csm[2][0]%>,
                                    "Negative Sentiments": <%=sentiment2_csm[2][1]%>,
                                    "Orders": <%=count2_csm[2]%>
                        },
                        {
                                    "month":<%=month_csm[3]%>,
                                    "Positive Sentiments":<%=sentiment2_csm[3][0]%>,
                                    "Negative Sentiments": <%=sentiment2_csm[3][1]%>,
                                    "Orders": <%=count2_csm[3]%>
                        }
                    ],
                    "titles": [
                        {
                            "id": "Title-1",
                            "size": 15,
                            "text": "Amazon Feedback Analysis By Month"
                        }
                    ],
                    "valueAxes": [{
                            "id": "v1",
                            "axisColor": "#FF6600",
                            "axisThickness": 2,
                            "gridAlpha": 0,
                            "title": "Sentiments",
                            "axisAlpha": 1,
                            "position": "left"
                        }, {
                            "id": "v2",
                            "axisColor": "#FCD202",
                            "axisThickness": 2,
                            "title": "Sentiments",
                            "gridAlpha": 0,
                            "axisAlpha": 1,
                            "position": "left"
                        }, {
                            "id": "v3",
                            "axisColor": "#B0DE09",
                            "axisThickness": 2,
                            "gridAlpha": 0,
                            "title": "Orders",
                            "offset": 50,
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