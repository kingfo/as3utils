package  {
	import asunit.textui.TestRunner;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class LangTest extends Sprite {
		
		public function LangTest() {
			runner = new TestRunner();
			stage.addChild(runner);
			runner.start(AllTests, null, false);
		}
		
		
		private var runner: TestRunner;
	}

}