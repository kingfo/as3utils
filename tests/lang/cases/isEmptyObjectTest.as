package cases {
	import asunit.framework.TestCase;
	import com.xintend.utils.lang.isEmptyObject;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class isEmptyObjectTest extends TestCase {
		
		
		public function isEmptyObjectTest(testMethod:String = null) {
			super(testMethod);
			
		}
		
		public function test_emptyPlainObject(): void {
			assertTrue(isEmptyObject( { } ));
			assertTrue(isEmptyObject( new Object() ));
			assertFalse(isEmptyObject({a:0,b:1}));
		}
		
		public function test_emptyClass(): void {
			assertFalse(isEmptyObject(Class));
			assertFalse(isEmptyObject(this));
		}
		
		public function test_emptyFunction(): void {
			assertFalse(isEmptyObject(Function));
			assertFalse(isEmptyObject(new Function()));
			assertFalse(isEmptyObject(function():String{return ""}));
			assertFalse(isEmptyObject(function():String{return "1"}));
			assertFalse(isEmptyObject(function():void{}));
		}
		
		public function test_emptyString(): void {
			assertFalse(isEmptyObject(""));
			assertFalse(isEmptyObject("1"));
			assertFalse(isEmptyObject(new String()));
		}
		
		public function test_emptyNumber(): void {
			assertFalse(isEmptyObject(1));
			assertFalse(isEmptyObject(new Number()));
			assertFalse(isEmptyObject(new Number(1)));
		}
		
		public function test_emptyBoolean(): void {
			assertFalse(isEmptyObject(true));
			assertFalse(isEmptyObject(false));
			assertFalse(isEmptyObject(new Boolean()));
		}
		
		public function test_emptyArray(): void {
			assertFalse(isEmptyObject([]));
			assertFalse(isEmptyObject([1,2,3]));
			assertFalse(isEmptyObject(new Array(1)));
			assertFalse(isEmptyObject(new Array(1,2,3)));
		}
		
		public function test_emptyXML(): void {
			assertFalse(isEmptyObject(<data/>));
			assertFalse(isEmptyObject(<data><a/></data>));
			assertFalse(isEmptyObject(new XML("xml")));
			assertFalse(isEmptyObject(XML("<data><a/></data>")));
			assertFalse(isEmptyObject(XML));
		}
		
		public function test_emptyXMLList(): void {
			assertFalse(isEmptyObject(new XMLList("xml")));
			assertFalse(isEmptyObject(XMLList("<data><a/></data>")));
			assertFalse(isEmptyObject(XMLList));
		}
		
		public function test_emptyMovieClip(): void {
			assertFalse(isEmptyObject(new MovieClip()));
			assertFalse(isEmptyObject(MovieClip));
		}
	}

}