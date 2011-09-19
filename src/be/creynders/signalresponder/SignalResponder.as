/*
The MIT License

Copyright (c) 2010 the original author or authors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

/**
 * @author Camille Reynders, info@creynders.be
 */


package be.creynders.signalresponder
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	
	public class SignalResponder implements ISignalResponder
	{
		
		/*-------------------------------------------------*/
		/* CONSTRUCTOR                                     */
		/*-------------------------------------------------*/
		
		public function SignalResponder( signalFactory : ISignalFactory = null )
		{
			_status = ResponderStatus.READY
			_signalFactory = signalFactory || new SignalFactory();
			
			successSignal.add( _handleSuccessSignal );
			failureSignal.add( _handleFailureSignal );
			
		}
		
		/*-------------------------------------------------*/
		/* INSTANCE PROPS                                  */
		/*-------------------------------------------------*/
		
		private var _signalFactory : ISignalFactory;
		
		/*-------------------------------------------------*/
		/* ACCESSORS                                       */
		/*-------------------------------------------------*/
		
		private var _startSignal : ISignal;
		/**
		 * @inheritdoc
		 */
		public function get startSignal():ISignal
		{
			return _startSignal ||= _signalFactory.createSignal();
		}
		
		public function set startSignal(value:ISignal):void
		{
			_startSignal = value;
		}
		
		private var _progressSignal : ISignal;
		/**
		 * @inheritdoc
		 */
		public function get progressSignal():ISignal{
			return _progressSignal ||= _signalFactory.createSignal();
		}

		public function set progressSignal(value:ISignal):void{
			_progressSignal = value;
		}

		
		private var _successSignal : ISignal;
		/**
		 * @inheritdoc
		 */
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
		/**
		 * @inheritdoc
		 */
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
		
		private var _status : ResponderStatus;
		/**
		 * @inheritdoc
		 */
		public function get status():ResponderStatus
		{
			return _status;
		}
		
		/**
		 * @inheritdoc
		 */
		public function get hasCompleted():Boolean
		{
			return _status == ResponderStatus.SUCCEEDED || _status == ResponderStatus.FAILED;
		}
		
		[Bindable]
		private var _result : *;
		/**
		 * @inheritdoc
		 */
		public function get result():*{
			return _result;
		}
		
		/*-------------------------------------------------*/
		/* METHS                                           */
		/*-------------------------------------------------*/
		
		
		protected function _handleSuccessSignal( ...valueObjects ) : void{
			_result = valueObjects;
			_status = ResponderStatus.SUCCEEDED;
		}
		
		protected function _handleFailureSignal( ...valueObjects ) : void{
			_result = valueObjects;
			_status = ResponderStatus.FAILED;
		}
		
	}
}