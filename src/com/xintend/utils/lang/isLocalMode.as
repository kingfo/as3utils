package com.xintend.utils.lang {
	import flash.display.Stage;
	import flash.external.ExternalInterface;
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public function isLocalMode(stage: Stage): Boolean {
		return stage.loaderInfo.loaderURL.indexOf("file:///") > -1;
	}

}