package cases.string {
	import as3utils.string.substitute;
	import asunit.framework.TestCase;
	
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class substituteTest extends TestCase {
		
		public function substituteTest(methodName:String=null) {
			super(methodName);
		}
		
		public function test_defaultTest(): void {
			var s1: String = "hello {myname} !",
				s2:String = "hello \{myname} !",
				s3:String = "hello \{{myname}} !",
				s4:String = "hello \{{myname} !",
				s5:String = "hello \{{myname !",
				s6:String = "hello \{{myName} !",
				s7:String = "hello \{{MYNAME} !",
				s8:String = "hello \{[myname] !",
				s9:String = "hello{myname} !",
				s10:String = "hello{myage} !",
				s11:String = "hello\myage} !",
				o:Object = {myname:"Kingfo",myage:"30"};
			
			
			assertTrue(substitute(s1, o).indexOf(o.myname) > -1);
			assertTrue(substitute(s2, o).indexOf(o.myname) > -1);
			assertTrue(substitute(s3, o).indexOf(o.myname) > -1);
			assertTrue(substitute(s4, o).indexOf(o.myname) > -1);
			
			assertTrue(substitute(s5, o).indexOf(o.myname) == -1);
			assertTrue(substitute(s6, o).indexOf(o.myname) == -1);
			assertTrue(substitute(s7, o).indexOf(o.myname) == -1);
			assertTrue(substitute(s8, o).indexOf(o.myname) == -1);
			
			assertTrue(substitute(s9, o).indexOf(o.myname) > -1);
			assertTrue(substitute(s10, o).indexOf(o.myage) > -1);
			assertTrue(substitute(s11, o).indexOf(o.myage) == -1);
			
		}
		
		
		public function test_customRegExp(): void {
			var regexp: RegExp = /\\?\$\{([^{}]+)\}/g,
				s1: String = "hello ${myname} !",
				s2:String = "hello${myname} !",
				s3:String = "hello ${myname}$ !",
				s4:String = "hello ${$myname}$ !",
				o: Object = { myname: "Kingfo" };
			
			assertTrue(substitute(s1, o, regexp).indexOf(o.myname) > -1);
			assertTrue(substitute(s2, o, regexp).indexOf(o.myname) > -1);
			assertTrue(substitute(s3, o, regexp).indexOf(o.myname) > -1);
			
			assertTrue(substitute(s4, o, regexp).indexOf(o.myname) == -1);
		}
		
	}

}