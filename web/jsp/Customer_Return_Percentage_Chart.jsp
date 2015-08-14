
<%@page import="java.util.ArrayList"%>
<%@page import="com.bigdid.model.*"%>
<%@page import="com.bigdid.controller.*"%>
<%--<%@page import="Model.Item_Return_Percentage"%>--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <%
                    Customer_Return_Percentage_Controller crpc= new Customer_Return_Percentage_Controller();
                    ArrayList<String> feed_crpc;
                    feed_crpc= (ArrayList<String>)getServletContext().getAttribute("Return_Feed");
                    ArrayList<String> item_crpc;
                    item_crpc = (ArrayList<String> )getServletContext().getAttribute("Return_Feed");                                   
           %>

        <script type="text/javascript">
            function generateChartData() {          
                chartData4 = [];

            <% for (int i=0; i<item_crpc.size(); i++) { %>
                var item_crpc = "<%=item_crpc.get(i)%>";
                var ReturnPer_crpc =<%=feed_crpc.get(i)%>;
                chartData4.push({item_crpc: item_crpc, ReturnPer_crpc: ReturnPer_crpc});
            <% } %>
                return chartData4;
            }
        </script>
</head>
    <body>
        
        
        <script type="text/javascript" src="../js/amcharts.js"></script>
        <script type="text/javascript" src="../js/pie.js"></script>
        <script type="text/javascript" src="http://www.amcharts.com/lib/3/themes/none.js"></script>

        
            
    <script type="text/javascript">
        
        var chartData4=generateChartData();
        function Customer_Return_Percentage_Chart(){
      var chart4 = AmCharts.makeChart("chartdiv4", {
    "type": "pie",
                    "theme": "none",
                    "dataProvider": chartData4,
                    "titles": [
                        {
                            "id": "Title-1",
                            "size": 15,
                            "text": "Return Analysis"
                        }
                    ],
                    "valueField": "ReturnPer_crpc",
                    "titleField": "item_crpc",
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
