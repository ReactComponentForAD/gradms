/**
 * Created by pcy on 2016/5/31.
 */

var browserName = navigator.appName;  
var browserVersion = parseFloat(navigator.appVersion); 
function to$(arg) {
    var r_obj = null;
    if(typeof(arg) == 'object') {
        return arg;
    }
    r_obj = document.getElementById(arg);
    if (r_obj == null) {
        r_obj = document.getElementsByName(arg)[0];
    }
    return r_obj;
}

try {
    document.oncontextmenu = new Function('return false;');
} catch (e) {}

var useSoftBoard = false;

function newIE7(){
    var newwin=window.open("/V5/win7o.html","","top=0,left=0,height=768,width=1024,scrollbars=yes,status=no,resizable=yes")
}

function changeVersion() {
    var ifset = document.getElementById("NEWVERSION");
    if (ifset.checked == true) {
        document.jhform.PT_STYLE.value='6';
        document.jhform.TXCODE.value='K00001';
    } else {
        document.jhform.PT_STYLE.value='';
        document.jhform.TXCODE.value='100101';
    }
}

function showSpanForIE8( obj, spanId){
    var isCurrIE8=(navigator.userAgent.toLowerCase().indexOf("msie 8.0") != -1);
    var isCurrIE9=(navigator.userAgent.toLowerCase().indexOf("msie 9.0") != -1);
    var isCurrIE7=(navigator.userAgent.toLowerCase().indexOf("msie 7.0") != -1);
    if(isCurrIE8 || isCurrIE9 || isCurrIE7){
        obj.style.display = "";
        document.getElementById(spanId).focus();
    }
}

var submitFlag=0;
function go1() {
    var mult_flag = '1';
    if(mult_flag=="1"){
        querySer();
    }

    $("#COPY_USERID").val($("#USERID").val());


    if(check1()){
        $('#loginButton').attr("disabled","disabled");
        $('#loginButton').css("background","#ccc");

        if(submitFlag==0){
            submitFlag=1;
            return true;
        }else{
            return false;
        }
    }
    return false
}
function check1(){
//if(!autoCheck()) return false
    return true
}

var _ietype = window.navigator.appName;
var _isIE = true;
if(_ietype.indexOf("Microsoft Internet Explorer")!=-1){
    _isIE = true;
}else if(_ietype.indexOf("Netscape")!=-1){
    _isIE = false;
}



