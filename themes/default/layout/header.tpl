<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        {THEME_PAGE_TITLE} {THEME_META_TAGS}
        <link rel="icon" href="{NV_BASE_SITEURL}favicon.ico" type="image/vnd.microsoft.icon" />
        <link rel="shortcut icon" href="{NV_BASE_SITEURL}favicon.ico" type="image/vnd.microsoft.icon" />
        <link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/reset.css" />
        <link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/template.css" />
        <link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/icons.css" />
        {THEME_CSS}
        {THEME_SITE_RSS}
        {THEME_SITE_JS}


    </head>
    <body>
    <noscript>
        <div id="nojavascript">{THEME_NOJS}</div>
    </noscript>
	<div id="topbar">
	Hello, Have a nice day ! # this's a product of LeViet.pro # 2014.
	</div>
        <div id="container">
			<div id="header">
                <!-- BEGIN: language -->
	                <div class="language">
	                	Language:
	                    <select name="lang">
	                        <!-- BEGIN: langitem -->
	                        	<option value="{LANGSITEURL}" title="{SELECTLANGSITE}">{LANGSITENAME}</option>
	                        <!-- END: langitem -->
	                        <!-- BEGIN: langcuritem -->
	                        	<option value="{LANGSITEURL}" title="{SELECTLANGSITE}" selected="selected">{LANGSITENAME}</option>
	                        <!-- END: langcuritem -->
	                    </select>
	                    <script type="text/javascript">
	                        $(function(){
	                            $("select[name=lang]").change(function(){
	                                var reurl = $("select[name=lang]").val();
	                                document.location = reurl;
	                            });
	                        });
	                    </script>
	                </div>
                <!-- END: language -->
            
		<style type='text/css'>
       #floatDivWrapper {font-size:11px}
       #floatDiv.fixed {position:fixed;top:0px;z-index:1000;width:85%}
       </style>

       <!-- begin Float menu -->
		<script type='text/javascript'>//<![CDATA[
          $(document).ready(function(){var documentHeight=$(document).height();if(documentHeight>200){      
          var bottomHeight=300;var  msie6=$.browser=='msie'&&$.browser.version<7;if(!msie6){var  top=$('#floatDiv').offset().top-parseFloat($('#floatDiv').css('margin-top').replace(/auto/,0));$(window).scroll(function(event){var   y=$(this).scrollTop();if(y>=top&&y<=(documentHeight-bottomHeight)){$('#floatDiv').addClass('fixed')}else{$('#floatDiv').removeClass('fixed')}})}}});
          //]]>
       </script>
       <script type='text/javascript'>//<![CDATA[
          var s=true;function doBlink(){$('.blink').css('display',function(index,val){s=!s;return (s)?'block':'none';})}
          $(document).ready(function() {setInterval("doBlink()",0)});
          //]]>
       </script>
	<div class="widget HTML" id="floatDiv">
				<div class="menusite">[MENU_SITE]</div>
				<div class="social">[SOCIAL]</div>
	</div>		
			</div>
			
            [THEME_ERROR_INFO]