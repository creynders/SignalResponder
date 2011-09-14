package be.creynders.signalresponder
{
	final public class ResponderStatus
	{
		
		static public const READY : ResponderStatus = new ResponderStatus( 'ready' );
		static public const STARTED : ResponderStatus = new ResponderStatus( 'started' );
		static public const SUCCEEDED : ResponderStatus = new ResponderStatus( 'succeeded' );
		static public const FAILED : ResponderStatus = new ResponderStatus( 'failed' );
		
		public function ResponderStatus( value : String )
		{
			_value = value;
		}
		
		private var _value : String;

		public function get value():String{
			return _value;
		}

	}
}
