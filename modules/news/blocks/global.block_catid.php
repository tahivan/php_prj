<?php
/**
 * @Project NUKEVIET 3.0
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2010 VINADES., JSC. All rights reserved
 * @Createdate 3/9/2010 23:25
 */

if ( ! defined( 'NV_MAINFILE' ) ) die( 'Stop!!!' );

if ( ! nv_function_exists( 'nv_news_catid' ) )
{

    function nv_block_config_news_catid ( $module, $data_block, $lang_block )
    {
        global $db, $language_array, $site_mods;
        $html = "";
        $html .= "<tr>";
        $html .= "	<td>" . $lang_block['catid'] . "</td>";
        $html .= "	<td><select name=\"config_blockid\">\n";
        $sql = "SELECT * FROM `" . NV_PREFIXLANG . "_" . $site_mods[$module]['module_data'] . "_cat` ORDER BY `weight` ASC";
        $list = nv_db_cache( $sql, 'catid', $module );
        foreach ( $list as $l )
        {
            $sel = ( $data_block['catid'] == $l['catid'] ) ? ' selected' : '';
            $html .= "<option value=\"" . $l['catid'] . "\" " . $sel . ">" . $l['title'] . "</option>\n";
        }
        $html .= "	</select></td>\n";
        $html .= "</tr>";
        $html .= "<tr>";
        $html .= "	<td>" . $lang_block['numrow'] . "</td>";
        $html .= "	<td><input type=\"text\" name=\"config_numrow\" size=\"5\" value=\"" . $data_block['numrow'] . "\"/></td>";
        $html .= "</tr>";
		$html .= "<tr>";
		$html .= "	<td>" . $lang_block['type'] . "</td>";
        $html .= "	<td><select name=\"type\">\n";
		$sel = ($data_block['type'] == 1) ? ' selected' : '';
		$html .= "<option value=\"1\" " . $sel . ">1 Tin Chính 2 Tin con</option>\n";
        $sel = ($data_block['type'] == 2) ? ' selected' : '';
		$html .= "<option value=\"2\" " . $sel . ">1 Tin Chính các tin con bên dưới không hình</option>\n";
         $sel = ($data_block['type'] == 3) ? ' selected' : '';
		$html .= "<option value=\"3\" " . $sel . ">1 Tin Chính 2 tin con bên cạnh</option>\n";
         $sel = ($data_block['type'] == 4) ? ' selected' : '';
		$html .= "<option value=\"4\" " . $sel . ">3 tin ngang hình lớn</option>\n";
         $sel = ($data_block['type'] == 5) ? ' selected' : '';
		$html .= "<option value=\"5\" " . $sel . ">Tin dạng list có hình</option>\n";
         $sel = ($data_block['type'] == 6) ? ' selected' : '';
		$html .= "<option value=\"6\" " . $sel . ">Tin dạng slide 300px</option>\n";
        $html .= "	</select></td>\n";
        $html .= "</tr>";
        return $html;
    }

    function nv_block_config_news_catid_submit ( $module, $lang_block )
    {
        global $nv_Request;
        $return = array();
        $return['error'] = array();
        $return['config'] = array();
        $return['config']['catid'] = $nv_Request->get_int( 'config_blockid', 'post', 0 );
        $return['config']['numrow'] = $nv_Request->get_int( 'config_numrow', 'post', 0 );
		$return['config']['type'] = $nv_Request->get_int('type', 'post', 0);
        return $return;
    }

    function nv_news_catid ( $block_config )
    {
        global $module_array_cat, $module_info, $lang_module, $site_mods,$global_config;
        
		$html = "";
		if($block_config['type'] == 1){	
			$module = $block_config['module'];
			$sql = "SELECT id, listcatid, publtime, exptime, title, alias, hometext, homeimgthumb, homeimgfile FROM `" . NV_PREFIXLANG . "_" . $site_mods[$module]['module_data'] . "_" . $block_config['catid'] . "`  WHERE inhome='1' AND  publtime < " . NV_CURRENTTIME . " AND (exptime=0 OR exptime >" . NV_CURRENTTIME . ") ORDER BY publtime DESC LIMIT 0,3";
			
			$list = nv_db_cache( $sql, 'catid', $module );
			$i = 1;
			if ( ! empty( $list ) )
			{
				if ( file_exists( NV_ROOTDIR . "/themes/" . $module_info['template'] . "/modules/news/block_style1.tpl" ) )
				{
					$block_theme = $module_info['template'];
				}
				else
				{
					$block_theme = "default";
				}
				$xtpl = new XTemplate( "block_style1.tpl", NV_ROOTDIR . "/themes/" . $block_theme . "/modules/news" );
				$xtpl->assign( 'linksite', NV_BASE_SITEURL."themes/".$global_config['site_theme'] );
				foreach ( $list as $l )
				{
					
					$arr_catid = explode( ',', $l['listcatid'] );
					if(isset($arr_catid[1]))
					{
						$link = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module . "&amp;" . NV_OP_VARIABLE . "=" . $module_array_cat[$arr_catid[1]]['alias'] . "/" . $l['alias'] . "-" . $l['id'];
					}else
					{
						$link = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module . "&amp;" . NV_OP_VARIABLE . "=" . $module_array_cat[$arr_catid[0]]['alias'] . "/" . $l['alias'] . "-" . $l['id'];
					}
				   $l['link'] = $link;
					if ( $i == 1 )
					{
						$image = NV_UPLOADS_REAL_DIR . "/" . $module . "/" . $l['homeimgfile'];
						
						if ( $l['homeimgfile'] != "" and file_exists( $image ) )
						{
							$width = 183;
							$height = 150;
							
							$row['imgsource'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module . '/' . $l['homeimgfile'];
							$imginfo = nv_is_image( $image );
							$basename = basename( $image );
							if ( $imginfo['width'] > $width or $imginfo['height'] > $height )
							{
								$basename = preg_replace( '/(.*)(\.[a-zA-Z]+)$/', $module . '_' . $l['id'] . '_\1_' . $width . '-' . $height . '\2', $basename );
								if ( file_exists( NV_ROOTDIR . "/" . NV_TEMP_DIR . '/' . $basename ) )
								{
									$l['imgsource'] = NV_BASE_SITEURL . NV_TEMP_DIR . '/' . $basename;
								}
								else
								{
									require_once ( NV_ROOTDIR . "/includes/class/image.class.php" );
									$_image = new image( $image, NV_MAX_WIDTH, NV_MAX_HEIGHT );
									$_image->resizeXY( $width, $height );
									$_image->save( NV_ROOTDIR . '/' . NV_TEMP_DIR, $basename );
									if ( file_exists( NV_ROOTDIR . "/" . NV_TEMP_DIR . '/' . $basename ) )
									{
										$l['imgsource'] = NV_BASE_SITEURL . NV_TEMP_DIR . '/' . $basename;
									}
								}
							}
						}
						elseif ( nv_is_url( $l['homeimgfile'] ) )
						{
							$l['imgsource'] = $l['homeimgfile'];
						}
						else
						{
							$l['imgsource'] = NV_BASE_SITEURL . 'themes/' . $global_config['site_theme'] . '/images/no_image.gif';
						}
						$xtpl->assign( 'main', $l );
						++$i;
					}
					else
					{
						if ( ! empty( $l['homeimgthumb'] ) )
						{
							$array_img = explode( "|", $l['homeimgthumb'] );
						}
						else
						{
							$array_img = array( "", "" );
						}
						if ( $array_img[0] != "" and file_exists( NV_ROOTDIR . '/' . NV_FILES_DIR . '/' . $module . '/' . $array_img[0] ) )
						{
							$l['imgsource'] = NV_BASE_SITEURL . NV_FILES_DIR . '/' . $module . '/' . $array_img[0];
						}
						elseif ( $l['homeimgfile'] != "" and file_exists( NV_UPLOADS_REAL_DIR . '/' . $module . '/' . $l['homeimgfile'] ) )
						{
							$l['imgsource'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module . '/' . $l['homeimgfile'];
						}
						elseif ( nv_is_url( $l['homeimgfile'] ) )
						{
							$l['imgsource'] = $l['homeimgfile'];
						}
						else
						{
							$l['imgsource'] = NV_BASE_SITEURL . 'themes/' . $global_config['site_theme'] . '/images/no_image.gif';
						}
						$xtpl->assign( 'othernews', $l );
						$xtpl->parse( 'main.othernews' );
					}
					
				}
				$xtpl->assign( 'HTML_CONTENT', $html );
				
				$xtpl->parse( 'main' );
				return $xtpl->text( 'main' );
			}
		}
		elseif($block_config['type'] == 2){	
			$module = $block_config['module'];
			$sql = "SELECT id, listcatid, publtime, exptime, title, alias, hometext, homeimgthumb, homeimgfile FROM `" . NV_PREFIXLANG . "_" . $site_mods[$module]['module_data'] . "_" . $block_config['catid'] . "`  WHERE inhome='1' AND  publtime < " . NV_CURRENTTIME . " AND (exptime=0 OR exptime >" . NV_CURRENTTIME . ") ORDER BY publtime DESC LIMIT 0," . $block_config['numrow'];

			$list = nv_db_cache( $sql, 'catids', $module );
			$i = 1;
			if ( ! empty( $list ) )
			{
				if ( file_exists( NV_ROOTDIR . "/themes/" . $module_info['template'] . "/modules/news/block_style2.tpl" ) )
				{
					$block_theme = $module_info['template'];
				}
				else
				{
					$block_theme = "default";
				}
				$xtpl = new XTemplate( "block_style2.tpl", NV_ROOTDIR . "/themes/" . $block_theme . "/modules/news" );
				$xtpl->assign( 'linksite', NV_BASE_SITEURL."themes/".$global_config['site_theme'] );
				foreach ( $list as $l )
				{
					
					$arr_catid = explode( ',', $l['listcatid'] );
					if(isset($arr_catid[1]))
					{
						$link = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module . "&amp;" . NV_OP_VARIABLE . "=" . $module_array_cat[$arr_catid[1]]['alias'] . "/" . $l['alias'] . "-" . $l['id'];
					}else
					{
						$link = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module . "&amp;" . NV_OP_VARIABLE . "=" . $module_array_cat[$arr_catid[0]]['alias'] . "/" . $l['alias'] . "-" . $l['id'];
					}
				   $l['link'] = $link;
					if ( $i == 1 )
					{
						$l['hometext'] = nv_clean60( strip_tags( $l['hometext'] ), 160 );
						$image = NV_UPLOADS_REAL_DIR . "/" . $module . "/" . $l['homeimgfile'];
						
						if ( $l['homeimgfile'] != "" and file_exists( $image ) )
						{
							$width = 183;
							$height = 150;
							
							$row['imgsource'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module . '/' . $l['homeimgfile'];
							$imginfo = nv_is_image( $image );
							$basename = basename( $image );
							if ( $imginfo['width'] > $width or $imginfo['height'] > $height )
							{
								$basename = preg_replace( '/(.*)(\.[a-zA-Z]+)$/', $module . '_' . $l['id'] . '_\1_' . $width . '-' . $height . '\2', $basename );
								if ( file_exists( NV_ROOTDIR . "/" . NV_TEMP_DIR . '/' . $basename ) )
								{
									$l['imgsource'] = NV_BASE_SITEURL . NV_TEMP_DIR . '/' . $basename;
								}
								else
								{
									require_once ( NV_ROOTDIR . "/includes/class/image.class.php" );
									$_image = new image( $image, NV_MAX_WIDTH, NV_MAX_HEIGHT );
									$_image->resizeXY( $width, $height );
									$_image->save( NV_ROOTDIR . '/' . NV_TEMP_DIR, $basename );
									if ( file_exists( NV_ROOTDIR . "/" . NV_TEMP_DIR . '/' . $basename ) )
									{
										$l['imgsource'] = NV_BASE_SITEURL . NV_TEMP_DIR . '/' . $basename;
									}
								}
							}
						}
						elseif ( nv_is_url( $l['homeimgfile'] ) )
						{
							$l['imgsource'] = $l['homeimgfile'];
						}
						else
						{
							$l['imgsource'] = NV_BASE_SITEURL . 'themes/' . $global_config['site_theme'] . '/images/no_image.gif';
						}
						$xtpl->assign( 'main', $l );
						++$i;
					}
					else
					{
						
						$xtpl->assign( 'othernews', $l );
						$xtpl->parse( 'main.othernews' );
					}
					
				}
				$xtpl->assign( 'HTML_CONTENT', $html );
				$xtpl->assign( 'NV_BASE_SITEURL', NV_BASE_SITEURL );
				$xtpl->assign( 'template', $module_info['template'] );
				
				$xtpl->parse( 'main' );
				return $xtpl->text( 'main' );
			}
		}
		elseif($block_config['type'] == 3){	
			$module = $block_config['module'];
			$sql = "SELECT id, listcatid, publtime, exptime, title, alias, hometext, homeimgthumb, homeimgfile FROM `" . NV_PREFIXLANG . "_" . $site_mods[$module]['module_data'] . "_" . $block_config['catid'] . "`  WHERE inhome='1' AND  publtime < " . NV_CURRENTTIME . " AND (exptime=0 OR exptime >" . NV_CURRENTTIME . ") ORDER BY publtime ASC LIMIT 0,3";

			$list = nv_db_cache( $sql, 'catids', $module );
			$i = 1;
			if ( ! empty( $list ) )
			{
				if ( file_exists( NV_ROOTDIR . "/themes/" . $module_info['template'] . "/modules/news/block_style3.tpl" ) )
				{
					$block_theme = $module_info['template'];
				}
				else
				{
					$block_theme = "default";
				}
				$xtpl = new XTemplate( "block_style3.tpl", NV_ROOTDIR . "/themes/" . $block_theme . "/modules/news" );
				$xtpl->assign( 'linksite', NV_BASE_SITEURL."themes/".$global_config['site_theme'] );
				foreach ( $list as $l )
				{
					$l['hometext'] = nv_clean60( strip_tags( $l['hometext'] ), 160 );
					$arr_catid = explode( ',', $l['listcatid'] );
					if(isset($arr_catid[1]))
					{
						$link = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module . "&amp;" . NV_OP_VARIABLE . "=" . $module_array_cat[$arr_catid[1]]['alias'] . "/" . $l['alias'] . "-" . $l['id'];
					}else
					{
						$link = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module . "&amp;" . NV_OP_VARIABLE . "=" . $module_array_cat[$arr_catid[0]]['alias'] . "/" . $l['alias'] . "-" . $l['id'];
					}
				   $l['link'] = $link;
						if ( ! empty( $l['homeimgthumb'] ) )
						{
							$array_img = explode( "|", $l['homeimgthumb'] );
						}
						else
						{
							$array_img = array( "", "" );
						}
						if ( $array_img[0] != "" and file_exists( NV_ROOTDIR . '/' . NV_FILES_DIR . '/' . $module . '/' . $array_img[0] ) )
						{
							$l['imgsource'] = NV_BASE_SITEURL . NV_FILES_DIR . '/' . $module . '/' . $array_img[0];
						}
						elseif ( $l['homeimgfile'] != "" and file_exists( NV_UPLOADS_REAL_DIR . '/' . $module . '/' . $l['homeimgfile'] ) )
						{
							$l['imgsource'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module . '/' . $l['homeimgfile'];
						}
						elseif ( nv_is_url( $l['homeimgfile'] ) )
						{
							$l['imgsource'] = $l['homeimgfile'];
						}
						else
						{
							$l['imgsource'] = NV_BASE_SITEURL . 'themes/' . $global_config['site_theme'] . '/images/no_image.gif';
						}
					if ( $i == 1 )
					{
						$xtpl->assign( 'main', $l );
						++$i;
					}
					else
					{
						
						$xtpl->assign( 'othernews', $l );
						$xtpl->parse( 'main.othernews' );
					}
					
				}
				$xtpl->assign( 'HTML_CONTENT', $html );
				$xtpl->assign( 'NV_BASE_SITEURL', NV_BASE_SITEURL );
				$xtpl->assign( 'template', $module_info['template'] );
				
				$xtpl->parse( 'main' );
				return $xtpl->text( 'main' );
			}
		}
		elseif($block_config['type'] == 4){	
			$module = $block_config['module'];
			$sql = "SELECT id, listcatid, publtime, exptime, title, alias, hometext, homeimgthumb, homeimgfile FROM `" . NV_PREFIXLANG . "_" . $site_mods[$module]['module_data'] . "_" . $block_config['catid'] . "`  WHERE inhome='1' AND  publtime < " . NV_CURRENTTIME . " AND (exptime=0 OR exptime >" . NV_CURRENTTIME . ") ORDER BY publtime DESC LIMIT 0,3";

			$list = nv_db_cache( $sql, 'catids', $module );
			$i = 1;
			if ( ! empty( $list ) )
			{
				if ( file_exists( NV_ROOTDIR . "/themes/" . $module_info['template'] . "/modules/news/block_style4.tpl" ) )
				{
					$block_theme = $module_info['template'];
				}
				else
				{
					$block_theme = "default";
				}
				$xtpl = new XTemplate( "block_style4.tpl", NV_ROOTDIR . "/themes/" . $block_theme . "/modules/news" );
				$xtpl->assign( 'linksite', NV_BASE_SITEURL."themes/".$global_config['site_theme'] );
				foreach ( $list as $l )
				{
					$arr_catid = explode( ',', $l['listcatid'] );
					if(isset($arr_catid[1]))
					{
						$link = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module . "&amp;" . NV_OP_VARIABLE . "=" . $module_array_cat[$arr_catid[1]]['alias'] . "/" . $l['alias'] . "-" . $l['id'];
					}else
					{
						$link = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module . "&amp;" . NV_OP_VARIABLE . "=" . $module_array_cat[$arr_catid[0]]['alias'] . "/" . $l['alias'] . "-" . $l['id'];
					}
				   $l['link'] = $link;
						if ( ! empty( $l['homeimgthumb'] ) )
						{
							$array_img = explode( "|", $l['homeimgthumb'] );
						}
						else
						{
							$array_img = array( "", "" );
						}
						if ( $array_img[0] != "" and file_exists( NV_ROOTDIR . '/' . NV_FILES_DIR . '/' . $module . '/' . $array_img[0] ) )
						{
							$l['imgsource'] = NV_BASE_SITEURL . NV_FILES_DIR . '/' . $module . '/' . $array_img[0];
						}
						elseif ( $l['homeimgfile'] != "" and file_exists( NV_UPLOADS_REAL_DIR . '/' . $module . '/' . $l['homeimgfile'] ) )
						{
							$l['imgsource'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module . '/' . $l['homeimgfile'];
						}
						elseif ( nv_is_url( $l['homeimgfile'] ) )
						{
							$l['imgsource'] = $l['homeimgfile'];
						}
						else
						{
							$l['imgsource'] = NV_BASE_SITEURL . 'themes/' . $global_config['site_theme'] . '/images/no_image.gif';
						}
						$xtpl->assign( 'main', $l );
						$xtpl->assign( 'othernews', $l );
						$xtpl->parse( 'main.othernews' );
						++$i;
				}
				$xtpl->assign( 'HTML_CONTENT', $html );
				$xtpl->assign( 'NV_BASE_SITEURL', NV_BASE_SITEURL );
				$xtpl->assign( 'template', $module_info['template'] );
				
				$xtpl->parse( 'main' );
				return $xtpl->text( 'main' );
			}
		}
		elseif($block_config['type'] == 5){	
			$module = $block_config['module'];
			$sql = "SELECT id, listcatid, publtime, exptime, title, alias, hometext, homeimgthumb, homeimgfile FROM `" . NV_PREFIXLANG . "_" . $site_mods[$module]['module_data'] . "_" . $block_config['catid'] . "`  WHERE inhome='1' AND  publtime < " . NV_CURRENTTIME . " AND (exptime=0 OR exptime >" . NV_CURRENTTIME . ") ORDER BY publtime ASC LIMIT 0,5";

			$list = nv_db_cache( $sql, 'catids', $module );
			$i = 1;
			if ( ! empty( $list ) )
			{
				if ( file_exists( NV_ROOTDIR . "/themes/" . $module_info['template'] . "/modules/news/block_style5.tpl" ) )
				{
					$block_theme = $module_info['template'];
				}
				else
				{
					$block_theme = "default";
				}
				$xtpl = new XTemplate( "block_style5.tpl", NV_ROOTDIR . "/themes/" . $block_theme . "/modules/news" );
				$xtpl->assign( 'linksite', NV_BASE_SITEURL."themes/".$global_config['site_theme'] );
				foreach ( $list as $l )
				{
				
					$arr_catid = explode( ',', $l['listcatid'] );
					if(isset($arr_catid[1]))
					{
						$link = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module . "&amp;" . NV_OP_VARIABLE . "=" . $module_array_cat[$arr_catid[1]]['alias'] . "/" . $l['alias'] . "-" . $l['id'];
					}else
					{
						$link = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module . "&amp;" . NV_OP_VARIABLE . "=" . $module_array_cat[$arr_catid[0]]['alias'] . "/" . $l['alias'] . "-" . $l['id'];
					}
				   $l['link'] = $link;
						if ( ! empty( $l['homeimgthumb'] ) )
						{
							$array_img = explode( "|", $l['homeimgthumb'] );
						}
						else
						{
							$array_img = array( "", "" );
						}
						if ( $array_img[0] != "" and file_exists( NV_ROOTDIR . '/' . NV_FILES_DIR . '/' . $module . '/' . $array_img[0] ) )
						{
							$l['imgsource'] = NV_BASE_SITEURL . NV_FILES_DIR . '/' . $module . '/' . $array_img[0];
						}
						elseif ( $l['homeimgfile'] != "" and file_exists( NV_UPLOADS_REAL_DIR . '/' . $module . '/' . $l['homeimgfile'] ) )
						{
							$l['imgsource'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module . '/' . $l['homeimgfile'];
						}
						elseif ( nv_is_url( $l['homeimgfile'] ) )
						{
							$l['imgsource'] = $l['homeimgfile'];
						}
						else
						{
							$l['imgsource'] = NV_BASE_SITEURL . 'themes/' . $global_config['site_theme'] . '/images/no_image.gif';
						}
						$xtpl->assign( 'othernews', $l );
						$bg = ( $i % 2 == 0 ) ? "bg" : "";
						$xtpl->assign( 'bg', $bg );
						++$i;
						$xtpl->parse( 'main.othernews' );
					
				}
				$xtpl->assign( 'HTML_CONTENT', $html );
				$xtpl->assign( 'NV_BASE_SITEURL', NV_BASE_SITEURL );
				$xtpl->assign( 'template', $module_info['template'] );
				
				$xtpl->parse( 'main' );
				return $xtpl->text( 'main' );
			}
		}
		elseif($block_config['type'] == 6){	
			$module = $block_config['module'];
			$sql = "SELECT id, listcatid, publtime, exptime, title, alias, hometext, homeimgthumb, homeimgfile FROM `" . NV_PREFIXLANG . "_" . $site_mods[$module]['module_data'] . "_" . $block_config['catid'] . "`  WHERE inhome='1' AND  publtime < " . NV_CURRENTTIME . " AND (exptime=0 OR exptime >" . NV_CURRENTTIME . ") ORDER BY publtime ASC LIMIT 0,5";

			$list = nv_db_cache( $sql, 'catids', $module );
			$i = 1;
			if ( ! empty( $list ) )
			{
				if ( file_exists( NV_ROOTDIR . "/themes/" . $module_info['template'] . "/modules/news/block_style6.tpl" ) )
				{
					$block_theme = $module_info['template'];
				}
				else
				{
					$block_theme = "default";
				}
				$xtpl = new XTemplate( "block_style6.tpl", NV_ROOTDIR . "/themes/" . $block_theme . "/modules/news" );
				$xtpl->assign( 'linksite', NV_BASE_SITEURL."themes/".$global_config['site_theme'] );
				foreach ( $list as $l )
				{
				
					$arr_catid = explode( ',', $l['listcatid'] );
					if(isset($arr_catid[1]))
					{
						$link = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module . "&amp;" . NV_OP_VARIABLE . "=" . $module_array_cat[$arr_catid[1]]['alias'] . "/" . $l['alias'] . "-" . $l['id'];
					}else
					{
						$link = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module . "&amp;" . NV_OP_VARIABLE . "=" . $module_array_cat[$arr_catid[0]]['alias'] . "/" . $l['alias'] . "-" . $l['id'];
					}
				   $l['link'] = $link;
						if ( ! empty( $l['homeimgthumb'] ) )
						{
							$array_img = explode( "|", $l['homeimgthumb'] );
						}
						else
						{
							$array_img = array( "", "" );
						}
						if ( $array_img[0] != "" and file_exists( NV_ROOTDIR . '/' . NV_FILES_DIR . '/' . $module . '/' . $array_img[0] ) )
						{
							$l['imgsource'] = NV_BASE_SITEURL . NV_FILES_DIR . '/' . $module . '/' . $array_img[0];
						}
						elseif ( $l['homeimgfile'] != "" and file_exists( NV_UPLOADS_REAL_DIR . '/' . $module . '/' . $l['homeimgfile'] ) )
						{
							$l['imgsource'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module . '/' . $l['homeimgfile'];
						}
						elseif ( nv_is_url( $l['homeimgfile'] ) )
						{
							$l['imgsource'] = $l['homeimgfile'];
						}
						else
						{
							$l['imgsource'] = NV_BASE_SITEURL . 'themes/' . $global_config['site_theme'] . '/images/no_image.gif';
						}
						$xtpl->assign( 'othernews', $l );
						$bg = ( $i % 2 == 0 ) ? "bg" : "";
						$xtpl->assign( 'bg', $bg );
						++$i;
						$xtpl->parse( 'main.othernews' );
					
				}
				$xtpl->assign( 'HTML_CONTENT', $html );
				$xtpl->assign( 'NV_BASE_SITEURL', NV_BASE_SITEURL );
				$xtpl->assign( 'template', $module_info['template'] );
				
				$xtpl->parse( 'main' );
				return $xtpl->text( 'main' );
			}
		}
		
    }
}

if ( defined( 'NV_SYSTEM' ) )
{
    global $site_mods, $module_name, $global_array_cat, $module_array_cat;
    $module = $block_config['module'];
    if ( isset( $site_mods[$module] ) )
    {
        if ( $module == $module_name )
        {
            $module_array_cat = $global_array_cat;
            unset( $module_array_cat[0] );
        }
        else
        {
            $module_array_cat = array();
            $sql = "SELECT catid, parentid, title, alias, viewcat, subcatid, numlinks, description, inhome, keywords, who_view, groups_view FROM `" . NV_PREFIXLANG . "_" . $site_mods[$module]['module_data'] . "_cat` ORDER BY `order` ASC";
            $list = nv_db_cache( $sql, 'catid', $module );
            foreach ( $list as $l )
            {
                $module_array_cat[$l['catid']] = $l;
                $module_array_cat[$l['catid']]['link'] = NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module . "&amp;" . NV_OP_VARIABLE . "=" . $l['alias'];
            }
        }
        $content = nv_news_catid( $block_config );
    }
}

?>