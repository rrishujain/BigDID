package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.bigdid.controller.Feedback_Order_Days_Controller;
import java.util.Map;
import java.util.Iterator;
import java.util.Set;
import com.bigdid.model.Sentiment_Date_Revised_one;
import java.util.HashMap;
import com.bigdid.model.Feedback_Order_Days;
import com.bigdid.controller.Customer_Feedback_Date_Controller;
import com.bigdid.controller.Customer_Sentiment_Month_Controller;
import com.bigdid.controller.Customer_Sentiment_Week_Controller;
import com.bigdid.controller.Customer_Sentiment_Date_Controller;

public final class Feedback_005fOrder_005fDays_005fChart_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>chart created with amCharts | amCharts</title>\n");
      out.write("        <meta name=\"description\" content=\"chart created using amCharts live editor\" />\n");
      out.write("\n");
      out.write("        <!-- amCharts javascript sources -->\n");
      out.write("        <script src=\"../js/amcharts.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"../js/serial.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
Feedback_Order_Days_Controller fodc=new Feedback_Order_Days_Controller();
        fodc.getFeedback();
        HashMap<String, int[]> finalDataSet_fodc = new HashMap<String, int[]>();
        finalDataSet_fodc=fodc.getFeedback();
        
      out.write("       \n");
      out.write("        \n");
      out.write("         <script type=\"text/javascript\">\n");
      out.write("            function generateChartData() {          \n");
      out.write("                chartData_date = [];\n");
      out.write("\n");
      out.write("               ");

                Set set_fodc = finalDataSet_fodc.entrySet();
        // Get an iterator
       Iterator i_fodc = set_fodc.iterator();
       
        // Display elements
        while (i_fodc.hasNext()) {
           int[] array_fodc = new int[7];
           
            Map.Entry me_fodc = (Map.Entry) i_fodc.next();
            System.out.print(me_fodc.getKey() + ": ");
            array_fodc = (int[]) me_fodc.getValue();
            
                    
                
      out.write("\n");
      out.write("                    var date = \"");
      out.print(me_fodc.getKey());
      out.write("\";\n");
      out.write("                    var excellent = \"");
      out.print(array_fodc[0]);
      out.write("\";\n");
      out.write("                    var good = \"");
      out.print(array_fodc[1]);
      out.write("\";\n");
      out.write("                    var average = \"");
      out.print(array_fodc[2]);
      out.write("\";\n");
      out.write("                    var bad = \"");
      out.print(array_fodc[3]);
      out.write("\";\n");
      out.write("                    var orderValue = \"");
      out.print(array_fodc[4]);
      out.write("\";\n");
      out.write("                    var posCount = \"");
      out.print(array_fodc[5]);
      out.write("\";\n");
      out.write("                    var negCount = \"");
      out.print(array_fodc[6]);
      out.write("\";\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                      chartData_date.push({date: date, bad: bad, positive: posCount , negative:negCount, average :average, good: good, excellent: excellent});\n");
      out.write("            ");
}
      out.write("\n");
      out.write("            \n");
      out.write("                return chartData_date;\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("        <!-- amCharts javascript code -->\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("                var chartData_date = generateChartData();\n");
      out.write("            function Customer_Feedback_Date_DoubleLineChart() {\n");
      out.write("                AmCharts.makeChart(\"chartdiv5\",\n");
      out.write("                        {\n");
      out.write("                            \"type\": \"serial\",\n");
      out.write("                            \"columnWidth\": 0.3,\n");
      out.write("                            \"pathToImages\": \"http://cdn.amcharts.com/lib/3/images/\",\n");
      out.write("                            \"categoryField\": \"date\",\n");
      out.write("                            \n");
      out.write("                            \"categoryAxis\": {\n");
      out.write("                                \"gridPosition\": \"start\"\n");
      out.write("                            },\n");
      out.write("                            \"trendLines\": [],\n");
      out.write("                            \"graphs\": [\n");
      out.write("                                {\n");
      out.write("                                    \"balloonText\": \"[[title]] of [[category]]:[[value]]\",\n");
      out.write("                                    \"fillAlphas\": 1,\n");
      out.write("                                    \"id\": \"AmGraph-1\",\n");
      out.write("                                    \"title\": \"Bad\",\n");
      out.write("                                    \"type\": \"column\",\n");
      out.write("                                    \"valueField\": \"bad\",\n");
      out.write("                                    \"valueAxis\": \"ValueAxis-1\"\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    \"balloonText\": \"[[title]] of [[category]]:[[value]]\",\n");
      out.write("                                    \"fillAlphas\": 1,\n");
      out.write("                                    \"id\": \"AmGraph-2\",\n");
      out.write("                                    \"title\": \"Good\",\n");
      out.write("                                    \"type\": \"column\",\n");
      out.write("                                    \"valueField\": \"good\",\n");
      out.write("                                    \"valueAxis\": \"ValueAxis-1\"\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    \"balloonText\": \"[[title]] of [[category]]:[[value]]\",\n");
      out.write("                                    \"fillAlphas\": 1,\n");
      out.write("                                    \"id\": \"AmGraph-3\",\n");
      out.write("                                    \"title\": \"Average\",\n");
      out.write("                                    \"type\": \"column\",\n");
      out.write("                                    \"valueField\": \"average\",\n");
      out.write("                                    \"valueAxis\": \"ValueAxis-1\"\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    \"balloonText\": \"[[title]] of [[category]]:[[value]]\",\n");
      out.write("                                    \"fillAlphas\": 1,\n");
      out.write("                                    \"id\": \"AmGraph-4\",\n");
      out.write("                                    \"title\": \"Excellent\",\n");
      out.write("                                    \"type\": \"column\",\n");
      out.write("                                    \"valueField\": \"excellent\",\n");
      out.write("                                    \"valueAxis\": \"ValueAxis-1\"\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    \"valueAxis\": \"v1\",\n");
      out.write("                                    \"lineColor\": \"#FF0000\",\n");
      out.write("                                    \"bullet\": \"round\",\n");
      out.write("                                    \"bulletBorderThickness\": 1,\n");
      out.write("                                    \"hideBulletsCount\": 30,\n");
      out.write("                                    \"title\": \"Negative Sentiments\",\n");
      out.write("                                    \"valueField\": \"negative\",\n");
      out.write("                                    \"fillAlphas\": 0\n");
      out.write("                                }, {\n");
      out.write("                                    \"valueAxis\": \"v2\",\n");
      out.write("                                    \"lineColor\": \"#229022\",\n");
      out.write("                                    \"bullet\": \"square\",\n");
      out.write("                                    \"bulletBorderThickness\": 1,\n");
      out.write("                                    \"hideBulletsCount\": 30,\n");
      out.write("                                    \"title\": \"Positive Sentiments\",\n");
      out.write("                                    \"valueField\": \"positive\",\n");
      out.write("                                    \"fillAlphas\": 0\n");
      out.write("                                },\n");
      out.write("                            ],\n");
      out.write("                            \"titles\": [\n");
      out.write("                                {\n");
      out.write("                                    \"id\": \"Title-1\",\n");
      out.write("                                    \"size\": 15,\n");
      out.write("                                    \"text\": \"Comparative Analysis with Social Media Sentiments\"\n");
      out.write("                                }\n");
      out.write("                            ],\n");
      out.write("                            \"guides\": [],\n");
      out.write("                            \"valueAxes\": [{\n");
      out.write("                                    \"id\": \"v1\",\n");
      out.write("                                    \"axisColor\": \"#FF0000\",\n");
      out.write("                                    \"axisThickness\": 2,\n");
      out.write("                                    \"gridAlpha\": 0,\n");
      out.write("                                    \"title\": \"Negative Sentiments\",\n");
      out.write("                                    \"axisAlpha\": 1,\n");
      out.write("                                    \"position\": \"right\"\n");
      out.write("                                }, {\n");
      out.write("                                    \"id\": \"v2\",\n");
      out.write("                                    \"axisColor\": \"#229022\",\n");
      out.write("                                    \"axisThickness\": 2,\n");
      out.write("                                    \"gridAlpha\": 0,\n");
      out.write("                                    \"title\": \"Positive Sentiments\",\n");
      out.write("                                    \"axisAlpha\": 1,\n");
      out.write("                                    \"position\": \"left\"\n");
      out.write("                                }],\n");
      out.write("                            \"allLabels\": [],\n");
      out.write("                            \"balloon\": {},\n");
      out.write("                            \"legend\": {\n");
      out.write("                                \"useGraphSettings\": true\n");
      out.write("                            },\n");
      out.write("                            \"dataProvider\":chartData_date\n");
      out.write("                        }\n");
      out.write("                );\n");
      out.write("\n");
      out.write("\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("<!--        <div id=\"chartdiv5\" style=\"width: 100%; height: 400px; background-color: #FFFFFF;\" ><script type=\"text/javascript\">Customer_Feedback_Date_DoubleLineChart();</script></div>-->\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
