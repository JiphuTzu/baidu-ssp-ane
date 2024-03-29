package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class UI extends Sprite
	{
		private var format:TextFormat=new TextFormat(null,36);
		private var click:Function;
		public function UI(clickHandler:Function)
		{
			super();
			click=clickHandler;
		}
		public function addButton(label:String,x:int,y:int):TextField{
			var check:TextField=new TextField();
			check.defaultTextFormat=format;
			check.text=label;
			check.x=x;
			check.y=y;
			check.width=160;
			check.height=44;
			check.border=true;
			check.addEventListener(MouseEvent.CLICK,onClick);
			addChild(check);
			return check;
		}
		protected function onClick(event:MouseEvent):void
		{
			if(click!=null){
				var label:TextField=event.currentTarget as  TextField;
				click(label.text);
			}
		}
	}
}