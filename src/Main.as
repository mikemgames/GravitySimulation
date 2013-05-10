package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import Vector2D.Vec2D;
	
	/**
	 * ...
	 * @author Miguel Murça
	 */
		
	 [SWF(width = "1024", height = "640", backgroundColor = "0x000000")]
	 
	public class Main extends Sprite 
	{		
		public var attractor:Particle;
		public var particle:Particle;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			attractor = new Particle(60, 0, 0, 15);
			particle = new Particle(5, randInt(0, stage.stageWidth), randInt(0, stage.stageHeight), 10);
			
			
			addChild(attractor);
			addChild(particle);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event = null):void
		{
			
			particle.attractTo(attractor);
			particle.updatePos();
			
			attractor.x = mouseX;
			attractor.y = mouseY;
		}
		
		private function randInt(min:Number, max:Number):Number
		{
			return(Math.round(Math.random() * (max - min) + min));
		}
	}
	
}