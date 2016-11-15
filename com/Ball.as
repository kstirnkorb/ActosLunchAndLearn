/*************************************************************/
/* Takeda Actos Lunch Learn Quiz *****************************/
/* AT 15147 **************************************************/
/*************************************************************/
/*************************************************************/

package com {
	
	import flash.display.Sprite;
	
	public class Ball extends Sprite {
		public var radius:Number;
		private var color:uint;
		public var vx:Number = 0;
		public var vy:Number = 0;
		private var mcBall:mc_ball;
		
		public function Ball(radius:Number=40) {
			this.radius = radius;
			this.color = 0xFFFFFF;
			init();
		}
		public function init():void {
			// Bring in asset from library
			mcBall = new mc_ball();
			addChild(mcBall);
			mcBall.width = radius * 2.1;
			mcBall.height = radius * 2;
		}
	}
	
}