package org.systemsbiology.echidna.common
{
	import flash.display.DisplayObject;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.managers.IBrowserManager;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	import mx.utils.URLUtil;
	
	import org.systemsbiology.echidna.events.StopProgressBarEvent;
	
	public class Util
	{

		private var dispObj:DisplayObject;


		public function Util(dispObj:DisplayObject)
		{
			this.dispObj = dispObj;
		}
		
		
		public static function foo():void {
			
		}
		
		
		
		public static function ajax(url:String, params:Object, result:Function, fault:Function, method:String = "GET"): void {
			var service:HTTPService = new HTTPService();
			service.url = url;
			service.method = method;
			service.resultFormat = "text";
			service.addEventListener(ResultEvent.RESULT, result);
			service.addEventListener(FaultEvent.FAULT, fault);
			service.send(params);
		}
		
		
		public static function objectToArrayCollection(obj:Object, type:String):ArrayCollection {
			var ac:ArrayCollection = new ArrayCollection();
			for (var i:Object in obj) {
				var item:Object = obj[i][type];
				ac.addItem(item);
			}
			return ac;
		}
		
		public static function getQueryStringItem(bm:IBrowserManager, key:String):String {
			trace("bm.base = " + bm.base);
			trace("bm.url = " + bm.url);
			var segs:Array = bm.base.split("?");
			if (segs.length < 2) {
				return null;
			}
			var temp:String = segs[1];
			segs  = temp.split("#");
			var queryString:String = segs[0];
			trace("query string = " + queryString);
			var params:Object = URLUtil.stringToObject(queryString, "&");
			return(params[key]);
		}
		

	}
}