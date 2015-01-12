<!-- BEGIN: main -->
<style type="text/css">
.style2 ul li{ 
	padding:5px 0px 0px 5px;
	border-bottom:1px #B5B5B5 solid;
}
.style2 ul li a{
	font-size:10px;
	color:#000;
}
.style2 ul li a:hover{text-decoration:underline}
.style2 ul li img{
	padding:2px;
	border:1px solid #F7F7F7;
	width:60px;
	float:left;
	margin-right:4px;
}

</style>
<div class="style2">
  <ul>
      <!-- BEGIN: loop -->
      <li class="clearfix">
      	<!-- BEGIN: img -->
        <a href="{ROW.link}" title="{ROW.title}"><img src="{ROW.thumb}" alt=""/></a>
        <!-- END: img -->
      	<a href="{ROW.link}" title="{ROW.title}">{ROW.title}</a>
       </li>
      <!-- END: loop -->
  </ul>
</div>
<!-- END: main -->