/* Copyright © 2012~2015. Open Platform All Rights Reserved.
 * 3D WEB API 2.0*/
 
var vw = {
   /*브이월드 API에서 사용되는 대부분 클래스의 부모 클래스. 
	*추상 클래스로 직접 인스턴스를 생성하지 않는다. 
	*모든 객체에서 이벤트 리스너를 등록하고, 
	*해제할 수 있도록 관련 기능을 제공하고, 
	*각 객체의 개발자가 임의 값을 저장하고 읽을 수 있도록 
	*개발자 지정 프로퍼티를 설정하고 읽을 수 있도록 한다. 
	*또한, 모든 객체는 복제할 수 있다.*/

	function Object(){};
	
		Object.prototype.on = function(type, listener){
			var eventKey = addOnEventListener(type, listener);
			return eventKey;
		};

		Object.prototype.once = function(type, listener){
			var eventKey = addOnceEventListener(type, listener);	
			return eventKey;
		};
		
		Object.prototype.un = function(type, listener){
			removeOnEventListener(type, listener);
		};
		
		Object.prototype.unByKey = function(key){
			removeOnEventListenerByKey(key);
		};
		
		Object.prototype.set = function(name, value){	

		};
		
		Object.prototype.getNames = function(){

			return this.names;
		};
		
		Object.prototype.get = function(name){

		};
		
		Object.prototype.remove = function(name){

		};
		
	 	/*
		 *객체 복제
		 */
		Object.prototype.clone = function(){
		    if (null == obj || "object" != typeof obj) return obj;
		    var copy = new Object();
		    for (var attr in obj) {
		        if (obj.hasOwnProperty(attr)) copy[attr] = obj[attr];
		    }
		    return copy;

		};

		Object.prototype.equals = function(obj){
			var flag = false;
			if(this == obj){
				flag = true;	
			}
			return flag;
		};

		function addOnEventListener(type, listener){
			listener.addEventListener(type);
		}

		function addOnceEventListener(type, listener){
			listener.addEventListener(type);
		}

	}





