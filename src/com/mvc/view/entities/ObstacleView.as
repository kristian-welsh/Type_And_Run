package com.mvc.view.entities {
	import com.mvc.model.entities.EntityModel;
	import com.mvc.model.entities.IEntityModel;
	import flash.display.DisplayObjectContainer;

	/** @author Kristian Welsh */
	public class ObstacleView extends EntityView {
		[Embed(source="../../../../../lib/images/simple/Obstacle.png")]
		private var _image:Class;

		public function ObstacleView(container:DisplayObjectContainer, model:IEntityModel) {
			super(container, model, _image);
		}
	}
}