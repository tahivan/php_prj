<!-- BEGIN: main -->
<style>
div.border {
background: white;
}
.brt_new5 {
padding: 0 1px;
border: 0 solid gainsboro;
border-image: initial;
}
.brt_new5 .tnd {
padding: 10px 0;
}
.brt_new5 .tnd .show1 .image {
border: 1px solid #C4C4C4;
padding: 2px;
width: 270px;
height: 120px;
overflow: hidden;
margin-bottom: 5px;
border-image: initial;
}
.brt_new5 .tnd .show1 a {
	color: #123979;
}
.drop-shadow {
position: relative;
float: left;
padding: .3em;
background: white;
-webkit-box-shadow: 0 1px 4px rgba(0,0,0,0.3),0 0 0 rgba(0,0,0,0.1) inset;
-moz-box-shadow: 0 1px 4px rgba(0,0,0,0.3),0 0 0 rgba(0,0,0,0.1) inset;
box-shadow: 0 1px 4px rgba(0,0,0,0.3),0 0 0 rgba(0,0,0,0.1) inset;
}
.brt_new5 .tnd a {
font-weight: bold;
padding: 0 0 15px 5px;
display: block;
}
.brt_new5 .tnd .l_new1 {
padding: 0 0 0 5px;
}
.brt_new5 .tnd .l_new1 .dw140 {
float: left;
width: 130px;
}
.brt_new5 .tnd .l_new1 .dw140 .image {
float: left;
border: 1px solid #C4C4C4;
padding: 2px;
width: 60px;
height: 46px;
display: inline;
margin-right: 5px;
overflow: hidden;
border-image: initial;
}
</style>
<div class="border">
  <div class="brt_new5">
    <div class="tnd">
      <div class="show1">
        <div class="image drop-shadow"><a href="{main.link}"> <img src="{main.imgsource}" alt="{main.title}" height="120" width="280"> </a></div>
		<br class="clear">
        <a href="{main.link}">{main.title}</a> 
		</div>

      <div class="l_new1 clearfix">
	  <!-- BEGIN: othernews -->
        <div class="dw140">
		
          <div class="image drop-shadow"><a href="{othernews.link}"> <img src="{othernews.imgsource}" alt="{othernews.title}" height="46" width="60"> </a></div>
          <a href="{othernews.link}">{othernews.title}</a> </div>
      <!-- END: othernews -->  
      </div>
    </div>
  </div>
</div>

<!-- END: main -->