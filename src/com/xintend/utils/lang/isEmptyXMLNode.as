package com.xintend.utils.lang {
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public function isEmptyXMLNode(data: * ): Boolean {
		var xml: XML ;
		if (data is String) {
			if(isValidXML(data as String))
		}
		if (!(xml is XML || xml is XMLList)) return false;
		return !xml.toString().length;
	}

}