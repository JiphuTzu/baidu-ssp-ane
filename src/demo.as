package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	import so.cuo.platform.baidu.*;
//	import so.cuo.platform.baidu.BaiDu;

	public class demo extends Sprite
	{
		public function demo()
		{
			super();
			stage.align=StageAlign.TOP_LEFT;
			stage.scaleMode=StageScaleMode.NO_SCALE;
			var ui:UI=new UI(onClick);
			addChild(ui);
			ui.addButton("top", 0, 50);
			ui.addButton("abs", 200, 50);
			ui.addButton("hide", 0, 150);
			ui.addButton("full", 200, 150);
			ui.addButton("video", 0, 250);
			ui.addButton("bottom", 200, 250);
			
			
			if (BaiDu.getInstance().supportDevice)
			{
//				BaiDu.getInstance().setKeys("e12b8d63","2067713","2067714","2067715");//ios
				BaiDu.getInstance().setKeys("a3cce0b7","2067723","2067724","2067726");//android
				BaiDu.getInstance().enableTrace=true;
				BaiDu.getInstance().addEventListener(BaiDuAdEvent.onBannerLeaveApplication, onAdEvent);
				BaiDu.getInstance().addEventListener(BaiDuAdEvent.onInterstitialLeaveApplication, onAdEvent);
				BaiDu.getInstance().addEventListener(BaiDuAdEvent.onInterstitialFailedReceive, onAdEvent);
				BaiDu.getInstance().addEventListener(BaiDuAdEvent.onInterstitialReceive, onAdEvent);
			}
		}

		private function onAdEvent(event:BaiDuAdEvent):void
		{
			trace("event " + event.type);
		}

		private function onClick(label:String):void
		{
			trace("click:" + label);
			if (!BaiDu.getInstance().supportDevice)
				return;
			if (label == "top")
			{
				BaiDu.getInstance().showBanner(BaiDu.BANNER, RelationPosition.TOP_CENTER);
				
			}
			else if (label == "bottom")
			{
				BaiDu.getInstance().showBanner(BaiDu.BANNER,RelationPosition.BOTTOM_CENTER);
			}
			else if (label == "abs")
			{
				BaiDu.getInstance().showBannerAbsolute(BaiDu.BANNER, 50, 50);
			}
			else if (label == "hide")
			{
				BaiDu.getInstance().hideBanner();
			}
			else if (label == "video")
			{
				if(BaiDu.getInstance().isVideoReady()){
					BaiDu.getInstance().showVideo();
				}else{
					BaiDu.getInstance().cacheVideo();
				}
			}
			else if (label == "full")
			{
				if (BaiDu.getInstance().isInterstitialReady())
				{
					BaiDu.getInstance().showInterstitial();
				}
				else
				{
					BaiDu.getInstance().cacheInterstitial();
				}
			}
		}
	}
}
