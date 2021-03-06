package Vector2D
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Miguel Murça
	 */
	public class Vec2D extends Point
	{
		public function Vec2D(x:Number = 0, y:Number = 0) 
		{
			super(x, y);
		}
		
		public function addVector(vector:Vec2D):void
		{
			this.x += vector.x;
			this.y += vector.y;
		}
		
		public function ReturnAddition(vector:Vec2D):Vec2D
		{
			return(new Vec2D(this.x += vector.x, this.y += vector.y));
		}
		
		public function subtractVector(vector:Vec2D):void
		{
			this.x -= vector.x;
			this.y -= vector.y;
		}
		
		public function returnSubtracted(vector:Vec2D):Vec2D
		{
			return(new Vec2D(this.x -= vector.x, this.y -= vector.y));
		}
		
		public function multiply(vector:Vec2D):void
		{
			this.x = this.x * vector.x;
			this.y = this.y * vector.y;
		}
		
		public function ReturnMultiplied(factor:Number):Vec2D
		{
			return(new Vec2D(this.x * factor, this.y * factor));
		}
		
		public function changeLength(original:Vec2D, NewLength:Number):void
		{
			var ratio:Number = NewLength / original.length;
			this.x = original.x * ratio;
			this.y = original.y * ratio;
		}
		
		public function zero():void
		{
			this.x = 0;
			this.y = 0;
		}
		
	}

}