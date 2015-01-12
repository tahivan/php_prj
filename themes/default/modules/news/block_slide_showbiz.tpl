<!-- BEGIN: main -->   
    <link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}themes/{TEMPLATE}/showbiz/css/style.css" media="screen" />	
	<link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}themes/{TEMPLATE}/showbiz/services-plugin/css/settings.css" media="screen" />
	<script type="text/javascript" src="{NV_BASE_SITEURL}themes/{TEMPLATE}/showbiz/services-plugin/js/jquery.cssAnimate.mini.js"></script>	
	<script type="text/javascript" src="{NV_BASE_SITEURL}themes/{TEMPLATE}/showbiz/services-plugin/js/jquery.themepunch.services.mini.js"></script>	
<style type="text/css">
.example-wrapper{
	width:100%;
	height:400px;
	margin-top:10px;
		display:block;
}
.theme1 .details_double{
	width:310px;
	margin-right:30px;
}
.theme1 .video_clip{
	width: 458px;
	height: 280px;
</style>	
<div class="example-wrapper">
					<div id="services-example-1" class="theme1">
					
						<ul>
						
						<!-- BEGIN: loop -->
							<li>
								<img class="thumb" src="{ROW.homeimgfile}" alt="{ROW.title}" data-bw="{ROW.thumb}" style="width:200px;height:130px"/>	
								<div style="margin-top:10px"></div>
								<h2>{ROW.title1}</h2>
								<p>{ROW.hometext1}</p>								
								<a class="buttonlight morebutton" href="#">read more</a>
								<div class="page-more">
									<img class="big-image" style="width:458px;height:280px" src="{ROW.homeimgfile}">
									<div class="details_double">
										<h2>{ROW.title}</h2>
										<p style="width=400;height:220px">{ROW.hometext}</p>
										<a class="buttonlight" href="{ROW.link}">view detail</a>
									</div>
									<div  class="closer"></div>
								</div>
							</li>
							<!-- END: loop -->   
						</ul>
						<!-- <div class="toolbar">
							<div class="left"></div><div class="right"></div>
						</div> -->
					</div>
				
</div>
		
			<script type="text/javascript">
				$(document).ready(function() {
					jQuery('#services-example-1').services(
						{										
							width:1075,
							height:290,							
							slideAmount:5,
							slideSpacing:30,							
							touchenabled:"on",
							mouseWheel:"on"
						});
			});
			</script>
<!-- END: main -->