package be.creynders.signalresponder.tests
{
	import be.creynders.signalresponder.ISignalResponder;
	import be.creynders.signalresponder.ResponderStatus;
	import be.creynders.signalresponder.SignalFactory;
	import be.creynders.signalresponder.SignalResponder;
	import be.creynders.signalresponder.tests.support.CustomSignal;
	
	import flexunit.framework.Assert;
	
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
			Assert.assertEquals("status should be ResponderStatus.READY", ResponderStatus.READY,responder.status );
		}
		
		[Test]
		public function testDispatchFailureStatus():void
		{
			var responder : ISignalResponder = new SignalResponder();
			responder.failureSignal.dispatch();
			
			Assert.assertEquals("status should be ResponderStatus.FAILED", ResponderStatus.FAILED,responder.status );
			Assert.assertTrue( 'should be completed', responder.hasCompleted );
		}
		
		[Test]
		public function testDispatchSuccess():void
		{
			var responder : ISignalResponder = new SignalResponder();
			responder.successSignal.dispatch();
			
			Assert.assertEquals("status should be ResponderStatus.SUCCESS", ResponderStatus.SUCCEEDED,responder.status );
			Assert.assertTrue( 'should be completed', responder.hasCompleted );
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
			
			Assert.assertNotNull("passed payload should be set", passed );
			Assert.assertEquals( 'passed payload should have correct value', payload, passed );
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
			
			Assert.assertTrue( 'should have passed', passed );
		}
		
	}
}