/*************************************************************/
/* Takeda Actos Lunch Learn Quiz *****************************/
/* AT 15147 **************************************************/
/*************************************************************/
/*************************************************************/

package com {
	
	import flash.display.Sprite;
	
	public class Ball2 extends Sprite {
		public var radius:Number;
		private var color:uint;
		public var vx:Number = 0;
		public var vy:Number = 0;
		private var mcBall2:mc_ball2;
		
		public function Ball2(radius:Number=40) {
			this.radius = radius;
			this.color = 0xFFFFFF;
			init();
		}
		public function init():void {
			// Bring in asset from library
			mcBall2 = new mc_ball2();
			addChild(mcBall2);
			mcBall2.width = radius * 2.1;
			mcBall2.height = radius * 2;
		}
	}
	
}