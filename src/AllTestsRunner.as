package 
{
	import asunit.core.TextCore;
	
	import flash.display.MovieClip;
	import be.creynders.signalresponder.AllTests;
	
	[SWF(width='1000', height='800', backgroundColor='#333333', frameRate='31')]
	public class AllTestsRunner extends MovieClip
	{
		public function AllTestsRunner()
		{
			_core = new TextCore();
			_core.textPrinter.hideLocalPaths = true;
			_core.start( AllTests, null, this );
		}
		
		private var _core : TextCore;
	}
}