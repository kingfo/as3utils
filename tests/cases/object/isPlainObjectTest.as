package cases.object {
	import as3utils.object.isPlainObject;
	import asunit.framework.TestCase;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class isPlainObjectTest extends TestCase {
		
		public function isPlainObjectTest(testMethod:String = null) {
			super(testMethod);
			
		}
		
		public function test_defaultTest(): void {
			assertTrue(isPlainObject({}));
			assertTrue(isPlainObject({a:"1",b:function():void{}}));
			assertTrue(isPlainObject(new Object()));
		}
		
		public function test_boundaryTest(): void {
			assertFalse(isPlainObject(Class));
			assertFalse(isPlainObject(""));
			assertFalse(isPlainObject("234"));
			assertFalse(isPlainObject(false));
			assertFalse(isPlainObject(true));
			assertFalse(isPlainObject(new String()));
			assertFalse(isPlainObject(new Array()));
			assertFalse(isPlainObject(new XML()));
			assertFalse(isPlainObject(new MovieClip()));
		}
	}

}