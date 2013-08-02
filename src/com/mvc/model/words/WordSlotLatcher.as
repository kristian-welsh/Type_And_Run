package com.mvc.model.words
{
	/**
	 * ...
	 * @author Kristian Welsh
	 */
	public class WordSlotLatcher implements IWordSlotLatcher
	{
		private var _latchedWordSlots:Vector.<IWordSlotModel>;
		private var _wordSlots:Vector.<IWordSlotModel>;
		private var _handler:IWordSlotHandlerModel;
		
		public function WordSlotLatcher(handler:IWordSlotHandlerModel, latchedWordSlots:Vector.<IWordSlotModel>)
		{
			super();
			_handler = handler
			_latchedWordSlots = latchedWordSlots;
		}
		
		public function unlatchAll():void
		{
			_latchedWordSlots.length = 0;
		}
		
		/**
		 * Send advance and reset messages to the valid wordslots for the input character.
		 * @param Character code of the key parse
		 */
		public function acceptInput(charCode:int):void
		{
			latchValidWords(charCode);
			advanceAllLatchedWords(charCode);
		}
		
		// PRIVATE
		
		private function latchValidWords(inputChar:int):void
		{
			if (_latchedWordSlots.length != 0) return;
			for (var i:int = 0; i < _handler.length; i++)
			{
				if (_handler.isNextCharacterCode(i, inputChar)) {
					_latchedWordSlots.push(_handler.getWordSlotAt(i));
				}
			}
		}
		
		private function advanceAllLatchedWords(inputChar:int):void
		{
			for (var i:int = _latchedWordSlots.length-1; i >= 0; --i)
			{
				if (!_latchedWordSlots[i].isNextCharacterCode(inputChar)) {
					unlatchIndex(i);
				} else {
					_latchedWordSlots[i].advanceWord(inputChar);
				}
			}
		}
		
		/**
		 * Cleanly reset and remove element at index on _latchedWordSlots.
		 * @param	index
		 */
		private function unlatchIndex(index:int):void
		{
			_latchedWordSlots[index].resetWord();
			_latchedWordSlots.splice(index, 1);
		}
		
	}

}