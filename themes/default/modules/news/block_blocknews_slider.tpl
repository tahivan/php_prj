<!-- BEGIN: main -->
<link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/genk-style.css" />
<div class="boxnhungsoha">
   <div class="hSohaEmbed_box-soha" id="sohaEmbed_GenK" style="display: block;">
      <a class="hSohaEmbed_box-shtt" target="_blank">
         <span class="hSohaEmbed_box-sohatt"></span>
         <p>{TITLECAT.title}</p>
      </a>
      <div class="hSohaEmbed_boxsh-row">
         <p id="hSohaEmbed_SlideCounter"></p>
         <a class="hSohaEmbed_prebt rowsprite" href="javascript:void(0);" id="hSohaEmbed_btnPre"></a>
         <a class="hSohaEmbed_nextbt-active rowsprite" href="javascript:void(0);" id="hSohaEmbed_btnNext"></a>
      </div>
      <div id="hSohaViewPort">
         <div id="hSohaSlideWrapper">
              <!-- BEGIN: loop -->
               <ul class="hSohaEmbed_box-sohact">
               <!-- BEGIN: items -->
               <li class="hSohaEmbed_mgl18">
                  <a title="{ROW.title}" target="_blank" href="{ROW.link}"></a>
                    <!-- BEGIN: img -->
                    <a href="{ROW.link}" title="{ROW.title}">
                        <img height="120" alt="{ROW.title}" title="{ROW.title}" src="{ROW.thumb}" itemprop="image">
                    </a>
                    <!-- END: img -->
                  <p>{ROW.title_cut}</p>
               </li>
               <!-- END: items -->
            </ul> 
              <!-- END: loop -->
         </div>
      </div>
   </div>
</div>

<script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/genk-embed.js" type="text/javascript"></script>
<!-- END: main -->