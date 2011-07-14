package cases.timer {
	import asunit.framework.TestCase;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class laterTest extends TestCase {
		
		public function laterTest(testMethod:String = null) {
			super(testMethod);
		}
		
		public function testIt(): void {
			var l:Later = new Later();
			l.addEventListener("timeout", addAsync(function(e: Event): void {
					assertEquals(l.aData.data, 'timeout');
				} ));
			l.addEventListener("interval", addAsync(function(e: Event): void {
					assertEquals(l.bData.data, 'interval');
				} ));
		}
	}

}
import as3utils.timer.later;
import flash.events.Event;
import flash.events.EventDispatcher;


class Later extends EventDispatcher {
	
	public var aData:*;
	public var bData:*;
	
	public function Later() {
		a = later(timeout, 1000, false, this, [ { data: "timeout" } ]);
		b = later(interval, 1000, false, this, [ { data: "interval" } ]);
	}
	
	private function timeout(data:*): void {
		aData = data;
		dispatchEvent(new Event("timeout"));
		a.cancel();
		
	}
	
	private function interval(data:*): void {
		bData = data;
		dispatchEvent(new Event("interval"));
		b.cancel();
	}
	
	private var a:*;
	private var b:*;
	
}