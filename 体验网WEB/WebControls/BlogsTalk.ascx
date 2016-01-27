<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlogsTalk.ascx.cs" Inherits="Adpost.YCH.WEB.WebControls.BlogsTalk" %>
<div class="travel_raiders_text_message">
                            <table>
                                <tr>
                                    <td width="8%">&nbsp;</td>
                                    <td width="12%"></td>
                                    <td width="48%">0/140</td>
                                    <td width="18%" class="message_td1"><asp:PlaceHolder ID="phLogin" runat="server"><a href="/Login.aspx" target="_blank">登录</a>|<a href="/Register.aspx" target="_blank">注册</a></asp:PlaceHolder></td>                        
                                    <td width="14%"></td>
                                </tr>
                                <tr>
                                    <td class="message_td3"><asp:Literal ID="ltrImg" runat="server"></asp:Literal></td>
                                    <td><p><asp:Literal ID="ltrUserName" runat="server"></asp:Literal></p></td>
                                    <td colspan="2"><textarea class="messages_txra1" id="TalkRemark" name="TalkRemark"></textarea></td>
                                    <td class="message_td2"><a href="#">发表</a></td>
                                </tr>
                            </table>            
                        </div>
<script language="javascript" type="text/javascript">
    $(function () {
        $(".message_td2").click(function () {
            var remark = escape($("#TalkRemark").val());
            if (remark == "") {
                alert("请填写评论内容!");
                return;
            }
            $.ajax({
                type: "post",
                cache: false,
                url: "/CommonPage/CommentSubmit.ashx?CommentType=<%=(int)CommentType%>&HotspotId=<%=HotspotId%>&trk=" + remark,
                dataType: "json",
                success: function (ret) {
                    //ajax回发提示
                    if (ret.result != "0") {
                        alert(ret.msg);
                        window.location.reload();
                    } else {
                        alert(ret.msg);
                    }
                },
                error: function () {
                    tableToolbar._showMsg(tableToolbar.errorMsg);
                    $("#btnSave").text("保 存");
                    PageJsDataObj.BindBtn();
                }
            });

        });
    });
</script>