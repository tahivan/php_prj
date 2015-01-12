<!-- BEGIN: main -->
    <!-- it works the same with all jquery version from 1.x to 2.x <script type="text/javascript" src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/jquery-1.9.1.min.js"></script>-->
    <!-- use jssor.slider.mini.js (39KB) or jssor.sliderc.mini.js (31KB, with caption, no slideshow) or jssor.sliders.mini.js (26KB, no caption, no slideshow) instead for release -->
    <!-- jssor.slider.mini.js = jssor.sliderc.mini.js = jssor.sliders.mini.js = (jssor.core.js + jssor.utils.js + jssor.slider.js) -->
    <script type="text/javascript" src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/jssor.core.js"></script>
    <script type="text/javascript" src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/jssor.utils.js"></script>
    <script type="text/javascript" src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/jssor.slider.js"></script>
    <script>
        jQuery(document).ready(function ($) {
            var options = {
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 3,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, default value is 3

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideDuration: 800,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
                $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, default value is 1
                $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                $ArrowNavigatorOptions: {                       //[Optional] Options to specify and enable arrow navigator or not
                    $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 1,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1                                       //[Optional] Steps to go for each navigation request, default value is 1
                },

                $ThumbnailNavigatorOptions: {
                    $Class: $JssorThumbnailNavigator$,              //[Required] Class to create thumbnail navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always

                    $ActionMode: 1,                                 //[Optional] 0 None, 1 act by click, 2 act by mouse hover, 3 both, default value is 1
                    $AutoCenter: 0,                                 //[Optional] Auto center thumbnail items in the thumbnail navigator container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 3
                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange thumbnails, default value is 1
                    $SpacingX: 3,                                   //[Optional] Horizontal space between each thumbnail in pixel, default value is 0
                    $SpacingY: 3,                                   //[Optional] Vertical space between each thumbnail in pixel, default value is 0
                    $DisplayPieces: 9,                              //[Optional] Number of pieces to display, default value is 1
                    $ParkingPosition: 260,                          //[Optional] The offset position to park thumbnail
                    $Orientation: 1,                                //[Optional] Orientation to arrange thumbnails, 1 horizental, 2 vertical, default value is 1
                    $DisableDrag: false                            //[Optional] Disable drag or not, default value is false
                }
            };

            var jssor_slider1 = new $JssorSlider$("slider1_container", options);

            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var bodyWidth = document.body.clientWidth;
                if (bodyWidth)
                    jssor_slider1.$SetScaleWidth(Math.min(bodyWidth, 920));
                else
                    window.setTimeout(ScaleSlider, 30);
            }

            ScaleSlider();

            if (!navigator.userAgent.match(/(iPhone|iPod|iPad|BlackBerry|IEMobile)/)) {
                $(window).bind('resize', ScaleSlider);
            }
            //responsive code end
        });
    </script>
	<style>
	#block_slide_content {position: relative; width: 100%; overflow: hidden;}
	#block_slide_content2{position: relative; left: 50%; width: 5000px; text-align: center; margin-left: -2500px;}
	#slider1_container {}
	#block_slide_content .item{position: absolute; width:45%/*480px*/; height: 300px; top: 10px; left: 10px;text-align: left; line-height: 1.8em; font-size: 12px;}
	#block_slide_content .item .title{display: block; line-height: 1em; text-transform: uppercase; font-size: 22px;/* font-family: sans-serif;font-weight: bold;*/color: {COLORTITLE};}
	#block_slide_content .item .content{display: block; line-height: 1.1em; font-size: 1.5em; color: {COLORCONTENT};}
	
	/*#block_slide_content .item */img.ccc{position: absolute; top: 23px;right:7px;/* left: 480px;*/ width: 500px; height: 300px;}
	#block_slide_content .item a.botton{
	background: #A1D743;
  background-image: -webkit-linear-gradient(top, #A1D743, #82C21A);
  background-image: -moz-linear-gradient(top, #A1D743, #82C21A);
  background-image: -ms-linear-gradient(top, #A1D743, #82C21A);
  background-image: -o-linear-gradient(top, #A1D743, #82C21A);
  background-image: linear-gradient(to bottom, #A1D743, #82C21A);
  -webkit-border-radius: 28;
  -moz-border-radius: 28;
  border-radius: 28px;
  text-shadow: 1px 2px 0px #BCE364;
  -webkit-box-shadow: 0px 2px 5px #496300;
  -moz-box-shadow: 0px 2px 5px #496300;
  box-shadow: 0px 2px 5px #496300;
  font-family: Arial;
  color: {COLORA}/*#295B00*/;
  font-size: 25px;
  padding: 10px 30px;
  text-decoration: none;}
  	#block_slide_content .item a.botton:hover{background: #B6DF53;
  background-image: -webkit-linear-gradient(top, #B6DF53, #A6D040);
  background-image: -moz-linear-gradient(top, #B6DF53, #A6D040);
  background-image: -ms-linear-gradient(top, #B6DF53, #A6D040);
  background-image: -o-linear-gradient(top, #B6DF53, #A6D040);
  background-image: linear-gradient(to bottom, #B6DF53, #A6D040);
  text-decoration: none;}
	</style>
        <div  id="block_slide_content">
            <!-- Jssor Slider Begin -->
            <div id="slider1_container" style="position: relative; margin: 0 auto;top: 0px; left: 0px; width: 920px; height: 400px; background: {BGCOLOR} url({BGIMG}) top center no-repeat; background-size: 100% 100%;">
                <!-- Loading Screen -->
                <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                    <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block;top: 0px; left: 0px; width: 100%; height: 100%;"></div>
                    <div style="position: absolute; display: block; background: url(data:image/png;base64,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/*{NV_BASE_SITEURL}themes/{TEMPLATE}/img/loading.gif*/) no-repeat center center;top: 0px; left: 0px; width: 100%; height: 100%;"></div>
                </div>
                <!-- Slides Container -->

                <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 920px;height: 400px; overflow: hidden;">
                   <!-- BEGIN: loop -->
				   <div>
                        <div class="item" style="">
                            <br />
                            <span class="title">{TITLE}</span>
                            <br />
                            <br />
                            <span class="content">{CONTENT}</span>
                            <br />
                            <br />
                            <a href="{URL}" class="botton">{LINK}</a>
                        </div>
                        <img class="ccc" src="{IMG}" alt="{TITLE}"/>
                        <img u="thumb" src="{IMG}" alt="{TITLE}" />
                    </div>
				<!-- END: loop -->
                </div>
				
                <!-- Arrow Navigator Skin Begin -->
                <style>
                    /* jssor slider arrow navigator skin 07 css */
                    /*
                    .jssora07l              (normal)
                    .jssora07r              (normal)
                    .jssora07l:hover        (normal mouseover)
                    .jssora07r:hover        (normal mouseover)
                    .jssora07ldn            (mousedown)
                    .jssora07rdn            (mousedown)
                    */
                    .jssora07l, .jssora07r, .jssora07ldn, .jssora07rdn
                    {
                        position: absolute;
                        cursor: pointer;
                        display: block;/*
                        background: url({NV_BASE_SITEURL}themes/{TEMPLATE}/img/a07.png) no-repeat;*/
                        background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAADoCAYAAACtmrf4AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAABGJJREFUeF7tnL1uE0EUha1dUVAhOjpqOko6Kt4gbngDkMKPQGmIs3ZFmYYCKS/gPnTJQmEpLwA1XUpLaSylC3OWnWi92p0ZN5l7b04kK4q9Wd/zzd+d6zOeTPhDAiRAAiRAAiRAAiTgCey///ymqqqr+Xx+434v31bfnqij44KvIKD3WKkRMp1Oy0VVfR8Q0YhSIQQi0IXGRLjX/ogXsvfxxUMnYBUQcXVwcPhMtJCYCCfuUrwIzEToMqHuJH62QoCgrVoEuopfI0aErNDlRI+JVsR1oCWWmMFEi1gsFi/HBOB5rCEmRIhuBQS3/+HTXqglkJLIF+GSv5AIJIfiRYwkf7fJIFpKvAgEaEZIMz4sdK3bTZKFwe7FpKwhKsYLgoyJwX5E/ILoaZtIUXpimsKC2qTRizGRxnfFhDZW2K+I31h5MSa2uqlisAkTv2/3YmLlIFRZ1KwzJgp0XdrqS6ZdMW2y2VRZ1Bax1YwFBkoCJEACJEACJEACJEACJEACJEACJEACJEACJEACJEAC2Qm0LlJvSr5UYWkaojZiSpZvMuuLGTMEqPAudsVEzMnqfCf3w6qBcSTerOy7mQkPfKoYU74TU1YNJ+Zale8kdJaq8ck7H3321CQ1AFNiaHJObfa7vs7EiQZAMyHEhH/exGBXP/0mGDHlL4hI2SOHi+WnKDGzsoqkMbYnUZHGmzD0IyUPHS5WsdU1cbgYacdIga45/KLqGJKZAp2ZkqmZIvZd72n4fiRAAiRAAiRAAiRAAiRAAiRAAiRAAiRAAiRAAiRAAiRAArsQmP0s3s3qcn1Ulzezujj9+uPR413+X8S1LvhjCOg+nJgzEcGlBAFrhwv+pC/C/51yj+zXQITrSssxEbPz4nf2IGMBwNqBrjMqoi43X+rJ09h9sr6OQXxUFxcBEWsVItBlxkS45/+KF4EAEWhoTIifcqtfD577NWJYSHGhRcRmfEwUp+LPk8zOy1eB8YAF8ET81+QmiDjOOn2mvPlhXbwOtYQbL/OU+2S9BslfUIR7PWuAKW8O0iERaKmU+2S/JtYaaoSAZEwMXs9OPDUAE4PdizUx/e4gRv6C6MW0eZbuFMWLQearPmnsilGfxnsxSNXVb6y6YtRvdb2YlOIDJonUdSvrdbFyEFota4C7vLmJAl1X8FDWrKpkuiXGQhF7l+7Ia0mABEiABEiABEiABEiABEiABEiABEiABEiABEiABEjgfhNoPux0vvb//vZyrcp3sv2BzaApWb5Trt//Al4tPVYNiAp9hg4fvHgjpm+Z1qoR8p2cibfG9sQ0B1rUmpW7Yug7kbiCpRyxUGPVaH0nzSI59HCz2UaNmJhVo8kEnI9eYq8ajGnodNvWSTdNYsy4tZsMwIJ/3vc5MybnqBAN1nMTXcvEYFc//ZpYEE2kKClJo/gjrSbs4ybO5Zo4YpFw6EVH8SFyCkFPOchOgW7gexxUnMvtbwPNFLHV7LkZKAmQAAmQAAmQgDIC/wCtCwn+w/7uxAAAAABJRU5ErkJggg==) no-repeat;
                        overflow: hidden;
                    }
                    .jssora07l
                    {
                        background-position: 0 0;
                    }
                    .jssora07r
                    {
                        background-position: 0 -60px;
                    }
                    .jssora07l:hover
                    {
                        background-position: 0 -120px;
						background-color: #fff;
                    }
                    .jssora07r:hover
                    {
                        background-position: 0 -180px;
						background-color: #fff;
                    }
                    .jssora07ldn
                    {
                        background-position: 0 0;
						background-color: #92CD2F;
                    }
                    .jssora07rdn
                    {
                        background-position: 0 -60px;
						background-color: #92CD2F;
                    }
                </style>
                <!-- Arrow Left -->
                <span u="arrowleft" class="jssora07l" style="width: 50px; height: 50px; top: 123px;left: 8px; opacity:0.7;"></span>
                <!-- Arrow Right -->
                <span u="arrowright" class="jssora07r" style="width: 50px; height: 50px; top: 123px;right: 8px; opacity:0.7;"></span>
                <!-- Arrow Navigator Skin End -->
                <!-- ThumbnailNavigator Skin Begin -->
                <div u="thumbnavigator" class="jssort04" style="position: absolute; width: 600px;height: 60px; right: 0px; bottom: 0px;">
                    <!-- Thumbnail Item Skin Begin -->
                    <style>
                        /* jssor slider thumbnail navigator skin 04 css */
                        /*
                        .jssort04 .p            (normal)
                        .jssort04 .p:hover      (normal mouseover)
                        .jssort04 .pav          (active)
                        .jssort04 .pav:hover    (active mouseover)
                        .jssort04 .pdn          (mousedown)
                        */
                        .jssort04 .w, .jssort04 .pav:hover .w
                        {
                            position: absolute;
                            width: 60px;
                            height: 30px;
                            border: {BORDER} 1px solid;
                        }
                        * html .jssort04 .w
                        {
                            width: /**/ 62px;
                            height: /**/ 32px;
                        }
                        .jssort04 .pdn .w, .jssort04 .pav .w
                        {
                            border-style: solid;
                        }
                        .jssort04 .c
                        {
                            width: 62px;
                            height: 32px;
                            filter: alpha(opacity=40);
                            opacity: 0.3;
                            transition: opacity .6s;
                            -moz-transition: opacity .6s;
                            -webkit-transition: opacity .6s;
                            -o-transition: opacity .6s;
                        }
                        .jssort04 .p:hover .c, .jssort04 .pav .c
                        {
                            filter: alpha(opacity=0);
                            opacity: 0;
                        }
                        .jssort04 .p:hover .c
                        {
                            transition: none;
                            -moz-transition: none;
                            -webkit-transition: none;
                            -o-transition: none;
                        }
                    </style>
                    <div u="slides" style="bottom: 25px; right: 30px;">
                        <div u="prototype" class="p" style="position: absolute; width: 62px; height: 32px; top: 0; left: 0;">
                            <div class="w">
                                <thumbnailtemplate style="width: 100%; height: 100%; border: none; position: absolute; top: 0; left: 0;"></thumbnailtemplate>
                            </div>
                            <div class="c" style="position: absolute; background-color: #fff; top: 0; left: 0;"></div>
                        </div>
                    </div>
                    <!-- Thumbnail Item Skin End -->
                </div>
                <!-- ThumbnailNavigator Skin End -->
            </div>
            <!-- Jssor Slider End -->
        </div>
<!-- END: main -->