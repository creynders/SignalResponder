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
		private var _completeSignal : NativeSignal;
		
		public function loadTwitterStream( responder : SignalResponder ) : void{
			var request : URLRequest = new URLRequest( TWITTER_FEED_URL );
			_loader = new URLLoader();
			_completeSignal = new NativeSignal( _loader, Event.COMPLETE, Event );
			_completeSignal.addOnce( _handleCompleteSignal );
			responder.startSignal.dispatch();
			_loader.load( request );
			_responder = responder;
		}
		
		protected function _handleCompleteSignal(event:Event):void
		{
			_responder.successSignal.dispatch( _loader.data );
		}
		
	}
}