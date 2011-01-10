package cases {
	import asunit.framework.TestCase;
	import com.xintend.utils.lang.trim;
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class trimTest extends TestCase {
		
		public function trimTest(methodName:String=null) {
			super(methodName);
		}
		
		
		public function test_trimString(): void {
			var s1: String = " abcsd ",
				s2: String;
			s2 = trim(s1);
			assertNotSame(s2, s1);
			assertTrue(s2.length < s1.length);
		}
		
		
		
	}

}