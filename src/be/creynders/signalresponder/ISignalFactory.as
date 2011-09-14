package be.creynders.signalresponder
{
	import org.osflash.signals.ISignal;

	public interface ISignalFactory
	{
		function createSignal() : ISignal;
	}
}