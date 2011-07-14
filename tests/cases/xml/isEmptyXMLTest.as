package cases.xml {
	import as3utils.xml.isEmptyXML;
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
			var data: XML =<data/>;
			assertTrue(isEmptyXML(data));
			data.child = <child/>;
			assertFalse(isEmptyXML(data));
		}
		
		public function test_rootTextOnly(): void {
			var data: XML =<data>123</data>;
			assertFalse(isEmptyXML(data));
		}
		
	}

}