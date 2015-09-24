 /*
  * Copyright © 2012~2015. Open Platform All Rights Reserved.
  * 3D WEB API 2.0
  */
 
var vw = {};

/*브이월드 API에서 사용되는 대부분 클래스의 부모 클래스. 
*추상 클래스로 직접 인스턴스를 생성하지 않는다. 
*모든 객체에서 이벤트 리스너를 등록하고, 
*해제할 수 있도록 관련 기능을 제공하고, 
*각 객체의 개발자가 임의 값을 저장하고 읽을 수 있도록 
*개발자 지정 프로퍼티를 설정하고 읽을 수 있도록 한다. 
*또한, 모든 객체는 복제할 수 있다.*/
vw.Object = function(){};

vw.Object.prototype.on = function(type, listener){
	//이벤트 타입에 리스너를 등록
};

vw.Object.prototype.once = function(type, listener){
	//이벤트 타입에 한번만 동작하는 리스너를 등록
};

vw.Object.prototype.un = function(type, listener){
	//이벤트 제거	
};

vw.Object.prototype.unByKey = function(key){
	// 반환된 키로 이벤트 제거
};

/*사용자 프로퍼티 추가*/
vw.Object.prototype.set = function(pName, pValue){
	this[pName] = pValue;
};

/*사용자 프로퍼티 키 목록 반환*/
vw.Object.prototype.getNames = function(){
	var nameArr = Object.keys(this);
	return nameArr;
};

/*사용자 프로퍼티값을 키로 반환*/
vw.Object.prototype.get = function(name){
	return this[name];
};

/*사용자 프로퍼티 제거*/
vw.Object.prototype.remove = function(name){
	this.name = null;
};

/*
 *객체 복제
 */
vw.Object.prototype.clone = function(){
    if (null == this || "object" != typeof this) return this;
    var copy = new vw.Object();
    for (var attr in this) {
        if (this.hasOwnProperty(attr)) copy[attr] = this[attr];
    }
    return copy;
};

vw.Object.prototype.equals = function(obj){
	var flag = false;
	if(this == obj){
		flag = true;	
	}
	return flag;
};


 /*
  * 실세계 좌표 구조체
  */

vw.Coord = {    
    x : null,
    y : null
}


vw.CoordZ = {    
    x : null,
    y : null,
    z : null
}


vw.CoordM = {    
    x : null,
    y : null,
    m : null
}


vw.CoordZM = {    
    x : null,
    y : null,
    z : null,
    m : null
}

/*화면의 픽셀 좌표*/
vw.Pixel = {
    x : null,
    y : null
}

/*실세계 좌표와 화면좌표가 Pair로 처리될 때 사용*/
vw.CoordPixel = {
    coord : null, // vw.Coord
    pixel : null //vw.Pixcel
}


/*
 *크기(폭과 높이)를 표현하는 클래스
 */
vw.Size = function(pWidth, pHeight){
    this.width = pWidth;
    this.height = pHeight;
    this.fromConers = function(start, end){
        var rSize = start - end; //좌표로 사이즈 구해야함
        return rSize;
    }
    this.clone = function(){
        if (null == this || "object" != typeof this) return this;
            var copy = new vw.Size();
            for (var attr in this) {
                if (this.hasOwnProperty(attr)) copy[attr] = this[attr];
            }
        return copy;       
    }
}

vw.Size.prototype = new vw.Object();










//이 밑으로 테스트 소스

	for(var i = 0; i < arg.length; i ++){
		if( "object" == typeof arg[i]){
			for(var name in arg[i]){
				console.log("obj : " + arg[i][name]);			
			}
		}else{
			console.log("log : " + arg[i].toString());		
		}
		
	}
}


var tobj = new vw.Object();
tobj.set("이름" , "상민");
tobj.set("나이" , 18);
tobj.set("하는일" , "게임");


function testclass(){}
testclass.prototype = new vw.Object();
testclass.prototype.clone = function(){
        if (null == this || "object" != typeof this) return this;
        var cloneObj = new testclass();
        for (var attr in this) {
            if (this.hasOwnProperty(cloneObj)) this[attr] = cloneObj[attr];
        }
        return cloneObj;
}

var ha = new testclass();
var ho = ha.clone();






function flatClone(obj){
    console.log("fn : " + obj.toString());
    if (null == obj || "object" != typeof obj) return this;
    var cloneObj = new obj.constructor();
    for (var attr in obj) {
        console.log(attr);
        if (this.hasOwnProperty(cloneObj)) obj[attr] = cloneObj[attr];
    }
    return cloneObj;
}
/*
function clone(obj) {
    if(obj === null || typeof(obj) !== 'object' || 'isActiveClone' in obj)
        return obj;

    var temp = obj.constructor(); // changed

    for(var key in obj) {
        if(Object.prototype.hasOwnProperty.call(obj, key)) {
            obj['isActiveClone'] = null;
            temp[key] = clone(obj[key]);
            delete obj['isActiveClone'];
        }
    }    

    return temp;
}
*/