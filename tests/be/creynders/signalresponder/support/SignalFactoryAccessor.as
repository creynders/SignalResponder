package be.creynders.signalresponder.support
{
	import be.creynders.signalresponder.SignalFactory;
	
	public class SignalFactoryAccessor extends SignalFactory
	{
		public function SignalFactoryAccessor(signalClass:Class=null)
		{
			super(signalClass);
		}
		
		public function get signalClass() : Class{
			return this._signalClass;
		}
	}
}