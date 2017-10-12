
function isEmpty(val) {
	if ("" == val) {
		return true;
	} else {
		return false;
	}
}
function strTrim(strVal) {
	return strVal.replace(/^\s+/g, "").replace(/\s+$/g, "");
}
function isNumeric(val) {
	return checkStringByRegExp(val, "/^(-|+)?d+$/");
}
function isNaturalNum(val) {
	return checkStringByRegExp(val, "/^d+$/");
}
function isNegativeNum(val) {
	return checkStringByRegExp(val, "/^-d+$/");
}
function checkStringByRegExp(strVal, strPattern) {
	var regEx = new RegExp(strPattern, "i");
	if (regEx.test(strVal)) {
		return true;
	} else {
		return false;
	}
}
function isIdCard(idCard) {
	if (idCard.length > 0) {
		var digit = "0123456789Xx";
		var i;
		for (i = 0; i < idCard.length; i++) {
			if (digit.indexOf(idCard.charAt(i)) == -1) {
				alert("\u8eab\u4efd\u8bc1\u53f7\u53ea\u80fd\u662f" + digit + "\u7684\u7ec4\u5408");
				return false;
			}
		}
		if (idCard.length < 15 || idCard.length == 16 || idCard.length == 17 || idCard.length > 18) {
			alert("\u8eab\u4efd\u8bc1\u53f7\u7801\u7684\u957f\u5ea6\u4e3a15\u621618\u4f4d");
			return false;
		}

     //<!-- 井明添加 对15位身份证进行验证 -->
		if (idCard.length == 15) {
			var aCity = {11:"\u5317\u4eac", 12:"\u5929\u6d25", 13:"\u6cb3\u5317", 14:"\u5c71\u897f", 15:"\u5185\u8499\u53e4", 21:"\u8fbd\u5b81", 22:"\u5409\u6797", 23:"\u9ed1\u9f99\u6c5f", 31:"\u4e0a\u6d77", 32:"\u6c5f\u82cf", 33:"\u6d59\u6c5f", 34:"\u5b89\u5fbd", 35:"\u798f\u5efa", 36:"\u6c5f\u897f", 37:"\u5c71\u4e1c", 41:"\u6cb3\u5357", 42:"\u6e56\u5317", 43:"\u6e56\u5357", 44:"\u5e7f\u4e1c", 45:"\u5e7f\u897f", 46:"\u6d77\u5357", 50:"\u91cd\u5e86", 51:"\u56db\u5ddd", 52:"\u8d35\u5dde", 53:"\u4e91\u5357", 54:"\u897f\u85cf", 61:"\u9655\u897f", 62:"\u7518\u8083", 63:"\u9752\u6d77", 64:"\u5b81\u590f", 65:"\u65b0\u7586", 71:"\u53f0\u6e7e", 81:"\u9999\u6e2f", 82:"\u6fb3\u95e8", 91:"\u56fd\u5916"};
			var iSum = 0;
			if (!/^\d{15}$/i.test(idCard)) {
				alert("\u975e\u6cd5\u8eab\u4efd\u8bc1\u53f7!\n\u8eab\u4efd\u8bc1\u53f7\u53ea\u5141\u8bb8\u4e3a0-9Xx");
				return false;
			}

	     //<!-- 验证身份证前两位对应地区是否正确 -->
			if (aCity[parseInt(idCard.substr(0, 2))] == null) {
				alert("\u975e\u6cd5\u8eab\u4efd\u8bc1\u53f7!\n\u5730\u533a\u7801\u9519\u8bef");
				return false;
			}

	     //<!-- 验证身份证出生年月是否正确 参数g表示在目标对象的全局范围内执行多次查找—替换操作-->
			sBirthday = "19" + idCard.substr(6, 2) + "-" + Number(idCard.substr(8, 2)) + "-" + Number(idCard.substr(10, 2));
			var d = new Date(sBirthday.replace(/-/g, "/"));
			if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate())) {
				alert("\u975e\u6cd5\u8eab\u4efd\u8bc1\u53f7!\n\u51fa\u751f\u65e5\u671f\u9519\u8bef");
				return false;
			}
		}

     //<!-- 井明添加 对18位身份证进行验证 -->
		if (idCard.length == 18) {
			var aCity = {11:"\u5317\u4eac", 12:"\u5929\u6d25", 13:"\u6cb3\u5317", 14:"\u5c71\u897f", 15:"\u5185\u8499\u53e4", 21:"\u8fbd\u5b81", 22:"\u5409\u6797", 23:"\u9ed1\u9f99\u6c5f", 31:"\u4e0a\u6d77", 32:"\u6c5f\u82cf", 33:"\u6d59\u6c5f", 34:"\u5b89\u5fbd", 35:"\u798f\u5efa", 36:"\u6c5f\u897f", 37:"\u5c71\u4e1c", 41:"\u6cb3\u5357", 42:"\u6e56\u5317", 43:"\u6e56\u5357", 44:"\u5e7f\u4e1c", 45:"\u5e7f\u897f", 46:"\u6d77\u5357", 50:"\u91cd\u5e86", 51:"\u56db\u5ddd", 52:"\u8d35\u5dde", 53:"\u4e91\u5357", 54:"\u897f\u85cf", 61:"\u9655\u897f", 62:"\u7518\u8083", 63:"\u9752\u6d77", 64:"\u5b81\u590f", 65:"\u65b0\u7586", 71:"\u53f0\u6e7e", 81:"\u9999\u6e2f", 82:"\u6fb3\u95e8", 91:"\u56fd\u5916"};
			var iSum = 0;
			if (!/^\d{17}(\d|x)$/i.test(idCard)) {
				alert("\u975e\u6cd5\u8eab\u4efd\u8bc1\u53f7!\n\u8eab\u4efd\u8bc1\u53f7\u53ea\u5141\u8bb8\u4e3a0-9Xx");
				return false;
			}
	     //<!-- 将X或x换成16进制中的A或a, 参数i在此表示忽略大小写-->
			idCard = idCard.replace(/x$/i, "a");

	     //<!-- 验证身份证前两位对应地区是否正确 -->
			if (aCity[parseInt(idCard.substr(0, 2))] == null) {
				alert("\u975e\u6cd5\u8eab\u4efd\u8bc1\u53f7!\n\u5730\u533a\u7801\u9519\u8bef");
				return false;
			}

	     //<!-- 验证身份证出生年月是否正确 参数g表示在目标对象的全局范围内执行多次查找—替换操作-->
			sBirthday = idCard.substr(6, 4) + "-" + Number(idCard.substr(10, 2)) + "-" + Number(idCard.substr(12, 2));
			var d = new Date(sBirthday.replace(/-/g, "/"));
			if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate())) {
				alert("\u975e\u6cd5\u8eab\u4efd\u8bc1\u53f7!\n\u51fa\u751f\u65e5\u671f\u9519\u8bef");
				return false;
			}

	     //<!-- 验证身份证最后一位校验码是否正确 -->
			for (var i = 17; i >= 0; i--) {
				iSum += (Math.pow(2, i) % 11) * parseInt(idCard.charAt(17 - i), 11);
			}
			if (iSum % 11 != 1) {
				alert("\u975e\u6cd5\u8eab\u4efd\u8bc1\u53f7!\n\u6821\u9a8c\u7801\u9519\u8bef");
				return false;
			}
		}
	}
}
function getCookie(c_name) {
	var c_value = document.cookie;
	var c_start = c_value.indexOf(" " + c_name + "=");
	if (c_start == -1) {
		c_start = c_value.indexOf(c_name + "=");
	}
	if (c_start == -1) {
		c_value = null;
	} else {
		c_start = c_value.indexOf("=", c_start) + 1;
		var c_end = c_value.indexOf(";", c_start);
		if (c_end == -1) {
			c_end = c_value.length;
		}
		c_value = unescape(c_value.substring(c_start, c_end));
	}
	return c_value;
}

