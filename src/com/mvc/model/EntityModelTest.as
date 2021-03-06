package com.mvc.model {
	import asunit.framework.TestCase;
	import com.events.EntityModelEvent;
	import com.mvc.model.entities.EntityModel;
	import flash.geom.Point;
	import kris.Dimentions;

	public class EntityModelTest extends TestCase {
		private static const DIMENTIONS_0:Dimentions = new Dimentions(0, 0);
		private static const POSITION_0:Point = new Point(0, 0);

		private var _positionChangeEvents:Array = [];

		public function EntityModelTest(testMethod:String = null):void {
			super(testMethod);
		}

		public function test_dispatch_position_change_event_when_moved():void {
			var instance:EntityModel = newModel();
			instance.addEventListener(EntityModelEvent.POSITION_CHANGE, recordPositionChange);

			instance.moveBy(0, 0);
			assertEquals("moving by a zero value dispatches an event", 1, _positionChangeEvents.length);
			_positionChangeEvents.length = 0;

			instance.moveBy(1, 1);
			assertEquals("moving by a positive value dispatches an event", 1, _positionChangeEvents.length);
			_positionChangeEvents.length = 0;

			instance.moveBy(-1, -1);
			assertEquals("moving by a negative value dispatches an event", 1, _positionChangeEvents.length);
			_positionChangeEvents.length = 0;

			instance.moveBy(30, 80);
			assertEquals("dispatched events contain the current position of the instance, x", 30, _positionChangeEvents[0].x);
			assertEquals("dispatched events contain the current position of the instance, y", 80, _positionChangeEvents[0].y);
		}

		private function recordPositionChange(e:EntityModelEvent):void {
			_positionChangeEvents.push(e);
		}

		private function newModel(x:Number = 0, y:Number = 0, w:Number = 0, h:Number = 0):EntityModel {
			return new EntityModel(x, y, w, h);
		}
	}
}