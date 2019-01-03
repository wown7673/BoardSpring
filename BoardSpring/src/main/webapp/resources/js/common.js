/**
 * 
 */

// 널체크 ( null이랑 undefined를 다로 체크해야하지않나? )
function gfn_isNull(str) {
	
    if (str == "" || str == null || str == undefined || str == NaN ) {   	
    	return true;
    }

    // {} 객체 비었는지
    if (str != null && typeof str == "object" && !Object.keys(str).length) {
        return true;
    }

    return false;

}
/*  흔한개발자..
function gfn_isNull(obj){
	if(obj == null) return true;
	if(obj == "NaN") return true;
	var chkStr = new String(obj);
	if( chkStr.valueOf() == "undefined") return true;
	if( chkStr.toString().length == 0) return true;
	if( chkStr == null) return true;
	
	return false;
}
*/


// 널값 대체 
function gfn_nullVal(inVal, empyVal) {
    if (gfn_isNull(inVal)) {
    	return gfn_trim(empyVal);
    }
    return gfn_trim(inVal);
}


// 숫자형식인지판단 ( number또는 문자열이 숫자형식인지)
function gfn_isNumber(s) {
    s += "";
    s = s.replace(/^\s+|\s+$/g, ''); // 공백제거
    if (s == "" || isNaN(s)) return false;
    return true;
}

// 문자열 양옆 공백제거
function gfn_trim(str) {
    if (str == null) return "";
    if (new String(str).valueOf() == "undefined") return "";
    if (new String(str) == null) return "";

    return new String(str).replace(/^\s+|\s+$/g, "");
}

// 배열에 해당값이 있는지 체크
function gfn_isExistInArray(arr, val) {
    var retVal = false;
    var nCnt = arr.length;
    for (var i = 0; i < arr.length; i++) {
        if (arr[i] == val) {
            retVal = true;
            break;
        }
    }
    return retVal;
}