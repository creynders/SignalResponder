package be.creynders.signalresponder
{
	import asunit.asserts.assertEquals;
	import asunit.asserts.assertNotNull;
	import asunit.asserts.assertTrue;
	
	import org.osflash.signals.PrioritySignal;
	
	public class SignalResponderTests
	{	
		[Before]
		public function setUpBeforeEachTest():void
		{
		}
		
		[After]
		public function tearDownAfterEachTest():void
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
		public function testReadyStatus():void
		{
			var responder : ISignalResponder = new SignalResponder();
			assertEquals("status should be ResponderStatus.READY", ResponderStatus.READY,responder.status );
		}
		
		[Test]
		public function testDispatchFailureStatus():void
		{
			var responder : ISignalResponder = new SignalResponder();
			responder.failureSignal.dispatch();
			
			assertEquals("status should be ResponderStatus.FAILED", ResponderStatus.FAILED,responder.status );
			assertTrue( 'should be completed', responder.hasCompleted );
		}
		
		[Test]
		public function testDispatchSuccess():void
		{
			var responder : ISignalResponder = new SignalResponder();
			responder.successSignal.dispatch();
			
			assertEquals("status should be ResponderStatus.SUCCESS", ResponderStatus.SUCCEEDED,responder.status );
			assertTrue( 'should be completed', responder.hasCompleted );
		}
		
		[Test]
		public function testDispatchSuccessWithPayload():void
		{
			var responder : ISignalResponder = new SignalResponder();
			var payload : String = 'foo';
			var passed : String
			var handler : Function = function( value : String ) : void{
				passed = value;
			}
			responder.successSignal.addOnce( handler );
			responder.successSignal.dispatch( payload );
			
			assertNotNull("passed payload should be set", passed );
			assertEquals( 'passed payload should have correct value', payload, passed );
		}
		
		[Test]
		public function testWithPrioritySignal() :void{
			var responder : ISignalResponder = new SignalResponder( new SignalFactory( PrioritySignal ) );
			var passed : Boolean = false;
			var handler : Function = function() : void{
				passed = true;
			}
			responder.successSignal.addOnce( handler );
			responder.successSignal.dispatch();
			
			assertTrue( 'should have passed', passed );
		}
		
	}
}