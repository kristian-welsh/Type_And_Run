package com.mvc.view.words
{
	// Flash Imports
	import flash.display.Stage;
	import flash.events.Event;
	import org.flashdevelop.utils.FlashConnect;
	
	// My Imports
	import com.events.WordSlotHandlerEvent;
	import com.events.WordSlotHandlerEvent;
	import com.mvc.model.words.IWordSlotHandlerModel;
	import com.mvc.model.words.WordSlotHandlerModel;
	import com.mvc.view.words.IWordSlotView;
	import com.mvc.view.words.WordSlotView;
	
	/**
	 * Handle the display of spellable words.
	 * @author Kristian Welsh
	 */
	public class WordSlotHandlerView
	{
		/** Referance to the game's stage */
		private var _stage:Stage;
		
		/** Referance to the object's model component. */
		private var _model:IWordSlotHandlerModel;
		
		/** List of active WordSlotView Objects. */
		private var _wordObjects:Vector.<IWordSlotView>;
		
		private var _numInitialisedObjects:int = 0;
		
		/**
		 * Readys the object for use.
		 * @param	stage
		 * @param	model
		 */
		public function WordSlotHandlerView(stage:Stage, model:IWordSlotHandlerModel, wordObjects:Vector.<IWordSlotView>):void
		{
			initVars(stage, model, wordObjects);
			addListeners();
		}
		
		/**
		 * Set the global object referances to the passed in values.
		 * @param	stage
		 * @param	model
		 */
		private function initVars(stage:Stage, model:IWordSlotHandlerModel, wordObjects:Vector.<IWordSlotView>):void
		{
			_stage = stage;
			_model = model;
			_wordObjects = wordObjects;
		}
		
		/**
		 * Adds all needed listeners to the associated model.
		 */
		private function addListeners():void
		{
			_model.addEventListener(WordSlotHandlerEvent.CREATE, wordCreated);
		}
		/**
		 * Adds a WordSlotView object to the referance list and provides needed globals and event variables.
		 * @param	e:WordSlotHandlerEvent
		 */
		private function wordCreated(e:WordSlotHandlerEvent):void
		{
			if (!(_numInitialisedObjects < _wordObjects.length)) return;
			_wordObjects[_numInitialisedObjects].init(_stage, e.newWord);
			_numInitialisedObjects++;
		}
	}

}