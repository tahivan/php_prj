<?php
/**
 * @Project NUKEVIET
 * @Author Thaotrinh member forum nukeviet (trinhthao@bendoi.vn)
 */

if ( ! defined( 'NV_MAINFILE' ) ) die( 'Stop!!!' );
if ( ! nv_function_exists( 'plugin_sticky_navbar' ) )
{

    function nv_block_config_plugin_sticky_navbar ( $module, $data_block, $lang_block )
    {
        $html = "";
		$html .= "<tr><td colspan='2' style='text-align:center;font-weight:bold;background: #B6C8FF; text-shadow: 1px 2px 3px #FFF;' title='" . $lang_block['note'] . "'> " . $lang_block['name'] . " </td></tr>";
		
        $html .= "<tr>";
        $html .= "	<td>" . $lang_block['block'] . "</td><td>";
        $html .= " <select name=\"config_idclass\"  style=\"width:20%\" > ";
				$se1= ($data_block['idclass']=='1')? 'selected="selected"': '';
				$se2= ($data_block['idclass']=='2')? 'selected="selected"': '';
		$html .= " 	<option value=\"1\"".$se1."> id </option> 
					<option value=\"2\"".$se2." > class </option> </select>";
				
        $html .= " <input type=\"text\" name=\"config_block\" value=\"" . $data_block['block'] . "\" style=\"width:70%;\"/>";
        $html .= "</td></tr>";
		
		$html .= "<tr>";
		$html .= "	<td>" . $lang_block['style'] . "</td><td>";

		$html .= " <select name=\"config_style\"  style=\"width:70%\" > ";
				$se1= ($data_block['style']=='1')? 'selected="selected"': '';
				$se2= ($data_block['style']=='2')? 'selected="selected"': '';
				
		$html .= " 	<option value=\"1\"".$se1." > " . $lang_block['style1'] . " </option> 
					<option value=\"2\"".$se2." > " . $lang_block['style2'] . " </option>  </select>";
		
		$html .= " <input type=\"text\" name=\"config_topbot\" value=\"" . $data_block['topbot'] . "\" title=\"" . $lang_block['topbot'] . "\"style=\"width:20%;\"/>";			
		$html .= "</td></tr>";
        return $html;
    }

    function nv_block_config_plugin_sticky_navbar_submit ( $module, $lang_block )
    {
        global $nv_Request;
        $return = array();
        $return['error'] = array();
        $return['config'] = array();
        $return['config']['idclass'] = $nv_Request->get_string( 'config_idclass', 'post', "" );
        $return['config']['block'] = $nv_Request->get_string( 'config_block', 'post', "" );
        $return['config']['style'] = $nv_Request->get_string( 'config_style', 'post', "" );
        $return['config']['topbot'] = $nv_Request->get_string( 'config_topbot', 'topbot', "" );
        return $return;
    }

    function plugin_sticky_navbar ( $block_config )
    {
		$x="";
		$css="";
		$block=$block_config['block'];
		$idclass=$block_config['idclass'];
		$style=$block_config['style'];
		$topbot=$block_config['topbot'];
		
		if($idclass == '1') {$idclass = "id"; $x = "#";}	else {$idclass  = "class"; $x = ".";}
		
		if($style =='1') {$style ="";$css="top:".$topbot.";width: 100%;z-index: 2000;";}
		else {$style ="";$css="bottom:".$topbot.";width: 100%;z-index: 2000;";}
		
		$content = "";
		$content .= "<style>" .$x. "" .$block. "{" .$css. "}</style>";

		$content .= "<script>$(window).load(function(){ $(\"" .$x. "" .$block. "\").sticky({" .$style. "}); }); </script>";

		$content .= "<script>
			(function($) {
			  var defaults = {
				  topSpacing: 0,
				  bottomSpacing: 0,
				  className: 'is-sticky',
				  wrapperClassName: 'sticky-wrapper',
				  center: false,
				  getWidthFrom: ''
				},
				\$window = $(window),
				\$document = $(document),
				sticked = [],
				windowHeight = \$window.height(),
				scroller = function() {
				  var scrollTop = \$window.scrollTop(),
					documentHeight = \$document.height(),
					dwh = documentHeight - windowHeight,
					extra = (scrollTop > dwh) ? dwh - scrollTop : 0;

				  for (var i = 0; i < sticked.length; i++) {
					var s = sticked[i],
					  elementTop = s.stickyWrapper.offset().top,
					  etse = elementTop - s.topSpacing - extra;

					if (scrollTop <= etse) {
					  if (s.currentTop !== null) {
						s.stickyElement
						  .css('position', '')
						  .css('top', '');
						s.stickyElement.parent().removeClass(s.className);
						s.currentTop = null;
					  }
					}
					else {
					  var newTop = documentHeight - s.stickyElement.outerHeight()
						- s.topSpacing - s.bottomSpacing - scrollTop - extra;
					  if (newTop < 0) {
						newTop = newTop + s.topSpacing;
					  } else {
						newTop = s.topSpacing;
					  }
					  if (s.currentTop != newTop) {
						s.stickyElement
						  .css('position', 'fixed')
						  /*.css('top', newTop)*/;

						if (typeof s.getWidthFrom !== 'undefined') {
						  s.stickyElement.css('width', $(s.getWidthFrom).width());
						}

						s.stickyElement.parent().addClass(s.className);
						s.currentTop = newTop;
					  }
					}
				  }
				},
				resizer = function() {windowHeight =  \$window.height(); 		},
				methods = {
				  init: function(options) {
					var o = $.extend(defaults, options);
					return this.each(function() {
					  var stickyElement = $(this);

					  var stickyId = stickyElement.attr('".$idclass."');
					  var wrapper = $('<div></div>')
						.attr('".$idclass."', stickyId + '-sticky-wrapper')
						.addClass(o.wrapperClassName);
					  stickyElement.wrapAll(wrapper);

					  if (o.center) {
						stickyElement.parent().css({width:stickyElement.outerWidth(),marginLeft:\"auto\",marginRight:\"auto\"});
					  }

					  if (stickyElement.css(\"float\") == \"right\") {
						stickyElement.css({\"float\":\"none\"}).parent().css({\"float\":\"right\"});
					  }

					  var stickyWrapper = stickyElement.parent();
					  stickyWrapper.css('height', stickyElement.outerHeight());
					  sticked.push({
						topSpacing: o.topSpacing,
						bottomSpacing: o.bottomSpacing,
						stickyElement: stickyElement,
						currentTop: null,
						stickyWrapper: stickyWrapper,
						className: o.className,
						getWidthFrom: o.getWidthFrom
					  });
					});
				  },
				  update: scroller,
				  unstick: function(options) {
					return this.each(function() {
					  var unstickyElement = $(this);

					  removeIdx = -1;
					  for (var i = 0; i < sticked.length; i++) 
					  {
						if (sticked[i].stickyElement.get(0) == unstickyElement.get(0))
						{
							removeIdx = i;
						}
					  }
					  if(removeIdx != -1)
					  {
						sticked.splice(removeIdx,1);
						unstickyElement.unwrap();
						unstickyElement.removeAttr('style');
					  }
					});
				  }
				};

			  // should be more efficient than using \$window.scroll(scroller) and \$window.resize(resizer):
			  if (window.addEventListener) {
				window.addEventListener('scroll', scroller, false);
				window.addEventListener('resize', resizer, false);
			  } else if (window.attachEvent) {
				window.attachEvent('onscroll', scroller);
				window.attachEvent('onresize', resizer);
			  }

			  $.fn.sticky = function(method) {
				if (methods[method]) {
				  return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
				} else if (typeof method === 'object' || !method ) {
				  return methods.init.apply( this, arguments );
				} else {
				  $.error('Method ' + method + ' does not exist on jQuery.sticky');
				}
			  };

			  $.fn.unstick = function(method) {
				if (methods[method]) {
				  return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
				} else if (typeof method === 'object' || !method ) {
				  return methods.unstick.apply( this, arguments );
				} else {
				  $.error('Method ' + method + ' does not exist on jQuery.sticky');
				}

			  };
			  $(function() {
				setTimeout(scroller, 0);
			  });
			})(jQuery);
			</script>";
		return $content;
    }
}

if ( defined( 'NV_SYSTEM' ) )
{
    $content = plugin_sticky_navbar( $block_config );
}
?>