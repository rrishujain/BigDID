
<%@page import="com.bigdid.controller.Promotional_Offers_Controller"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bigdid.model.Promotional_Offers"%>
<!DOCTYPE html>
<html>
    <head>
        <title>chart created with amCharts | amCharts</title>
        <meta name="description" content="chart created using amCharts live editor" />
        <% Promotional_Offers_Controller poc = new Promotional_Offers_Controller();
        ArrayList<Long> offers_poc=new ArrayList<Long>();
        ArrayList<String> date_poc=new ArrayList<String>();
        HashMap count_poc=new HashMap();
        offers_poc=poc.getOffers();
        count_poc=poc.getPositiveCount();
        date_poc=poc.getDates();
        
        %>
            
        <!-- amCharts javascript sources -->
        <script type="text/javascript" src="../js/amcharts.js"></script>
        <script type="text/javascript" src="../js/pie.js"></script>      
        <script src="../js/serial.js" type="text/javascript"></script>
        <script type="text/javascript" src="http://www.amcharts.com/lib/3/themes/none.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

        <!-- amCharts javascript code -->
        <script type="text/javascript">
            function Promotional_Offers(){
            AmCharts.makeChart("chartdiv_Promotion_Offers",
                    {
                        "type": "serial",
                        "pathToImages": "http://cdn.amcharts.com/lib/3/images/",
                        "categoryField": "category",
                        
                        "categoryAxis": {
                            "gridPosition": "start",
                            "labelRotation":90
                        },
                        "trendLines": [],
                        "graphs": [
                            {
                                "balloonText": "[[title]] of [[category]]:[[value]]",
                                "fillAlphas": 1,
                                "id": "AmGraph-1",
                                "title": "  Orders(Days Lasted)",
                                "type": "column",
                                "valueField": "column-1",
                                
                            },
                            
                                {
                                    "valueAxis": "v1",
                                    "lineColor": "#FF0000",
                                    "bullet": "round",
                                    "bulletBorderThickness": 1,
                                    "hideBulletsCount": 30,
                                    "title": "Positive Feedbacks",
                                    "valueField": "positive",
                                    "fillAlphas": 0
                                }
                        ],
                        "guides": [],
                        "valueAxes": [
                            {
                                "id": "ValueAxis-1",
                                "title": "Orders",
                                "gridAlpha": 0,
                                "position": "left"
                            },
                            {
                                    "id": "v1",
                                    "axisColor": "#229022",
                                    "title": "Positive Sentiments",
                                    "gridAlpha": 0,
                                    "axisAlpha": 0,
                                    "position": "right"
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
                                "text": "Promotional Offer Analysis"
                                
                            }
                        ],
                        "colors":["#0174DF","#B40404"],
                        "dataProvider": [
                            {
                                "category": "<%=date_poc.get(0)%>",
                                "column-1": <%=offers_poc.get(0)%>,
                                "positive": <%=count_poc.get(date_poc.get(0))%>
                            },
                                    {
                                "category": "<%=date_poc.get(1)%>",
                                "column-1": <%=offers_poc.get(1)%>,
                                "positive": <%=count_poc.get(date_poc.get(1))%>
                            },
                                    {
                                "category": "<%=date_poc.get(2)%>",
                                "column-1": <%=offers_poc.get(2)%>,
                                "positive": <%=count_poc.get(date_poc.get(2))%>
                            },
                                    {
                                "category": "<%=date_poc.get(3)%>",
                                "column-1": <%=offers_poc.get(3)%>,
                                "positive": <%=count_poc.get(date_poc.get(3))%>
                            }
                            
                        ]
                    }
            );}
        </script>
        
    </head>
    <body>
    </body>
    
</html>