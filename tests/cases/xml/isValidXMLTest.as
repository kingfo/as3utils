package cases.xml {
	import as3utils.xml.isValidXML;
	import asunit.framework.TestCase;
	
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class isValidXMLTest extends TestCase {
		
		public function isValidXMLTest(testMethod:String = null) {
			super(testMethod);
			
		}
		
		public function test_XmlString(): void {
			assertFalse(isValidXML('<data/>'));
			assertFalse(isValidXML('<data></data>'));
			assertTrue(isValidXML('<data>123</data>'));
			assertTrue(isValidXML('<data><da/><db/></data>'));
			assertFalse(isValidXML('<data><da><db/></data>'));
		}
		
		public function test_Xml(): void {
			assertFalse(isValidXML(<data/>));
			assertFalse(isValidXML(<data></data>));
			assertTrue(isValidXML(<data>123</data>));
			assertTrue(isValidXML(<data><da/><db/></data>));
		}
	}

}