<%--
  Created by IntelliJ IDEA.
  User: VOPER
  Date: 2020/5/26
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String flag2 = request.getParameter("flag2");
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>验证</title>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <style>
        .pwd{
            position: relative;
            top:40%;
        }
    </style>
    <script type="text/javascript">
        var flag2="<%=flag2%>";
        if ("1"==flag2){
            alert("您还未登录，请输入密码")
        }
    </script>
    <script type="text/javascript" src="resources/js/jquery-1.4.2.js"></script>
</head>
<body style="height: 800px; background: aquamarine; text-align: center">
<div class="pwd">

<%--<form action="brothercontroller.jsp" method="post">--%>
    请输入密码：<br>
    <input type="password" name="password" ><br>
    <span class="tip" style="color:red;font-size:12px"></span><br>
    <input type="button" value="登录"  id="login">
<%--</form>--%>

    <script type="text/javascript">
        $("#login").click(function(){
            //单击登录按钮的时候触发ajax事件
            $.ajax({
                url:"<%=basePath%>/brothercontroller.jsp",
                type:"post",
                data:{
                    password:$("input[name=password]").val()
                },
                dataType:"json",
                success:function(result){
                    var flag = result.flag;
                    if(flag==true){
                        //如果登录成功则跳转到成功页面
                        window.location.href="<%=basePath%>/brother.jsp";
                    }else{
                        //跳回到Index.jsp登录页面，同时在登录页面给用户一个友好的提示
                        $(".tip").text("您输入的用户名或者密码不正确");
                    }
                }

            });
        });
    </script>

</div>
</body>
</html>
