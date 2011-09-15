package 
{
	import be.creynders.signalresponder.SignalResponder;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.osflash.signals.natives.NativeSignal;

	public class TwitterService
	{
		
		static private const TWITTER_FEED_URL : String = 'http://api.twitter.com/1/statuses/user_timeline.xml?user_id=309386961';
		
		public function TwitterService()
		{
		}
		
		private var _loader : URLLoader;
		private var _responder : SignalResponder;
		
		public function loadTwitterStream( responder : SignalResponder ) : void{
			responder.startSignal.dispatch();
			var request : URLRequest = new URLRequest( TWITTER_FEED_URL );
			_loader = new URLLoader();
			_loader.addEventListener( Event.COMPLETE, _handleCompleteEvent );
			_loader.load( request );
			_responder = responder;
		}
		
		protected function _handleCompleteEvent(event:Event):void
		{
			_responder.successSignal.dispatch( _loader.data );
		}
		
	}
}