<!-- BEGIN: main -->
<div id="detail">
	<div class="detail_boder clearfix">
		<span class="image-demo">
			<a href="{SRC_PRO_LAGE}" title="{TITLE}" rel="shadowbox">
				<img src="{SRC_PRO_LAGE}" alt="" width="380px" style="border:1px solid #eeeeee; padding:2px">
			</a>
			<br />
			<!-- BEGIN: adminlink -->
			<div class="fl">{ADMINLINK}</div>
			<!-- END: adminlink -->
		</span>
		<div class="info_product">
			<h2>{TITLE}</h2>
			<!-- BEGIN: product_code -->{LANG.product_code}: <strong>{PRODUCT_CODE}</strong><br /><!-- END: product_code -->
			
			<!-- BEGIN: price -->
			
			<p>
				{LANG.detail_pro_price} : <span class="{class_money}">{product_price} {money_unit}</span>
				<!-- BEGIN: discounts -->
				<span class="money">{product_discounts} {money_unit}</span>
				<!-- END: discounts --> / {pro_unit}
			</p>
			<!-- END: price -->
			<!-- BEGIN: contact -->
			{LANG.detail_pro_price} : <span class="money">{LANG.price_contact}</span>
			<!-- END: contact -->
			<!-- BEGIN: hometext -->
			<p>
				{hometext}
			</p>	
			<!-- END: hometext -->
			<!-- BEGIN: source -->
			<div>{LANG.detail_source} : <a href="{link_source}">{source}</a></div>
			<!-- END: source -->
            
			<!-- BEGIN: address -->
			<div>{LANG.detail_product_address} : {address}</div>
			<!-- END: address -->
            <!-- BEGIN: warranty -->
			<div>{LANG.detail_warranty} : {warranty}</div>
			<!-- END: warranty -->
            <!-- BEGIN: note -->
			<div>{LANG.cart_note} : {note}</div>
			<!-- END: note -->
			<!-- BEGIN: allowed_rating -->
			<p style="padding:6px 0; border-bottom:1px dotted #000000; color:#006699">
				<span>{LANG.detail_rank} : <span class="math_rate">{RATE}</span> {LANG.detail_rate_math}</span>
				<span class="div_rate">
					<a href="#" class="rate">1</a>
					<a href="#" class="rate">2</a>
					<a href="#" class="rate">3</a>
					<a href="#" class="rate">4</a>
					<a href="#" class="rate">5</a>
				</span>
			<p>
			<!-- END: allowed_rating -->
			<div class="clearfix fl" style="width:170px; padding:6px 0px">
				<strong class="fl">{LANG.detail_share} : </strong>
				<span class="share clearfix">
					<!-- BEGIN: allowed_print -->
					<a rel="nofollow" href="{LINK_PRINT}" title="print" id="click_print">
						<img border="0" alt="print" src="{THEME_URL}/images/shops/print.png">
					</a><!-- END: allowed_print -->
					<a onclick="share_facebook();" href="javascript:;" title="Share on Facebook">
						<img border="0" alt="Share on Facebook" src="{THEME_URL}/images/shops/flickr.png">
					</a>
					<a onclick="share_twitter();" href="javascript:;" title="Share on Twitter">
						<img border="0" alt="Share on Twitter" src="{THEME_URL}/images/shops/twitter.png">
					</a>
					<a onclick="share_google();" href="javascript:;" title="Share on Google">
						<img border="0" alt="Share on Google" src="{THEME_URL}/images/shops/google.png">
					</a>
					<a onclick="share_buzz();" href="javascript:;" title="Share on Buzz">
						<img border="0" alt="Share on Buzz" src="{THEME_URL}/images/shops/buzz.png">
					</a>
				</span>
			</div>
			<!-- BEGIN: order -->
			<div class="clearfix fr" style="width:170px; padding:6px 0px">
				<span class="fl" style="line-height:22px;">{LANG.title_order} : &nbsp;</span> 
				<input type="text" name="num" value="1" style="width:30px; height:15px" id="pnum" class="fl">
				<a href="javascript:void(0)" id="{proid}" title="{title_pro}" class="pro_order fl" onclick="cartorder_detail(this)">
					{LANG.add_product}
				</a>
			</div>
			<!-- END: order -->
			<div style="clear:both"></div>
		</div>
	</div>
		<div style="clear:both"></div>

		<div style="detail_com">
			<!-- BEGIN: shop -->
			{LANG.company_product} : <a href="{link_shop}" title="{title_shop}">{title_shop}</a> 
			<!-- END: shop -->
		</div>
		<div class="TabView" id="TabView">
			<div class="Tabs">
				<a href="#">{LANG.product_detail}</a> 
				<a href="#">Hướng dẫn</a>
				<a href="#">{LANG.add_otherimage}</a>
				<!-- BEGIN: comment_tab --><a href="#">{LANG.detail_comments}</a><!-- END: comment_tab -->
			</div>
			<div class="Pages">
				<div class="Page">
					{DETAIL}
				</div>
				<div class="Page">
					<iframe name="framename" width="100%" height="100%" src="pages/huongdan.html"></iframe>

				</div>
				<div class="Page" align="center">
					<div class="clearfix">
						<!-- BEGIN: othersimg -->
						<div style="width:33%; float:left; text-align:center">
							<a href="{IMG_SRC_OTHER}" rel="shadowbox[miss]"><img src="{IMG_SRC_OTHER}" style="max-width:100%" height="140px"/></a>
						</div>
						<!-- END: othersimg -->
						<!-- BEGIN: no_otherimage -->{LANG.detail_no_otherimage}<!-- END: no_otherimage -->
					</div>
				</div>
				<!-- BEGIN: comment -->
				<div class="Page">
					<div class="prd_rate">
						<!-- BEGIN: form -->
						<form class="comment" action="" onsubmit="return false;">
							<input type="hidden" value="{proid}" name="proid" id="proid" />
							<fieldset>
								<span id="charlimitinfo">{LANG.comment_limit_characters}</span>
								<textarea id="commentcontent" rows="5" name="commentcontent" style="width:90%"></textarea>
								<div class="fl clearfix">
									<label for="captcha">
										{LANG.comment_capcha}
									</label>
									<img height="20" name="vimg" src="{NV_BASE_SITEURL}?scaptcha=captcha" title="{LANG.captcha}" alt="{LANG.captcha}" id="vimg" />
									<input type="text" maxlength="{NV_GFX_NUM}" value="" id="commentseccode_iavim" name="fcode" style="width:60px"/>
									<input type="button" value="Reset" class="button" onclick="nv_change_captcha('vimg','commentseccode_iavim');" style="margin-right:5px" />
								</div>
								<div>
									<input onclick="sendcommment('{proid}','{COMMENT_CHECKSESS}','{NV_GFX_NUM}')" type="button" value="{LANG.comment_send}" id="buttoncontent" class="button"/>
								</div>
							</fieldset>
						</form>
						<!-- END: form -->
						<!-- BEGIN: form_login -->
						<p>{COMMENT_LOGIN}</p>
						<!-- END: form_login -->
						<div id="showcomment">{COMMENTCONTENT}</div>
					</div>
				</div>
				<!-- END: comment -->
			</div>
		</div>
	
	<!-- BEGIN: other -->
	<h1 class="divbg">{LANG.detail_others}</h1>
	{OTHER}
	<!-- END: other -->
	<!-- BEGIN: other_view -->
	<h1 class="divbg">{LANG.detail_others_view}</h1>
	{OTHER_VIEW}
	<!-- END: other_view -->
</div>
<div class="msgshow" id="msgshow"></div>
<script language="javascript" type="text/javascript">
	tabview_initialize('TabView');
</script>
<script type="text/javascript">
	$(function(){
		<!-- BEGIN: allowed_print_js -->
		$('#click_print').click(function(event){
			var href = $(this).attr("href");
			event.preventDefault();
			NewWindow(href, '', '640', '500', 'yes');
			return false;
		});
		<!-- END: allowed_print_js -->
		<!-- BEGIN: allowed_rating_js -->
		$("a.rate").click(function(event){
			event.preventDefault();
			var val = $(this).html();
			$.ajax({
				type: "POST",
				url: '{LINK_RATE}'+'&nocache=' + new Date().getTime(),
				data: 'val=' + val,
				success: function(data){
					var s = data.split('_');
					alert(s[1]);
				}
			});
			return false;
		});
		<!-- END: allowed_rating_js -->
	});
</script>
<!-- END: main -->