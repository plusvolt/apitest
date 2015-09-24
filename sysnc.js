var syncMode = function(type){	
				//CASE:3D 모드로 전환하기			
				if (type == 2) {
					//1.2D 지도 영역 받기
					var bounds = vmap.getExtent();								 
					if ((bounds == null) || (vearth == null)) return false;						
					var mbounds = vmap.getExtent(); 					
					var dist = m = Math.abs(mbounds.bottom - mbounds.top);	
					//checkDist = dist;
					var center2d = bounds.transform(vmap.projection, vmap.displayProjection).getCenterLonLat();
					//2.2D화면 감추기
					vworldFunc._GetElement(vworldIDs.idmenu).style.display 
		    			= vworldFunc._GetElement(vworldIDs.idshim).style.display = 'none';
		    						
		    		//4.3D 지도 영역 이동하기	
		    		var vec3=vearth.createVec3();
					vec3.Longitude = center2d.lon;
					vec3.Latitude = center2d.lat;
					vearth.getViewCamera().viewNorth();
		    		vearth.getViewCamera().moveDist(vec3,88.9,0,dist,0);		    		
		    		vworld._makeinvisible(vworldIDs.id3d, true);		    		  		
		    		vworld._makeinvisible(vworldIDs.id2d, false);
		    		if (!vworldFunc._isIE()) {	    			
		    			vearth.setPluginFocus();
		    		}		    		
	          		return true;	
	          					
		        //CASE:2D 모드로 전환하기			
				} else {
					if((vearth == null) || (vworldFunc._GetElement(vworldIDs.id3d).style.display == 'none' || vworldFunc._GetElement(vworldIDs.id3d).style.visibility == 'hidden')) return false;
					//1.3D 지도 현재정보 받기(Distance, zoomLevel, center)
					//3d초기화
					if(vearth.getAnalysis().getBuildLandscapeMode()){
						vearth.getAnalysis().setBuildLandscapeMode(false);
					}
					if(vearth.getAnalysis().getGroundLandScapeMode()){
						vearth.getAnalysis().setGroundLandScapeMode(false);
					}
					vearth.getView().setWorkMode(1);
					
					var tilt = parseInt(vearth.getViewCamera().getTilt());
					var bSleep = !(tilt>=88.0 && tilt < 91);
					vearth.getViewCamera().stopCamNavigation();
					vearth.getViewCamera().viewNorth();
		        	vearth.getViewCamera().setTilt(88.9);
		        	if (bSleep) vworldFunc._sleep(1000);		        	
	          		var dist = vearth.getViewCamera().getDistance();
	          		var zoom = vearth.getViewCamera().getMapZoomLevel();
	          		var center = vearth.getViewCamera().getCenterPoint();          		
	          		if (center == null) return false;          		
	          		//2.2D로 전환할 영역 계산하기
		        	var view_w = parseInt(vworldFunc._GetElement(vworldIDs.id3d).offsetWidth);
	                var view_h = parseInt(vworldFunc._GetElement(vworldIDs.id3d).offsetHeight);	                
	          		var r = (view_h/view_w);	
	          		var lonlat=new OpenLayers.LonLat(center.Longitude,center.Latitude).transform(vmap.displayProjection, vmap.projection);
	                var m=dist;
	                var h=m*0.5;
	                
	                var extent = new OpenLayers.Bounds(lonlat.lon - m, lonlat.lat - h, lonlat.lon + m, lonlat.lat + h);
					var idealResolution = extent.getWidth()/view_w;
						
					zoom = vmap.baseLayer.getZoomForResolution(idealResolution, true);
					if (r > 1) {if (zoom < 19) zoom = zoom + 1;} 
					var res = vmap.getResolutionForZoom(zoom);
					dist = res * view_h;
					//3.3D화면 정북방향 및 distance 설정					
					vearth.getViewCamera().setDistance(dist);
					vearth.getViewCamera().moveLonLat(center.Longitude,center.Latitude);					
					vworldFunc._sleep(1000);        			
					
		        	vworld._makeinvisible(vworldIDs.id2d, true);   		
		        	vworld._makeinvisible(vworldIDs.id3d, false);

	                //5.2D지도 화면이동하기	                
	                vmap.setCenterAndZoom(lonlat.lon,lonlat.lat, zoom);	
	                vmap.updateSize();
	                return true;
				}	
			};