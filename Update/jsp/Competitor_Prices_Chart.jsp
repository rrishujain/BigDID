<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.bigdid.controller.Competitor_Prices_Controller"%>
<%@page import="com.bigdid.model.Competitor_Prices"%>
<%--<%@page import="Model.CompareJava"%>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%
            Competitor_Prices_Controller cpc = new Competitor_Prices_Controller();
            ArrayList<String> l_cpc;
            l_cpc = new ArrayList<String>();
            l_cpc = (ArrayList<String>) cpc.Item();
            Map<String, List<Integer>> data1_cpc = new HashMap<String, List<Integer>>();
            data1_cpc = cpc.Price();

        %>


        <script type="text/javascript">
            function generateChartData() {
                chartData_cp = [];

            <% for (int i = 0; i < l_cpc.size(); i++) {%>
                var name = "<%=l_cpc.get(i)%>";
                var c1_cpc =<%=data1_cpc.get(l_cpc.get(i)).get(0)%>;
                var c2_cpc =<%=data1_cpc.get(l_cpc.get(i)).get(1)%>;
                var c3_cpc =<%=data1_cpc.get(l_cpc.get(i)).get(2)%>;

                chartData_cp.push({
                    category: name,
                    colum1: c1_cpc,
                    colum2: c2_cpc,
                    colum3: c3_cpc
                });
            <% } %>
                return chartData_cp;
            }
        </script>
        <title>JSP Page</title>


    </head>
    <body>

        
       
        <!-- amCharts javascript sources -->
        <script src="../js/amcharts.js" type="text/javascript"></script>
        <script src="../js/serial.js" type="text/javascript"></script>

        <!-- amCharts javascript code -->
        
        <script type="text/javascript">
            var chartData_cp = generateChartData();
            function Competitor_Prices_Chart(){
            AmCharts.makeChart("chartdiv1",
                    {
                        "type": "serial",
                        "pathToImages": "http://cdn.amcharts.com/lib/3/images/",
                        "categoryField": "category",
                        "startDuration": 1,
                        "categoryAxis": {
                            "gridPosition": "start",
                            "labelRotation":90
                        },
                        "trendLines": [],
                        "graphs": [
                            {
                                "balloonText": "Price of [[category]] on [[title]]:[[value]]",
                                "fillAlphas": 1,
                                "id": "AmGraph-1",
                                "title": "Amazon",
                                "type": "column",
                                "valueField": "colum1"
                            },
                            {
                                "balloonText": "Price of [[category]] on [[title]]:[[value]]",
                                "fillAlphas": 1,
                                "id": "AmGraph-2",
                                "title": "Ebay",
                                "type": "column",
                                "valueField": "colum2"
                            },
                            {
                                "balloonText": "Price of [[category]] on [[title]]:[[value]]",
                                "fillAlphas": 1,
                                "id": "AmGraph-3",
                                "title": "Wallmart",
                                "type": "column",
                                "valueField": "colum3"
                            }
                        ],
                        "guides": [],
                        "valueAxes": [
                            {
                                "id": "ValueAxis-1",
                                "title": "Price($)"
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
                                "text": "Competitor Price Analysis"
                            }
                        ],
                        "dataProvider": chartData_cp


                    }
            );
            }
        </script>
<!--        <div id="chartdiv2" style="width: 100%; height: 400px; background-color: #FFFFFF;" ><script type="text/javascript">Competitor_Prices_Chart();</script></div>-->
    </body>
</html>