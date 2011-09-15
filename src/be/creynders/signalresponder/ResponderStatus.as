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
	final public class ResponderStatus
	{
		
		/**
		 * the SignalResponder is ready to be used. Initial state
		 */
		static public const READY : ResponderStatus = new ResponderStatus( 'ready' );
		
		/**
		 * the process has started and is curently running
		 */
		static public const STARTED : ResponderStatus = new ResponderStatus( 'started' );
		
		/**
		 * the process has completed successfully
		 */
		static public const SUCCEEDED : ResponderStatus = new ResponderStatus( 'succeeded' );
		
		/**
		 * the process completed in failure
		 */
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
