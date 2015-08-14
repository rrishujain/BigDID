
<%@page import="com.bigdid.controller.Customer_Feedback_Amazon_Controller"%>
<%@page import="com.bigdid.model.Average_Value"%>
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
                    long count_cfac[]= new long[5];
                    
                    count_cfac= (long [])getServletContext().getAttribute("Sentiment_Amazon");
                    
           %>
    <script type="text/javascript">
        function Customer_Feedback_Amazon(){
      var chart = AmCharts.makeChart("chartdiv_amazon", {
    "type": "pie",	
	"theme": "none",
   
    "dataProvider": [{
        "range": "Positive",
        "Return ": "<%=count_cfac[0]%>"
    }, {
        "range": "Negative",
        "Return ": "<%=count_cfac[1]%>"
    }, {
        "range": "Neutral",
        "Return ": "<%=count_cfac[2]%>"
    }
    ],
     "titles": [
                        {
                            "id": "Title-1",
                            "size": 15,
                            "text": "Amazon Sentiment Analysis"
                        }
                ],  
                "colors" : ["#229022", "#FF0000", "#EEE40C"], 
    "valueField": "Return ",
    "titleField": "range",
    "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
    "exportConfig": {
        "menuTop":"0px",
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
