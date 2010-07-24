package com.xintend.security {
	
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public interface IWhitelist {
		function loadPolicyFile(policyFile: String): void;
		function urlMatches(url: String, secureObejct: * = null ): void;
		
	}
	
}