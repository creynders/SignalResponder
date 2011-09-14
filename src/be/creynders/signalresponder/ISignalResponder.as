package be.creynders.signalresponder
{
	import org.osflash.signals.ISignal;

	public interface ISignalResponder
	{
		function get startSignal() : ISignal;
		function set startSignal( value : ISignal ) : void;
		
		function get successSignal() : ISignal;
		function set successSignal( value : ISignal ) : void;
		
		function get failureSignal() : ISignal;
		function set failureSignal( value : ISignal ) : void;
		
		function get status() : ResponderStatus;
		
		function get hasCompleted() : Boolean;
		
	}
}