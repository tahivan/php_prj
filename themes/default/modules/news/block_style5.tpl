<!-- BEGIN: main -->
<style type="text/css">
.other_blocknews {
}
.other_blocknews ul{
	margin:0;
}
.other_blocknews ul li{ 
	background:#FFFFFF;
	padding:5px;
}
.other_blocknews ul li a{
color: #123979;
}
.other_blocknews ul li a:hover{
text-decoration: underline;
}
.other_blocknews ul li img{
	padding:2px;
	border:1px solid #F7F7F7;
	width:60px;
	float:left;
	margin-right:4px;
}
.other_blocknews ul li.bg{
	background:#F3F3F3;
}
</style>
<div class="other_blocknews">
  <ul>
      <!-- BEGIN: othernews --> 
      <li class="clearfix {bg}">
        <a href="{othernews.link}" title="{othernews.title}"><img src="{othernews.imgsource}" alt=""/></a>
      	<a href="{othernews.link}" title="{othernews.title}">{othernews.title}</a>
       </li>
      <!-- END: othernews -->
  </ul>
</div>
<!-- END: main -->