<%@ page import="org.json.JSONObject" %><%
String password=request.getParameter("password");
session.setAttribute("password",password);
    JSONObject jsonObject=null;
if("chenkefu".equals(password)){
//response.sendRedirect(request.getContextPath()+"brother.jsp");
    jsonObject = new JSONObject("{flag:true}");
}else{
//    response.sendRedirect(request.getContextPath()+"1.jsp?flag=1");
    jsonObject = new JSONObject("{flag:false}");
}
response.getOutputStream().write(jsonObject.toString().getBytes("utf-8"));
%>