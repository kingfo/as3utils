package cases.url {
	import as3utils.url.isLocalURL;
	import asunit.framework.TestCase;
	
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class isLocalURLTest extends TestCase {
		
		public function isLocalURLTest(testMethod:String = null) {
			super(testMethod);
		}
		
		public function test_hostnameURL(): void {
			assertTrue(isLocalURL('file://localhost/c|/WINDOWS/clock.avi'));
			assertTrue(isLocalURL('file://localhost/c:/WINDOWS/clock.avi'));
			assertTrue(isLocalURL('file://localhost/etc/fstab'));
		}
		
		public function test_nonHostnameURL(): void {
			assertTrue(isLocalURL('file:///c|/WINDOWS/clock.avi'));
			assertTrue(isLocalURL('file:///c:/WINDOWS/clock.avi'));
			assertTrue(isLocalURL('file:///etc/fstab'));
		}
		
	}

}