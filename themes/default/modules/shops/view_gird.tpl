<!-- BEGIN: main -->
<div id="category">
	<h2 class="page_title">{CAT_NAME}</h2>
	<div id="productsgroup" class="clearfix">
	<!-- BEGIN: grid_rows -->
		<div class="items" style="width:{pwidth}%">
        <span style="padding-left: 10px"><a href="{LINK}" title="{title_pro}"><strong>{title_pro0}</strong></a></span> <br />
			<div class="items_content">
				<div class="content_top">
					<a title="{title_pro}" href="{link_pro}">
						<img src="{img_pro}" alt="{title_pro}" style="height:{height}px;width:{width}px;"/>	
					</a><br />
				</div>
				<!-- BEGIN: price -->
				<p class="content_price">
					{LANG.detail_pro_price} : <span class="{class_money}">{product_price} {money_unit}</span>
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
		<!-- BEGIN: end_row -->
			<div style="clear:both"></div>
		<!-- END: end_row -->
	<!-- END: grid_rows -->
	</div>
	<div class="pages">
		{pages}
	</div>
</div>
<div class="msgshow" id="msgshow"></div>
<!-- BEGIN: tooltip_js -->
<script type="text/javascript">tooltip_shop();</script>
<!-- END: tooltip_js -->
<!-- END: main -->