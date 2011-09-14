package be.creynders.signalresponder
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	public class SignalFactory implements ISignalFactory
	{
		public function SignalFactory( signalClass : Class = null )
		{
			_signalClass = signalClass || Signal;
		}
		
		protected var _signalClass : Class;
		
		public function createSignal():ISignal
		{
			return new _signalClass;
		}
		
	}
}