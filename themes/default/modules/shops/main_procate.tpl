<!-- BEGIN: main -->
<div id="products">
	<!-- BEGIN: catalogs -->
    <div class="title_cate clearfix">
			<div class="fl"><a href="{LINK_CATALOG}" title="{TITLE_CATALOG}">{TITLE_CATALOG}</a></div>
		</div>
	<div class="grid clearfix" style="margin-bottom:5px; border: #fea40f 2px solid;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    border-radius: 10px;">
		
		<div class="clearfix">
			<!-- BEGIN: items -->
			<div class="items" style="width:{pwidth}%">
				<div class="items_content clearfix">
					
                    <span style="padding-left: 10px"><a href="{LINK}" title="{TITLE}"><strong>{TITLE0}</strong></a></span><br />
						<a href="{LINK}">
							<img src="{IMG_SRC}" title="{TITLE}" alt="{TITLE}" style="height:{height}px;width:{width}px;"/>
						</a><br />
						<div class="content_top">
					<!-- BEGIN: price -->
					<p class="content_price">
						{LANG.detail_pro_price} : <span class="money">{product_price} {money_unit}</span>
						<!-- BEGIN: discounts -->
						{LANG.detail_pro_price} : <span class="money">{product_discounts} {money_unit}</span>
						<!-- END: discounts -->
					</p>
					<!-- END: price -->
					<!-- BEGIN: contact -->
					<p class="content_price">
						{LANG.detail_pro_price} : <span class="money">{LANG.price_contact}</span>
					</p>
					<!-- END: contact -->
                    <!-- BEGIN: product_code -->
						{LANG.detail_pro_phuongtien} : <span class="money">{PRODUCT_CODE}</span><br />
					<!-- END: product_code -->
                    {LANG.detail_address} : <span class="money">{address}</span><br />
                    {LANG.detail_pro_hotel} : <span class="money">{warranty}</span><br />
                    {LANG.detail_time} : <span class="money">{promotional}</span><br />
                    <!-- BEGIN: adminlink -->
				<div class="shops-center">{ADMINLINK}</div>
				<!-- END: adminlink -->
				</div>
				</div>
			</div>
			<!-- BEGIN: break -->
			<div style="clear:both"></div>
			<!-- END: break -->
			<!-- END: items -->
		</div>
	</div>
	<!-- END: catalogs -->
</div>
<div class="msgshow" id="msgshow"></div>
<!-- BEGIN: tooltip_js -->
<script type="text/javascript">tooltip_shop();</script>
<!-- END: tooltip_js -->
<!-- END: main -->