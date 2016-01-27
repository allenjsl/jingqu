<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="huodong_baoming.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.huodong_baoming" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>阳澄湖半岛旅游度假区</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/common.css">
	<script src="../js/zepto.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
<!--header begin-->
<header class="header center">
	<div class="hd-back font16">
		<a href="javascript:history.go(-1);">
			
		</a>
	</div>
	<div class="hd-title font24 bold">阳澄湖半岛度假区</div>
	<a class="hd-user icon" href="login.aspx"></a>
</header>
<!--header end-->
<!--outer-wrap begin-->
<div class="outer-wrap borderBox">
	<!--nav begin-->
	<!--load begin-->
	<div id="navObj"></div>
	<script>
	    $(function () {
	        $("#navObj").load("nav.aspx", function () {
	            $(".nav li").eq(4).addClass("active");
	        });
	    });
	</script>
	<!--load end-->
	<!--load注释里面内容请开发时换用include引用-->
	<!--nav end-->
	<!--inner-wrap begin-->
	<div class="inner-wrap borderBox">
		<div class="in-banner fixed borderBox">
			<div class="icon ts-banner posR"></div>
            
		</div>
		<div class="register">
            <table>
            	<Tr>
                	<td align="right">用户名：</td>
                    <td><asp:Literal ID="ltrUserInfo" runat="server"></asp:Literal></td>
                </Tr><!--
            	<Tr>
                	<td align="right">参加活动时间：</td>
                    <td><input type="text" class="register_input" name="txtPlanTime"></td>
                </Tr>
                <Tr>
                	<td align="right">手机号码：</td>
                    <td><input type="text" class="register_input" name="txtMobilePhone"></td>
                </Tr>
                <Tr>
                	<td align="right">邮箱：</td>
                    <td><input type="text" class="register_input" id="txtEmail" name="txtEmail" runat="server"></td>
                </Tr>
                <Tr>
                	<td align="right">地址：</td>
                    <td><input type="text" class="register_input" name="txtAddress"></td>
                </Tr>--><tr>
                   <td align="right">份数</td>
                   <td><input type="text" name="txtFenNumber" class="register_input_peo">份*</td>
                </tr>
                <Tr>
                	<td align="right">参加人数：</td>
                    <td><input type="text" class="register_input_peo" name="txtJoinNumber">人*</td>
                </Tr>
                
                <!--
                <Tr>
                	<td align="right">活动道具：</td>
                    <td><input type="radio" value="1" name="dj">需要 &nbsp;&nbsp;&nbsp; <input type="radio" checked="checked" value="0" name="dj">无需</td>
                </Tr>-->
                <Tr>
                	<td align="right">说明：</td>
                    <td><asp:Literal ID="ltrRemark" runat="server"></asp:Literal></td>
                </Tr>
                <Tr>
                	<td align="right">备注：</td>
                    <td><input type="text" class="register_input" name="txtRemark"></td>
                </Tr>
                <tr>
                                  <td colspan="2">
                                    <table id="tblFinaPlan" width="100%">
                                      <tr>
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>身份证号</th>
                                        <th>手机</th>
                                      </tr>
                                      <asp:Literal ID="ltrBuyContactInfo" runat="server"></asp:Literal>
                                    </table>
                                  </td>
                                </tr>
                <tr>
                	<td colspan="2">
                        <asp:Button ID="btnSubmit" CssClass="login_btn" runat="server" Text="提 交" 
                            onclick="btnSubmit_Click" /></td>
                </tr>
            </table>
        </div>
	</div>
    
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
    </form>
</body>
</html>
