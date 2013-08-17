package com.mvc.view {
	import com.mvc.model.EntityModel;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	
	/** @author Kristian Welsh */
	public class PlayerView extends EntityView {
		[Embed(source="../../../../lib/images/simple/Player.png")]
		private var _image:Class;
		
		public function PlayerView(container:DisplayObjectContainer, model:EntityModel) {
			super(container, model, _image);
		}
	}
}