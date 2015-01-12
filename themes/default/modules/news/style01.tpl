<!-- BEGIN: main -->
<style type="text/css">
.style1 .title{width:74px;float:left;}
.style1 .title a{font-size:10px;color:#000}
.style1 .title a:hover{text-decoration:underline}
.style1 .images{overflow:hidden;width:143px;float:left;margin-bottom:10px}
.style1 .images .ima{width:68px;height:60px;float:left}
.style1 .images .ima a img{padding-left:2px; width:60px;border:1px #ccc solid}
</style>
<div class="style1">
	
    <!-- BEGIN: loop -->
	<div class="images">
		<div class="ima">
			<!-- BEGIN: img -->
			<a href="{ROW.link}" title="{ROW.title}"><img src="{ROW.thumb}" alt=""/></a>
			<!-- END: img -->
		</div>
		<div class="title">
			<a href="{ROW.link}" title="{ROW.title}">{ROW.title}</a>
		</div>
	</div>
	<div class="{clear}"></div>
    <!-- END: loop -->
</div>
<div class="clear"></div>
<!-- END: main -->