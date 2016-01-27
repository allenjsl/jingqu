<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Talk.ascx.cs" Inherits="Adpost.YCH.WEB.WebControls.Talk" %>
<div class="travel_raiders_text_message1">
            <table>

            	<tr>
                	<td>评论星级：</td>
                    <td colspan="4">
                        <div class="goods-comm">
                            <div class="goods-comm-stars">
                                <div id="rate-comm-1" class="rate-comm"></div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="8%">&nbsp;</td>
                    <td width="44%">0/140</td>
                    <td width="32%" class="message_td1"><asp:PlaceHolder ID="phLogin" runat="server"><a href="/Login.aspx" target="_blank">Sign in</a>|<a href="/Register.aspx" target="_blank">Registration</a></asp:PlaceHolder></td>                        
                    <td width="14%"></td>
                </tr>
                
                <tr>
                    <td class="message_td3" align="center"><asp:Literal ID="ltrLoginInfo" runat="server"></asp:Literal></td>
                    <td colspan="2"><textarea class="messages_txra3" id="TalkRemark" name="TalkRemark"></textarea></td>
                    <td class="message_td2">
                        <a href="#"">发表</a></td>
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