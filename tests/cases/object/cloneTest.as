package cases.object {
	import as3utils.object.clone;
	import asunit.framework.TestCase;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class cloneTest extends TestCase {
		
		public function cloneTest(testMethod:String=null) {
			super(testMethod);
		}
		
		public function test_defaultTest(): void {
			var o:Object = {a:123,b:"x",c:function():void{},d:{}},
				a: Array = [1, "x", function(): void { }, true, {}];
				
			assertTrue(clone(a) !== a);
			assertTrue(clone(a) != a);
			
			assertTrue(clone(a)[3] === a[3]);
			assertTrue(clone(a)[3] == a[3]);
			
			assertTrue(clone(o) !== o);
			assertTrue(clone(o) != o);
			assertTrue(clone(o).d !== o.d);
			assertTrue(clone(o).d != o.d);
			
		}
		
		
		public function test_event(): void {
			var event: Event = new Event("E123"),
				mouseEvent:MouseEvent = new MouseEvent("E123");
			
			assertTrue(clone(event) !== event);
			assertTrue(clone(event) != event);
			
			assertTrue(clone(event).bubbles == event.bubbles);
			assertTrue(clone(event).cancelable == event.cancelable);
			
			assertTrue(clone(mouseEvent) !== mouseEvent);
			assertTrue(clone(mouseEvent) != mouseEvent);
			
			assertTrue(clone(mouseEvent).cancelable == mouseEvent.cancelable);
			assertTrue(clone(mouseEvent).cancelable == mouseEvent.cancelable);
			
		}
		
		public function test_complexObject(): void {
			//TODO:
			
		}
		
	}

}