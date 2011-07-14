package  {
	import asunit.framework.TestSuite;
	import cases.array.uniqueTest;
	import cases.object.cloneTest;
	import cases.object.isEmptyObjectTest;
	import cases.object.isPlainObjectTest;
	import cases.string.substituteTest;
	import cases.timer.laterTest;
	import cases.url.isLocalURLTest;
	import cases.xml.isEmptyXMLTest;
	import cases.xml.trimTest;
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class AllTests extends TestSuite {
		
		public function AllTests() {
			super();
			
			addTest(new cloneTest());
			addTest(new isEmptyObjectTest());
			addTest(new isEmptyXMLTest());
			addTest(new isPlainObjectTest());
			addTest(new isLocalURLTest());
			addTest(new laterTest());
			addTest(new substituteTest());
			addTest(new trimTest());
			addTest(new uniqueTest());
			
		}
		
	}

}