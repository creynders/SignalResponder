package  
{
	import be.creynders.signalresponder.SignalResponder;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	
	[SWF(width='1000', height='800', backgroundColor='#FFFFFF', frameRate='31')]
	public class SignalResponderDemo extends Sprite
	{
		public function SignalResponderDemo()
		{
			init();	
		}
		private var _service : TwitterService;
		private var _responder : SignalResponder;
		private var _outputField : TextField;
		
		protected function init():void
		{
		
			_createUI();
			_loadTwitterStream()
			
		}
		
		private function _createUI():void{
			_outputField = new TextField();
			_outputField.width = 1000;
			_outputField.height = 400;
			_outputField.multiline = true;
			this.addChild( _outputField );
		}
		
		private function _output( msg : String ) : void{
			trace( msg );
			_outputField.appendText( msg + '\n' );
		}
		
		private function _loadTwitterStream() : void{
			_responder = new SignalResponder();
			_responder.startSignal.addOnce( _handleStartSignal );
			_responder.successSignal.addOnce( _handleSuccessSignal );
			_responder.failureSignal.addOnce( _handleFailureSignal );
			_service = new TwitterService();
			_service.loadTwitterStream( _responder );
		}
		
		private function _handleStartSignal():void	
		{
			
			_output( 'started' );
			
		}
		
		private function _handleSuccessSignal( data : String ):void
		{
			var xml : XML = new XML( data );
			var statuses : XMLList = xml.status.text.text(); 
			_output( 'succeeded' );
			_output( statuses );
		}
		
		private function _handleFailureSignal():void
		{
			
			_output( 'failed' );
			
		}
	}
}