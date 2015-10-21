baidu-ssp-ane-for-ios-and-android
=============================

百度ane是一个方便flash as3开发人员在flex，flash air 移动应用中添加百度ssp移动广告联盟广告的ane插件，<br/>
支持flash air ios和flash air android，支持百度广告联盟全屏广告,视频广告和banner广告<br/>
项目官方网址:https://github.com/lilili87222/baidu-ssp-ane<br/>
百度广告联盟网站：http://ssp.baidu.com/<br/>
admob广告ane地址:https://github.com/lilili87222/admob-for-flash<br/>
版本号：201501020<br/>
构建于：adobe air sdk 17.0<br/>
iphone4/ios7,iphone5/ios7,小米/android 4测试都ok<br/>

###使用：<br/>
1.在百度ssp广告联盟网站创建应用，获取广告id<br/>
2.添加baidu1.0.ane到flex air项目或者flash android ，flash ios项目中。具体怎么在flex air项目中加ane可以在网上找<br/>
3.书写下面代码,把debug改成在百度网站获得的广告id<br/>

```
if(BaiDu.getInstance().supportDevice){
	BaiDu.getInstance().setKeys("appid","banner id","插屏幕id","视频id");
	BaiDu.getInstance().showBanner(BaiDu.BANNER,RelationPosition.BOTTOM_CENTER);
}
```

4.显示百度全屏广告
```
if (BaiDu.getInstance().isInterstitialReady())
{
	BaiDu.getInstance().showInterstitial();
}
else
{
	BaiDu.getInstance().cacheInterstitial();
}
```

5.显示百度视频广告(只有android才有视频广告)
```
BaiDu.getInstance().cacheVideo();
if(BaiDu.getInstance().isVideoReady()){
BaiDu.getInstance().showVideo();
}

```

6.确认xxx-app.xml中已经有ane的id代码

```
 <extensionID>so.cuo.platform.baidussp</extensionID>
```

7.ios只需要上门4步，android版本需要比ios多出此步骤<br/>
     a.给应用添加相关权限，确认在xxx-app.xml中添加下面的权限代码

```
        <uses-permission android:name="android.permission.INTERNET" />
	<uses-permission android:name="android.permission.READ_PHONE_STATE" />
	<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
	<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
	<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
	<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
```

  b.代码中添加广告的Activity

```
<application>
  	 	<activity android:name="com.baidu.mobads.AppActivity" android:configChanges="keyboard|keyboardHidden|orientation" /> 
</application>
```

   c.把biduad_plugin文件夹复制到编译路径，例如源代码src路径下


**ane其他api:**
- 	1.缓存加载百度全屏广告<br/>
 	public function cacheInterstitial():void
- 	2.展示广告，展示前先需要缓存好<br/>
 	public function showInterstitial():void
- 	3.检测百度移动全屏广告是否缓存好了<br/>
 	public function isInterstitialReady():Boolean
- 	4.相对位置，展示百度移动应用banner广告<br/>
 	public function showBanner(adSize:BaiDuSize, position:int):void
- 	5.绝对定位展示百度应用广告<br/>
 	public function showBannerAbsolute(adSize:BaiDuSize, x:Number, y:Number):void
- 	6.隐藏banner广告<br/>
 	public function hideBanner():void
-	7.加载视频广告，在android上有效，只需要调用一次
	BaiDu.getInstance().cacheVideo()
-	8.显示视频广告，android上有效
	BaiDu.getInstance().showVideo(VideoType.VideoPause,new Rectangle(50,100,250,250))
<br/>
<br/>
**ane支持广告相关的各种事件在BaiDuAdEvent中的常量**
-	1.广告隐藏<br/>
	public static const onBannerDismiss:String = "onBannerDismiss";
-	2.广告加载失败<br/>
	public static const onBannerFailedReceive:String = "onBannerFailedReceive";
-	3.点击广告离开应用<br/>
	public static const onBannerLeaveApplication:String = "onBannerLeaveApplication";
-	4.展示广告<br/>
	public static const onBannerPresent:String = "onBannerPresent";
-	5.接收到广告<br/>
	public static const onBannerReceive:String = "onBannerReceive";
-	6.全屏广告关闭<br/>
	public static const onInterstitialDismiss:String = "onInterstitialDismiss";
-	7.全屏广告加载失败<br/>
	public static const onInterstitialFailedReceive:String = "onInterstitialFailedReceive";
-	8.点击了全屏广告跳出应用<br/>
	public static const onInterstitialLeaveApplication:String = "onInterstitialLeaveApplication";
-	9.全屏广告将展示<br/>
	public static const onInterstitialPresent:String = "onInterstitialPresent";
-	10.全屏广告加载成功<br/>
	public static const onInterstitialReceive:String = "onInterstitialReceive";
