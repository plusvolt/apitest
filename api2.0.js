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
vw.Object = function(){
    this.userProperties = null; //사용자 지정 프로퍼티
};

//vw.Object.prototype.userProperties = {};

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
    if(this.userProperties == null){
        this.userProperties = {};
        this.userProperties[pName] = pValue;
    }else{
        this.userProperties[pName] = pValue;    
    }	
};

/*사용자 프로퍼티값을 키로 반환*/
vw.Object.prototype.get = function(name){
    return this.userProperties[name];
};

/*사용자 프로퍼티 키 목록 반환*/
vw.Object.prototype.getNames = function(){
    if(this.userProperties){
        return Object.keys(this.userProperties);    
    }else{
        return null;   
    }
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
    //for (var attr in this) {
      //  clone[key] = goog.object.unsafeClone(obj[key]);
    
    //var clone = type == 'array' ? [] : {};
    for (var key in this) {
      copy[key] = vw.Util.unSafeClone(this[key]);
    }
        //if (this.hasOwnProperty(attr)) copy[attr] = this[attr];
    return copy;
};

/*객체 비교 메소드 조금더 생각하고 수정해야함*/
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

/*
 *사각형 영역을 표현하는 클래스.
 */
vw.Extent = function(pMinx, pMiny, pMaxx, pMaxy){
    this.minx = pMinx;
    this.miny = pMiny;
    this.maxx = pMaxx;
    this.maxy = pMaxy;

    this.fromConers = function(start, end){
        var rSize = start - end; //좌표로 사이즈 구해야함
        return rSize;
    }

    this.clone = function(){
        if (null == this || "object" != typeof this) return this;
            var copy = new vw.Extent();
            for (var attr in this) {
                if (this.hasOwnProperty(attr)) copy[attr] = this[attr];
            }
        return copy;       
    }
}

vw.Extent.prototype = new vw.Size();


vw.Util = {};
vw.Util.unSafeClone = function(obj){
   var type = vw.typeOf(obj);
  if (type == 'object' || type == 'array') {
  
    var clone = type == 'array' ? [] : {};
  
    for (var key in obj) {
      clone[key] = vw.Util.unSafeClone(obj[key]);
    }
  
    return clone;
  }

  return obj;
}


function flatClone(obj){
    if (null == obj || "object" != typeof obj) return obj;
    var cloneObj = new obj.constructor();
    for (var attr in obj) {
        console.log(attr);
        if (this.hasOwnProperty(cloneObj)) obj[attr] = cloneObj[attr];
    }
    return cloneObj;
}




/**
 * This is a "fixed" version of the typeof operator.  It differs from the typeof
 * operator in such a way that null returns 'null' and arrays return 'array'.
 * @param {*} value The value to get the type of.
 * @return {string} The name of the type.
 */
vw.typeOf = function(value) {
  var s = typeof value;
  if (s == 'object') {
    if (value) {
      // Check these first, so we can avoid calling Object.prototype.toString if
      // possible.
      //
      // IE improperly marshals tyepof across execution contexts, but a
      // cross-context object will still return false for "instanceof Object".
      if (value instanceof Array) {
        return 'array';
      } else if (value instanceof Object) {
        return s;
      }

      // HACK: In order to use an Object prototype method on the arbitrary
      //   value, the compiler requires the value be cast to type Object,
      //   even though the ECMA spec explicitly allows it.
      var className = Object.prototype.toString.call(
          /** @type {Object} */ (value));
      // In Firefox 3.6, attempting to access iframe window objects' length
      // property throws an NS_ERROR_FAILURE, so we need to special-case it
      // here.
      if (className == '[object Window]') {
        return 'object';
      }

      // We cannot always use constructor == Array or instanceof Array because
      // different frames have different Array objects. In IE6, if the iframe
      // where the array was created is destroyed, the array loses its
      // prototype. Then dereferencing val.splice here throws an exception, so
      // we can't use goog.isFunction. Calling typeof directly returns 'unknown'
      // so that will work. In this case, this function will return false and
      // most array functions will still work because the array is still
      // array-like (supports length and []) even though it has lost its
      // prototype.
      // Mark Miller noticed that Object.prototype.toString
      // allows access to the unforgeable [[Class]] property.
      //  15.2.4.2 Object.prototype.toString ( )
      //  When the toString method is called, the following steps are taken:
      //      1. Get the [[Class]] property of this object.
      //      2. Compute a string value by concatenating the three strings
      //         "[object ", Result(1), and "]".
      //      3. Return Result(2).
      // and this behavior survives the destruction of the execution context.
      if ((className == '[object Array]' ||
           // In IE all non value types are wrapped as objects across window
           // boundaries (not iframe though) so we have to do object detection
           // for this edge case.
           typeof value.length == 'number' &&
           typeof value.splice != 'undefined' &&
           typeof value.propertyIsEnumerable != 'undefined' &&
           !value.propertyIsEnumerable('splice')

          )) {
        return 'array';
      }
      // HACK: There is still an array case that fails.
      //     function ArrayImpostor() {}
      //     ArrayImpostor.prototype = [];
      //     var impostor = new ArrayImpostor;
      // this can be fixed by getting rid of the fast path
      // (value instanceof Array) and solely relying on
      // (value && Object.prototype.toString.vall(value) === '[object Array]')
      // but that would require many more function calls and is not warranted
      // unless closure code is receiving objects from untrusted sources.

      // IE in cross-window calls does not correctly marshal the function type
      // (it appears just as an object) so we cannot use just typeof val ==
      // 'function'. However, if the object has a call property, it is a
      // function.
      if ((className == '[object Function]' ||
          typeof value.call != 'undefined' &&
          typeof value.propertyIsEnumerable != 'undefined' &&
          !value.propertyIsEnumerable('call'))) {
        return 'function';
      }

    } else {
      return 'null';
    }

  } else if (s == 'function' && typeof value.call == 'undefined') {
    // In Safari typeof nodeList returns 'function', and on Firefox typeof
    // behaves similarly for HTML{Applet,Embed,Object}, Elements and RegExps. We
    // would like to return object for those and we can detect an invalid
    // function by making sure that the function object has a call method.
    return 'object';
  }
  return s;
};



/*********************************************************/
//이 밑으로 테스트 소스

function loger(){
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