
<%@page import="com.bigdid.model.*"%>
<%@page import="com.bigdid.controller.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <script type="text/javascript" src="../js/amcharts.js"></script>
        <script type="text/javascript" src="../js/pie.js"></script>
        <script type="text/javascript" src="http://www.amcharts.com/lib/3/themes/none.js"></script>

        
            <%
                    Average_Value_Controller av= new Average_Value_Controller();
                    long feed_av[]= new long[4];
                    feed_av= (long[])getServletContext().getAttribute("Breakup"); 
                    
           %>
    <script type="text/javascript">
        function Average_Value_Chart(){
      var chart = AmCharts.makeChart("chartdiv6", {
    "type": "pie",
                "theme": "none",
               
                "dataProvider": [{
                        "range": "$1-2000",
                        "Return ": "<%=feed_av[0]%>"
                    }, {
                        "range": "$2000-4000",
                        "Return ": "<%=feed_av[1]%>"
                    }, {
                        "range": "$4000-7000",
                        "Return ": "<%=feed_av[2]%>"
                    }, {
                        "range": "$7000-10000",
                        "Return ": "<%=feed_av[3]%>"
                    }
                ],
                "titles": [
                        {
                            "id": "Title-1",
                            "size": 15,
                            "text": "Average Order Value"
                        }
                    ],
                    "colors" : ["#FE2E2E","#F7FE2E","#04B404","#0B610B"], 
                "valueField": "Return ",
                "titleField": "range",
                "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
                "exportConfig": {
                    "menuTop": "0px",
                    "menuItems": [{
                            "icon": '/lib/3/images/export.png',
                            "format": 'png'
                        }]
                }
});}
Average_Value_Chart();
 </script>
    </body>
</html>
