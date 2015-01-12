<!-- BEGIN: main -->
<style type="text/css">
.block_cart {
	display:block;
	background:#e3e3e3;
	opacity:0.7;
	text-align:center;
	
}
.money {
	color:#CC3300;
	font-weight: bold;
}
</style>
<div class="block_cart">
	<!-- BEGIN: enable -->
       <a class="btn_03" title="{LANG.cart_check_out}" href="{LINK_VIEW}" id="submit_send"> <p>
            <strong>{LANG.cart_title} :</strong>
            <span class="money">( {num} )</span>
            
        </p>
        <!-- BEGIN: price -->
        <p>
            <strong>{LANG.cart_product_total} : </strong>
            <span class="money">{total}</span> {money_unit}
        </p>
		</a>
        <!-- END: price -->
       <!-- <p class="clearfix" style="padding-top:5px">
            <a class="btn_03" title="{LANG.cart_check_out}" href="{LINK_VIEW}" id="submit_send">{LANG.cart_check_out}</a>
        </p>
        <!--  BEGIN: history -->
        <p style=" border-top:1px solid #c0c0c0; margin-bottom:3px; margin-top:5px; padding-top:5px">
            <a href="{LINK_HIS}"><span>{LANG.history_title}</span></a>
        </p>
		-->
        <!--  END: history -->
    <!-- END: enable -->
    <!-- BEGIN: disable -->
    <p>
    	{LANG.active_order_dis}
    </p>
    <!-- END: disable -->
</div>
<!-- END: main -->