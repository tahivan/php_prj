<!-- BEGIN: main -->
<div id="event-slider">
<div class="back">
	<a title="" class="prev browse left">Tin phía dưới</a>
</div>
<div class="event-slider-items">
    <ul style="left: -880px;">
		<!-- BEGIN: loop -->
		<li>
			<!-- BEGIN: items -->
			<div class="event-slider-item">
				<a href="{ROW.link}" title=""><img class="drop-shadow" src="{ROW.thumb}" alt="" width="120" height="88"/></a>
				<a class="title" href="{ROW.link}" title="{ROW.title}">{ROW.title1}</a>
			</div>
			<!-- END: items -->
		</li>
		<!-- END: loop -->
	</ul>
</div>
<div class="next2"><a class="next browse right" title="">Tin tiếp theo</a></div>
</div>
<script type="text/javascript">
    window.onload = function(){    
    	$( '.event-slider-items' ).scrollable({ circular: true, speed: 600 });
    };
</script>
<!-- END: main -->