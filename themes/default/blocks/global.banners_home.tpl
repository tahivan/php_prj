<!-- BEGIN: main  -->
<script type="text/javascript" src="{NV_BASE_SITEURL}themes/default/js/s3Slider.js"></script>
<link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}themes/default/css/slideshow1.css" media="screen" />
<script type="text/javascript">
    $(document).ready(function() {
        $('#slider').s3Slider({
            timeOut: 5000
        });
    });
</script>
<div id="slider">
       <ul id="sliderContent">
        			<!-- BEGIN: loop -->
                    <!-- BEGIN: type_image_link -->
							<li class="sliderImage">
                                <a href="{DATA.link}" onclick="this.target='_blank'" title="{DATA.file_alt}">
				                <img src="{DATA.file_image}" alt="{DATA.file_alt}" />
				                 <span class="top"><strong>{DATA.file_alt}</strong></span>
				                </a>
                            </li>
			         <!-- END: type_image_link -->	
                     <!-- BEGIN: type_image -->	
							<li class="sliderImage">
				                <img  src="{DATA.file_image}" alt="{DATA.file_alt}" />
				                <span class="bottom"><strong>{DATA.file_alt}</strong></span>
				            </li>
					<!-- END: type_image -->
                    <!-- END: loop -->
            <div class="clearfix sliderImage"></div>
        </ul>
</div>
<!-- END: main -->