package be.creynders.signalresponder
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	
	public class SignalResponder implements ISignalResponder
	{
		public function SignalResponder( signalFactory : ISignalFactory = null )
		{
			_signalFactory = signalFactory || new SignalFactory();
			
			successSignal.add( _handleSuccessSignal );
			failureSignal.add( _handleFailureSignal );
		}
		
		private var _signalFactory : ISignalFactory;
		
		private var _startSignal : ISignal;
		public function get startSignal():ISignal
		{
			return _startSignal ||= _signalFactory.createSignal();
		}
		
		public function set startSignal(value:ISignal):void
		{
			_startSignal = value;
		}
		
		private var _successSignal : ISignal;
		public function get successSignal():ISignal
		{
			return _successSignal ||= _signalFactory.createSignal();
		}
		
		public function set successSignal(value:ISignal):void
		{
			if( _successSignal ) _successSignal.remove( _handleSuccessSignal );
			_successSignal = value;
			_successSignal.add( _handleSuccessSignal );
		}
		
		private var _failureSignal : ISignal;
		public function get failureSignal():ISignal
		{
			return _failureSignal ||= _signalFactory.createSignal();
		}
		
		public function set failureSignal(value:ISignal):void
		{
			if( _failureSignal ) _failureSignal.remove( _handleFailureSignal );
			_failureSignal = value
			_failureSignal.add( _handleFailureSignal );
		}
		
		private var _status : ResponderStatus = ResponderStatus.READY;
		public function get status():ResponderStatus
		{
			return _status;
		}
		
		public function get hasCompleted():Boolean
		{
			return _status == ResponderStatus.SUCCEEDED || _status == ResponderStatus.FAILED;
		}
		
		protected function _handleSuccessSignal( ...valueObjects ) : void{
			_status = ResponderStatus.SUCCEEDED;
		}
		
		protected function _handleFailureSignal( ...valueObjects ) : void{
			_status = ResponderStatus.FAILED;
		}
		
	}
}