package  {
	import asunit.textui.TestRunner;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class AllTestRunner extends Sprite {
		
		public function AllTestRunner() {
			runner = new TestRunner();
			stage.addChild(runner);
			runner.start(AllTests, null, false);
		}
		
		
		private var runner: TestRunner;
	}

}