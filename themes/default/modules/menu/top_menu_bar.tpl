<!-- BEGIN: tree -->
<li>
	<a title="{MENUTREE.note}" href="{MENUTREE.link}"{MENUTREE.target}>{MENUTREE.title}</a>	
	<!-- BEGIN: tree_content -->
	<ul>
		{TREE_CONTENT}
	</ul><!-- END: tree_content -->                
</li><!-- END: tree -->
<!-- BEGIN: main -->
<link rel="stylesheet" type="text/css" media="screen" href="{NV_BASE_SITEURL}themes/{BLOCK_THEME}/css/ddlevelsmenu-topbar.css" />
<script src="{NV_BASE_SITEURL}js/jquery/ddlevelsmenu.js" type="text/javascript"></script>
<div id="ddtopmenubar" class="mattblackmenu">

	<ul>
	<div id="logo">
		<a title="VIET NAM - TIMELESS CHARM!" alt="du lich viet nam,du lich tron goi,du lich gia re" href="#"><img src="http://levietpro.com/demo/dulich/images/logo.png" alt="" /></a>
	</div>
		<!-- BEGIN: loopcat1 -->
		<li><a href="{CAT1.link}" {rel}{CAT1.target}{CAT1.class}><strong>{CAT1.title}</strong></a></li><!-- END: loopcat1 -->
	</ul>
</div>
<script type="text/javascript">
ddlevelsmenu.setup("ddtopmenubar", "topbar") 
</script>
<!-- BEGIN: cat2 -->

<ul id="ddsubmenu{nu}" class="ddsubmenustyle">
	<!-- BEGIN: loopcat2 -->
    <div style="float:left">
	<li {CAT2.class}>
		<strong><a title="{CAT2.note}" href="{CAT2.link}"{CAT2.target}>{CAT2.title}</a></strong>
		<!-- BEGIN: cat3 -->			
			{HTML_CONTENT}	
		<!-- END: cat3 -->
	</li>
   </div>
<!-- END: loopcat2 -->

</ul><!-- END: cat2 -->
<!-- END: main -->