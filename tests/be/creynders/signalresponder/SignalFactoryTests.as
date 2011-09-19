package be.creynders.signalresponder
{
	import asunit.asserts.assertEquals;
	import asunit.asserts.assertNotNull;
	import asunit.asserts.assertTrue;
	
	import be.creynders.signalresponder.support.CustomSignal;
	import be.creynders.signalresponder.support.SignalFactoryAccessor;
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.PrioritySignal;
	import org.osflash.signals.Signal;
	
	public class SignalFactoryTests
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testCreateSignalWithDefaults():void
		{
			var factory : SignalFactory = new SignalFactory();
			var signal : ISignal = factory.createSignal();
			assertNotNull("signal should not be null", signal);
			assertTrue( 'default signal should be of type Signal', signal is Signal );
		}
		
		[Test]
		public function testCreateSignalWithPrioritySignal():void
		{
			var factory : SignalFactory = new SignalFactory( PrioritySignal );
			var signal : ISignal = factory.createSignal();
			assertNotNull("signal should not be null", signal);
			assertTrue( 'default signal should be of type Signal', signal is PrioritySignal );
		}		

		[Test]
		public function testCreateSignalWithCustomSignal():void
		{
			var factory : SignalFactory = new SignalFactory( CustomSignal );
			var signal : ISignal = factory.createSignal();
			assertNotNull("signal should not be null", signal);
			assertTrue( 'default signal should be of type CustomSignal', signal is CustomSignal );
		}		


		[Test]
		public function testSignalFactoryInitialization():void
		{
			var factory : SignalFactoryAccessor = new SignalFactoryAccessor();
			assertNotNull("Signal class should have default value", factory.signalClass );
			assertEquals( 'Signal class should default to Signal', factory.signalClass, Signal );
		}
	}
}