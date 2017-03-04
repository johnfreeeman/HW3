<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type ="text/css" href="newcss1.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salary Info</title>
    </head>
    
    <%
        int hoursWorked = Integer.parseInt(request.getParameter("hoursWorked"));
        int hourlyPay = Integer.parseInt(request.getParameter("hourlyPay"));
        int preTaxDeduct = Integer.parseInt(request.getParameter("preTaxDeduct"));
        int postTaxDeduct = Integer.parseInt(request.getParameter("postTaxDeduct"));
        int overTime = hoursWorked - 40;
        double otPay = hourlyPay*1.5;
        double grossPay = (40*hourlyPay) + (overTime*otPay);    
        double preTaxPay = grossPay - preTaxDeduct;
    %>
    
    <body>
        <h1>Salary Info</h1>
        
         <table border="1">
             <tbody>
                 
                 <tr>
                    <td>Total Hours Worked:</td>
                    <td><%= hoursWorked %></td>
                 </tr>
                 
                 <tr>
                    <td>Hourly Rate:</td>
                    <td><%= hourlyPay %></td>
                 </tr>
                 
                 <tr>
                    <td># Hours Overtime:</td>
                    <td>
                        <%
                            int[]Hours;
                            if (hoursWorked > 40)
                            {
                                out.print(overTime);
                            }else
                                out.print("0");
                        %>
                    </td>
                 </tr>
                 
                 <tr>
                     <td>Overtime Hourly Rate:</td>
                     <td><%
                         if(hoursWorked>40)
                         {
                             out.print(otPay);
                         }else
                            out.print("0");
                     %></td>
                 </tr>
                 
                 <tr>
                     <td>Gross Pay:</td>
                     <td>
                         <%
                         if(hoursWorked>40)
                         {
                             out.print(grossPay);
                         }else
                            out.print(hoursWorked*hourlyPay);
                        %>
                     </td>
                 </tr>
                 
                 <tr>
                     <td>Pre-tax Deduct:</td>
                     <td><%=preTaxDeduct%> </td>
                 </tr>
                 
                 <tr>
                     <td>Pre-tax Pay:</td>
                     <td>
                         <%
                          out.print(preTaxPay);
                         %>
                     </td>
                 </tr>
                 
                 <tr>
                     <td>Tax Amount:</td>
                     <td>
                         <%
                             if(grossPay < 500) {
                                 out.print(preTaxPay*0.18);
                             }
                             else
                                out.print(preTaxPay*0.22);
                         %>
                     </td>
                 </tr>
                 
                 <tr>
                     <td>Post-tax Pay:</td>
                     <td>
                         <%
                             if(grossPay < 500) {
                                 out.print(preTaxPay-(preTaxPay*0.18));
                             }else
                                out.print(preTaxPay-(preTaxPay*0.22));
                         %>
                     </td>
                 </tr>
                 
                 <tr>
                     <td>Post-tax Deduct:</td>
                     <td>
                         <%=postTaxDeduct%>
                     </td>
                 </tr>
                 
                 <tr>
                     <td>Net Pay:</td>
                     <td>
                         <%
                             if(grossPay <500)
                             {
                                 out.print((preTaxPay-(preTaxPay*0.18))-postTaxDeduct);
                             }
                             else
                                 out.print((preTaxPay-(preTaxPay*0.22))-postTaxDeduct);
                         %>
                     </td>
                 </tr>
                    
             </tbody>
         </table>
    </body>
</html>
