<!-- BEGIN: main -->
<style>
.brt_new2 {
padding: 0 1px;
border: 0 solid gainsboro;
border-image: initial;
}
.brt_new2 .tnd {
padding: 10px;
}
.title1 a{
	color: #123979;
}
.brt_new2 .tnd .textnd {
padding-top: 5px;
}
.brt_new2 .tnd .textnd .left1 {
float: left;
width: 120px;
height: 113px;
background: url({linksite}/images/sprice_icon.gif) no-repeat -2px -398px;
padding: 11px 9px;
margin-right: 10px;
margin-bottom: 5px;
display: inline;
}
.brt_new2 .tnd .l_new1 {
padding-top: 10px;
}
.brt_new2 .tnd .l_new1 a {
display: block;
background: url({linksite}/images/sprice_bg.gif) no-repeat 0 -916px;
padding-left: 15px;
padding-bottom: 5px;
}
</style>
<div class="brt_new2">
  <div class="tnd">
    <div class="title1"> <a href="{main.link}"><b>{main.title}</b></a> </div>
    <div class="textnd clearfix">
      <div class="left1"> <img src="{main.imgsource}" alt="{main.title}" height="113" width="120"> </div>
      {main.hometext}</div>
    <div class="l_new1"> 
	<!-- BEGIN: othernews -->
	<a href="{othernews.link}">{othernews.title}</a> 
	<!-- END: othernews -->
	</div>
  </div>
</div>


<!-- END: main -->