	<div class="clear"></div>
	
	  <script type="text/javascript" src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/flytop.js"></script>
<p id="back-top">
        <a href="#top"><span><strong class="vedau">Về đầu trang</strong></span></a>
    </p>
	<p id="back-bottom">
        <a href="#bottom"><span></span></a>
    </p>
	<script type="text/javascript">
	jQuery(document).ready(function(){
           // hide #back-top first
        	jQuery("#back-top").hide();
        	jQuery("#back-bottom").hide();
        	// fade in #back-top
        	jQuery(function () {
        		jQuery(window).scroll(function () {
        			if (jQuery(this).scrollTop() > 100) {
        				jQuery('#back-top').fadeIn();
						jQuery('#back-bottom').fadeIn();
        			} else {
        				jQuery('#back-top').fadeOut();
						jQuery('#back-bottom').fadeOut();
        			}
        		});
        
        		jQuery('#back-top a').click(function () {
        			jQuery('body,html').animate({
        				scrollTop: 0
        			}, 800);
        			return false;
        		});
				jQuery('#back-bottom a').on("click",function() {
					var percentageToScroll = 100;
					var height = jQuery(document).innerHeight();
					var scrollAmount = height * percentageToScroll/ 100;
					//alert(scrollAmount);
					 var overheight = jQuery(document).height() - jQuery(window).height();
					//alert(overheight);
				jQuery("html, body").animate({scrollTop: scrollAmount}, 900);    
				});
        	});

           
        });
	</script>
	
	<div id="footer" class="clearfix">
	        [FOOTER_SITE]
		<div class="footer2">[FOOTER2]</div>
		<div class="footer1">[FOOTER1]</div>
		<div class="fr">
			{THEME_STAT_IMG} {THEME_NUKEVIET_IMG} 
		</div>
	
	    <div class="clear"></div>
	    <div id="run_cronjobs" style="visibility: hidden; display: none;">
	        <img alt="" title="" src="{THEME_IMG_CRONJOBS}" width="1" height="1" />
	    </div>
	</div>
	
</div>
</body>
</html>