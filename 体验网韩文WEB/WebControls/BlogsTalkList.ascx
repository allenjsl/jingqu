<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlogsTalkList.ascx.cs" Inherits="Adpost.YCH.WEB.WebControls.BlogsTalkList" %>
<div class="travel_raiders_text_messagelist">
                            <ul>
                                <asp:Repeater ID="rptMsgList" runat="server" OnItemDataBound="rptMsgList_ItemDataBound">
                    <ItemTemplate>
                        <li>
                    <table class="message_table">
                        <tr>
                            <td width="8%"><img src="../images/travel_raiders_tx_img1.jpg"></td>
                            <td width="12%"><p><%#Eval("name") %><br/><span><%#Eval("commenttime","{0:yyyy-MM-dd}") %></span></p></td>
                            <td width="66%" class="message_td4" colspan="2"><p><%#Eval("content") %></p></td>                    			<td width="14%" class="message_td5"><span onClick="messageOpen()" class="message_click" TID="<%#Eval("id") %>">回复</span><span>举报</span></td>
                        </tr>
                    </table>
                    <div class="message_reply"></div>
                    <asp:Repeater ID="rptReplyList" runat="server">
                    <ItemTemplate>
                    <div class="message_reply_show">
                        <p><%#Eval("content") %></p>
                        <span>来自<%#Eval("name") %>的回复    <%#Eval("commenttime","{0:yyyy-MM-dd}") %></span>
                    </div></ItemTemplate>
                </asp:Repeater>
                </li>
                    </ItemTemplate>
                </asp:Repeater>
                            </ul>
                        </div>
<script type="text/javascript">
    function TalkReply(obj) {
        var tr = $(obj).closest("tr");
        var ReplyRemark = escape(tr.find("textarea[name='replyRemark']").val());
        var talkid = tr.find("input[name='hidTalkId']").val();
        if (ReplyRemark == "" || talkid == "") {
            alert("请填写评论内容!");
            return;
        }
        //回复
        $.ajax({
            type: "post",
            cache: false,
            url: "/CommonPage/CommentSubmit.ashx?talkid=" + talkid + "&CommentType=<%=(int)CommentType%>&HotspotId=<%=HotspotId%>&trk=" + ReplyRemark,
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
    }
    $(document).ready(function (e) {
        $(".message_click").click(function () {
            var talkId = $(this).attr("TID");
            var html = '<table><tr><td colspan="2">0/140</td></tr><tr><td><textarea name="replyRemark" id="replyRemark" class="messages_txra2"></textarea><input type="hidden" name="hidTalkId" id="hidTalkId" value="' + talkId + '"></td><td><a href="javascript:void(0);" onclick="TalkReply(this)">发表</a></td></tr></table>'
            //var messageDiv = $(this).parents("li").find(".message_reply").html();
            var messageDiv1 = $(this).parents("li").find(".message_reply").html();
            //if (messageDiv == "") {
            //    $(this).parents("li").find(".message_reply").append(html).addClass("message_reply_border");
            //}
            if (messageDiv1 == "") {
                $(this).parents("li").find(".message_reply").append(html).addClass("message_reply_border");
            }

        });
    });
 </script>