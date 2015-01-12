<!-- BEGIN: main -->
<style type="text/css">
.style5 ul li{ 
	float:left;
	width:90px;
	margin-left:5px;
}
.style5 ul li a{
	font-size:10px;
	color:#000;
}
.style5 ul li a:hover{text-decoration:underline}
.style5 ul li a img{
	border:1px solid #F7F7F7;
	width:80px;
	height:70px;
	text-align:center;
	border:1px #5ef661 solid;
}

</style>
<div class="style5">
  <ul>
      <!-- BEGIN: loop -->
      <li class="clearfix">
      	<!-- BEGIN: img -->
        <a class="ima" href="{ROW.link}" title="{ROW.title}"><img src="{ROW.thumb}" alt=""/></a>
        <!-- END: img -->
		<br class="clear"/>
      	<a href="{ROW.link}" title="{ROW.title}">{ROW.title1}</a>
       </li>
	   <div class="{clear}"></div>
      <!-- END: loop -->
  </ul>
</div>
<!-- END: main -->