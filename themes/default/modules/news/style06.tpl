<!-- BEGIN: main -->
<style type="text/css">

.style6 .title{width:80px;float:left;}
.style6 .title a{font-size:10px;color:#000}
.style6 .title a:hover{text-decoration:underline}
.style6 .images{overflow:hidden;width:160px;float:left;margin-bottom:10px}
.style6 .left{}

.style6 .images .ima{width:80px;height:60px;float:left}
.style6 .images .ima a img{padding-left:2px; width:70px;border:1px #ccc solid}
</style>
<div class="style6">
	<div style="width:6px;height:10px"></div>
    <!-- BEGIN: loop -->
	<div class="images {ROW.left}">
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