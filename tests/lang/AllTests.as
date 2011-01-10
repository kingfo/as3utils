package  {
	import asunit.framework.TestSuite;
	import cases.*;
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
			addTest(new isPureLocalTest());
			addTest(new laterTest());
			addTest(new substituteTest());
			addTest(new trimTest());
			addTest(new uniqueTest());
			
		}
		
	}

}