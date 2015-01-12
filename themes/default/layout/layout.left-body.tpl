<!-- BEGIN: main -->
{FILE "header.tpl"}
<div class="contentwrapper">

	[HEADER]
	<div class="clear"></div>

		<!-- BEGIN: mod_title -->
	    <h3 class="breakcolumn">
	    	<span itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a title="{LANG.Home}" itemprop="url" href="{NV_BASE_SITEURL}"><img src="{NV_BASE_SITEURL}themes/{TEMPLATE}/images/icons/home.png" alt="{LANG.Home}" />&nbsp;<span itemprop="title">{LANG.Home}</span></a></span>
	    	<!-- BEGIN: breakcolumn -->
				<span class="breakcolumn">&frasl;</span>	    	
	    		<span itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="{BREAKCOLUMN.link}"  itemprop="url" title="{BREAKCOLUMN.title}"><span itemprop="title">{BREAKCOLUMN.title}</span></a></span>
	    	<!-- END: breakcolumn -->
	    </h3>

         <!-- END: mod_title --> 
		
    <div class="span-5">
        [LEFT]
    </div>
    <div class="span-19 last">
    	[TOP]
        {MODULE_CONTENT}
		[BOTTOM]
    </div>
	<div class="clear"></div>
	[FOOTER]
</div>
{FILE "footer.tpl"}<!-- END: main -->
