<!-- BEGIN: main -->
<style>
.brt_new4 {
width: 280px;
padding: 0 1px;
border: 0 solid gainsboro;
border-image: initial;
}
.brt_new4 .tnd {
padding: 5px;
}
.brt_new4 .tnd .left3 {
float: left;
width: 160px;
padding-right: 5px;
}
.dw170 {
float: left;
width: 150px;
}
.dw170 .image {
width: 150px;
border: 1px solid #C4C4C4;
padding: 2px;
overflow: hidden;
text-align: center;
height: 120px;
margin-bottom: 5px;
}
.dw170 a {
color: #123979;
font-weight:bold;
}
.dw170 span {
width: 150px;
line-height: 150%;
}
.brt_new4 .tnd .right3 {
float: left;
width: 104px;
}
.dw98 {
width: 100px;
padding-bottom: 10px;
}
.dw98 .image {
width: 100px;
height: 67px;
overflow: hidden;
border: 1px solid #C4C4C4;
padding: 2px;
padding-bottom: 0;
margin-bottom: 5px;
font-size: 0%;
border-image: initial;
}
.dw98 a {
width: 80px;
font: normal 11px arial;
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
</style>
<div class="brt_new4">
  <div class="tnd clearfix">
    <div class="left3">
      <div class="dw170">
        <div class="image drop-shadow"> <a href="{main.link}"> <img src="{main.imgsource}" alt="" height="120" width="150"></a> </div>
        <a href="{main.link}">{main.title}</a><br>
        <span>{main.hometext}</span> 
		</div>
    </div>
    <div class="right3">
     
    <!-- BEGIN: othernews -->
	 <div class="dw98">
        <div class="image drop-shadow"> <img src="{othernews.imgsource}" alt="" height="65" width="100"> </div>
        <a href="{othernews.link}">{othernews.title}</a> </div>
	<!-- END: othernews -->  
    </div>
  </div>
</div>
<!-- END: main -->