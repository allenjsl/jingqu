<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>阳澄湖半岛旅游度假区</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/common.css">
	<script src="../js/zepto.min.js" type="text/javascript"></script>

</head>
<body>
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
		$(function(){
			$("#navObj").load("nav.aspx" ,function(){
				$(".nav li").eq(0).addClass("active");
			});
		});
	</script>
	<!--load end-->
	<!--load注释里面内容请开发时换用include引用-->
	<!--nav end-->
	<!--inner-wrap begin-->
	<div class="inner-wrap borderBox">
		<div class="in-banner fixed borderBox">
			<div class="icon dl-banner posR"></div>
            
		</div>
		<div class="login">
            <table>
            	<Tr>
                	<td><input type="text" class="username_input"></td>
                </Tr>
                <Tr>
                	<td><input type="text" class="password_input"></td>
                </Tr>
                <tr>
                	<td><input type="button" class="login_btn" value="登 录"><a href="register.aspx">立即注册</a></td>
                </tr>
                <tr>
                	<td><a href="login_find.aspx">找回密码？</a></td>
                </tr>
            </table>
        </div>
	</div>
    
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
</body>
</html>