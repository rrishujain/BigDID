
<%@page import="com.bigdid.controller.Customer_Feedback_Ebay_Controller"%>
<%@page import="com.bigdid.model.Average_Value"%>
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
                    long count_ebay[]= new long[5];
                    
                    count_ebay= (long [])getServletContext().getAttribute("Sentiment_Ebay");
                    
           %>
    <script type="text/javascript">
        function Customer_Feedback_Ebay(){
      var chart =  AmCharts.makeChart("chartdiv_ebay", {
                "type": "pie",
                "theme": "none",
                
                "dataProvider": [{
                        "range": "Positive",
                        "Return ": "<%=count_ebay[0]%>"
                    }, {
                        "range": "Negative",
                        "Return ": "<%=count_ebay[1]%>"
                    }, {
                        "range": "Neutral",
                        "Return ": "<%=count_ebay[2]%>"
                    }
                ],
                "titles": [
                        {
                            "id": "Title-1",
                            "size": 15,
                            "text": "Ebay Sentiment Analysis"
                        }
                ],
                "colors" : ["#229022", "#FF0000", "#EEE40C"], 
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
            });
            }
 </script>
    </body>
</html>
