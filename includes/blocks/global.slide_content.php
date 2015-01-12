<?php
/**
 * @Project NUKEVIET
 * @Author THAOTRINH (nukeviet@bendoi.vn)
 * @Createdate 2014.04.28-II 8:44:50 VN
 */

if( ! defined( 'NV_MAINFILE' ) ) die( 'Stop!!!' );
if( ! nv_function_exists( 'slide_content' ) )
{
	function nv_block_config_slide_content( $module, $data_block, $lang_block )
	{
		$html = "";
		$html .= "<tr><td colspan='2' style='text-align:center;font-weight:bold;background: #B6C8FF; text-shadow: 1px 2px 3px #FFF;' title='" . $lang_block['note'] . "'> " . $lang_block['name'] . " </td></tr>";

		for( $i = 1; $i <10 ; ++ $i )
		{
			$html .= "<tr><td>" . $lang_block['title'] . " " . $i . "</td><td> <input type=\"text\" name=\"config_title" . $i . "\" value=\"" . $data_block['title' . $i] . "\" style=\"width:100%\"/>  </td></tr>";
			$html .= "<tr><td>" . $lang_block['content'] . " " . $i . "</td><td> <input type=\"text\" name=\"config_content" . $i . "\" value=\"" . $data_block['content' . $i] . "\" style=\"width:100%\"/>  </td></tr>";
			$html .= "<tr><td>" . $lang_block['link'] . " " . $i . "</td><td> <input type=\"text\" name=\"config_link" . $i . "\" value=\"" . $data_block['link' . $i] . "\" style=\"width:100%\"/>  </td></tr>";
			$html .= "<tr><td>" . $lang_block['url'] . " " . $i . "</td><td> <input type=\"text\" name=\"config_url" . $i . "\" value=\"" . $data_block['url' . $i] . "\" style=\"width:100%\"/>  </td></tr>";
			$html .= "<tr><td>" . $lang_block['img'] . " " . $i . "</td><td> <input type=\"text\" name=\"config_img" . $i . "\" value=\"" . $data_block['img' . $i] . "\" style=\"width:100%\"/>  </td></tr>";
		}
		
		$html .= "<tr><td> Color</td><td> 
			<input type=\"text\" name=\"config_colortitle\" value=\"" . $data_block['colortitle'] . "\" style=\"width:20%\" title=\"" . $lang_block['colortitle'] . "\"/> 
			<input type=\"text\" name=\"config_colorcontent\" value=\"" . $data_block['colorcontent'] . "\" style=\"width:20%\" title=\"" . $lang_block['colorcontent'] . "\"/> 
			<input type=\"text\" name=\"config_colora\" value=\"" . $data_block['colora'] . "\" style=\"width:20%\" title=\"" . $lang_block['colora'] . "\"/> 
			<input type=\"text\" name=\"config_border\" value=\"" . $data_block['border'] . "\" style=\"width:20%\" title=\"" . $lang_block['border'] . "\"/> 
		</td></tr>";
		
		$html .= "<tr><td> Background </td><td> 
			<input type=\"text\" name=\"config_bgcolor\" value=\"" . $data_block['bgcolor'] . "\" style=\"width:20%\" title=\"" . $lang_block['bgcolor'] . "\"/> 
			<input type=\"text\" name=\"config_bgimg\" value=\"" . $data_block['bgimg'] . "\" style=\"width:62%\" title=\"" . $lang_block['bgimg'] . "\"/> 
			 
		</td></tr>";
		
		return $html;
	}

	function nv_block_config_slide_content_submit( $module, $lang_block )
	{
		global $nv_Request;
		$return = array();
		$return['error'] = array();
		$return['config'] = array();
		
		for( $i = 1; $i < 10; ++ $i )
		{
			$return['config']['title' . $i] = $nv_Request->get_string( 'config_title' . $i, 'post', 0 );
			$return['config']['content' . $i] = $nv_Request->get_string( 'config_content' . $i, 'post', 0 );
			$return['config']['link' . $i] = $nv_Request->get_string( 'config_link' . $i, 'post', 0 );
			$return['config']['url' . $i] = $nv_Request->get_string( 'config_url' . $i, 'post', 0 );
			$return['config']['img' . $i] = $nv_Request->get_string( 'config_img' . $i, 'post', 0 );
		}
		$return['config']['colortitle'] = $nv_Request->get_string( 'config_colortitle', 'post', 0 );
		$return['config']['colorcontent'] = $nv_Request->get_string( 'config_colorcontent', 'post', 0 );
		$return['config']['colora'] = $nv_Request->get_string( 'config_colora', 'post', 0 );
		$return['config']['bgcolor'] = $nv_Request->get_string( 'config_bgcolor', 'post', 0 );
		$return['config']['bgimg'] = $nv_Request->get_string( 'config_bgimg', 'post', 0 );
		$return['config']['border'] = $nv_Request->get_string( 'config_border', 'post', 0 );
		
		return $return;
	}

	function slide_content( $block_config )
	{
		global $module_info, $global_config;

		if( file_exists( NV_ROOTDIR . "/themes/" . $global_config['site_theme'] . "/blocks/global.slide_content.tpl" ) )
		{
			$block_theme = $global_config['site_theme'];
		}
		elseif( file_exists( NV_ROOTDIR . "/themes/" . $module_info['template'] . "/blocks/global.slide_content.tpl" ) )
		{
			$block_theme = $module_info['template'];
		}
		else
		{
			$block_theme = "default";
		}
		
		$xtpl = new XTemplate( 'global.slide_content.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks' );
		$xtpl->assign( 'TEMPLATE', $block_theme );
		$xtpl->assign( 'NV_BASE_SITEURL', NV_BASE_SITEURL );
		
		for( $i = 1; $i < 10; $i ++ )
		{
			if( ! empty( $block_config['link' . $i] ) )
			{
				$xtpl->assign( 'TITLE', $block_config['title' . $i] );
				$xtpl->assign( 'CONTENT', $block_config['content' . $i] );
				$xtpl->assign( 'LINK', $block_config['link' . $i] );
				$xtpl->assign( 'URL', $block_config['url' . $i] );
				$xtpl->assign( 'IMG', $block_config['img' . $i] );
				$xtpl->parse( 'main.loop' );
			}
		}
		/*
		if($block_config['']=="") {}
		$xtpl->assign( '', $block_config[''] );
		*/

		$xtpl->assign( 'COLORTITLE', $block_config['colortitle'] );
		$xtpl->assign( 'COLORCONTENT', $block_config['colorcontent'] );
		$xtpl->assign( 'COLORA', $block_config['colora'] );
		$xtpl->assign( 'BGCOLOR', $block_config['bgcolor'] );
		$xtpl->assign( 'BGIMG', $block_config['bgimg'] );
		$xtpl->assign( 'BORDER', $block_config['border'] );

		
		/**/
		$xtpl->parse( 'main' );
		return $xtpl->text( 'main' );
	}

}

if( defined( 'NV_SYSTEM' ) )
{
	$content = slide_content( $block_config );
}

?>