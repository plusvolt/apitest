 /*
  * Copyright © 2012~2015. Open Platform All Rights Reserved.
  * 3D WEB API 2.0
  */
 
var vw = {};


/*******************************************************************************
 ** 기본 클래스 시작(2015.09.23)
 ** author plusvolt
 ********************************************************************************/

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
	//이벤트 타입에 리스너를 등록(구현)
};

vw.Object.prototype.once = function(type, listener){
	//이벤트 타입에 한번만 동작하는 리스너를 등록(구현)
};

vw.Object.prototype.un = function(type, listener){
	//이벤트 제거	(구현)
};

vw.Object.prototype.unByKey = function(key){
	// 반환된 키로 이벤트 제거(구현)
};

/*사용자 프로퍼티 추가
 *@params pName : 프로퍼티 이름, pValue : 프로퍼티 값
 */
vw.Object.prototype.set = function(pName, pValue){
    if(this.userProperties == null){
        this.userProperties = {};
        this.userProperties[pName] = pValue;
    }else{
        this.userProperties[pName] = pValue;    
    }	
};

/*사용자 프로퍼티값을 키로 반환
 *@params pName : 프로퍼티 이름
 *@return (navtiveObject) 프로퍼티 값
 */
vw.Object.prototype.get = function(name){
    return this.userProperties[name];
};

/*사용자 프로퍼티 키 목록 반환
 *@return (Array) 프로퍼티 이릅 배열
 */
vw.Object.prototype.getNames = function(){
    if(this.userProperties){
        return Object.keys(this.userProperties);    
    }else{
        return null;   
    }
};

/*사용자 프로퍼티 값 목록 반환
 *@return (Array) 프로퍼티 값 배열
 */
vw.Object.prototype.getValues = function(){
    var valueArr = new Array();
    if(this.userProperties){
      for(var i=0; i < Object.keys(this.userProperties).length; i++){
        valueArr[i] = this.userProperties[Object.keys(this.userProperties)[i]];
      }
      return valueArr;
    }else{
        return null;   
    }
};


/*사용자 프로퍼티 제거
 *@return (Array) 프로퍼티 이릅 배열
 */
vw.Object.prototype.remove = function(name){
	this.name = null;
};

/*
 *객체 복제
 *@return (vw.Object) 복사된 객체
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
 *크기(폭과 높이)를 표현하는 클래스 vw.Size
 *@params pWidth : 넓이, pHeight : 높이
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

/*vw.Object상속*/
vw.Size.prototype = new vw.Object();

/*
 *사각형 영역을 표현하는 클래스.
 *@params pMinx 최소 x, pMiny 최소 y, pMaxx 최대 x, pMaxy 최대 y
 */
vw.Extent = function(pMinx, pMiny, pMaxx, pMaxy){
    this.minx = pMinx;
    this.miny = pMiny;
    this.maxx = pMaxx;
    this.maxy = pMaxy;

    /*두개의 coord좌표를 이용하여 extent 생성하지
    @params start : 시작좌표(vw.Coord), end : 끝좌표(vw.Coord)*/
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

/*vw.Size 상속*/
vw.Extent.prototype = new vw.Size();

/*값이 변할 수 있는 범위를 지정*/
vw.Bound ={
  apply : false, //바운드를 지정할지 여부
  min : 0,
  max : 999999
}

/*색상 클래스 
 *r,g,b,a를 톨해 색상을 생성 및 반환한다
 *@params r : RED ,g : GREEN,b : BLUE ,a : ALPHA
 */
vw.Color = function(pr,pg,pb,pa){
  if(arguments.length < 3) return false; //생서자 호출시 최소 파라미터 3개
  
  for(var i = 0; i < arguments.length; i ++ ){ //RGB범위값 체크
    if(arguments[i] < 0 && arguments[i] > 255){
      return false;
      //this.rgba[Object.keys(this.rgba)[i] = arguments[i];
    }
  }

  var aFlag = arguments.length;

  this.r = pr;
  this.g = pg;
  this.b = pb;

  if(aFlag == 4 ){ //a 파라미터 있을때만 표시 
    this.a = pa;  
  }else{
    this.a = 1;
  }  
}

vw.Color.prototype = new vw.Object(); //vw.Object 상속
//rgba to color
vw.Color.prototype.fromRation = function(pr,pg,pb,pa){
  //구현
  return true;
}

/*CSS 컬러 스트링에서 Color를 생성한다.
 *@param color: string – CSS 색상 문자열 (“#FFFFFFFF”)
 *@return (vw.Color) 컬러
 */
vw.Color.prototype.fromCssString = function(pColor){
  
  var r = parseInt((cutHex(pColor)).substring(0,2),16);
  var g = parseInt((cutHex(pColor)).substring(2,4),16);
  var b = parseInt((cutHex(pColor)).substring(4,6),16);


  return new vw.Color(r,g,b);
}

/*Color를 CSS 컬러 스트링으로 반환
 *@return (nativeObject) css 컬러 스트링
 */
vw.Color.prototype.getCssString = function(){
  
  var rVal= parseInt(this.r);
  var gVal= parseInt(this.g);
  var bVal= parseInt(this.b);
  
  var hexValR = rVal.toString(16);  
  var hexValG = gVal.toString(16);  
  var hexValB = bVal.toString(16);
  
  if(hexValR.substr(0,1) == 0 ){ 
    hexValR = hexValR+'0';
  } 
  if(hexValG.substr(0,1) ==0){
    hexValG = hexValG+'0';
  } 
  if(hexValB.substr(0,1) ==0){
    hexValB = hexValB+'0';
  }   
  var hexVal = hexValR+hexValG+hexValB;  
  hexVal= hexVal.toUpperCase();
  
  return hexVal;
}
/*사용자 프로퍼티 키 목록 반환*/
vw.Color.prototype.getNames = function(){
  var names = new Array();
  for (var attrC in this) {
    if(this.hasOwnProperty(attrC)){
      if(attrC == "userProperties"){//userProperties추가시
        for(var a in this.userProperties){
          names.push(a);  
        }
      }else{
        names.push(attrC);  
      }
    }
  }
  return names;
};

/*컬러 객체 복제*/
vw.Color.prototype.clone = function(){
  if (null == this || "object" != typeof this) return this;
    var copy = new vw.Color(this.r,this.g,this.b,this.a);
    for (var attr in this) {
        if (this.hasOwnProperty(attr)) copy[attr] = this[attr];
    }
  return copy;       
}

vw.ColorRampType = function() {};

/*배열을 확장한 컬렉션으로 아이템을 
 *다루는 메소드와 이벤트를 제공한다.
 *vw.Collection 클래스 
 *@params pItems : array< anything> – 추가할 아이템을 가지고 있는 배열, (O)
 */
vw.Collection = function(pItems) {  
  this.collectionProp = new Array();
  if(pItems != null && pItems != "undifined"){
    for(var i = 0; i < pItems.length; i ++){
      this.collectionProp[i] = pItems[i];  
    }  
  }
  this.count = this.collectionProp.length;  
};

/*vw.Object 상속*/
vw.Collection.prototype = new vw.Object(); 

/*주어진 배열의 아이템을 컬렉션의 아이템으로 추가하여 컬렉션을 확장한다.
 *pItems: array< anything> – 추가할 아이템을 가지고 있는 배열*/
vw.Collection.prototype.extend = function(pItems){
  var curIdx = this.count;
  for(var i = 0; i < pItems.length; i ++){
    this.collectionProp[curIdx+i] = pItems[i];  
  }
  this.updateCount();
}

/*컬렉션의 마지막에 주어진 아이템을 추가하고, 
 *컬렉션의 길이를 반환한다.
 *@params pItem: anything – 추가할 아이템
 *@return integer 컬렉션의 길이 
 */
vw.Collection.prototype.add = function(pItem){
  var returnValue = this.collectionProp.push(pItem);
  this.updateCount();
  return returnValue
}

/*주어진 인덱스에 아이템을 추가한다. 
 *index >= count일 경우 마지막에 추가하고 index < 0일 경우
 *처음에 추가한다.
 *@param pIndex: integer – 아이템을 추가할 위치
 *@param pItem: anything – 추가할 아이템
 */
vw.Collection.prototype.insert = function(pIndex, pItem){
  if(pIndex < 0){
    this.collectionProp.unshift(pItem);    
  }else if(pIndex >= this.count){
    this.collectionProp.push(pItem);    
  }else{
    this.collectionProp.splice(pIndex,0, pItem);
  }  
  this.updateCount();
}

/*주어진 인덱스에 아이템을 설정하여 교체한다. 
 *무효 인덱스가 입력되면 실행하지 않는다.(index < 0 또는 index >= count)
 *@param pIndex: integer – 교체할 아이템의 인덱스
 *@param pItem: anything – 교체할 아이템
 */
vw.Collection.prototype.update = function(pIndex, pItem){
  if(pIndex > 0 || pIndex < this.count){
    this.collectionProp[pIndex] = pItem;        
  }
}

/*from 인덱스에 있는 item을 to 인덱스 위치로 이동한다. 
 *그에 따라 from, to 사이의 item index는 변경된다.
 *@param pFrom: integer – 현재 인덱스
 *@param pTo: integer – 대상 인덱스
 */
vw.Collection.prototype.move = function(pFrom, pTo){
  if(pFrom < 0 || pFrom >= this.count){
    return false;
  }else if(pTo < 0 || pTo >= this.count){
    return false;
  }else{
    this.collectionProp[pTo] = vw.Util.unSafeClone(this.collectionProp[pFrom]);
    this.removeAt(pFrom);        
  }
}

/*index1의 item과 index2의 item을 맞바꾼다.
 *@param pIndex1: integer – 맞바꿀 첫번째 인덱스
 *@param pIndex2: integer – 맞바꿀 두번째 인덱스
 */
vw.Collection.prototype.switch = function(pIndex1, pIndex2){
  if(pIndex1 < 0 || pIndex1 >= this.count){
    return false;
  }else if(pIndex2 < 0 || pIndex2 >= this.count){
    return false;
  }else{
    var temp1 = vw.Util.unSafeClone(this.collectionProp[pIndex1]);
    this.update(pIndex1, vw.Util.unSafeClone(this.collectionProp[pIndex2]));
    this.update(pIndex2, temp1);
  }
}

/*아이템 전체를 담은 배열을 반환한다. 
 *@return array 아이템 전체
 */
vw.Collection.prototype.getArray = function(){
  return this.collectionProp;
}

/*주어진 값으로 인덱스를 반환한다. 없으면 -1을 반환한다. 
 *값이 동일한 것이 있으면 첫번째 발견된 인덱스를 반환한다.
 *@param pItem: anything – 찾을 아이템의 값
 *@return integer : 인덱스
 */
vw.Collection.prototype.indexOf = function(pItem){
  var retrunValue = -1
  for(var i = 0; i < this.count; i++){
    if(this.collectionProp[i] == pItem){
      return i;
    }
  }
}

/*주어진 인덱스의 아이템을 반환한다. 
 *무효 인덱스가 입력되면 NULL을 반환한다.
 *@param pIndex: integer – 아이템의 인덱스
 *@return anything 인덱스의 아이템
 */
vw.Collection.prototype.item = function(pIndex){
  if(pIndex < 0 || pIndex >= this.count){
    return null;
  }else{
    return this.collectionProp[pIndex];
  }
}

/*컬렉션의 마지막 아이템을 제거하여 반환한다. 
 *컬렉션이 비어 있으면 NULL을 반환한다.
 *@return anything 마지막 아이템값 
 */
vw.Collection.prototype.pop = function(){
  var returnValue = null;
  if(this.count > 0){
    returnValue = this.collectionProp.pop();
    this.updateCount();
  }
  return returnValue;
}

/*컬렉션에서 주어진 아이템이 첫번째로 나타나는 경우를 제거하고, 
 *제거한 아이템을 반환한다. 
 *아이템을 찾지 못한 경우에는 NULL을 반환한다.
 *@param pItem: anything – 제거할 아이템
 */
vw.Collection.prototype.remove = function(pItem){
  var returnValue = null;
  for(var i = 0; i < this.count; i++){
    if(this.collectionProp[i] == pItem){
      returnValue = this.removeItem(i);
      break;
    }
  }
  this.updateCount();
  return returnValue;
}

/*주어진 인덱스의 아이템을 제거하고 반환한다. 
 *컬렉션에서 인덱스에 아이템이 없는 경우에는 NULL을 반환한다.
 *@param pIndex: integer – 제거할 아이템의 인덱스
 */
vw.Collection.prototype.removeAt = function(pIndex){
  var returnValue = null;
  if(pIndex < 0 || pIndex >= this.count){
    return returnValue;
  }else{
    returnValue = this.removeItem(pIndex);
  }
  this.updateCount();
  return returnValue;
}

/*인덱스를 입력 받아 아이템을 제거 하고 반환
 *remove메소드와 removeAt메소드에서 사용
 *@param pIndex : 삭제할 아이템의 인덱스
 *@return anything : 삭제된 아이템 값
 */
vw.Collection.prototype.removeItem = function(pIndex){
  var returnValue = this.collectionProp.splice(pIndex,1);
  this.updateCount();
  return returnValue;
}

/*컬렉션의 모든 아이템을 제거한다.*/
vw.Collection.prototype.clear = function(){
  this.collectionProp = new Array();  
  this.updateCount();
}

/*컬렉션 수정시  count 프로퍼티 갱신*/
vw.Collection.prototype.updateCount = function(){
  this.count = this.collectionProp.length;  
}

/*컬렉션의 객체 복제*/
vw.Collection.prototype.clone = function(){
  if (null == this || "object" != typeof this) return this;
    var copy = new vw.Collection();
    for (var key in this) {
      copy[key] = vw.Util.unSafeClone(this[key]);
    }
    return copy;    
}

/*이름으로 아이템을 다루는 메소드와 이벤트를 제공한다 */
vw.NamedSet = function() {
  this.count = 0;
};

/*vw.Object 상속*/
vw.NamedSet.prototype = new vw.Object(); 

/*  셋 추가 */
vw.NamedSet.prototype.set = function(pName, pValue){
    if(this.userProperties == null){
        this.userProperties = {};
        this.userProperties[pName] = pValue;
    }else{
        this.userProperties[pName] = pValue;    
    } 
    this.updataCount();
};

/* 셋 반환 */
vw.NamedSet.prototype.get = function(pName){
  return this.userProperties[pName];
};

/* 셋 반환 */
vw.NamedSet.prototype.updataCount = function(pName){
  this.count = this.getNames().length;
}

/*모든 아이템을 제거한다*/
vw.NamedSet.prototype.clear = function() {
  this.userProperties = {};
  this.updataCount();
};

/*
 *객체 복제
 *@return NamedSet 복사된 객체
 */
vw.NamedSet.prototype.clone = function(){
    if (null == this || "object" != typeof this) return this;
    var copy = new vw.NamedSet();
    for (var key in this) {
      copy[key] = vw.Util.unSafeClone(this[key]);
    }
    return copy;
};


/*컨트롤의 위치를 지정하는 상수.
 *임시로 정의
 */
vw.SiteAlignType = {
  "NONE" : 0,
  "TOP_LEFT" : 1,
  "TOP_CENTER" : 2,
  "TOP_RIGHT" : 3,
  "CENTER_LEFT" : 4,
  "CENTER_CENTER" : 5,
  "CENTER_RIGHT" : 6,
  "BOTTOM_LEFT" : 7,
  "BOTTOM_CENTER" : 8,
  "BOTTOM_RIGHT" : 9
}

/*변경상태 
 *임시로 정의
 */
vw.SiteAlignType = {
  "NONE" : 0,
  "INSERT" : 1,
  "UPDATE" : 2,
  "DELETE" : 3  
}

/*******************************************************************************
 ** 이벤트 관련 클래스 시작(2015.09.30)
 ** author plusvolt
 ********************************************************************************/
vw.EventHandler = function(){}

/*
vw.Color.names = {
  'aliceblue': '#f0f8ff',
  'antiquewhite': '#faebd7',
  'aqua': '#00ffff',
  'aquamarine': '#7fffd4',
  'azure': '#f0ffff',
  'beige': '#f5f5dc',
  'bisque': '#ffe4c4',
  'black': '#000000',
  'blanchedalmond': '#ffebcd',
  'blue': '#0000ff',
  'blueviolet': '#8a2be2',
  'brown': '#a52a2a',
  'burlywood': '#deb887',
  'cadetblue': '#5f9ea0',
  'chartreuse': '#7fff00',
  'chocolate': '#d2691e',
  'coral': '#ff7f50',
  'cornflowerblue': '#6495ed',
  'cornsilk': '#fff8dc',
  'crimson': '#dc143c',
  'cyan': '#00ffff',
  'darkblue': '#00008b',
  'darkcyan': '#008b8b',
  'darkgoldenrod': '#b8860b',
  'darkgray': '#a9a9a9',
  'darkgreen': '#006400',
  'darkgrey': '#a9a9a9',
  'darkkhaki': '#bdb76b',
  'darkmagenta': '#8b008b',
  'darkolivegreen': '#556b2f',
  'darkorange': '#ff8c00',
  'darkorchid': '#9932cc',
  'darkred': '#8b0000',
  'darksalmon': '#e9967a',
  'darkseagreen': '#8fbc8f',
  'darkslateblue': '#483d8b',
  'darkslategray': '#2f4f4f',
  'darkslategrey': '#2f4f4f',
  'darkturquoise': '#00ced1',
  'darkviolet': '#9400d3',
  'deeppink': '#ff1493',
  'deepskyblue': '#00bfff',
  'dimgray': '#696969',
  'dimgrey': '#696969',
  'dodgerblue': '#1e90ff',
  'firebrick': '#b22222',
  'floralwhite': '#fffaf0',
  'forestgreen': '#228b22',
  'fuchsia': '#ff00ff',
  'gainsboro': '#dcdcdc',
  'ghostwhite': '#f8f8ff',
  'gold': '#ffd700',
  'goldenrod': '#daa520',
  'gray': '#808080',
  'green': '#008000',
  'greenyellow': '#adff2f',
  'grey': '#808080',
  'honeydew': '#f0fff0',
  'hotpink': '#ff69b4',
  'indianred': '#cd5c5c',
  'indigo': '#4b0082',
  'ivory': '#fffff0',
  'khaki': '#f0e68c',
  'lavender': '#e6e6fa',
  'lavenderblush': '#fff0f5',
  'lawngreen': '#7cfc00',
  'lemonchiffon': '#fffacd',
  'lightblue': '#add8e6',
  'lightcoral': '#f08080',
  'lightcyan': '#e0ffff',
  'lightgoldenrodyellow': '#fafad2',
  'lightgray': '#d3d3d3',
  'lightgreen': '#90ee90',
  'lightgrey': '#d3d3d3',
  'lightpink': '#ffb6c1',
  'lightsalmon': '#ffa07a',
  'lightseagreen': '#20b2aa',
  'lightskyblue': '#87cefa',
  'lightslategray': '#778899',
  'lightslategrey': '#778899',
  'lightsteelblue': '#b0c4de',
  'lightyellow': '#ffffe0',
  'lime': '#00ff00',
  'limegreen': '#32cd32',
  'linen': '#faf0e6',
  'magenta': '#ff00ff',
  'maroon': '#800000',
  'mediumaquamarine': '#66cdaa',
  'mediumblue': '#0000cd',
  'mediumorchid': '#ba55d3',
  'mediumpurple': '#9370db',
  'mediumseagreen': '#3cb371',
  'mediumslateblue': '#7b68ee',
  'mediumspringgreen': '#00fa9a',
  'mediumturquoise': '#48d1cc',
  'mediumvioletred': '#c71585',
  'midnightblue': '#191970',
  'mintcream': '#f5fffa',
  'mistyrose': '#ffe4e1',
  'moccasin': '#ffe4b5',
  'navajowhite': '#ffdead',
  'navy': '#000080',
  'oldlace': '#fdf5e6',
  'olive': '#808000',
  'olivedrab': '#6b8e23',
  'orange': '#ffa500',
  'orangered': '#ff4500',
  'orchid': '#da70d6',
  'palegoldenrod': '#eee8aa',
  'palegreen': '#98fb98',
  'paleturquoise': '#afeeee',
  'palevioletred': '#db7093',
  'papayawhip': '#ffefd5',
  'peachpuff': '#ffdab9',
  'peru': '#cd853f',
  'pink': '#ffc0cb',
  'plum': '#dda0dd',
  'powderblue': '#b0e0e6',
  'purple': '#800080',
  'red': '#ff0000',
  'rosybrown': '#bc8f8f',
  'royalblue': '#4169e1',
  'saddlebrown': '#8b4513',
  'salmon': '#fa8072',
  'sandybrown': '#f4a460',
  'seagreen': '#2e8b57',
  'seashell': '#fff5ee',
  'sienna': '#a0522d',
  'silver': '#c0c0c0',
  'skyblue': '#87ceeb',
  'slateblue': '#6a5acd',
  'slategray': '#708090',
  'slategrey': '#708090',
  'snow': '#fffafa',
  'springgreen': '#00ff7f',
  'steelblue': '#4682b4',
  'tan': '#d2b48c',
  'teal': '#008080',
  'thistle': '#d8bfd8',
  'tomato': '#ff6347',
  'turquoise': '#40e0d0',
  'violet': '#ee82ee',
  'wheat': '#f5deb3',
  'white': '#ffffff',
  'whitesmoke': '#f5f5f5',
  'yellow': '#ffff00',
  'yellowgreen': '#9acd32'
};

*/










/*공통 유틸 관련 클래스*/
vw.Util = {};
vw.Util.unSafeClone = function(obj){
   var type = vw.Util.typeOf(obj);
  if (type == 'object' || type == 'array') {
  
    var clone = type == 'array' ? [] : {};
  
    for (var key in obj) {
      clone[key] = vw.Util.unSafeClone(obj[key]);
    }
  
    return clone;
  }

  return obj;
}


/**
 * This is a "fixed" version of the typeof operator.  It differs from the typeof
 * operator in such a way that null returns 'null' and arrays return 'array'.
 * @param {*} value The value to get the type of.
 * @return {string} The name of the type.
 */
vw.Util.typeOf = function(value) {
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