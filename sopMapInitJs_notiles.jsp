<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="
        java.util.*,
        org.springframework.web.context.*,
        egovframework.rte.fdl.property.EgovPropertyService,
        org.springframework.web.context.support.*"%>

<%
 	ServletContext ctx = pageContext.getServletContext();
	WebApplicationContext wac =  WebApplicationContextUtils.getRequiredWebApplicationContext(ctx);
    String dfdomain = request.getServerName();


    // getBean 
 	 EgovPropertyService propertyService =(EgovPropertyService)wac.getBean("propertiesService");
%>

function fnGoPlugInInstallPage(){
	location.href = "http://map.vworld.kr/map/po_mapuse_a001.do";
}

(function(){
    if (!('sop' in window)) {
        window.sop = {};
    }
    if (!('earth' in window.sop)) {
        window.sop.earth = {};
    }
    if (!('sop' in window)) {
        window.sop = {};
    }
    if (!('loader' in window.sop)) {
        window.sop.loader = {};
    }
	if(!('cons' in window.sop)){
		window.sop.cons={};
	}
	if(!('error' in window.sop.cons)){
		window.sop.cons.error={};
	}
	if(!('errorStr' in window.sop.cons)){
		window.sop.cons.errorStr={};
	}
	if (!("idleproc" in window.sop)) {
        window.sop.idleproc = {};
    }
	if (!("map" in window.sop.idleproc)){
		window.sop.idleproc.map = {};
	}
        //window.loader.sopLocale='http://sop.co.kr';	
        window.sop.loader.APIKEY = '<c:out value='${rMap.apiKey}'/>'; 
        window.sop.loader.XDCOMCLSID = '07782E30-6EFC-4760-BE77-9A8D40FC0E92';
		window.sop.loader.XDLANCHCLSID = '32AFB3E5-DAC6-458A-85CD-11394D8A251B';
		window.sop.loader.VWORLD_EMBED_TYPE = 'application/npVWorld-Plugin:.VWorld:Scriptability Plugin,version=1.0.0.5';		
		window.sop.loader._ERROR_STR="";
		window.sop.loader._ERROR_CODE=1;
		window.sop.loader.OS_WINDOW = 'win';
		window.sop.loader.OS_MAC = 'mac';
		window.sop.loader.OS_LINUX = 'linux';
		window.sop.loader.CURRENT_BROWSER='';
		window.sop.loader.BROWSER_IE=0;
		window.sop.loader.BROWSER_CHROME=1;
		window.sop.loader.BROWSER_FIREFOX=2;
		window.sop.loader.BROWSER_SAFARI=3;
		window.sop.loader.BROWSER_OPERA=4;
		window.sop.loader.BROWSER_MOZILLA=5;
		window.sop.loader.BROWSER_NETSCAPE=6;
		window.sop.loader.BROWSER_OTHERS=7;		
		        

		getErrorCode = function(){
			return window.sop.loader._ERROR_CODE;
		};

		getErrorString = function(){
			return window.sop.loader._ERROR_STR;
		};

		setErrorCode = function(code){
			if(typeof code == 'number' || typeof code == 'Number'){
				window.sop.loader._ERROR_CODE = code;
			}
		};

		setErrorString = function(str){
			if(typeof str == 'string' || typeof str == 'String'){
				window.sop.loader._ERROR_STR = str;
			}
		};

		sop.loader._browserCheck = function(){
			appName = navigator.appName;
			agent = navigator.userAgent;
			loaders = window.sop.loader;
			if (agent.indexOf("Opera") >= 0) {
				return loaders.BROWSER_OPERA;
			}else if(agent.indexOf("Edge") >= 0 ){
				return loaders.BROWSER_OTHERS;
			}else if(agent.indexOf("Mozilla/5.0 (Windows NT 10.0; Win64; x64)") >= 0 ){
				return loaders.BROWSER_OTHERS;
			}else if (agent.indexOf("Firefox") >= 0 || agent.indexOf("Minefield") >= 0) {
				return loaders.BROWSER_FIREFOX;
			} else if (agent.indexOf("Chrome") >= 0) {
				return loaders.BROWSER_CHROME;
			} else if (agent.indexOf("Safari") >= 0) {
				return loaders.BROWSER_SAFARI;
			} else if (agent.indexOf("MSIE") >= 0 || agent.indexOf("Trident") >= 0) {
				return loaders.BROWSER_IE;
			} else if (appName.indexOf("Mozilla") >= 0) {
				return loaders.BROWSER_MOZILLA;
			} else if (appName.indexOf("Netscape") >= 0) {
				return loaders.BROWSER_NETSCAPE;
			} else {
				return loaders.BROWSER_OTHERS;
			}
		};
		
        sop.loader._ieVersionCheck = function(){
        	
			var mode;
			var agentStr = navigator.userAgent;
			if (agentStr.indexOf("Trident/5.0") > -1) {
				if (agentStr.indexOf("MSIE 7.0") > -1)
					mode = 1;	//IE9 Compatibility View
				else
					mode = 2;	//IE9
			}else if (agentStr.indexOf("Trident/4.0") > -1) {
				if (agentStr.indexOf("MSIE 7.0") > -1)
					mode = 3;	//IE8 Compatibility View
				else
					mode = 4;	//IE8
			}else if (agentStr.indexOf("Trident/6.0") > -1) {
				if (agentStr.indexOf("MSIE 7.0") > -1)
					mode = 6;	//IE10 Compatibility View
				else
					mode = 7;	//IE10	
			}else if (agentStr.indexOf("Trident/7.0") > -1) {
				mode = 8;	//IE11
			}else{
				mode = 5;	//IE7
			}
			return mode;
		};		
        sop.loader._nsVersionCheck = function(){
        	
			var v,mv,mode;
			if (/Chrome/.test(navigator.userAgent)) {
		  		 v = /Chrome\/([\d\.]+) Safari/.exec(navigator.appVersion)[1];
		  		mv = /(\d+)\./.exec(v)[1];
		  		if(mv>31){	//chrome v32 upper
		  			mode=1;
		  		}else{		//chrome v31 minor
		  			mode=2;
		  		}		
	 		}else if (/Firefox/.test(navigator.userAgent)) {
	  			v = /Firefox\/([\d\.]+)/.exec(navigator.userAgent)[1];	
	 			mv = /(\d+)\./.exec(v)[1];
				mode=3;
			}else if (/Safari/.test(navigator.userAgent)) {
			  v = /Version\/([\d\.]+) Safari/.exec(navigator.appVersion)[1];
			  mv = /(\d+)\./.exec(v)[1];
				mode=4;
			}
			return mode;
		};		
		sop.loader._platFormCheck = function(){
	        var agent = navigator.userAgent;
			var sopLoader=window.sop.loader;
	        if (agent.indexOf("Windows") >= 0) {
				setErrorCode(sop.cons.error.NO_ERROR);
				setErrorString(sop.cons.errorStr.NO_ERROR);
	            return sopLoader.OS_WINDOW;
	        }
			/* 
	        if (agent.indexOf("Macintosh") >= 0) {
				setErrorCode(sop.cons.error.NO_ERROR);
				setErrorString(sop.cons.errorStr.NO_ERROR);
	            return sopLoader.OS_MAC;
	        }
	        if (agent.indexOf("Linux") >= 0) {
				setErrorCode(sop.cons.error.NO_ERROR);
				setErrorString(sop.cons.errorStr.NO_ERROR);
	            return sopLoader.OS_LINUX;
	        }
	        */
			setErrorCode(sop.cons.error.UNSUPPORTED_PLATFORM);
			setErrorString(sop.cons.errorStr.UNSUPPORTED_PLATFORM);
	        return null;
		};

        sop.loader._callScript = function(url){
            var head = document.getElementsByTagName('head')[0];
            var script = document.createElement('script');
            script.type = 'text/javascript';
            script.src = url;
            head.appendChild(script);
            setTimeout(function(){
                return;
            },1);
        };
        window.sop.loader.createInstance = function(divId, initCallback, failureCallback){
            initCallback = initCallback || function(){};	
            failureCallback = failureCallback || function(){};	
			var initError=null;
			 if (sop.loader._platFormCheck() != 'win') {	
				failureCallback(getErrorString(), getErrorCode(),initError);
				return;   
			 }
			 if(sop.loader._browserCheck()==sop.loader.BROWSER_OTHERS){
				setErrorCode(sop.cons.error.UNSUPPORTED_BROWER);
				setErrorString(sop.cons.errorStr.UNSUPPORTED_BROWER);
			 	failureCallback(getErrorString(), getErrorCode(),initError);
				return;
			 }
            var mapDiv;
            if (typeof(divId) == 'string' || typeof divId == 'String') {
				mapDiv = document.getElementById(divId);
				if(mapDiv==null){					
					setErrorCode(sop.cons.error.INVALID_DIV_ERROR);
					setErrorString(sop.cons.errorStr.INVALID_DIV_ERROR);	
					failureCallback(getErrorString(),getErrorCode(),initError);
					return;
				}
			}else if (typeof(divId) == 'object' || typeof(divId) == 'Object') {	//DIV형태체크
				var nodeName = divId.nodeName.upperCase();
				if (nodeName == 'DIV' || nodeName == 'SAPN') {
					mapDiv = divId;
				} else {
					setErrorCode(sop.cons.error.INVALID_DIV_ERROR);
					setErrorString(sop.cons.errorStr.INVALID_DIV_ERROR);
					failureCallback(getErrorString(),getErrorCode(),initError);
					return;
				}
			}else {
				setErrorCode(sop.cons.error.INVALID_DIV_ERROR);
				setErrorString(sop.cons.errorStr.INVALID_DIV_ERROR);
				failureCallback(getErrorString(),getErrorCode(),initError);
                return;
            }
			window.sop.loader._mapDiv=mapDiv;
			if(window.sop.loader._launcherOnLine()==false){
			setErrorCode(sop.cons.error.NOT_INIT);
				if (getErrorCode() == sop.cons.error.NOT_INIT ||getErrorCode() == sop.cons.error.LAUNCHER_NOT_INSTALLED|| getErrorCode()==sop.cons.error.UNABLE_EXCUTE_LANCHER) {
				    window.sop.loader._createPluginObject(mapDiv, 'XDcom');	//플러그인이 있는지 확인하기위해 일단 object생성
					if(window.sop.loader._browserCheck()==window.sop.loader.BROWSER_IE){	//internet explorer일 경우
						try{
							var abc=new ActiveXObject("XDWorldPlugIn.XDWorldCOM.1");
						}catch(e){
							sop.loader._openLauncherPage();
							return;	
						}
					}else{																	//비 internet explorer일 경우
						if(window.sop.loader._nsPluginExist()==false){
							sop.loader._openLauncherPage();
							return;	
						}	
					}	
				}			
			}else{	//런처가 있음.
				    window.sop.loader._createPluginObject(mapDiv, 'XDcom');	//플러그인이 있는지 확인하기위해 일단 object생성
					if(window.sop.loader._browserCheck()==window.sop.loader.BROWSER_IE){	//internet explorer일 경우
						try{
							var abc=new ActiveXObject("XDWorldPlugIn.XDWorldCOM.1");
						}catch(e){
							sop.loader._openLauncherPage();
							return;	
						}
					}else{																	//비 internet explorer일 경우
						if(window.sop.loader._nsPluginExist()==false){
							sop.loader._openLauncherPage();
							return;	
						}	
					}					
			}
			//window.sop.loader._createPluginObject(mapDiv, 'XDcom');
            if (sop.cons.error.NO_ERROR == getErrorCode()) {

               setTimeout(function(){
					window.sop.loader._create(mapDiv, 'XDcom');
					var pluginInit= window.sop.loader._getCFlag();
//					setTimeout(function(){
					if(!pluginInit){failureCallback(getErrorString(),getErrorCode(),initError);return;}					
					var XDcom = document.getElementById('XDcom');
					window.sop.idleproc._init(mapDiv, 'XDcom', XDcom,initCallback, failureCallback);	
//					}, 1000);
               },1000);
            }

            else {
				failureCallback(getErrorString(),getErrorCode(),initError);
            }
        };
        sop.earth.createInstance = sop.loader.createInstance;	
        window.sop.loader._nsPluginExist = function(){	//플러그인이 있는지 체크
			for (i=0; i < navigator.plugins.length; i++){
				if(navigator.plugins[i].name.indexOf("VWorld")!=-1){	
					return true;
				}
				if(i==navigator.plugins.length-1&&navigator.plugins[i].name.indexOf("VWorld")!=-1){
					return false;
				}
			}			        	
        }
        window.sop.loader._launcherExist = function(){
        	var flag = false;
        	try{
        		var abc=new ActiveXObject("XDLauncher.ATLWebUpdater.1");
        		if(abc){
        			flag = true;
        		}else{
        			flag = false;
        		}
        	}catch(e){
        		flag = false;
        	}
        	return flag;
        }
		window.sop.loader._openLauncherPage = function(){

			var mapDiv=window.sop.loader._mapDiv;
			if(mapDiv.style.display == 'none') mapDiv.style.display = 'block';	
			if(mapDiv){	
				var divOffSetTop, divOffSetHeight, divOffSetLeft, divOffSetWidth;
				divOffSetTop=mapDiv.offsetTop;
				divOffSetHeight=mapDiv.offsetHeight;
				divOffSetLeft=mapDiv.offsetLeft;
				divOffSetWidth=mapDiv.offsetWidth;
				var html=sop.loader._createHTML('install',divOffSetTop, divOffSetLeft, divOffSetWidth, divOffSetHeight, mapDiv);
				mapDiv.style.zIndex=0;
				mapDiv.innerHTML=html;
			}
			
		}
		/*
		window.sop.loader._isInstalled = function(){
			var div = document.getElementById("launcher");
			if(div==null){
				div=window.sop.loader._makeDiv("launcher");
			}
				setTimeout(function(){
					try{
						window.sop.loader._createLauncherObject(div,'XDLUC');
						XDLUC.RunUpdate('<%=propertyService.getString("3Dhost")%>', '<%=propertyService.getString("3Dport")%>', '<%=propertyService.getString("3Dversion")%>'); 
						window.location.reload();                                               
					}catch(e){
						window.sop.loader._isInstalled();
					}
				},3000);
		}
		*/
		window.sop.loader._confirmInstalled = function(category){
			var mapDiv=window.sop.loader._mapDiv;
//			mapDiv.style.border="1px solid #000000";
			var divOffSetTop, divOffSetHeight, divOffSetLeft, divOffSetWidth;
			divOffSetTop=mapDiv.offsetTop;
			divOffSetHeight=mapDiv.offsetHeight;
			divOffSetLeft=mapDiv.offsetLeft;
			divOffSetWidth=mapDiv.offsetWidth;
			var html=sop.loader._createHTML(category,divOffSetTop, divOffSetLeft, divOffSetWidth, divOffSetHeight, mapDiv);	
			mapDiv.style.zIndex=0;
			mapDiv.innerHTML=html;

		}
		window.sop.loader._onclickEventHandler = function(){
			if(sop.loader._browserCheck()==sop.loader.BROWSER_IE){
				location.href='http://xdworld.vworld.kr:8080/3dgis/launcher/ie/sopLauncherSetup_ie.exe';
//				location.href='http://xdworld.vworld.kr:8080/3dgis/launcher/sopLauncherSetup_co.exe';
//				location.href='http://10.1.2.6:8080/3dgis/launcher/sopLauncherSetup_co.exe';
			}else if(sop.loader._browserCheck()==sop.loader.BROWSER_CHROME || sop.loader._browserCheck()==sop.loader.BROWSER_FIREFOX || sop.loader._browserCheck()==sop.loader.BROWSER_SAFARI){
				location.href='http://xdworld.vworld.kr:8080/3dgis/launcher/ns/sopLauncherSetup_ns.exe';
//				location.href='http://xdworld.vworld.kr:8080/3dgis/launcher/sopLauncherSetup_co.exe';
			}else{
				alert(sop.cons.errorStr.UNSUPPORTED_BROWER);
			}
//			location.href='http://xdworld.vworld.kr:8080/3dgis/launcher/sopLauncherSetup.exe';
			window.sop.loader._confirmInstalled('reflash');
//			window.sop.loader._isInstalled();
		}		
		window.sop.loader._createHTML = function(category, top, left, width, height,mapDiv){
			var pgLeft, pgTop, dtLeft, dtTop, gtTop, gtLeft, twidth;
			if(width<=800)width=800;
			if(height<=533)height=533;
			pgLeft=(new Number(width)/2)-(800/2);
			pgTop=(new Number(height/2))-(533/2)-new Number(top);
			if(pgLeft<=0)pgLeft=0;
			if(pgTop<=0)pgTop=0;
			var html='';
			html+='<html><head></head><body style="margin:0 0 0 0;font" >';
			html+='<STYLE>';
			html+='a:link.mapAnchor      {COLOR:#F7E6D7;TEXT-DECORATION:none;}';
			html+='a:visited.mapAnchor   {COLOR:#F7E6D7;TEXT-DECORATION:none;}';
			html+='a:active.mapAnchor    {COLOR:#F7E6D7;TEXT-DECORATION:none;}';
			html+='a:hover.mapAnchor     {COLOR:#FF9900;TEXT-DECORATION:none;}';
			html+='</STYLE>';
			if (category == 'install'||category=='reflash') {
			if(sop.loader._browserCheck()==sop.loader.BROWSER_IE){
				html+='<div id="initError" style="position:relative;height:'+height+'px;background-color:#000000;"><div style="position:absolute;top:'+pgTop+'px;left:'+pgLeft+'px;width:800px;height:533px;z-index:0; text-align:center;background:url(http://xdworld.vworld.kr:8080/dll_home/images/image1.jpg) no-repeat left top;" >';
			}else if(sop.loader._browserCheck()==sop.loader.BROWSER_CHROME || sop.loader._browserCheck()==sop.loader.BROWSER_SAFARI|| sop.loader._browserCheck()==sop.loader.BROWSER_FIREFOX){
				html+='<div id="initError" style="position:relative;height:'+height+'px;background-color:#000000;"><div style="position:absolute;top:'+pgTop+'px;left:'+pgLeft+'px;width:800px;height:533px;z-index:0; text-align:center;background:url(http://xdworld.vworld.kr:8080/dll_home/images/image3.png) no-repeat left top;" >';
			}else{
				alert(sop.cons.errorStr.UNSUPPORTED_BROWER);
			}
				if (category != 'reflash') {
					if(sop.loader._browserCheck()==sop.loader.BROWSER_IE){
						html += '<div style="position:absolute;left:'+(450-(288/2)-10)+'px; top:'+((533/2)-(78/2)-18)+'px;z-index:1; text-align:center;">';
						html += '<img src="http://xdworld.vworld.kr:8080/dll_home/images/button01.png"  width=200 height=60 onclick="window.sop.loader._onclickEventHandler();" onmouseover="this.style.cursor=\'pointer\'"></div>';
						html += '<div style="position:absolute; bottom:60px; left:'+(450-(288/2)-3)+'px; z-index:2; text-align:center;">';
						html += '<img src="http://xdworld.vworld.kr:8080/dll_home/images/button02.png"  width=190 height=50 onclick="javascript:fnGoPlugInInstallPage();" onmouseover="this.style.cursor=\'pointer\'"></div>';
					
					}else if(sop.loader._browserCheck()==sop.loader.BROWSER_CHROME || sop.loader._browserCheck()==sop.loader.BROWSER_SAFARI|| sop.loader._browserCheck()==sop.loader.BROWSER_FIREFOX){
						html += '<div style="position:absolute;left:'+(450-(288/2)-10)+'px; top:'+((533/2)-(78/2)-18)+'px;z-index:1; text-align:center;">';
						html += '<a onclick="window.sop.loader._onclickEventHandler();" style="cursor:pointer;background:url(http://xdworld.vworld.kr:8080/dll_home/images/button01.png) no-repeat left top;width:200px; height:60px;display:block;background-size:200px 60px;text-indent:-5000px">플러그인 설치</a></div>';
						html += '<div style="position:absolute; bottom:60px; left:'+(450-(288/2)-3)+'px; z-index:2; text-align:center;">';
						html += '<a onclick="fnGoPlugInInstallPage();" style="cursor:pointer;background:url(http://xdworld.vworld.kr:8080/dll_home/images/button02.png) no-repeat left top;width:190px; height:50px;display:block;background-size:190px 50px;text-indent:-5000px">설치안내 바로가기</a></div>';
					}else{
						alert(sop.cons.errorStr.UNSUPPORTED_BROWER);
					}
				}
			}
			else if(category=='plugin'){
			html+='<div id="initError" style="position:relative;height:'+height+'px;background-color:#000000;"><div style="position:absolute;top:'+pgTop+'px;left:'+pgLeft+'px;width:800px;height:533px;z-index:0; text-align:center;background:url(http://xdworld.vworld.kr:8080/dll_home/images/image2.jpg) no-repeat left top;" >';
//				html+='<label><img src="http://xdworld.vworld.kr:8080/dll_home/image2.png" alt="추가기능실행을 선택하여 주세요." title="[추가기능실행]을 선택하여 주세요." style="width:800px;height:533px;" ></label>';
			}
			html+='</div></div></body></html>';
			return html;
		}
		window.sop.loader._makeDiv = function(customDivId){
				var customdiv=document.createElement("div");
				customdiv.style.position="absolute";
				customdiv.style.top="0px";
				customdiv.style.left="0px";
				customdiv.style.display="none";
				customdiv.id=customDivId;		
				return customdiv;	
		}
		window.sop.loader._launcherOnLine = function(){
			var flag = true;
			var div = document.getElementById("launcher");
			if(div==null){
				div=window.sop.loader._makeDiv("launcher");
			}
			document.body.appendChild(div);
			window.sop.loader._createLauncherObject(div,'XDLUC');
			flag = true;
			try{
			
				if (getErrorCode() == sop.cons.error.NO_ERROR){
					if(window.sop.loader._browserCheck()==window.sop.loader.BROWSER_IE){
						XDLUC.RunUpdate('<%=propertyService.getString("3Dhost")%>', '<%=propertyService.getString("3Dport")%>', '<%=propertyService.getString("3Dversion")%>');
					}else if(window.sop.loader._browserCheck()==window.sop.loader.BROWSER_SAFARI ||window.sop.loader._browserCheck()==window.sop.loader.BROWSER_CHROME || window.sop.loader._browserCheck()==window.sop.loader.BROWSER_FIREFOX){
						//launcher check for chrome and firefox 
					}else{
						setErrorCode(sop.cons.error.UNSUPPORTED_BROWER);
						setErrorString(sop.cons.errorStr.UNSUPPORTED_BROWER);	
						flag=false;
						return flag;											
					}
				}else{
					flag=false;
					return flag;
				}
			}catch(e){
				flag=false;
				setErrorCode(sop.cons.error.UNABLE_EXCUTE_LANCHER);
				setErrorString(sop.cons.errorStr.UNABLE_EXCUTE_LANCHER);
				return flag;
			}
		//	alert(flag);	//true/2013.12.12
			return flag;
		};
			window.sop.loader.c_flag=false;
			window.sop.loader._setCFlag = function(flag){

				window.sop.loader.c_flag=flag;
			}
			window.sop.loader._getCFlag = function(){
				return window.sop.loader.c_flag;
			}
			window.sop.loader._create = function(div, mapId){
//            	window.sop.loader._createPluginObject(div, mapId);
				var flag=true;
					try{
						if (getErrorCode() == sop.cons.error.NO_ERROR) {
							if(window.sop.loader._browserCheck()==window.sop.loader.BROWSER_IE || window.sop.loader._browserCheck()==window.sop.loader.BROWSER_SAFARI ){
									document.getElementById(mapId).getView();
							}else if(window.sop.loader._browserCheck()==window.sop.loader.BROWSER_CHROME || window.sop.loader._browserCheck()==window.sop.loader.BROWSER_FIREFOX){
								this.install_check=false;
								
								for (i=0; i < navigator.plugins.length; i++){
									if(navigator.plugins[i].name.indexOf("VWorld")!=-1){
										this.install_check=true;
									//	break;
									}
								}
								if(!this.install_check){
									this.notInstallPlugin = function(){
										this.message=null;
										this.name=null;
									}
									var c_e = new this.notInstallPlugin();
									c_e.message=sop.cons.errorStr.LAUNCHER_NOT_INSTALLED;
									c_e.name='plugin is not install';
									throw c_e;
								}						
							}else{
								setErrorCode(sop.cons.error.UNSUPPORTED_BROWER);
								setErrorString(sop.cons.errorStr.UNSUPPORTED_BROWER);	
								window.sop.loader._setCFlag(false);
								return;
							}
							setErrorCode(sop.cons.error.NO_ERROR);
							setErrorString(sop.cons.errorStr.NO_ERROR);
							window.sop.loader._setCFlag(true);
							return;
						}else{
							window.sop.loader._create();
						}
					}catch(e){
						window.sop.loader._mapDiv.style.backgroundColor="#000000";
						if(window.sop.loader._browserCheck()==window.sop.loader.BROWSER_IE){
										
							window.sop.loader._confirmInstalled('plugin');
						//	window.sop.loader._openLauncherPage();
						}else if(window.sop.loader._browserCheck()==window.sop.loader.BROWSER_CHROME || window.sop.loader._browserCheck()==window.sop.loader.BROWSER_SAFARI || window.sop.loader._browserCheck()==window.sop.loader.BROWSER_FIREFOX){
							window.sop.loader._openLauncherPage();
						}else{
							setErrorCode(sop.cons.error.UNSUPPORTED_BROWER);
							setErrorString(sop.cons.errorStr.UNSUPPORTED_BROWER);
							window.sop.loader._setCFlag(false);
							return;
						}
						setErrorCode(sop.cons.error.NOT_INIT);
						setErrorString(sop.cons.errorStr.NOT_INIT);	
						window.sop.loader._setCFlag(false);
						return;
					}
        };
		var a=0;
        window.sop.loader._createPluginObject = function(div, objId){
            try {
				if(sop.loader._browserCheck()==sop.loader.BROWSER_IE){
					div.innerHTML = '<object  onerror=\'window.sop.loader._pluginError();return false;\' id=\'' + objId + '\'CLASSID=\'CLSID:' + window.sop.loader.XDCOMCLSID + '\'WIDTH=\'100%\' HEIGHT=\'100%\'></OBJECT>';
				}else{
					if(sop.loader._browserCheck()!=sop.loader.BROWSER_OTHERS){
						div.innerHTML = '<embed id=\'' + objId + '\' type=\''+window.sop.loader.VWORLD_EMBED_TYPE+'\'WIDTH=\'100%\' HEIGHT=\'100%\'>';
					}
				}
				setErrorCode(sop.cons.error.NO_ERROR);
				setErrorString(sop.cons.errorStr.NO_ERROR);					
			}catch (e) {
				setErrorCode(sop.cons.error.CREATE_PLUGIN_ERROR);
				setErrorString(sop.cons.errorStr.CREATE_PLUGIN_ERROR);	
        	}
        };

        window.sop.loader._createLauncherObject = function(div, objId){
			
			var launcher=null;
			try {
				if(sop.loader._browserCheck()==sop.loader.BROWSER_IE){
					div.innerHTML = '<object  onerror=\'window.sop.loader._luncherError();return false; \' id=\'' + objId + '\'CLASSID=\'CLSID:' + window.sop.loader.XDLANCHCLSID + '\'WIDTH=\'100%\' HEIGHT=\'100%\'></OBJECT>';
				}else{
					if(sop.loader._browserCheck()!=sop.loader.BROWSER_OTHERS){
					}
				}			
					setErrorCode(sop.cons.error.NO_ERROR);
					setErrorString(sop.cons.errorStr.NO_ERROR);
            } 
            catch (e) {
				setErrorCode(sop.cons.error.LAUNCHER_NOT_INSTALLED);
				setErrorString(sop.cons.errorStr.LAUNCHER_NOT_INSTALLED);
            }
        };			

		window.sop.loader._pluginError = function(){
			setErrorCode(sop.cons.error.CREATE_PLUGIN_ERROR);
			setErrorString(sop.cons.errorStr.CREATE_PLUGIN_ERROR);
			return false;
		};

		window.sop.loader._luncherError = function(){
			setErrorCode(sop.cons.error.LAUNCHER_NOT_INSTALLED);
			setErrorString(sop.cons.errorStr.LAUNCHER_NOT_INSTALLED);	
			return false;
		};
        window.sop.loader._serverStart = function(initCallback, failureCallback){

       // if(sop.loader._browserCheck()==sop.loader.BROWSER_FIREFOX){
        	// window.sop.idleproc.map.div.oncontextmenu=function(){return false;};
        	 document.oncontextmenu=function(){return false;};
       // }

			var obj = window.sop.idleproc.map.pluginObject;
			
			
			
            if (sop.cons.error.NO_ERROR==getErrorCode()) {	
               window.sop.idleproc.map.div.style.display = 'inline-block';
				obj.setDefaultServerURL("<%=propertyService.getString("3Dhost")%>",<%=propertyService.getString("3Dport")%>);
				obj.setWASServer(<%=propertyService.getString("3DWASServer")%>);
				
                window.setTimeout(function(){

				if(window.sop.loader._apiCheck(window.sop.loader.APIKEY)){
                    
					setErrorCode(sop.cons.error.NO_ERROR);
					setErrorString(sop.cons.errorStr.NO_ERROR);
					try{obj.getOption().setMetaInfoVisible(sop.cons.enums.SOPVISIBLE_OFF);}catch(e){}
					//20140918 실내디비 레이어 추가 
					obj.SetServerLayerURL("xdworld.vworld.kr:8080/real3d","indoor_build");
					obj.SetServerLayerURL("xdworld.vworld.kr:8080/real3d","poi_indoor");
					
					var l_list = obj.getLayerList();
					for(i=0;i<l_list.count();i++){
						var l=l_list.indexAtLayer(i);

						if(l.getName().match('_add_')!=null){
							l.setVisible(sop.cons.enums.SOPVISIBLE_OFF);
						}
					}
					obj.getLayerList().nameAtLayer('poi_base_north').setMaxLevel(14);
					obj.getLayerList().nameAtLayer('poi_bound_north').setMaxLevel(8);
					obj.getLayerList().nameAtLayer('poi_road_north').setMaxLevel(14);
					
					obj.getLayerList().setVisible("indoor_build", 257);
					obj.getLayerList().setVisible("poi_indoor", 257);
					
					
					window.sop.idleproc.allocSysEvent();
					window.sop.idleproc.map.BalloonManager = new window.sop.idleproc.balloonManager();
					window.sop.idleproc.map.BalloonManager.init();

					initCallback(obj);

				window.sop.idleproc.addEventListener(window.sop.idleproc.map.pluginObject,'serverdisconnect',function(){
				setErrorCode(sop.cons.error.CREATE_CONNECT_MUTEX);
				setErrorString(sop.cons.errorStr.CREATE_CONNECT_MUTEX);
				var layerlist = obj.getLayerList();
				failureCallback(getErrorString(),getErrorCode(),null);
  			   });
				}else{
						failureCallback(getErrorString(),getErrorCode(),null);
					return false;
				}
				}, 1);
            }else{
				failureCallback(getErrorString(),getErrorCode(),null);
			}
        };

		window.sop.loader._apiCheck = function(api){
			var plugin = window.sop.idleproc.map;
				var chkDom=true;
					if(chkDom){
							var confirm =  plugin.pluginObject.confirmIssuedKey(api);
							if(window.sop.loader._browserCheck()==window.sop.loader.BROWSER_IE){
								plugin.pluginObject.setDataAPI(true);
							}	
							if(confirm){
								setErrorCode(sop.cons.error.NO_ERROR);
								setErrorString(sop.cons.errorStr.NO_ERROR);
							}else{
								setErrorCode(sop.cons.error.INVALID_API_KEY);
								setErrorString(sop.cons.errorStr.INVALID_API_KEY);	
							}
							return confirm;
					}else{
						setErrorCode(sop.cons.error.INVALID_DOMAIN);
						setErrorString(sop.cons.errorStr.INVALID_DOMAIN);
						return false;
					}
		};

		window.sop.idleproc.setMap = function(mapDiv, pluginID, pluginObject){
			window.sop.idleproc.map.pluginID = pluginID;
			window.sop.idleproc.map.div = mapDiv;
			window.sop.idleproc.map.pluginObject = pluginObject;
		};

		window.sop.idleproc.eventHandlerIdToKey = function(objID){
			return "eventSupporter_" + objID;
		};
		window.sop.idleproc.addEventListener = function(object, eventID, listenerCB){
			var p = window.sop.idleproc;
			var objEventID =  p.eventHandlerIdToKey(object.getEventHandlerId_());
			
			if( p.map.div.EventSupporters[objEventID] == null ){
				p.map.div.EventSupporters[objEventID] = new p.eventSupporter; //이벤트 Class
			}
			
			p.map.div.EventSupporters[objEventID].addHandler(eventID, listenerCB);
		};

		window.sop.idleproc.removeEventListener = function(object, eventID, listenerCB){
			var p = window.sop.idleproc;
			var objEventID = p.eventHandlerIdToKey(object.getEventHandlerId_());
			if( p.map.div.EventSupporters[objEventID] == null ){
				return;
			}
			
			p.map.div.EventSupporters[objEventID].removeHandler(eventID, listenerCB);
		};

		window.sop.idleproc.eventSupporter = function(){
			var listenerParam = this;
			listenerParam.handlers = [];
			return listenerParam;
		};
		window.sop.idleproc.eventSupporter.prototype.getHandlerList = function(eventID){
			var listenerParam = this;
			return listenerParam.handlers[eventID];
		};
		
		window.sop.idleproc.eventSupporter.prototype.isHandler = function(eventID, listenerCB){
			var listenerParam = this;
			var c = listenerParam.getHandlerList(eventID);
			if( !c || c.length == 0 ){
				return false;
			}
			for( var b = 0 ; b < c.length ; b++ ){
				if( c[b] == listenerCB ) {
					return true;
				}
			}
			return false;
		};

		window.sop.idleproc.eventSupporter.prototype.addHandler = function(eventID, listenerCB){
			var listenerParam = this;
			if(listenerParam.isHandler(eventID, listenerCB)){
				return;
			}
			var handler = listenerParam.getHandlerList(eventID);
			
			if(!handler){
				handler = [];
				listenerParam.handlers[eventID] = handler;
			}

			handler.push(listenerCB);
		};

		window.sop.idleproc.eventSupporter.prototype.removeHandler = function(eventID, listenerCB){
			var listenerParam = this;
			var handler = listenerParam.getHandlerList(eventID);
			
			if(!handler){
				return;
			}
			for(var i = 0 ; i < handler.length ; i++){
				
				if (listenerCB != null) { 
					if (handler[i] == listenerCB) {
						handler.splice(i, 1);
					}
				}
				else {
					if (handler[i] != null) {
						
						handler.splice(i, 1);
					}
				}
			}
		};

		window.sop.idleproc.eventSupporter.prototype.perform = function(eventID, argsArray){ 
			
			var listenerParam = this;
			var handler = listenerParam.getHandlerList(eventID);
			if(!handler){ 
				return; 
			}
			var hElements = []; 
			for( var i = 0 ; i < handler.length ; i++ ){
				hElements.push(handler[i]); 
			}
			
			for( var i = 0 ; i < hElements.length ; i++ ){ 
				var element = hElements[i]; 
				
				if( i > 0 ){
					var l = false;
					for( var j = 0 ; j < handler.length ; j++ ){
						if( element == handler[j] ){
							l = true; 
							break;
						}
					}
					if(!l){
						continue;
					}
				}
				try{
					
					element.apply(element, argsArray); 
				}catch(o){
				}
			}
		};

		window.sop.idleproc.getEventSupporter = function(namespace, obj){
			if( obj == null ){
				
				return null;				
			}

			var objEventID = namespace.eventHandlerIdToKey(obj.getEventHandlerId_());
			var eventSupporter = namespace.map.div.EventSupporters[objEventID];

			if( eventSupporter == null ){
				return null;
			}
			return eventSupporter;
		};
		
		window.sop.idleproc.SOPEvent = function(object, targetObj, layobj, x, y, lon, lat, alt, keyValue){
			var eventParam = this;
			
			eventParam.targetObject = targetObj;
			eventParam.targetLayer = layobj;
			
			eventParam.x = x;
			eventParam.y = y;
			eventParam.lon = lon;
			eventParam.lat = lat;
			eventParam.alt = alt;
			//eventParam.screenXY = new ActiveXObject('XDWorldPlugin.SOPVec2.1');
			//eventParam.screenXY.set(x,y);

			//eventParam.mapCoordinate = new ActiveXObject('XDWorldPlugin.SOPVec3.1');
			//eventParam.mapCoordinate.set(lon, lat, alt);

			eventParam.shiftKey = false;
			eventParam.altKey = false;
			eventParam.ctrlKey = false;
			
			switch(keyValue){
				case 1:
					eventParam.shiftKey = true;
					break;
				case 2:
					eventParam.ctrlKey = true;
					break;
				case 3:
					eventParam.shiftKey = true;
					eventParam.ctrlKey = true;
					break;
				case 4:
					eventParam.altKey = true;
					break;
				case 5:
					eventParam.shiftKey = true;
					eventParam.altKey = true;
					break;
				case 6:
					eventParam.shiftKey = true;
					eventParam.altKey = true;
					eventParam.ctrlKey = true;
					break;
			}
			
			eventParam.keyValue = keyValue;
			return eventParam;
		};

		window.sop.idleproc.SOPEvent.prototype.getTarget = function(){
			var eventParam = this;
			return eventParam.targetObject;
		};

		window.sop.idleproc.SOPEvent.prototype.getTargetLayer = function(){
			var eventParam = this;
			return eventParam.targetLayer;
		};

		window.sop.idleproc.SOPEvent.prototype.getScreenXY = function(){
			var eventParam = this;
			var obj = window.sop.idleproc.map.pluginObject;
			var screenXY = obj.createVec2();
			screenXY.set(eventParam.x, eventParam.y);
			return screenXY;
		};

		window.sop.idleproc.SOPEvent.prototype.getMapCoordinate = function(){
			var eventParam = this;
			var obj = window.sop.idleproc.map.pluginObject;
			var mapCoordinate = obj.createVec3();
			mapCoordinate.set(eventParam.lon, eventParam.lat, eventParam.alt);
			return mapCoordinate;
		};

		window.sop.idleproc.SOPEvent.prototype.getShiftKey = function(){
			var eventParam = this;
			return eventParam.shiftKey;
		};

		window.sop.idleproc.SOPEvent.prototype.getAltKey = function(){
			var eventParam = this;
			return eventParam.altKey;
		};

		window.sop.idleproc.SOPEvent.prototype.getCtrlKey = function(){
			var eventParam = this;
			return eventParam.ctrlKey;
		};

		window.sop.idleproc.SOPEvent.prototype.getType = function(){
			return "SOPEvent";
		};
		//2013.12.14. netscape
		window.sop.idleproc.NSEventInit = function(map){
			var p = window.sop.idleproc.map;
			p.createCallbackNodeForNS = function(targetObj, eventName, eventParam, eventExec){
				var s = document.createElement("script");
				var h = document.getElementsByTagName('head')[0];
				s.setAttribute("language","javascript");
				s.setAttribute("type","text/javascript");
				s.text="document.addEventListener(\""+eventName+"\","+eventExec;
				h.appendChild(s);
			}

			p.createEventCodeForNS = function(eventID, paramLength){

				var paramStr, callbackParam = "";
				function operParam(eventID, eventParam){
				var str = "";

    			 for (var i = 0 ; paramLength > i; i++) {
    				  str += "callbackParam[" + i + "] = " + eventParam[i] + ";";
   				  }
     			return str;
				}
				if(paramLength==5){
					paramStr= operParam(eventID, ["e.detail.eyePos","e.detail.lookAtPos","e.detail.dTilt","e.detail.dDirection","e.detail.dDist"])	
				}else if(paramLength==1){
					if(eventID=='timeControlClose'){
						paramStr= operParam(eventID, ["e.detail.bClose"])
					}else{
						paramStr= operParam(eventID, ["e.detail.piCamera"])
					}	
				}else{
					paramStr="";
				}
				return "function(e){try{"
					+ "var p = top.window.sop.idleproc;" 
				     + "var paramCount = " + paramLength + ";"
					 + "var objEvent = null;"
					 + "var layerEvent = null;"
					 + "if( paramCount > 0 ){" 
					 	+ "objEvent = p.getEventSupporter(p, e.detail.iMObject);"	
					 + "}"
					 + "if( paramCount > 1 ){"
					 	+ "layerEvent = p.getEventSupporter(p, e.detail.piLayer);"
					 + "}"
					 + "var pluginEvent = p.getEventSupporter(p, p.map.pluginObject);"
					 + "if(objEvent == null && layerEvent == null && pluginEvent == null){return;}"
					 + "else{"
						+ "var callbackParam = [];"
						+ "if( paramCount == 9 ){"
							+ "callbackParam[0] = new p.SOPEvent(e.detail.iMObject, e.detail.iPObject, e.detail.piLayer, e.detail.nX, e.detail.nY, e.detail.dLon, e.detail.dLat, e.detail.dAlt, e.detail.dShift);"
						+ "}else{"
							+paramStr
						   + "}"
						   + "if(objEvent != null){objEvent.perform('" + eventID + "', callbackParam);}"
						   + "if(layerEvent != null){layerEvent.perform('" + eventID + "', callbackParam);}"
						   + "if(pluginEvent != null){pluginEvent.perform('" + eventID + "', callbackParam);}"
				     + "}"
					 + "}catch(e){}"
					 + "});";
					 
			};

				var eventList = [ 
					[ "Fire_eventSOPEventClick",  "click", 9],
					[ "Fire_eventSOPEventDBlClick", "dblclick", 9 ],
					[ "Fire_eventSOPEventMouseOver", "mouseover", 9 ],
					[ "Fire_eventSOPEventMouseOut", "mouseout", 9 ],
					[ "Fire_eventSOPEventMouseUp", "lmouseup", 9 ],
					[ "Fire_eventSOPEventMouseDown", "lmousedown", 9 ],
					[ "Fire_eventSOPEventRMouseUp", "rmouseup", 9 ],
					[ "Fire_eventSOPEventRMouseDown", "rmousedown", 9 ], 
//					[ "Fire_eventSOPEventMouseMove", "mousemove", 9 ],
					[ "Fire_eventSOPEventCamMoveStart", "cammovestart", 1 ],
					[ "Fire_eventSOPEventCamMoveEnd", "cammoveend", 1 ],
//					[ "Fire_eventSOPEventMapLoadComplete", "maploadcomplete" ], 
//					[ "Fire_eventSOPEventObjectDelete", "objectdelete" ],
//					[ "Fire_eventSOPEventServerConnect", "serverconnect" ],
//					[ "Fire_eventSOPEventServerDisconnect", "serverdisconnect" ], 
					[ "Fire_eventSOPEventBalloonOpened", "balloonopened",0 ], 
					[ "Fire_eventSOPEventBalloonClosed", "balloonclose",0 ], 
					[ "Fire_eventSOPEventBalloonMove", "balloonmove",0 ],
					[ "Fire_eventSOPEventResize", "viewresize",0 ],
					[ "Fire_eventSOPEventBalloonChange", "balloonchange",0 ],
					[ "Fire_eventSOPTimeCtrlState", "timeControlClose",1 ]
//					[ "Fire_eventSOPEventDataLoadFail", "dataloadfail" ],
//					[ "Fire_eventSOPEventMenuClick", "menuClick" ]	//메뉴이벤트
				];
				
			for (var i = 0; eventList.length > i; i++){
				p.createCallbackNodeForNS(p.pluginID, eventList[i][0], eventList[i][1], p.createEventCodeForNS(eventList[i][1], eventList[i][2]));
			}
		}
		//2013.12.14. ms internet explorer
		window.sop.idleproc.IEEventInit = function(){
			var p = window.sop.idleproc.map;
			p.createCallBackNode = function(div, targetObj, eventName, eventParam, eventExec){
				var c,i = document.createElement( "script" );

				if(sop.loader._ieVersionCheck()<=6){
					i.setAttribute( "language", "javascript" );
					i.setAttribute( "for", targetObj );
					i.setAttribute( "event", eventName+ "(" + eventParam.join(",") + ")" );
					i.setAttribute( "text", eventExec );

					if (i.text != eventExec) 
						i.text = eventExec;
					div.appendChild(i);
				}else if(sop.loader._ieVersionCheck()>=7){

				 c = document.getElementsByTagName("head")[0];
					i.setAttribute( "language", "javascript" );
					i.setAttribute( "for", targetObj );
					i.setAttribute( "event", eventName+ "(" + eventParam.join(",") + ")" );
					i.setAttribute( "text", eventExec );
	
					if (i.text != eventExec) 
						i.text = eventExec;

					c.appendChild(i);
				}
			};

			p.createEventCode = function(eventID, eventParam){
			
				var callbackParam = "";

				function operParam(eventID, eventParam){
					var str = "";
					var j = 0;
					
					if (eventID == "objectdelete") {
						j = 1;
					}
					else if(eventID == "timeControlClose"){
						j = 1;
					}
					
					for (var i = 1 ; eventParam.length > i - j; i++) {
						str += "callbackParam[" + (i - 1) + "] = " + eventParam[i - j] + ";";
					}     
					return str;
				}
				
		
				return "var p = top.window.sop.idleproc;" 
				     + "var paramCount = " + eventParam.length + ";"
					 + "var objEvent = null;"
					 + "var layerEvent = null;"
					 + "if( paramCount > 0 ){" 
					 	+ "objEvent = p.getEventSupporter(p, object);"
					 + "}"
					 + "if( paramCount > 1 ){"
					 	+ "layerEvent = p.getEventSupporter(p, layObj);"
					 + "}"
					 + "var pluginEvent = p.getEventSupporter(p, p.map.pluginObject);"
					 + "if(objEvent == null && layerEvent == null && pluginEvent == null){return;}"
					 + "else{"
					 	   + "var callbackParam = [];"
						   + "if( paramCount == 9 ){"
							   + "callbackParam[0] = new p.SOPEvent(object, targetObj, layObj, x, y, lon, lat, alt, keyvalue);"
						   + "}"
						   + "else{"
						       + operParam(eventID, eventParam)
						   + "}"
						   + "if(objEvent != null){objEvent.perform('" + eventID + "', callbackParam);}"
						   + "if(layerEvent != null){layerEvent.perform('" + eventID + "', callbackParam);}"
						   + "if(pluginEvent != null){pluginEvent.perform('" + eventID + "', callbackParam);}"
				     + "}";	
			};
			
			var div = document.createElement("div");
			div.id = p.pluginID + "_scriptsNode";
			div.style.display = "none";
			div.innerHTML = "&nbsp;";
			
			var eventList = [ 
				[ "eventSOPEventClick", [ "object", "targetObj", "layObj", "x", "y", "lon", "lat", "alt", "keyvalue" ], "click" ],
				[ "eventSOPEventDBlClick", [ "object", "targetObj", "layObj", "x", "y", "lon", "lat", "alt", "keyvalue" ], "dblclick" ],
				[ "eventSOPEventMouseOver", [ "object", "targetObj", "layObj", "x", "y", "lon", "lat", "alt", "keyvalue" ], "mouseover" ],
				[ "eventSOPEventMouseOut", [ "object", "targetObj", "layObj", "x", "y", "lon", "lat", "alt", "keyvalue" ], "mouseout" ],
				[ "eventSOPEventMouseUp", [ "object", "targetObj", "layObj", "x", "y", "lon", "lat", "alt", "keyvalue" ], "lmouseup" ],
				[ "eventSOPEventMouseDown", [ "object", "targetObj", "layObj", "x", "y", "lon", "lat", "alt", "keyvalue" ], "lmousedown" ],
				[ "eventSOPEventRMouseUp", [ "object", "targetObj", "layObj", "x", "y", "lon", "lat", "alt", "keyvalue" ], "rmouseup" ],
				[ "eventSOPEventRMouseDown", [ "object", "targetObj", "layObj", "x", "y", "lon", "lat", "alt", "keyvalue" ], "rmousedown" ], 
				[ "eventSOPEventMouseMove", [ "object", "targetObj", "layObj", "x", "y", "lon", "lat", "alt", "keyvalue" ], "mousemove" ],
				[ "eventSOPEventCamMoveStart", [ "object" ], "cammovestart" ],
				[ "eventSOPEventCamMoveEnd", [ "object" ], "cammoveend" ],
				[ "eventSOPEventNavigationEnd", [], "moveovalend" ],								
				[ "eventSOPEventMapLoadComplete", [], "maploadcomplete" ], 
				[ "eventSOPEventObjectDelete", [ "object" ], "objectdelete" ],
				[ "eventSOPEventServerConnect", [], "serverconnect" ],
				[ "eventSOPEventServerDisconnect", [], "serverdisconnect" ], 
				[ "eventSOPEventBalloonOpened", [], "balloonopened" ], 
				[ "eventSOPEventBalloonClosed", [], "balloonclose" ], 
				[ "eventSOPEventBalloonMove", [], "balloonmove" ],
				[ "eventSOPEventResize", [], "viewresize" ],
				[ "eventSOPEventBalloonChange", [], "balloonchange" ],
//				[ "eventSOPEventDataLoadFail", [], "dataloadfail" ],
				[ "eventSOPTimeCtrlState", ["bClose"], "timeControlClose" ]
			];
			
			for (var i = 0; eventList.length > i; i++){
				p.createCallBackNode(div, p.pluginID, eventList[i][0], eventList[i][1], p.createEventCode(eventList[i][2], eventList[i][1]));
			}
			p.div.appendChild(div);
			div.innerHTML += "&nbsp;";
		};
	
		window.sop.idleproc.allocSysEvent = function(){
			var p = window.sop.idleproc;
			p.addEventListener(p.map.pluginObject,
							   'maploadcomplete',
							   function(){
							   	alert("maploadcomplete");
							   });
			p.addEventListener(p.map.pluginObject,
							   'objectdelete',
							   function(obj){
							   	alert("objectdelete");
							   });
			p.addEventListener(p.map.pluginObject,
							   'serverconnect',
							   function(){
							   	alert("serverconnect");
							   });
			p.addEventListener(p.map.pluginObject,
							   'serverdisconnect',
							   function(){
							   	alert("serverdisconnect");
							   });				   
			p.addEventListener(p.map.pluginObject,
							   'dataloadfail',
							   function(){
							   	alert("dataloadfail");
							   });			
		};

		window.sop.idleproc.balloonManager = function(){
			var balloonParam = this;

			balloonParam.balloonState = {};
			balloonParam.balloonState.OPENING = 1;
			balloonParam.balloonState.OPENED = 2;
			balloonParam.balloonState.MOVE = 3;
			balloonParam.balloonState.RESIZE = 4;
			balloonParam.balloonState.CHANGED = 5;
			balloonParam.balloonState.CLOSED = 6;

			balloonParam.contentRootDiv = null;
			balloonParam.contentLowDiv = null;
			balloonParam.contentMiddleDiv = null;
			balloonParam.contentiFrame = null;
			
			balloonParam.ownerDocument = window.sop.idleproc.map.div.ownerDocument; 
			balloonParam.map3dDiv = window.sop.idleproc.map.div;
			balloonParam.state = balloonParam.balloonState.CLOSED;
			balloonParam.pObject = window.sop.idleproc.map.pluginObject;

			balloonParam.prevBalloonX = -1;
			balloonParam.prevBalloonY = -1;

			balloonParam.isBalloonOk = false;

			balloonParam.MoveECount = 0;

			balloonParam.gapObjectFrameLeft = 0;
			balloonParam.gapObjectFrameTop = 0;

			balloonParam.contentWidth = 0;
			balloonParam.contentHeight = 0;
			
			this.init = function(){
				
				var balloonParam;
				try {
					balloonParam = top.window.sop.idleproc.map.BalloonManager;
				} catch (e) {
					balloonParam = window.sop.idleproc.map.BalloonManager;					
				}
				
				var p = window.sop.idleproc;
				
				balloonParam.contentRootDiv = balloonParam.ownerDocument.createElement("div");
				balloonParam.contentRootDiv.style.cssText = "display: none;z-index: 100; position: absolute; margin: 0 0 0 0; padding: 0px";
				balloonParam.contentRootDiv.style.left = balloonParam.map3dDiv.style.left;
				balloonParam.contentRootDiv.style.top = balloonParam.map3dDiv.style.top;
				balloonParam.map3dDiv.appendChild(balloonParam.contentRootDiv);
				
				balloonParam.contentMiddleDiv = balloonParam.ownerDocument.createElement("div");
				balloonParam.contentMiddleDiv.style.cssText = "margin: 0 0 0 0; padding: 0px; position: relative; left: 0px; top: 0px;";
				balloonParam.contentRootDiv.appendChild(balloonParam.contentMiddleDiv);
				
				balloonParam.contentLowDiv = balloonParam.ownerDocument.createElement("div");
				balloonParam.contentLowDiv.style.cssText = "margin: 0 0 0 0; padding: 0px; position: absolute; top: 0px; left: 0px; overflow: auto";
				balloonParam.contentMiddleDiv.appendChild(balloonParam.contentLowDiv);
				
				
				balloonParam.contentiFrame = balloonParam.ownerDocument.createElement("iframe");
				balloonParam.contentiFrame.name = "balloonframe";
				balloonParam.contentiFrame.style.position = "absolute";
				balloonParam.contentiFrame.style.left = "0px";
				balloonParam.contentiFrame.style.top = "0px";
				balloonParam.contentiFrame.style.width = "100%";
				balloonParam.contentiFrame.style.height = "100%";
				balloonParam.contentiFrame.style.filter = "progid:DXImageTransform.Microsoft.Alpha(opacity=0)";
				balloonParam.contentiFrame.style.zIndex = -10000;
				balloonParam.contentiFrame.setAttribute("frameborder", "2");
				balloonParam.contentiFrame.setAttribute("scrolling", "no");
				balloonParam.contentiFrame.setAttribute("src", "_blank");
				balloonParam.contentiFrame.style.display = "inline";
				balloonParam.contentRootDiv.appendChild(balloonParam.contentiFrame);

				p.addEventListener( p.map.pluginObject, "balloonopened", balloonParam.OpeningEvent );
				p.addEventListener( p.map.pluginObject, "balloonclose", balloonParam.close );
				p.addEventListener( p.map.pluginObject, "balloonmove", balloonParam.MoveEvent );
				p.addEventListener( p.map.pluginObject, "viewresize", balloonParam.ResizeEvent );
				p.addEventListener( p.map.pluginObject, "balloonchange", balloonParam.ChangeEvent );

				balloonParam.OperStartPoint();
			};
		
		
			this.contentDefaultBalloon = function(){
				var balloonParam;
				try {
					balloonParam = top.window.sop.idleproc.map.BalloonManager;//this;
				} 
				catch (e) {
					balloonParam = window.sop.idleproc.map.BalloonManager;//this;
				}
				

				
				var balloon = balloonParam.pObject.getBalloon();

				if( balloon == null )
					return null;
				
				var targetObj = balloon.getTarget();

				if( targetObj.getName() == "" && targetObj.getDescription() == "" ){
					return null;
				}
				else {
					
					var textStyle = function(obj, style){
						var tag = "";
						if( style.getFontType(obj.SOPTEXTSTYLE_FONT_BOLD) )
							tag += "font-weight:bold;";
						if( style.getFontType(obj.SOPTEXTSTYLE_FONT_ITALIC) )
							tag += "font-style:italic;";					
						if( style.getFontType(obj.SOPTEXTSTYLE_FONT_UNDERLINE) )
							tag += "text-decoration:underline;";
						return tag;
					};

					var html = "";
					var bExistName = false;
		
					if( targetObj.getName() != "" ){
						//var nameStyle = targetObj.getNameStyle();
						
						bExistName = true;
						html += "<div style='font-size:14px; font-weight:bold; margin-top:0px; vertical-align:middle;'><p style='margin-top:0px; margin-bottom:0px;' dir=ltr>" + targetObj.getName() + "</p></div>";
						//html += "<div style='color:rgb(" + nameStyle.getColor().getR() + "," + nameStyle.getColor().getG() + "," + nameStyle.getColor().getB() + ");" +
						//				+ "font-family:" + nameStyle.getFontName() + "; font-size:" + nameStyle.getSize() + "px;" + textStyle(pObject, nameStyle) + "'>"				  
						//			+ "<p style='margin-top:0px; margin-bottom:0px;' dir=ltr>" + targetObj.getName() + "</p></div>";
					}
					if( targetObj.getDescription() != "" ){
						if(bExistName)
							html += "<div style='font-size:10px;margin-top:0px; margin-bottom:0px vertical-align:middle;";
						else
							html += "<div style='vertical-align:middle;";
						
						if(balloonParam.isHtmlTag(targetObj.getDescription()))
							html += "'>" + targetObj.getDescription();
						else{
							//var descStyle = targetObj.getDescriptionStyle();
							
							html += "'><p style='margin-top:0px; margin-bottom:0px;' dir=ltr>" + targetObj.getDescription() + "</p></div>";
							
							//html += "color:rgb(" + descStyle.getColor().getR() + "," + descStyle.getColor().getG() + "," + descStyle.getColor().getB() + ");" +
							//	    + "font-family:" + descStyle.getFontName() + "; font-size:" + descStyle.getSize() + "px;" + textStyle(pObject, nameStyle) + "'>"
							//     + "<p style='margin-top:0px; margin-bottom:0px;' dir=ltr>" + targetObj.getDescription() + "</p></div>"; 
						}
					}
					//html += "</div>";
					
					var contentDiv = document.createElement("div");
					contentDiv.id = "sopballooninnercontents";
					contentDiv.style.left = "0px";
					contentDiv.style.top = "0px";
					contentDiv.style.position = "relative";
					contentDiv.style.display = "inline";

					contentDiv.innerHTML = html;
					
					balloonParam.contentMiddleDiv.appendChild(contentDiv);

					return contentDiv;
					
				}
				return null;				
			};

			this.contentHtmlBalloon = function(){
				var balloonParam;
				try{
					balloonParam = top.window.sop.idleproc.map.BalloonManager;//this;	
				}catch(e){
					balloonParam = window.sop.idleproc.map.BalloonManager;//this;
				}
				
				
				var balloon = balloonParam.pObject.getBalloon();

				if( balloon == null ){

					return null;
				}

				if( balloon.getHtmlString() == "" ){

					return balloonParam.contentDefaultBalloon();
				}
				else{
					/*
					var color = balloon.getBackgroundColor();
					var r,g,b;
					if( color != null ){
						r = color.getR();
						g = color.getG();
						b = color.getB();
					}
					else{
						r = 0;
						g = 0;
						b = 0;
					}*/
					var html = "<div id='contentInner' style='padding-bottom:0px; margin:0px; padding-left:0px;"
								 + "padding-right:0px; padding-top:0px; vertical-align:middle; border:1px solid #ffffff; overflow:auto'>"//" + r.toString(16) + g.toString(16) + b.toString(16)+ ";'>";
					if( balloonParam.isHtmlTag(balloon.getHtmlString()) ){
						html += balloon.getHtmlString();	
					}
					else{
						html += "<p style='padding-bottom:0px; margin:0px; padding-left:0px;"
								 + "padding-right:0px; padding-top:0px; text-align:center;'>" 
								 + balloon.getHtmlString() + "</p>";
					}

					html += "</div>";

					var contentDiv = document.createElement("div");
					contentDiv.id = "sopballooninnercontents";
					contentDiv.style.left = "0px";
					contentDiv.style.top = "0px";
					contentDiv.style.position = "relative";
					contentDiv.style.display = "inline";
					
					
					contentDiv.innerHTML = html;
					
					balloonParam.contentMiddleDiv.appendChild(contentDiv);
					
					return contentDiv;
				}
				return null;
			};

			this.contentDivBalloon = function(){
				
				var balloonParam;
				try{
					balloonParam = top.window.sop.idleproc.map.BalloonManager;//this;					
				}catch(e){
					balloonParam = window.sop.idleproc.map.BalloonManager;//this;
				}
				var balloon = balloonParam.pObject.getBalloon();
				
				if(balloon == null)
					return null;
				if( balloon.getDiv() == null ){
					return balloonParam.contentDefaultBalloon();
				}
				else{
					var targetDiv = balloon.getDiv();
					
					var contentDiv = document.createElement("div");
					contentDiv.id = "sopballooninnercontents";
					contentDiv.style.left = "0px";
					contentDiv.style.top = "0px";
					contentDiv.style.position = "relative";
					contentDiv.style.display = "inline";
			
					contentDiv.appendChild(targetDiv);

					balloonParam.contentMiddleDiv.appendChild(contentDiv);
					return contentDiv;
				}
				return null;
			};

			this.contentLinkBalloon = function(){
				
				var balloonParam;
				try{
					balloonParam = top.window.sop.idleproc.map.BalloonManager;
				}catch(e){
					balloonParam = window.sop.idleproc.map.BalloonManager;
				}
				var balloon = balloonParam.pObject.getBalloon();
	
				if(balloon == null)
					return null;
				
				if( balloon.getUrl() == "" ){
					return balloonParam.contentDefaultBalloon();
				}
				else{
					var contentDiv = document.createElement("div");
					contentDiv.id = "sopballooninnercontents";
					contentDiv.style.left = "0px";
					contentDiv.style.top = "0px";
					contentDiv.style.position = "relative";
					contentDiv.style.margin = "0 0 0 0";
					contentDiv.style.display = "inline";
					
					contentDiv.innerHTML = "<iframe src='" + balloon.getUrl() + "' id='linkiframe' name='linkiframe' frameborder='0' top='0px' left='0px' width='100%' height='100%' style='background-color:#000000; margin:0 0 0 0; overflow-X=auto; overflow-Y=auto;'></iframe>";
				
					balloonParam.contentMiddleDiv.appendChild(contentDiv);

					return contentDiv;
				}
				return null;
			};

			this.close = function(){

				var balloonParam;
				try{
					balloonParam = top.window.sop.idleproc.map.BalloonManager;					
				}catch(e){
					balloonParam = window.sop.idleproc.map.BalloonManager;
				}
				balloonParam.prevBalloonX = -1;
				balloonParam.prevBalloonY = -1;
				balloonParam.contentWidth = 0;
				balloonParam.contentHeight = 0;

				balloonParam.isBalloonOk = false;
				balloonParam.MoveECount = 0;
				balloonParam.state = balloonParam.balloonState.CLOSED;
				balloonParam.contentMiddleDiv.removeChild(document.getElementById("sopballooninnercontents"));
				
				balloonParam.contentMiddleDiv.style.cssText = "margin: 0px; padding: 0px; position: relative; left: 0px; top: 0px;";
				balloonParam.contentRootDiv.style.cssText = "display: none;z-index: 100; position: absolute; margin: 0px; padding: 0px;";
				balloonParam.contentRootDiv.style.left = "-400px";
				balloonParam.contentRootDiv.style.top = "-400px";
				balloonParam.contentiFrame.style.width = "100%";
				balloonParam.contentiFrame.style.height = "100%";
				
				balloonParam.contentRootDiv.style.display = "none";

				
			};
		
			this.isHtmlTag = function(content){
				
				var balloonParam;
				try{
					balloonParam = top.window.sop.idleproc.map.BalloonManager;//this;					
				}catch(e){
					balloonParam = window.sop.idleproc.map.BalloonManager;//this;
				}
				var delTag = balloonParam.htmlTagRemove(content);
				
				if( delTag.length == content.length )
					return false;
					
				return true;
			};
		
			this.htmlTagRemove = function(tag){
				return tag.replace(/<[a-z|/]+[^<>]*>/gi, '');
			};
			this.OperStartPoint = function(){
				var balloonParam;
				try{
					balloonParam = top.window.sop.idleproc.map.BalloonManager;					
				}catch(e){
					balloonParam = window.sop.idleproc.map.BalloonManager;
				}
				
				balloonParam.gapObjectFrameLeft = balloonParam.map3dDiv.offsetLeft;
				balloonParam.gapObjectFrameTop = balloonParam.map3dDiv.offsetTop;
						
			};
			this.SizeOperator = function(offsetWidth, offsetHeigh){
				var balloonParam;
				try{
					balloonParam = top.window.sop.idleproc.map.BalloonManager;//this;					
				}catch(e){
					balloonParam = window.sop.idleproc.map.BalloonManager;//this;
				}
				var mw = 0,
					mh = 0;

				var balloon = balloonParam.pObject.getBalloon();
				////document.getElementById("memo").innerHTML += "<br> balloon max size : " + balloon.getMaxWidth() + " , " + balloon.getMaxHeight() + " , " + offsetWidth + ", " + offsetHeigh;
				if (balloon.getMaxWidth() != -1) {
					mw = Math.min(offsetWidth, balloon.getMaxWidth());
					//balloon.setLimitWidth_(mw); 
					mw = Math.min(mw, balloonParam.map3dDiv.clientWidth);
					mw = Math.max(mw, balloon.getMinWidth());
				}
				else{
					mw = Math.min(offsetWidth, balloonParam.map3dDiv.clientWidth);
					mw = Math.max(mw, balloon.getMinWidth());
					//balloon.setLimitWidth_(offsetWidth);
				}

				if (balloon.getMaxHeight() != -1) {
					mh = Math.min(offsetHeigh, balloon.getMaxHeight());
					//balloon.setLimitWidth_(mh); 
					mh = Math.min(mh, balloonParam.map3dDiv.clientWidth);
					mh = Math.max(mh, balloon.getMinHeight());
				}
				else{
					mh = Math.min(offsetHeigh, balloonParam.map3dDiv.clientWidth);
					mh = Math.max(mh, balloon.getMinHeight());
					//balloon.setLimitHeight_(offsetHeigh);
				}
				
				if ( mw <= 0 || mh <= 0 ) {
					return false;
				}

				//balloon.setWidth_(mw);

				//balloon.setHeight_(mh);
			
				balloonParam.contentiFrame.style.width = balloon.getWidth_() + "px";
				balloonParam.contentiFrame.style.height = balloon.getHeight_() + "px";
				document.getElementById("sopballooninnercontents").style.width=balloon.getWidth_() + "px";
				document.getElementById("sopballooninnercontents").style.height = balloon.getHeight_() + "px";
				if( balloon.getType() == "SOPLinkBalloon" ){
					document.getElementById("linkiframe").style.width = balloon.getWidth_() + "px";
					document.getElementById("linkiframe").style.height = balloon.getHeight_() + "px";
				}
				else if( balloon.getType() == "SOPHtmlBalloon" ){
					document.getElementById("contentInner").style.width = balloon.getWidth_() + "px";
					document.getElementById("contentInner").style.Height = balloon.getHeight_() + "px";
				}
				/*
				if( offsetWidth >  mw){
					document.getElementById("sopballooninnercontents").style.overflowX = "auto";
				}
				if( offsetHeigh > mh ){
					document.getElementById("sopballooninnercontents").style.overflowY = "auto";
				}
				*///balloon.show_(true);
				//balloonParam.pObject.setBalloon(balloon, false);
				return true;
			};

			this.OpeningEvent = function(){
				
				var balloonParam;
				try{
					balloonParam = top.window.sop.idleproc.map.BalloonManager;//this;					
				}catch(e){
					balloonParam = window.sop.idleproc.map.BalloonManager;//this;
				}
				if( balloonParam.state != balloonParam.balloonState.CLOSED ){
					balloonParam.ClosedEvent();
					return;
				}

				var balloon = balloonParam.pObject.getBalloon();
			
				if( balloon == null ){
					balloonParam.ClosedEvent();
					return;
				}
				balloonParam.state = balloonParam.balloonState.OPENING;
				balloonParam.prevBalloonX = 0;
				balloonParam.prevBalloonY = 0;
				var div;
				
				if( balloon.getType() == "SOPBalloon" )
					div = balloonParam.contentDefaultBalloon();
				else if( balloon.getType() == "SOPHtmlBalloon" )
					div = balloonParam.contentHtmlBalloon();
				else if( balloon.getType() == "SOPDivBalloon" )
					div = balloonParam.contentDivBalloon();
				else if( balloon.getType() == "SOPLinkBalloon" )
					div = balloonParam.contentLinkBalloon();
				if( div == null ){

					balloonParam.ClosedEvent();
					return;
				}
				balloonParam.contentiFrame.style.width = balloon.getWidth_() + "px";
				balloonParam.contentiFrame.style.height = balloon.getHeight_() + "px";
				document.getElementById("sopballooninnercontents").style.width=balloon.getWidth_() + "px";
				document.getElementById("sopballooninnercontents").style.height = balloon.getHeight_() + "px";
				if( balloon.getType() == "SOPLinkBalloon" ){
					document.getElementById("linkiframe").style.width = balloon.getWidth_() + "px";
					document.getElementById("linkiframe").style.height = balloon.getHeight_() + "px";
				}
				balloonParam.contentWidth = balloon.getWidth_();
				balloonParam.contentHeight = balloon.getHeight_();
				//balloonParam.contentRootDiv.style.display = "inline";
				//balloonParam.OpenedEvent(div);
			};

			this.OpenedEvent = function(div){
			
				var balloonParam;
				try{
					balloonParam = top.window.sop.idleproc.map.BalloonManager;//this;					
				}catch(e){
					balloonParam = window.sop.idleproc.map.BalloonManager;//this;
				}
				if( div == null ){
					balloonParam.ClosedEvent();
					return;
				}
				
				if( div.readyState == 'complete' ){
					var offsetWidth = div.offsetWidth;
					var offsetHeight = div.offsetHeight;
					balloonParam.contentRootDiv.style.display = "none";

					if( offsetWidth == "0" || offsetHeight == "0" ){
						/*
						balloonParam.ClosedEvent();
						return;*/
					}
					if (!balloonParam.SizeOperator(offsetWidth, offsetHeight)){
						balloonParam.ClosedEvent();
						return;
					}
					
					balloonParam.state = balloonParam.balloonState.OPENED;
				}
				else{
					window.setTimeout(balloonParam.OpenedEvent(div), 1);
				}
			};

			this.MoveEvent = function(){
				var balloonParam;
				try{
					balloonParam = top.window.sop.idleproc.map.BalloonManager;
				}catch(e){
					balloonParam = window.sop.idleproc.map.BalloonManager;
				}
				if( balloonParam.state == balloonParam.balloonState.CLOSED ){
					return;
				}
				
				if( balloonParam.contentRootDiv.style.display == "none" && !balloonParam.isBalloonOk ){//&& balloonParam.MoveECount > 0 ){
					var balloon = balloonParam.pObject.getBalloon();

					if (balloon == null) {
						
						return;
					}
				
					var loc = balloon.getLocation_();
					var rate= screen.logicalXDPI/screen.deviceXDPI;		
					var version = sop.loader._ieVersionCheck();
										
					balloonParam.prevBalloonX = loc.x;
					balloonParam.prevBalloonY = loc.y;

					if(version==1||version==2){
						balloonParam.contentRootDiv.style.left = loc.x * rate+"px";	
						balloonParam.contentRootDiv.style.top = loc.y * rate+"px";	
					}else{
						balloonParam.contentRootDiv.style.left = loc.x +"px";	
						balloonParam.contentRootDiv.style.top = loc.y +"px";	
					}

					balloonParam.contentRootDiv.style.display = "inline";
					balloonParam.contentRootDiv.style.zoom= rate;	//2012.12.12 추가
										
					if( balloonParam.contentWidth != balloon.getWidth_() || balloonParam.contentHeight != balloon.getHeight_() ){
						balloonParam.contentiFrame.style.width = balloon.getWidth_() + "px";
						balloonParam.contentiFrame.style.height = balloon.getHeight_() + "px";
						document.getElementById("sopballooninnercontents").style.width=balloon.getWidth_() + "px";
						document.getElementById("sopballooninnercontents").style.height = balloon.getHeight_() + "px";
						if( balloon.getType() == "SOPLinkBalloon" ){
							document.getElementById("linkiframe").style.width = balloon.getWidth_() + "px";
							document.getElementById("linkiframe").style.height = balloon.getHeight_() + "px";
						}

						balloonParam.contentWidth = balloon.getWidth_();
						balloonParam.contentHeight = balloon.getHeight_();
					}
				}
				else if( !balloonParam.isBalloonOk && balloonParam.contentRootDiv.style.display == "inline" ){
					
					var balloon = balloonParam.pObject.getBalloon();
					var loc = balloon.getLocation_();
					if( ( loc.x > ( balloonParam.prevBalloonX + 5 ) ) || ( loc.x < ( balloonParam.prevBalloonX-5 ) ) || ( loc.y > ( balloonParam.prevBalloonY + 5 ) ) || ( loc.y < ( balloonParam.prevBalloonY-5 ) ) ){
						balloonParam.isBalloonOk = true;
						balloonParam.contentRootDiv.style.left = loc.x + "px";
						balloonParam.contentRootDiv.style.top =loc.y + "px";
						balloonParam.prevBalloonX = loc.x;
						balloonParam.prevBalloonY = loc.y;

					}
				}
				else if( balloonParam.isBalloonOk && balloonParam.contentRootDiv.style.display == "none" ){
					balloonParam.contentRootDiv.style.display = "inline";
					balloonParam.MoveEvent();
				}
				else if( balloonParam.isBalloonOk && balloonParam.contentRootDiv.style.display == "inline" ){
					var balloon = balloonParam.pObject.getBalloon();
					var loc = balloon.getLocation_();
					if( ( loc.x >= ( balloonParam.prevBalloonX - balloonParam.map3dDiv.offsetLeft + 2 ) ) || ( loc.x <= ( balloonParam.prevBalloonX - balloonParam.map3dDiv.offsetLeft -2 ) ) || ( loc.y >= ( balloonParam.prevBalloonY - balloonParam.map3dDiv.offsetTop + 2 ) ) || ( loc.y <= ( balloonParam.prevBalloonY - balloonParam.map3dDiv.offsetTop -2 ) ) ){
						balloonParam.pObject.closeBalloon();
					
					}
		
				}
			};

			this.ResizeEvent = function(){
				var balloonParam;
				try{
					balloonParam = top.window.sop.idleproc.map.BalloonManager;					
				}catch(e){
					balloonParam = window.sop.idleproc.map.BalloonManager;
				}
				if(	balloonParam.pObject.getBalloon() != null ){
					balloonParam.pObject.closeBalloon();
				}
				balloonParam.OperStartPoint();
			};

			this.ClosedEvent = function(){
				//document.getElementById("memo").innerHTML += "<br>Balloon Close Event";
				var balloonParam;
				try{
					balloonParam = top.window.sop.idleproc.map.BalloonManager;					
				}catch(e){
					balloonParam = window.sop.idleproc.map.BalloonManager;
				}
				
				if( balloonParam.state != balloonParam.balloonState.CLOSED ){
					balloonParam.pObject.closeBalloon();
					
				}
			};

			this.ChangeEvent = function(){
				var balloonParam;
				try{
					balloonParam = top.window.sop.idleproc.map.BalloonManager;					
				}catch(e){
					balloonParam = window.sop.idleproc.map.BalloonManager;
				}
				var tmpBalloon = balloonParam.pObject.getBalloon();
				
				
				balloonParam.pObject.closeBalloon();
				balloonParam.pObject.setBalloon(tmpBalloon, true);
			};
		};		

		window.sop.idleproc.kmlLoad = function(pluginObj, url, completeCB){
			var kmlObject = pluginObj.createKmlLoadObj(); 
												
			window.sop.earth.addEventListener(kmlObject, "load", completeCB);
			pluginObj.loadKml(url, kmlObject); 
		};
		
		window.sop.idleproc.setLoadingImg = function(url){
			var p = window.sop.idleproc;
			
			p.map.loadingDiv = document.createElement("div");
			p.map.loadingDiv.style.cssText = "display: none; z-index: 100; position: absolute; left:0px; top:0px;";
			p.map.loadingDiv.style.left = p.map.div.style.left;
			p.map.loadingDiv.style.top = p.map.div.style.top;
			p.map.loadingDiv.style.backgroundColor = "#999999";
			
			var div1 = document.createElement("div");
			
			div1.style.cssText = "margin: 0px; padding: 0px; position: relative; left: 0px; top: 0px; align:center";
			
			div1.style.width = p.map.div.offsetWidth;
			div1.style.height = p.map.div.offsetHeight;
			
			p.map.loadingDiv.appendChild(div1);
			
			var div = document.createElement("div");
			div.style.cssText = "margin: 0px; padding: 0px; position: absolute; top: 0px; left: 0px; overflow: hidden;";
			
			div.innerHTML = "<img src='" + url + "'>";
			
			
			div1.appendChild(div);
			
			var loadframe = document.createElement("iframe");
			loadframe.name = "loadingFrame";
			loadframe.style.position = "absolute";
			loadframe.style.left = "0px";
			loadframe.style.top = "0px";
			loadframe.style.width = p.map.div.offsetWidth;//"100px";//"100%";
			loadframe.style.height = p.map.div.offsetHeight;//"100px";//"100%";
			loadframe.style.filter = "progid:DXImageTransform.Microsoft.Alpha(opacity=0)";
			loadframe.style.zIndex = -10000;
			loadframe.setAttribute("frameborder", "0");
			loadframe.setAttribute("scrolling", "no");
			loadframe.setAttribute("src", "_blank");
			loadframe.style.display = "inline";
			p.map.loadingDiv.appendChild(loadframe);
			
			p.map.loadingDiv.style.display = "inline";
			
			p.map.div.appendChild(p.map.loadingDiv);
			//p.imgLoadingComplete(div, p.map.div.offsetWidth, p.map.div.offsetHeight);
			
		};
		

		window.sop.idleproc.imgLoadingComplete = function(div, width, height){

			if( div.readyState == "complete" ){
				//if( width - div.offsetWidth < 0 )
				
				//alert(div.childNodes.length);
				//var left = width/2 - div.offsetWidth/2;
				//var top = height/2 - div.offsetHeight/2;
				
				//if( left < 0 )
				
				
				//for( var i = 0 ; div.childNodes.length > i ; i++ ){
				//	if( div.childNodes(i).nodeName == "IMG" ){
				//		if(div.childNodes(i).offsetWidth > width)
				//			div.childNodes(i).style.width = width;
				//		if(div.childNodes(i).offsetHeight > height)
				//			div.childNodes(i).style.height = height;
				//	}
				//}
				//div.style.left
				//div.style.top
				//
			}
			else{
				setTimeout(window.sop.idleproc.imgLoadingComplete(div, width, height), 500);
			}
		};

		window.sop.idleproc._init = function(mapDiv, pluginID, pluginObject, initCallback, failureCallback){
			var p = window.sop.idleproc;
			var l = window.sop.loader;
			try{			
				if((top.window.sop=='undefined'||top.window.sop==null)||(top.window.sop.idleproc=='undefined'||top.window.sop.idleproc==null)){
					top.window.sop=window.sop;
					top.window.sop.idleproc=window.sop.idleproc;
				}	
			}catch(e){}
		
			//전역 변수 설정
			p.setMap(mapDiv, pluginID, pluginObject);
			//브라우져 검색후 IE이면
			try{
				p.map.div.EventSupporters = {};
				if(l._browserCheck()==l.BROWSER_IE){
					p.IEEventInit();
				}else if(l._browserCheck()==l.BROWSER_MOZILLA||l._browserCheck()==l.BROWSER_SAFARI||l._browserCheck()==l.BROWSER_CHROME||l._browserCheck()==l.BROWSER_FIREFOX||l._browserCheck()==l.BROWSER_OPERA||l._browserCheck()==l.BROWSER_NETSCAPE){
					p.NSEventInit();
				}else{
					setErrorCode(sop.cons.error.UNSUPPORTED_BROWER);
					setErrorString(sop.cons.errorStr.UNSUPPORTED_BROWER);
					return; 
				}
			}catch(e){}
//			p.allocSysEvent();
		
			//p.setLoadingImg("http://postfiles9.naver.net/20110826_152/muchae1_1314327129944GerLi_JPEG/intro.jpg?type=w2");
			window.sop.loader._serverStart(initCallback,failureCallback);

		};
		window.sop.earth.addEventListener = window.sop.idleproc.addEventListener;
		window.sop.earth.removeEventListener = window.sop.idleproc.removeEventListener;	
		sop.cons.error = {
			NO_ERROR: 1,
			CREATE_PLUGIN_ERROR: 2,
			INVALID_DIV_ERROR: 3,
			NO_AVAILABLE_ID: 4,
			UNSUPPORTED_PLATFORM: 5,
			UNSUPPORTED_BROWER: 6,
			LAUNCHER_NOT_INSTALLED: 7,
			NOT_INIT: 8,
			INVALID_API_KEY: 9,
			EARTH_NOT_READY: 10,
			CREATE_CONNECT_MUTEX: 11,
			LAYER_INIT_ERROR: 12,
			CREATE_EARTH_TIMEOUT: 13,
			ERR_ETC : 14,
			INVALID_LANCHER_DIV : 15,
			UNABLE_EXCUTE_LANCHER : 16,
			INVALID_DOMAIN : 17
		};

		sop.cons.errorStr = {
			NO_ERROR: '정상입니다.',
			CREATE_PLUGIN_ERROR: '플러그인이 적용되지 않았습니다.',
			INVALID_DIV_ERROR: '플러그인을 추가할 영역의 아이디가 실제와 다르거나 지정되어 있지 않습니다..',
			NO_AVAILABLE_ID: '사용할 수 없는 아이디입니다.',
			UNSUPPORTED_PLATFORM: '플렛폼이 플러그인을 지원하지 않습니다.',
			UNSUPPORTED_BROWER: '브라우저가 플러그인을 지원하지 않습니다.',
			LAUNCHER_NOT_INSTALLED: '지도를 사용하시려면 플러그인을 설치해 주십시오.',
			NOT_INIT: '플러그인이 설치되지 않았습니다.',
			INVALID_API_KEY: '발행되지 않았거나 인증되지 않은 API 키를 사용하고 있습니다. ',
			EARTH_NOT_READY: '지도데이터의 로딩에 실패하였습니다.',
			CREATE_CONNECT_MUTEX: '서버접속을 실패하였습니다.',
			LAYER_INIT_ERROR: '레이어의 초기화에 실패하였습니다.',
			CREATE_EARTH_TIMEOUT: '대기시간이 초과되었습니다.',
			ERR_ETC : "알 수 없는 오류가 발생했습니다.",
			INVALID_LANCHER_DIV : "런처를 추가할 영역의 아이디가 실제와 다르거나 영역이 지정되어있지 않습니다.",
			UNABLE_EXCUTE_LANCHER : "브라우저 상단의 알림창에서 [추가기능 실행]이나 [모든 웹페이지에서 추가기능 실행]을 클릭하시면 서비스를 이용하실수 있습니다.",
			INVALID_DOMAIN : "사용신청한 도메인과 현재 사용중인 도메인이 서로 다릅니다."
		};
 
		sop.cons.enums = {
			SOPEDITABLE_OFF: 289,
			SOPEDITABLE_ON: 290,
			SOPKEYBOARD_DOWN: 18,
			SOPKEYBOARD_LEFT: 19,
			SOPKEYBOARD_RIGHT: 20,
			SOPKEYBOARD_ROTATELEFT: 25,
			SOPKEYBOARD_ROTATERIGHT: 32,
			SOPKEYBOARD_TILTDOWN: 24,
			SOPKEYBOARD_TILTUP: 23,
			SOPKEYBOARD_UP: 17,
			SOPKEYBOARD_ZOOMIN: 21,
			SOPKEYBOARD_ZOOMOUT: 22,
			SOPNAVIGATION_LARGE: 5,
			SOPNAVIGATION_LB: 3,
			SOPNAVIGATION_LT: 1,
			SOPNAVIGATION_RB: 4,
			SOPNAVIGATION_RT: 2,
			SOPNAVIGATION_SMALL: 6,
			SOPOBJECT_LINESTRING: 65538,
			SOPOBJECT_MODEL: 65540,
			SOPOBJECT_POINT: 65537,
			SOPOBJECT_POLYGON: 65539,
			SOPOBJECT_SYMBOL: 65541,
			SOPOPTION_DISABLE: 4097,
			SOPOPTION_HIGH: 4099,
			SOPOPTION_MIDDLE: 4098,
			SOPSELECTABLE_OFF: 273,
			SOPSELECTABLE_ON: 274,
			SOPTEXTSTYLE_EDGE_FILL: 1048579,
			SOPTEXTSTYLE_EDGE_LINE: 1048578,
			SOPTEXTSTYLE_EDGE_LINEFILL: 1048581,
			SOPTEXTSTYLE_EDGE_NONE: 1048577,
			SOPTEXTSTYLE_FONT_BOLD: 1048593,
			SOPTEXTSTYLE_FONT_ITALIC: 1048594,
			SOPTEXTSTYLE_FONT_UNDERLINE: 1048596,
			SOPVIEW_FT_GROUND: 16777218,
			SOPVIEW_FT_SKY: 16777219,
			SOPVIEW_TD_SKY: 16777217,
			SOPVISIBLE_AUTO: 259,
			SOPVISIBLE_OFF: 257,
			SOPVISIBLE_ON: 258
		};
		sop.cons.enums_KO = {
			SOPNAVIGATION_LT: '좌상단',
			SOPNAVIGATION_RT: '우상단',
			SOPNAVIGATION_LB: '좌하단',
			SOPNAVIGATION_RB: '우하단',
			SOPNAVIGATION_LARGE: '큼',
			SOPNAVIGATION_SMALL: '작음',
			SOPKEYBOARD_UP: '위로',
			SOPKEYBOARD_DOWN: '아래로',
			SOPKEYBOARD_LEFT: '왼쪽으로',
			SOPKEYBOARD_RIGHT: '오른쪽으로',
			SOPKEYBOARD_ZOOMIN: '확대',
			SOPKEYBOARD_ZOOMOUT: '축소',
			SOPKEYBOARD_TILTUP: '시야각증가',
			SOPKEYBOARD_TILTDOWN: '시야각감소',
			SOPKEYBOARD_ROTATELEFT: '왼쪽회전',
			SOPKEYBOARD_ROTATERIGHT: '오른쪽회전', 
			SOPVISIBLE_ON: '보임',
			SOPVISIBLE_OFF: '숨김',
			SOPVISIBLE_AUTO: '자동',
			SOPSELECTABLE_ON: '가능',
			SOPSELECTABLE_OFF: '불가능',
			SOPEDITABLE_ON: '가능',
			SOPEDITABLE_OFF: '불가능',
			SOPOPTION_DISABLE: '적용안함',
			SOPOPTION_MIDDLE: '낮음',
			SOPOPTION_HIGH: '높음',
			SOPOBJECT_MULTI: '다중객체',
			SOPOBJECT_POINT: 'point',
			SOPOBJECT_LINESTRING: 'LineString',
			SOPOBJECT_POLYGON: 'Polygon',
			SOPOBJECT_MODEL: 'Model',
			SOPOBJECT_SYMBOL: 'Symbol',
			SOPTEXTSTYLE_EDGE_LINE: '선',
			SOPTEXTSTYLE_EDGE_NONE: '채움없음',
			SOPTEXTSTYLE_EDGE_FILL: '채움',
			SOPTEXTSTYLE_EDGE_LINEFILL: '선채움',
			SOPTEXTSTYLE_FONT_BOLD: '굵게',
			SOPTEXTSTYLE_FONT_ITALIC: '이텔릭',
			SOPTEXTSTYLE_FONT_UNDERLINE: '언더라인',
			SOPVIEW_TD_SKY: '삼인칭스카이뷰',
			SOPVIEW_FT_GROUND: '일인칭지형뷰',
			SOPVIEW_FT_SKY: '일인칭스카이뷰'
		}
		sop.cons.mouseState={
			SOPMOUSE_MOVEGRAB:1,
			SOPMOUSE_INPUTPOINT:20,
			SOPMOUSE_LINESTRING:21,
			SOPMOUSE_POLYGON:24,
			SOPMOUSE_ANAAREA:80,
			SOPMOUSE_ANADISTANCE:81,
			SOPMOUSE_ANAABSHEIGHT:83,
			SOPMOUSE_ANARELHEIGHT:84,
			SOPMOUSE_LANDSCAPE:85,
			SOPMOUSE_ANAHEIGHT:86

		};
})();
var ge;
function initCallback(obj){
    ge = obj;    
    window.setTimeout(function(){
	    try{
	    	initMove();
		    setLinkType();		   	
	    }catch(e){ }
    }, 10);
}

function failureCallback(msg,error_cd,div){
	//alert(msg);
}
