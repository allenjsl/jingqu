//右侧浮动框
	$(document).ready(function() {
		
		$(".ctrolPanel-left").mousemove(function(){
			$(this).html("").animate({right:"-24px"});
			$(".ctrolPanel").animate({right:'0px'}); 
			});
		
		$("#floatPanel").mouseleave(function(){
			$(".ctrolPanel").animate({right:'-50px'}); 
			$(".ctrolPanel-left").html("<<").animate({right:"0px"});
			$(".search_open,.service_open,.language_open,.tianqi_open").hide();
			});
		
		//$(".tianqi_open").hide();
		$(".tianqi").mousemove(function(){
			$(".search_open,.service_open,.language_open").hide();
			$(this).removeClass("tianqi_over").addClass("tianqi_on")
			$(".tianqi_open").fadeIn(200);
			}).mouseleave(function(){
				$(this).removeClass("tianqi_on").addClass("tianqi_over")
				});
		$(".tianqi_open").mouseleave(function(){
			$(this).fadeOut(200);
			});
		
        //$(".language_open").hide();
		$(".language").mousemove(function(){
			$(".search_open,.service_open,.tianqi_open").hide();
			$(this).removeClass("language_over").addClass("language_on")
			$(".language_open").fadeIn(200);
			}).mouseleave(function(){
				$(this).removeClass("language_on").addClass("language_over")
				});
		$(".language_open").mouseleave(function(){
			$(this).fadeOut(200);
			});
			
		//$(".search_open").hide();
		$(".search").mousemove(function(){
			$(".language_open,.service_open,.tianqi_open").hide();
			$(this).removeClass("search_over").addClass("search_on")
			$(".search_open").fadeIn(200);
			}).mouseleave(function(){
				$(this).removeClass("search_on").addClass("search_over")
				});
		$(".search_open").mouseleave(function(){
			$(this).fadeOut(200);
			});
			
		//$(".service_open").hide();
		$(".service").mousemove(function(){
			$(".language_open,.search_open,.tianqi_open").hide();
			$(this).removeClass("service_over").addClass("service_on")
			$(".service_open").fadeIn(200);
			}).mouseleave(function(){
				$(this).removeClass("service_on").addClass("service_over")
				});
		$(".service_open").mouseleave(function(){
			$(this).fadeOut(200);
			});
			
		$(".arrow").mousemove(function(){
			$(".search_open,.service_open,.language_open,.tianqi_open").hide();
			});	
			
    });


//购物数量及价格的计算
function update_pro_quantity(direction){
    var price_one = parseFloat($(".order_price").html());
    var num = parseFloat($(".order_ip1").val());
	if(direction == "down"){
		var num_after = num - 1;
		 if(num_after == 0 ){
			 window.confirm("温馨提示：购买数量不能小于1！")
			 num_after = 1;
			 }
		$(".order_ip1").val(num_after);
		}else{
			var num_after = num + 1;
		$(".order_ip1").val(num_after);
			}
	var price_all = price_one * num_after
	
	$(".order_p2").html(price_all);
	
	}
	
//购物页面验证	
$(document).ready(function() {
	$(".order_ip2").focus(function(){
		$(this).addClass("order_ip3")		
		}).blur(function(){
			var tel = /^1[34589]\d{9}$/
			if(!tel.test(this.value)){
				 window.confirm("温馨提示：您输入的手机号码不正确，请出新输入！")
				}else{
					var tel1 = $(this).val();
					$(this).removeClass("order_ip3");
					}
			});
	});
	
//填写预定订单 验证	
$(document).ready(function() {
	$("#phone_check").focus(function(){
		$(this).addClass("hotel_ip3")		
		}).blur(function(){
			var tel = /^1[34589]\d{9}$/ 
			if(!tel.test(this.value)){
				 window.confirm("温馨提示：您输入的手机号码不正确，请出新输入！")
				}
			});
	});	
	
	
//酒店确认订单页面验证		
$(document).ready(function() {
	//手机验证
	$("#order_tel").focus(function(){
		$(this).addClass("list_order_input2")		
		}).blur(function(){
			var tel = /^1[34589]\d{9}$/
			if(!tel.test(this.value)){
				 window.confirm("温馨提示：您输入的手机号码不正确，请出新输入！")
				}else{
					var tel1 = $(this).val();
					$(this).removeClass("list_order_input2");
					}
			});
			
	//邮箱验证
	$("#order_mail").focus(function(){
		$(this).addClass("list_order_input2")		
		}).blur(function(){
			var mailFor = /^[0-9a-zA-Z_]+@[0-9a-zA-Z]+\.[a-zA-Z]/
			if(!mailFor.test(this.value)){
				 window.confirm("温馨提示：邮箱格式不正确，请出新输入！")
				}else{
					var tel1 = $(this).val();
					$(this).removeClass("list_order_input2");
					}
			});
	
	//地址修改
	$("#order_address").focus(function(){
		$(this).addClass("list_order_input2")		
		}).blur(function(){
			$(this).removeClass("list_order_input2");
			});
	
	//备注修改
	$("#order_bz").focus(function(){
		$(this).addClass("list_order_are2")		
		}).blur(function(){
			$(this).removeClass("list_order_are2");
			});
	});
	
	
//登录注册弹出层
$(document).ready(function(){
	$(".login").click(function(){
		Popuplayer({
			LayerId:"Monver_login",//层ID
			Masklayer:"cxc",//遮罩层ID
			CloseID:"close",//退出id
			Fun:function(){} //关闭时是否回调函数
		});
	});
	
	$(".member_card_btn").click(function(){
		Popuplayer({
			LayerId:"Monver_register",//层ID
			Masklayer:"cxc",//遮罩层ID
			CloseID:"close",//退出id
			Fun:function(){} //关闭时是否回调函数
		});
	});
	
	$(".submit_btn").click(function(){
		$(".register table").hide();
		$(".register_img").show();
		})
	
	$(".code").click(function(){
		Popuplayer({
			LayerId:"Monver_code",//层ID
			Masklayer:"cxc",//遮罩层ID
			CloseID:"close1",//退出id
			Fun:function(){} //关闭时是否回调函数
		});
	});
	
	$(".code1").click(function(){
		Popuplayer({
			LayerId:"Monver_code1",//层ID
			Masklayer:"cxc",//遮罩层ID
			CloseID:"close2",//退出id
			Fun:function(){} //关闭时是否回调函数
		});
	});
	
	$(".login_reg").click(function(){
		$("#Monver_login").remove();
		$("#Monver_register").show();
		Popuplayer({
			LayerId:"Monver_register",//层ID
			Masklayer:"cxc",//遮罩层ID
			CloseID:"close",//退出id
			Fun:function(){} //关闭时是否回调函数
		});
		});
	$(".register").click(function(){
		$("#Monver_login").remove();
		$("#Monver_register").show();
		Popuplayer({
			LayerId:"Monver_register",//层ID
			Masklayer:"cxc",//遮罩层ID
			CloseID:"close",//退出id
			Fun:function(){} //关闭时是否回调函数
		});
		});
});
	
//注册验证	
$(document).ready(function() {
	//用户名验证
   $("#username").blur(function(){
	   $("#usernameTip_error").hide();
	   if($("#username").val()==""){
		   $("#usernameTip_error").show().html("用户名不能为空！");		   
		   }else{
			   
			   $("#usernameTip_true").show().html("");
			   }
	   }).focus(function(){
		   $("#usernameTip_true").hide();
		   $("#usernameTip_error").show().html("请填写用户名");
		   });
	
	//验证
   $("#truename").blur(function(){
	   $("#truenameTip_error").hide();
	   if($("#truename").val()==""){
		   $("#truenameTip_error").show().html("不能为空！");		   
		   }else{
			   
			   $("#truenameTip_true").show().html("");
			   }
	   }).focus(function(){
		   $("#truenameTip_true").hide();
		   $("#truenameTip_error").show().html("请填写真实姓名");
		   });
	
	//验证
   $("#membertel").blur(function(){
	   $("#membertelTip_error").hide();
	        var tel = /^1[34589]\d{9}$/
			if(!tel.test(this.value)){
		   $("#membertelTip_error").show().html("格式不正确！");		   
		   }else{
			   
			   $("#membertelTip_true").show().html("");
			   }
	   }).focus(function(){
		   $("#membertelTip_true").hide();
		   $("#membertelTip_error").show().html("请填写手机号码");
		   });
	
	//密码验证
	$("#userpwd").blur(function(){
	   $("#userpwdTip_error").hide();
	   if($("#userpwd").val()==""){
		   $("#userpwdTip_error").show().html("密码不能为空！");		   
		   }else{
			   
			   $("#userpwdTip_true").show().html("");
			   }
	   }).focus(function(){
		   $("#userpwdTip_true").hide();
		   $("#userpwdTip_error").show().html("仅填写字母和数字");
		   });

	//确认密码验证
	$("#userpwd1").blur(function(){
	   $("#userpwd1Tip_error").hide();
	   if(this.value != $("#userpwd").val() || this.value==""){
		   $("#userpwd1Tip_error").show().html("密码不一致！");		   
		   }else{
			   
			   $("#userpwd1Tip_true").show().html("");
			   }
	   }).focus(function(){
		   $("#userpwd1Tip_true").hide();
		   $("#userpwd1Tip_error").show().html("提示：密码保持一致");
		   });

	//邮箱验证
	$("#usermail").blur(function(){
	   $("#usermailTip_error").hide();
	   var mailFor = /^[0-9a-zA-Z_]+@[0-9a-zA-Z]+\.[a-zA-Z]/
	   if(!mailFor.test(this.value)){
		   $("#usermailTip_error").show().html("邮箱格式不正确！");		   
		   }else{
			   
			   $("#usermailTip_true").show().html("");
			   }
	   }).focus(function(){
		   $("#usermailTip_true").hide();
		   $("#usermailTip_error").show().html("请输入正确的邮箱");
		   });

});
	
	
//下拉框美化	
$(document).ready(function() {
	$(".pane_search_choose_main").click(function(){
		$(".pane_search_choose_list").slideDown(300);
		$(".pane_search_choose_list").find("p").click(function(){
			var Info = $(this).html();
			$(".pane_search_choose_main").html(Info);
			$(".pane_search_choose_list").fadeOut(500);
			});
		});
		
	$(".pane_search_choose_main1").click(function(){
		$(".pane_search_choose_list1").slideDown(300);
		$(".pane_search_choose_list1").find("p").click(function(){
			var Info = $(this).html();
			$(".pane_search_choose_main1").html(Info);
			$(".pane_search_choose_list1").fadeOut(500);
			});
		});
	
	$(".pane_search_choose_main_1").click(function(){
		$(".pane_search_choose_list_2").fadeOut(500);
		$(".pane_search_choose_list_3").fadeOut(500);
		$(".pane_search_choose_list_4").fadeOut(500);
		
		$(".pane_search_choose_list_1").slideDown(300);
		$(".pane_search_choose_list_1").find("p").click(function(){
			var Info = $(this).html();
			$(".pane_search_choose_main_1").html(Info);
			$(".pane_search_choose_list_1").fadeOut(500);
			});
		});
	
	$(".pane_search_choose_main_2").click(function(){
		$(".pane_search_choose_list_1").fadeOut(500);
		$(".pane_search_choose_list_3").fadeOut(500);
		$(".pane_search_choose_list_4").fadeOut(500);
		
		$(".pane_search_choose_list_2").slideDown(300);
		$(".pane_search_choose_list_2").find("p").click(function(){
			var Info = $(this).html();
			$(".pane_search_choose_main_2").html(Info);
			$(".pane_search_choose_list_2").fadeOut(500);
			});
		});

	$(".pane_search_choose_main_3").click(function(){
		$(".pane_search_choose_list_2").fadeOut(500);
		$(".pane_search_choose_list_1").fadeOut(500);
		$(".pane_search_choose_list_4").fadeOut(500);
		
		$(".pane_search_choose_list_3").slideDown(300);
		$(".pane_search_choose_list_3").find("p").click(function(){
			var Info = $(this).html();
			$(".pane_search_choose_main_3").html(Info);
			$(".pane_search_choose_list_3").fadeOut(500);
			});
		});
	
	$(".pane_search_choose_main_4").click(function(){
		$(".pane_search_choose_list_2").fadeOut(500);
		$(".pane_search_choose_list_3").fadeOut(500);
		$(".pane_search_choose_list_1").fadeOut(500);
		
		$(".pane_search_choose_list_4").slideDown(300);
		$(".pane_search_choose_list_4").find("p").click(function(){
			var Info = $(this).html();
			$(".pane_search_choose_main_4").html(Info);
			$(".pane_search_choose_list_4").fadeOut(500);
			});
		});
});	
	
	
	

	$(document).ready(function() {
        $("#peo1").click(function(){
			$("#hotel_down1").fadeIn(500);
			$("#hotel_down1").mouseleave(function(){
				$("#hotel_down1").fadeOut(500);
				});
			$("#hotel_down1 li").mousemove(function(){
				$(this).addClass("hotel_li1")
				
				}).mouseleave(function(){
					$(this).removeClass("hotel_li1")
					
					});
			$("#hotel_down1 li").click(function(){
				var num = $(this).html();
				$("#peo1").val(num);
				$("#hotel_down1").fadeOut(500);
				});
			});
		$("#peo2").click(function(){
			$("#hotel_down2").fadeIn(500);
			$("#hotel_down2").mouseleave(function(){
				$("#hotel_down2").fadeOut(500);
				});
			$("#hotel_down2 li").mousemove(function(){
				$(this).addClass("hotel_li2")
				
				}).mouseleave(function(){
					$(this).removeClass("hotel_li2")
					
					});
			$("#hotel_down2 li").click(function(){
				var num = $(this).html();
				$("#peo2").val(num);
				$("#hotel_down2").fadeOut(500);
				});
			});
				
    });

//行程定制保存判断		
$(document).ready(function() {
    $(".save_btn").click(function(){
		var timeTip = $(".xcdz_input1").val()
		var time =/[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}/
		if($(".xcdz_input2").val()==""){
			alert("行程名称不能为空！")
			}
		if(!time.test($(".xcdz_input1").val())){
			
			alert("行程日期格式不正确！(示例:2014-09-02)")
			}
		});
});	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	