<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Adpost.YCH.WEB.Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>退出登陆</title>
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" charset="utf-8" data-appid="<%=QQAppid %>" data-redirecturi="<%=Request.Url.AbsoluteUri %>" data-callback="true"></script>
    <script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=<%=WBAppid %>&debug=true" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        QC.Login.signOut();
        /*
        WB2.logout(function () {
        });
        */
        $.ajax({
            type: "post",
            cache: false,
            url: "Logout.aspx?dotype=Logout",
            dataType: "json",
            success: function (ret) {
                //ajax回发提示
                if (ret.result != "0") {
                    //alert(ret.msg);
                    window.location.href = "/";
                } else {
                    alert(ret.msg);
                }
            },
            error: function () {
                tableToolbar._showMsg(tableToolbar.errorMsg);
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
