function getNaviVer(){
	var navigatorVers={};
	var ua = navigator.userAgent.toLowerCase();
	var s;
	(s = ua.match(/msie ([\d.]+)/)) ? navigatorVers.ie = s[1] :
	(s = ua.match(/firefox\/([\d.]+)/)) ? navigatorVers.firefox = s[1] :
	(s = ua.match(/chrome\/([\d.]+)/)) ? navigatorVers.chrome = s[1] :
	(s = ua.match(/opera.([\d.]+)/)) ? navigatorVers.opera = s[1] :
	(s = ua.match(/version\/([\d.]+).*safari/)) ? navigatorVers.safari = s[1] : 0;
	
	
	if (navigatorVers.ie) return ('IE:' + navigatorVers.ie);
	if (navigatorVers.firefox) return ('Firefox:' + navigatorVers.firefox);
	if (navigatorVers.chrome) return ('Chrome:' + navigatorVers.chrome);
	if (navigatorVers.opera) return ('Opera:' + navigatorVers.opera);
	if (navigatorVers.safari) return ('Safari:' + navigatorVers.safari);
	return "unknow";
}
