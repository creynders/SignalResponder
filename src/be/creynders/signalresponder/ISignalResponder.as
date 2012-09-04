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

	public interface ISignalResponder
	{
		/**
		 * signal dispatched when the async process has started
		 */
		function get startSignal() : ISignal;
		function set startSignal( value : ISignal ) : void;
		
		/**
		 * signal dispatched when the async process progresses
		 */
		function get progressSignal() : ISignal;
		function set progressSignal( value : ISignal ) : void;
		
		/**
		 * signal dispatched when the async process finished successfully
		 */
		function get successSignal() : ISignal;
		function set successSignal( value : ISignal ) : void;
		
		/**
		 * signal dispatched when the async process fails
		 */
		function get failureSignal() : ISignal;
		function set failureSignal( value : ISignal ) : void;
		
		/**
		 * the status of the async process
		 */
		function get status() : ResponderStatus;
		
		/**
		 * whether the async process has finished (successfully or not)
		 */
		function get hasCompleted() : Boolean;
		
		/**
		 * the result of the async process
		 */
		function get result() : *;
		
		function destroy() : void;
		
	}
}