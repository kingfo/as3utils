package cases.array {
	import as3utils.array.unique;
	import asunit.framework.TestCase;
	
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class uniqueTest extends TestCase {
		
		public function uniqueTest(testMethod:String = null) {
			super(testMethod);
		}
		
		public function testNormal(): void {
			assertEquals('0123456',unique(a).join(""));
		}
		
		public function testReverse(): void {
			assertEquals('6543210',unique(a,true).join(""));
		}
		
		private var a: Array = [0, 1, 2, 3, 4, 5, 6, 6, 5, 4, 3, 2, 1, 0];
	}

}