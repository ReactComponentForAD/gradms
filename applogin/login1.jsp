<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta name="renderer" content="ie-stand" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>山东大学研究生信息管理系统</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/applogin/css/login/index2.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/applogin/css/login/p_login2.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/applogin/css/login/theLoginDialog.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/applogin/css/login/base2.css"/>  <!--放在最后的样式表-->
<script type="text/javascript" src="<%=request.getContextPath()%>/applogin/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/applogin/js/navigatorversion.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/applogin/js/theLoginDialog.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/applogin/js/client_info.js"></script>

<script type='text/javascript'>
function loginAutoLogin(){
	    	loginGetCookie("login_strLoginName","username");
			loginGetCookie("login_strPassword","password");
			loginCheckAuto();
			if('null'!='null'){
				document.all("btn_submit").disabled = false;
				return false;
			}else{
				// todo();
			}
	    }
	    
function loginGetCookie(showText, name)
	    {
			var arg = name + "="; // 要查找的对象
			var arglength = arg.length;
			var cookielength = window.document.cookie.length;
			var i = 0;
			while (i < cookielength)
			{
				var j = i + arglength;
				if (window.document.cookie.substring(i, j) == arg) {
					document.all(showText).value = loginGetCookieVal (j);
					return true;
				}
				i = window.document.cookie.indexOf(" ", i) + 1;
				if (i == 0)
					break;
			}
			return true;
	    }

	    
function loginGetpwd(){
    		var name = strTrim(document.all("login_strLoginName").value);
    		document.all("login_strLoginName").value = name;

    		if(isEmpty(name)){
    			document.getElementById("msgSpan").innerHTML = "请输入登录名";
    			document.all("login_strLoginName").focus();
    			return false;
    		}

            document.getElementsByName("loginAction")[0].disabled = true;
            document.getElementsByName("loginAction")[0].onclick = null;
    		document.getElementsByName("btn_GetPwd")[0].disabled = true;
    		document.getElementsByName("btn_GetPwd")[0].onclick = null;
    		var path= document.getElementById("contextPath").value;
    		document.forms[0].action=path+"/getPwd.do";
    		document.forms[0].submit();
    	}
    	
function loginCheckAuto(){
	    	var checkValue = loginGetCookieValue("autocheck");
	    	if(checkValue=="true")
	    		document.all("login_autoLoginCheckbox").checked = checkValue;
	    }
	    
function testInvalidString(invalidString){
		if(invalidString == null || invalidString == "" || invalidString== "null"){
			return false;
		}
		else{
			var point;
			var output=invalidString;
			var spls = new Array();
			point=output.indexOf("/");
			if(point!=-1){
				var j=0;

				while(point!=-1){
					spls[j++]=output.substring(0, point);
					output = output.substring(point + 1);
					point=output.indexOf("/");
					if (point == -1) {
						spls[j++] = output;
					}
				}
				for(m=0;m<j;m++){
					var t=0;
					var arrs = new Array();
					var end=spls[m].indexOf(":");
					while (end != -1) {
						arrs[t++] = spls[m].substring(0, end);
						spls[m] = spls[m].substring(end + 1);
						end = spls[m].indexOf(":");
						if (end == -1) {
							arrs[t++] = spls[m];
						}
					}
					var obj = document.getElementsByName(arrs[0])[0];
					if((obj.value.length==0&&arrs[2]=="null")||(obj.value==-1&&arrs[2]=="null")){
						alert(arrs[3]);
						return true;
					}
				}
			}else{
				var i=0;
				var arrs = new Array();
				var end=output.indexOf(":");
				while (end != -1) {
					arrs[i++] = output.substring(0, end);
					output = output.substring(end + 1);
					end = output.indexOf(":");
					if (end == -1) {
						arrs[i++] = output;
					}
				}
				var obj = document.getElementsByName(arrs[0])[0];
				if((obj.value.length==0&&arrs[2]=="null")||(obj.value==-1&&arrs[2]=="null")){
					alert(arrs[3]);
					return true;
				}
			}
		}
	}

	
function loginGetCookieValue(name){
	    	var arg = name + "="; // 要查找的对象
			var arglength = arg.length;
			var cookielength = window.document.cookie.length;
			var i = 0;
			while (i < cookielength)
			{
				var j = i + arglength;
				if (window.document.cookie.substring(i, j) == arg) {
					return loginGetCookieVal (j);
				}
				i = window.document.cookie.indexOf(" ", i) + 1;
				if (i == 0)
					break;
			}
			return null;
	    }
				
function loginLoginAction(){
		    //var path= document.getElementById("contextPath").value;
			var name = $("#login_strLoginName").val().trim();
			document.getElementsByName("login_strLoginName")[0].value= name;
			var pw   = $("#login_strPassword").val();
		    var strVerify = $("#login_strVerify").val();// 获取输入框信息
			if (name == null || name==""||name==undefined) {
				alert("请输入登录名 ");
				document.getElementsByName("login_strLoginName")[0].focus();
				return false;
			}
			if (pw == null || pw == ""||pw==undefined) {
				alert("请输入密码！");
				document.getElementsByName("login_strPassword")[0].focus();
				return false;
			}
			if (strVerify == null || strVerify == ""||strVerify==undefined) {
				alert("请输入验证码！");
		        document.getElementById("login_strVerify").focus();
				return false;
			}
		
			document.getElementsByName("loginAction")[0].disabled = true;
			document.getElementsByName("loginAction")[0].onclick = null;
			//alert("开始存入cookie ");
			loginSetCookie();
			var ttt = "<%=request.getContextPath() %>/bsuims/bsMainFrameInit.do";
 			document.forms[0].action= ttt;
			document.forms[0].submit();
		}
function loginGetCookieVal (offset)
		{
			var endstr = window.document.cookie.indexOf (";", offset);
			if (endstr == -1)
			endstr = window.document.cookie.length;
			return unescape(window.document.cookie.substring(offset, endstr));
	    }

/* 存入cookie */	    
function loginSetCookie(){
    		var userValue = document.getElementsByName("login_strLoginName")[0].value;
    		//alert(userValue);
    		var exp = new Date();
			exp.setTime(exp.getTime() + (30*24*60*60*1000));
			window.document.cookie = "username=" + escape (userValue) + "; expires=" + exp.toGMTString()+";path=/";

    		var auto = document.getElementsByName("login_autoLoginCheckbox")[0];

    		if(auto.checked)
    		{
    			var password = document.getElementsByName("login_strPassword")[0].value;
    			window.document.cookie = "password="+escape(password)+"; expires=" + exp.toGMTString()+";path=/";
    			window.document.cookie = "autocheck=true; expires="+ exp.toGMTString()+";path=/";
    		}else{
    			window.document.cookie = "password=; expires=" + exp.toGMTString()+";path=/";
    			window.document.cookie = "autocheck=false; expires="+ exp.toGMTString()+";path=/";
    		}

    	}

    	
function layoutLoginNoVeralign(){
	    	loginAutoLogin();
	    }
 
$(window).load(function() {
	var error = document.getElementById("error");
	if (error.value != null && error.value != "") {
		alert(error.value);
	}
});

function repaintImage(){
    var img = document.getElementById("validateImage");
    img.src = "validatecode.jpg?rnd=" + Math.random()  ;  // 防止浏览器缓存的问题
}
</script>


<style type="text/css">
	.silder_div_img{
		width:100%;
		height:418px;
	}
	.silder_list li{
		position:absolute;
		left:0;
		top:0;
		z-index:1;
	}
	.bannerBtn{
		width:300px;
		height:4px;
		position:absolute;
		left:50%;
		margin-left:-150px;
		z-index:120;
		bottom:25px;
	}
	.bannerBtn li{
		float:left;
		width:75px;
		height:4px;
		background:#fff;
		margin-right:20px;
		cursor:pointer;
	}
	.bannerBtn li.active{
		background:#0066B3;
	}
</style>


</head>
<body id="portfolio" class="sel_portfolio"   onload = "layoutLoginNoVeralign()">
    <div class="w">
        <div class="header">
			<div id="navigation">
			</div>
			<div class="menu">
				<div class="menuL">
					<table class="cell" width="100%">
						<tbody>
							<tr>
								<td class="td1">
									<img src="<%=request.getContextPath()%>/applogin/img/schoollogo.png" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
        </div>
		<div class="topbg"></div>
    </div>
    <div class="banner" style="overflow: hidden;">
		<ul class="silder_list clearfix" id="silder_list" style="width:100%;height:418px;">
			<li class="silder_div_img" id="img0" style="opacity: 0; background: url(<%=request.getContextPath()%>/applogin/images/back1.png) 50% 50% no-repeat;"></li>
			<li class="silder_div_img" id="img1" style="opacity: 0; background: url(<%=request.getContextPath()%>/applogin/images/back2.png) 50% 50% no-repeat;"></li>
			<li class="silder_div_img" id="img2" style="opacity: 1; background: url(<%=request.getContextPath()%>/applogin/images/back3.png) 50% 50% no-repeat;"></li>
		</ul>
		<ol class="bannerBtn">
			<li class="active"></li>
			<li></li>
			<li></li>
		</ol>
		<div style="width:960px;height:418px;position:absolute;top:0;left:50%;margin-left:-480px;z-index:2;">
		  <div class="login_w" style="width: 960px;height: 400px;position:absolute;right:0px;top:50%;margin-top:-210px;">
		  <!-- 登录iframe区域 start -->
		      <input type="hidden" id="error" value="${msg}" />
			  <form name="form" id="form" action="<%=request.getContextPath() %>/bsuims/bsMainFrameInit.do" method="post">
				  <div class="login_div">
					  <table class="div_tab" id="Wrap_searchbar">
						  <tbody>
						  <tr style="height:47px;">
							  <td>
								  <div class="lgn_txt">登录研究生信息管理系统</div>
							  </td>
						  </tr>
						  <tr style="height:47px;">
							  <td>
								  <div class="ipt_cn ">
									  <span id="strLoginName_SHOW" class="holderClass" onclick="showSpanForIE8(this,'strLoginName');" >用户名</span>
									  <input class="Wrap_input_search" type="text" id="login_strLoginName" name="login_strLoginName" value= '' placeholder="" >
								  </div>
							  </td>
						  </tr>
						  <tr style="height:47px;">
							  <td id="passWord_tr">
								  <div class="ipt_pwd">
									  <span id="strPassword_SHOW" class="holderClass" onclick="showSpanForIE8(this,'strPassword');">密码</span>
									  <input class="Wrap_input_search" id="login_strPassword" name="login_strPassword" value= '' type="password" placeholder="" minlength="6" maxlength="20"  style="color:#333;" >
								  </div>
							  </td>
						  </tr>						  
						  <!--添加验证码 start-->
						  <tr style="height:47px;">
							  <td>
								<table id="tableVerify">
									<tr >
										<td><span class="info" align='right'>验证码:  &nbsp;</span></td>
										<td><input type="text" name="login_strVerify" id="login_strVerify" class="verify" class="input-text" /></td>
										<td><img id="validateImage" src="validatecode.jpg" /></td>
										<td ><a href="#" onclick="repaintImage();"style="text-decoration: none;color: #0066b3">换一张</a><td>
									</tr>
								</table>
						      </td>
						  </tr>
						  <!--添加验证码 end-->
						  <tr style="height:47px;">
							  <td>
								  <input type="submit" value="登 录" id="btn_submit" name="loginAction" onclick="return loginLoginAction();" style="width: 265px;height: 40px;background: #2F8DBC;border-radius: 5px;outline: none;color: #fff;font-size: 20px;border: 0; margin-bottom: 16px;">
							  </td>
						  </tr>
						  </tbody>
					  </table>
					  <div class="tourist_txt2">
						       <div class="tourist_txt" style="width:85px;color:#3f3f3f;cursor:auto;">
									  <input type="checkbox" name="login_autoLoginCheckbox" value = '1' id="ALIASCHECK" />
									  <span>记住密码</span>
							   </div>					       
						       <a  class="tourist_txt_rht"  style="text-align: right;width: 55px;" href="<%=request.getContextPath() %>/forgetPassword.jsp">忘记密码</a>				       						      						       						       					  
				      </div>
			      </div>
			  </form>
		  <!-- 登录框 END-->
		   </div>
		</div>
	</div>     
    <div id="LoginNav">
			<p class="LoginNavTitle">
				<i class="labaIoc" style="float:left;"></i>
				<span class="InfoTitle" style="float:left;margin-left:3px;"></span>
				<span class="Infocontent">
				  <MARQUEE style="float:left;margin-top:11px;margin-left:5px;width:800px;" onmouseover="this.stop();this.scrollDelay=50;" onmouseout="this.start();this.scrollDelay=1" scrollAmount=4 scrollDelay=1 direction=left >
				  <script type="text/javascript">
					var arr ="欢迎来到山东大学";
					document.writeln(arr);
					ableNotice = true;
				  </script>
			      </MARQUEE>
				</span>
			</p>
			<div class="LoginNavContent clearfix">
				<div class="LoginNavContent_left">
					<div class="list list1">
						<dl>
							<dt>
								<i></i>
								<span>友情提示：</span>
							</dt>
							<dd>（1）学生登陆为学生学号，缺省密码为前缀D（博士）/ 硕士（M）+证件号码后7位，证件号码中的字母为大写字母</dd>
							<dd>
							<dd>（2）建议使用9.0以上的IE浏览器或google浏览器,360浏览器请选用极速模式</dd>
						</dl>
					</div>

				</div>
			</div>
		</div>
        <!-- 页脚 START-->
        <div class="footer">
	        <div class="clear"></div>
	        <div class="foot_bottom">
	             <div class="footin">
						Copyright © 山东大学研究生院 &nbsp;&nbsp; 
	             </div>
	        </div>
     </div>
        <!-- 页脚 END-->
    </div>

</body>
</html>

<script type="text/javascript">
/*placeholder 兼容IE6 的设置  js  start*/	
var JPlaceHolder = {
	//检测
	_check : function(){
		return 'placeholder' in document.createElement('input');
	},
	//初始化
	init : function(){
		if(!this._check()){
			this.fix();
		}
	},
	//修复
	fix : function(){
		jQuery(':input[placeholder]').each(function(index, element) {
			var self = $(this), txt = self.attr('placeholder');
			self.wrap($('<div></div>').css({position:'relative', zoom:'1', border:'none', background:'none', padding:'none', margin:'none'}));
			var pos = self.position(), h = self.outerHeight(true), paddingleft = self.css('padding-left');
			var holder = $('<span></span>').text(txt).css({position:'absolute', left:pos.left, top:pos.top, height:h, lienHeight:h, paddingLeft:paddingleft, color:'#aaa'}).appendTo(self.parent());
			self.focusin(function(e) {
				holder.hide();
			}).focusout(function(e) {
				if(!self.val()){
					holder.show();
				}
			});
			holder.click(function(e) {
				holder.hide();
				self.focus();
			});
		});
	}
};
//执行
jQuery(function(){
	JPlaceHolder.init();    
});
/*placeholder 兼容IE6 的设置  js  end*/

/*placeholder ks*/
$(document).ready(function(e) {
	$("#Wrap_searchbar .Wrap_input_search").each(function(){
		var thisVal=$(this).val(); 
		//判断文本框的值是否为空，有值的情况就隐藏提示语，没有值就显示
		if(thisVal!=""){      
			$(this).siblings("span").hide();
		}else{
			$(this).siblings("span").css("display","inline-block");
		}
		//聚焦型输入框验证
		$(this).focus(function(){
			$(this).siblings("span").hide();
		}).blur(function(){
			var val=$(this).val();
			if(val!=""){
				$(this).siblings("span").hide();
			}else{
				$(this).siblings("span").css("display","inline-block");
			}
		});
	});
});


/**首页轮播图效果开始*/
$(function(){
	$(".bannerBtn li").each(function(index,element){
		$(this).on("mouseover",function(){
			clearInterval(timer);
			$(this).addClass("active").siblings().removeClass("active");
			$("#silder_list li").eq(index).stop().animate({"opacity":"1"},2000).siblings().css({"opacity":"0"});
		});
		$(this).on("mouseout",function(){
			autoplay();
		})
	});
	var timer = "";
	var _index = 0;
	function autoplay(){
		timer = setInterval(function(){
			_index ++;
			if(_index > 3){
				_index = 0;
			}
			$(".bannerBtn li").eq(_index).addClass("active").siblings().removeClass("active");
			$("#silder_list li").eq(_index).stop().animate({"opacity":"1"},1000).siblings().css({"opacity":"0"});
		},5000);
	}
	autoplay();
})
/**首页轮播图效果结束*/
</script>
