package cases {
	import asunit.framework.TestCase;
	
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class isEmptyXMLTest extends TestCase {
		
		public function isEmptyXMLTest(testMethod:String = null) {
			super(testMethod);
			
		}
		
		public function test_rootOnly(): void {
			var xml: XML = <data/>;
			assertTrue(isEmptyXMLTest(xml));
		}
		
		public function test_rootTextOnly(): void {
			var xml: XML = <data>hello</data>;
			assertTrue(isEmptyXMLTest(xml));
		}
		
		public function test_rootTextOnly(): void {
			var xml: XML = <data>hello</data>;
			assertTrue(isEmptyXMLTest(xml));
		}
	}

}