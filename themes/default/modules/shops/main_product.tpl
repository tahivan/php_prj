<!-- BEGIN: main -->
<div id="productsgroup" class="clearfix">
	<!-- BEGIN: items -->
	<div class="items" style="width:{pwidth}%">
		<div class="items_content">
			
            <span style="padding-left:10px"><a href="{LINK}" title="{TITLE}"><strong>{TITLE0}</strong></a></span> <br />
				<a href="{LINK}">
					<img src="{IMG_SRC}" alt="{TITLE}" style="height:{height}px;width:{width}px;"/>
					
				</a><br />
				<div class="content_top">
			<!-- BEGIN: price -->
			<p class="content_price">
				{LANG.detail_pro_price} : <span class="{class_money}">{product_price} {money_unit}</span>
				<!-- BEGIN: discounts -->
				<br />{LANG.detail_pro_price} : <span class="money">{product_discounts} {money_unit}</span>
				<!-- END: discounts -->
			</p>
			<!-- END: price -->
			<!-- BEGIN: contact -->
			<p class="content_price">
				{LANG.detail_pro_price} : <span class="money">{LANG.price_contact}</span>
			</p>
			<!-- END: contact -->
            	<!-- BEGIN: product_code -->
			{LANG.detail_pro_phuongtien} : 	<span class="money">{PRODUCT_CODE}</span><br />
				<!-- END: product_code -->
			{LANG.detail_address} : <span class="money">{address}</span><br />
            {LANG.detail_pro_hotel} : <span class="money">{warranty}</span><br />
            {LANG.detail_time} : <span class="money">{promotional}</span><br />
            <!-- BEGIN: adminlink -->
				<div class="shops-center">{ADMINLINK}</div>
				<!-- END: adminlink -->
		</div></div>
	</div>
	<!-- BEGIN: break -->
		<div style="clear:both"></div>
	<!-- END: break -->
	<!-- END: items -->
</div>
<!-- BEGIN: pages -->
<div class="pages">{generate_page}</div>
<!-- END: pages -->
<div class="msgshow" id="msgshow"></div>
<!-- BEGIN: tooltip_js -->
<script type="text/javascript">tooltip_shop();</script>
<!-- END: tooltip_js -->
<!-- END: main -->