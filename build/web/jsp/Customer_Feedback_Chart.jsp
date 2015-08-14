
<%@page import="com.bigdid.model.*"%>
<%@page import="com.bigdid.controller.*"%>
<%--<%@page import="Model.Customer_Model"%>--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="chartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
        
        <script type="text/javascript" src="../js/amcharts.js"></script>
        <script type="text/javascript" src="../js/pie.js"></script>
        <script type="text/javascript" src="http://www.amcharts.com/lib/3/themes/none.js"></script>

        
           <%
                  
                    int arr_cfc[]=new int[4];
                    arr_cfc= (int[])getServletContext().getAttribute("Feedback_Count");
                    
                    
           %>
    <script type="text/javascript">
        function Customer_Feedback_Chart(){
      var chart3 = AmCharts.makeChart("chartdiv3", {
    "type": "pie",
                    "theme": "none",
                    
                    "dataProvider": [{
                            "Feedback": "Bad",
                            "Count": "<%=arr_cfc[0]%>"
                        }, {
                            "Feedback": "Good",
                            "Count": "<%=arr_cfc[1]%>"
                        }, {
                            "Feedback": "Average",
                            "Count": "<%=arr_cfc[2]%>"
                        }, {
                            "Feedback": "Excellent",
                            "Count": "<%=arr_cfc[3]%>"
                        }
                    ],
                    "titles": [
                        {
                            "id": "Title-1",
                            "size": 15,
                            "text": "Feedback Overview"
                        }
                    ],
                    "colors" : ["#FE2E2E","#04B404","#F7FE2E","#0B610B"], 
                    "valueField": "Count",
                    "titleField": "Feedback",
                    "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
                    "exportConfig": {
                        "menuTop": "0px",
                        "menuItems": [{
                                "icon": '/lib/3/images/export.png',
                                "format": 'png'
                            }]
                    }
});}

 </script>
    </body>
</html>
