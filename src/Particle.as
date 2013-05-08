package  
{
  import flash.display.Sprite;
	import flash.geom.Point;
	import Vector2D.Vec2D;
	/**
	 * ...
	 * @author Miguel Murça
	 */
	public class Particle extends Sprite
	{
		public static var ParticlePos:Point;
		public static var gravitationalConstant:Number = 750;
		
		private var mass:Number;
		private var movement:Vec2D;
		
		public function Particle(ParticleMass:Number, x:Number = 0,y:Number = 0,radius:Number = 15) 
		{
			mass = ParticleMass;
			
			this.graphics.beginFill(Math.random() * 0xffffff);
			this.graphics.drawCircle(0, 0, radius);
			this.graphics.endFill();
			
			ParticlePos = new Point(x, y);
			this.x = ParticlePos.x;
			this.y = ParticlePos.y;
			
			movement = new Vec2D(0, 0);
		}
		
		public function GetMass():Number
		{
			return(mass);
		}
		
		public function updatePos():void
		{			
			this.applyVector(movement);
			
			this.x = ParticlePos.x;
			this.y = ParticlePos.y;
		}
		
		public function applyVector(vector:Vec2D):void
		{
			ParticlePos.x += vector.x;
			ParticlePos.y += vector.y;
		}
		
		public function attractTo(attractor:Particle):void
		{
			var direction:Vec2D = new Vec2D(attractor.x - this.x, attractor.y - this.y);
			var distanceSquared:Number = Math.pow(attractor.x - this.x, 2) + Math.pow(attractor.y - this.y, 2);
			if (distanceSquared != 0) //Doesn't matter if it's the actual distance that's 0 because 0^2=0 (also then you divide by 0 and the world explodes)
			{
				var accelerationLength:Number = gravitationalConstant * attractor.GetMass() / distanceSquared;
				var acceleration:Vec2D = new Vec2D();
				acceleration.changeLength(direction, accelerationLength);
			}
			var friction:Vec2D = new Vec2D();
			if (acceleration.x == 0 && acceleration.y == 0) {
				friction.zero() 
			} else {
				friction.changeLength(direction.ReturnMultiplied(-1), 0.1);
			}
			
			movement.addVector(acceleration);
			movement.subtractVector(friction);
			
			trace(acceleration);
		}
	}

}
