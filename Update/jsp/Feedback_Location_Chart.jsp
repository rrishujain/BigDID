
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bigdid.model.*"%>
<%@page import="com.bigdid.controller.*"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <%
            
            
            ArrayList<Integer > revenue = new ArrayList<Integer >();
            Feedback_Location_Controller flc=new Feedback_Location_Controller();
            ArrayList<String> l_flc; 
            l_flc = new ArrayList<String>();
            //l_flc = (ArrayList<String>)getServletContext().getAttribute("Feedback_City"); 
            l_flc = flc.City();
            Map<String, List<Integer>> data_flc = new HashMap<String, List<Integer>>();
            data_flc= (Map<String, List<Integer>>)flc.grade();
            revenue= flc.TotalRevenue();
        %>


        <script type="text/javascript">
            function generateChartData() {          
                chartData = [];

            <% for (int i=0; i<l_flc.size(); i++) { %>
                var name_flc = "<%=l_flc.get(i)%>";
                var c1_flc =<%=(data_flc.get(l_flc.get(i)).get(0))%>;
                var c2_flc =<%=(data_flc.get(l_flc.get(i)).get(1))%>;
                var c3_flc =<%=(data_flc.get(l_flc.get(i)).get(2))%>;
                var c4_flc =<%=(data_flc.get(l_flc.get(i)).get(3))%>;
                var rev =<%=(revenue.get(i) )%>
                chartData.push({
                    category_flc: name_flc, 
                    column1_flc: c1_flc, 
                    column2_flc: c2_flc, 
                    column3_flc: c3_flc, 
                    column4_flc: c4_flc,
                    Revenue:rev
                    
                });
            <% } %>
                return chartData;
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
            function Feedback_Location_Chart(){
            var chartData=generateChartData();
            AmCharts.makeChart("chartdiv5",
                    {
                        "type": "serial",
                        "pathToImages": "http://cdn.amcharts.com/lib/3/images/",
                        "categoryField": "category_flc",
                        
                        "categoryAxis": {
                            "gridPosition": "start",
                            "equalSpacing":"off",
                            "axisThickness":0.1,
                            "labelRotation":90
                        },
                        panelsSettings: {
                        startDuration: 1
                        },
                        "trendLines": [],
                        "graphs": [
                            {
                                "balloonText": "[[title]] of [[category]]:[[value]]",
                                "fillAlphas": 1,
                                "id": "AmGraph-1",
                                "title": "Bad",
                                "type": "column",
                                "valueField": "column1_flc"
                            },
                            {
                                "balloonText": "[[title]] of [[category]]:[[value]]",
                                "fillAlphas": 1,
                                "id": "AmGraph-2",
                                "title": "Good",
                                "type": "column",
                                "valueField": "column2_flc"
                            },
                            {
                                "balloonText": "[[title]] of [[category]]:[[value]]",
                                "fillAlphas": 1,
                                "id": "AmGraph-3",
                                "title": "Average",
                                "type": "column",
                                "valueField": "column3_flc"
                            },
                            {
                                "balloonText": "[[title]] of [[category]]:[[value]]",
                                "fillAlphas": 1,
                                "id": "AmGraph-4",
                                "title": "Excellent",
                                "type": "column",
                                "valueField": "column4_flc"
                            },
                             {
                                    "valueAxis": "v1",
                                    "lineColor": "#FF0000",
                                    "bullet": "round",
                                    "bulletBorderThickness": 1,
                                    "hideBulletsCount": 30,
                                    "title": "Revenue",
                                    "valueField": "Revenue",
                                    "fillAlphas": 0
                                }
                        ],
                        "guides": [],
                        "valueAxes": [
                              {
                                "id": "ValueAxis-1",
                                "title": "Feedback",
                                "position": "left"
                            },
                
                            {
                                    "id": "v1",
                                    "axisColor": "#FF0000",
                                    "axisThickness": 2,
                                    "gridAlpha": 0,
                                    "title": "Revenue",
                                    "axisAlpha": 1,
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
                               
                                "text": "Feedback Analysis"
                            }
                        ],
                        "dataProvider":chartData 
                        
                    }
            );}
Feedback_Location_Chart();
        </script>
    </body>
</html>