package com.xintend.security {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.LocalConnection;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.Security;
	/**
	 * 白名单机制（保守机制/被动机制）
	 * @author Kingfo[Telds longzang]
	 * @email 	oicuicu@gmail.com
	 * @blog 	http://www.xintend.com
	 */
	public class Whitelist extends EventDispatcher implements IWhitelist {
		/**
		 * 格式化数据出错，请确保位XML
		 */
		public static const DATA_FORMAT_ERROR:String = "dataFormatError";
		
		public static const TRUSTED_DOMAIN:String = "trustedDomain";
		
		public static const UNTRUSTED_DOMAIN:String = "untrustedDomain";
		
		/**
		 * 策略文件
		 */
		public function get policyFile():String { return _policyFile; }
		//public function set policyFile(value:String):void {
			//_policyFile = value ==null || value == "" ? "whitelist.xml" : value;
		//}
		
		public function Whitelist() {
			
		}
		
		
		/**
		 * 装载白名单策略文件
		 * @param	fullPath						单策略文件路径
		 */
		public function loadPolicyFile(policyFile: String): void {
			_policyFile = policyFile ==null || policyFile == "" ? "whitelist.xml" : policyFile;
			
			
			var loader:URLLoader = new URLLoader();
			
			loader.addEventListener(Event.COMPLETE, eventHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR, eventHandler);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, eventHandler);
			
			loader.load(new URLRequest(this.policyFile));
			
		}
		
		/**
		 * 检验 URL 是否匹配白名单策略
		 * @param	url								受检查的URL
		 * @param	secureObejct					默认采用 Security 进行. 而 LocalConnection 较为特殊 需要通过其实例授权
		 * @see 	flash.system.Security
		 * @see 	flash.net.LocalConnection
		 */
		public function urlMatches(url: String, secureObejct: * = null ): void {
			
			if (!(secureObejct is LocalConnection)) secureObejct = Security;
			
			urls.push({secureObejct:secureObejct,url:url});
			if (contentXML) {
				parseWhitelist();
			}
		}
		
		/**
		 * 解析白名单策略
		 * @private
		 * 
		 */
		private function parseWhitelist(): void {
			var i: int;
			var n: int;
			var item: Object;
			var path: XML;
			var domain: String;
			var valid: Boolean 
			
			valid = false;
			
			n = urls.length;
			for (i = 0; i < n; i++ ) {
				////	队列模式
				item = urls.shift();
				trace(item.url,item.secureObejct);
				for  each (path in contentXML["allow-access-from"] ) {
					domain = path.@domain;
					if (pathMatches(item.url, domain,item.secureObejct)) {
						//验证通过
						valid = true;
						break; 
					}
				}
				
				if (!valid) {
					dispatchEvent(new SecurityErrorEvent(UNTRUSTED_DOMAIN,false,false,item.url));
				}
			}
			if (valid) {
				dispatchEvent(new Event(TRUSTED_DOMAIN));
			}
			
		}
		
		private function pathMatches(page: String, domain: String,secureObejct:*): Boolean {
			var tag: Boolean ;
			var trimPattern: RegExp;
			var ipPattern: RegExp;
			var domainPattern: RegExp;
			var pageHost: String;
			var pageMatchList: Array;
			tag = false;
			
			page ||= "";
			
			//if (page == null || page == "") return tag;
			
			
			trimPattern = /^\s+|\s+$/g;
			
			ipPattern = /((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]\d)|\d)(\.((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]\d)|\d)){3}/;
			
			domainPattern = /[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+\.?/; 
			
			domain = domain.replace(trimPattern, "");
			
			pageMatchList = page.match(domainPattern);
			if (!pageMatchList) {
				pageHost = "";
				trace("警告:验证目标URL不存在!");
			}else {
				pageHost = pageMatchList[0];
			}
			if (domain == "*") {
				//完全开放的
				//tag = true;
				
				secureObejct.allowDomain(domain);
				
				return true;
			}else if (ipPattern.test(domain)) {
				// 符合ip的
				if (pageHost == domain) {
					//tag = true;
					secureObejct.allowDomain(domain);
					return true;
				}
			}else if (domainPattern.test(domain)) {
				// 符合域名的
				var domainParseData:Array = domain.split(".");
				var allDomain:String;
				if (domainParseData[0] == "*") {
					//域名前缀有通配符号的
					
					var ps:String = String("\\").concat(domainParseData[0]).concat("\.");
					ps = ps.replace(/\./, "\\.");
					allDomain = domain.replace(new RegExp(ps, 'g'), "")
					allDomain = allDomain.replace(/\./, "\\.");
					if (tag = new RegExp(allDomain).test(page)) {
						secureObejct.allowDomain(pageHost);
						return true;
					}
					return false;
				}else {
					tag = pageHost == domain;
					if (tag) {
						secureObejct.allowDomain(pageHost);
						return true;
					}
					return false;
				}
			}
			return false;
			
		}
		
		private function eventHandler(event: Event): void {
			switch(event.type) {
				case Event.COMPLETE:
					try {
						 contentXML = new XML(event.target.data);
					}catch (error: Error) {
						dispatchEvent(new IOErrorEvent(DATA_FORMAT_ERROR,false,true,String(event.target.data)));
					}
					parseWhitelist();
				break;
				default:
					dispatchEvent(event);
			}
		}
	
		
		
		
		private var _policyFile: String;
		
		private var urls: Array = [];
		private var contentXML: XML;
		
		
		
		
	}

}