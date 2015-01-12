<!-- BEGIN: main -->
<style type="text/css">
.style4 ul li{ padding-bottom:6px}
.style4 ul li a{font-size:10px;color:#333300}
.style4 ul li a:hover{text-decoration:underline}
.m_style4{margin-top:6px}
.m_style4 a.imge{float:left;width:90px;padding-left:6px;}
.m_style4 .title{float:left;width:65%;}
.m_style4 .title a{color:#363636; font-weight:bold; font-size:12px}
.m_style4 .title a:hover{text-decoration:underline}
.m_style4 .title span{font-size:10px; color:#000}
.m_style4 a img{width:80px;height:80px;border:2px green solid;}
</style>
<div class="m_style4">
<!-- BEGIN: content -->
<div style="border-bottom:1px #666633 dotted;">
	<a class="fl imge" href="{content.link}" title="{content.title}"><img src="{content.thumb}" alt=""/></a>
	<div class="title">
	<a href="{content.link}" title="{content.title}">{content.title}</a>
	<br />
	<span>{content.hometext}</span>
	</div>
	<div class="clear"></div>
</div>
<!-- END: content -->
</div>
<div class="clear"></div>
<div class="style4">
  <ul>
      <!-- BEGIN: loop -->
      <li class="clearfix">
      	<a href="{ROW.link}" title="{ROW.title}">
		<img width="8" alt="" src="{NV_BASE_SITEURL}themes/{ROW.template}/images/blue_dot_icon.jpg">
		{ROW.title}</a>
	   </li>
      <!-- END: loop -->
  </ul>
</div>
<!-- END: main -->