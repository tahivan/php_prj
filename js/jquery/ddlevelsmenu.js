if("undefined"==typeof dd_domreadycheck)var dd_domreadycheck=!1;
var ddlevelsmenu={enableshim:!0,arrowpointers:{downarrow:[nv_siteroot+"themes/default/images/ddsmoothmenu/mtop_down.gif",11,7],rightarrow:[nv_siteroot+"themes/default/images/ddsmoothmenu/mtop_right.gif",8,7],showarrow:{toplevel:!0,sublevel:!0}},hideinterval:200,effects:{enableswipe:!0,enablefade:!0,duration:200},httpsiframesrc:"blank.htm",topmenuids:[],topitems:{},subuls:{},lastactivesubul:{},topitemsindex:-1,ulindex:-1,hidetimers:{},shimadded:!1,nonFF:!/Firefox[\/\s](\d+\.\d+)/.test(navigator.userAgent),
getoffset:function(a,b){return a.offsetParent?a[b]+this.getoffset(a.offsetParent,b):a[b]},getoffsetof:function(a){a._offsets={left:this.getoffset(a,"offsetLeft"),top:this.getoffset(a,"offsetTop")}},getwindowsize:function(){this.docwidth=window.innerWidth?window.innerWidth-10:this.standardbody.clientWidth-10;this.docheight=window.innerHeight?window.innerHeight-15:this.standardbody.clientHeight-18},gettopitemsdimensions:function(){for(var a=0;a<this.topmenuids.length;a++)for(var b=this.topmenuids[a],
c=0;c<this.topitems[b].length;c++){var e=this.topitems[b][c],d=document.getElementById(e.getAttribute("rel"));e._dimensions={w:e.offsetWidth,h:e.offsetHeight,submenuw:d.offsetWidth,submenuh:d.offsetHeight}}},isContained:function(a,b){for(var b=window.event||b,c=b.relatedTarget||("mouseover"==b.type?b.fromElement:b.toElement);c&&c!=a;)try{c=c.parentNode}catch(e){c=a}return c==a?!0:!1},addpointer:function(a,b,c,e){var d=document.createElement("img");d.src=c[0];d.style.width=c[1]+"px";d.style.height=
c[2]+"px";"rightarrowpointer"==b&&(d.style.left=a.offsetWidth-c[2]-2+"px");d.className=b;(b=a.childNodes[1!=a.firstChild.nodeType?1:0])&&"SPAN"==b.tagName&&(a=b);"before"==e?a.insertBefore(d,a.firstChild):a.appendChild(d)},css:function(a,b,c){var e=RegExp("(^|\\s+)"+b+"($|\\s+)","ig");if("check"==c)return e.test(a.className);"remove"==c?a.className=a.className.replace(e,""):"add"==c&&!e.test(a.className)&&(a.className+=" "+b)},addshimmy:function(a){var b=!window.opera?document.createElement("iframe"):
document.createElement("div");b.className="ddiframeshim";b.setAttribute("src","https:"==location.protocol?this.httpsiframesrc:"about:blank");b.setAttribute("frameborder","0");a.appendChild(b);try{b.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)"}catch(c){}return b},positionshim:function(a,b,c,e,d){a._istoplevel&&(d=window.pageYOffset?window.pageYOffset:this.standardbody.scrollTop,b=a._offsets.top-d,c=d+this.docheight-a._offsets.top-a._dimensions.h,0<b&&(this.shimmy.topshim.style.left=
e+"px",this.shimmy.topshim.style.top=d+"px",this.shimmy.topshim.style.width="99%",this.shimmy.topshim.style.height=b+"px"),0<c&&(this.shimmy.bottomshim.style.left=e+"px",this.shimmy.bottomshim.style.top=a._offsets.top+a._dimensions.h+"px",this.shimmy.bottomshim.style.width="99%",this.shimmy.bottomshim.style.height=c+"px"))},hideshim:function(){this.shimmy.topshim.style.width=this.shimmy.bottomshim.style.width=0;this.shimmy.topshim.style.height=this.shimmy.bottomshim.style.height=0},buildmenu:function(a,
b,c,e,d,f){b._master=a;b._pos=e;(b._istoplevel=d)&&this.addEvent(b,function(){ddlevelsmenu.hidemenu(ddlevelsmenu.subuls[this._master][parseInt(this._pos)])},"click");this.subuls[a][e]=c;b._dimensions={w:b.offsetWidth,h:b.offsetHeight,submenuw:c.offsetWidth,submenuh:c.offsetHeight};this.getoffsetof(b);c.style.left=0;c.style.top=0;c.style.visibility="hidden";this.addEvent(b,function(a){if(!ddlevelsmenu.isContained(this,a)){a=ddlevelsmenu.subuls[this._master][parseInt(this._pos)];this._istoplevel&&(ddlevelsmenu.css(this,
"selected","add"),clearTimeout(ddlevelsmenu.hidetimers[this._master][this._pos]));ddlevelsmenu.getoffsetof(b);var c=window.pageXOffset?window.pageXOffset:ddlevelsmenu.standardbody.scrollLeft,d=window.pageYOffset?window.pageYOffset:ddlevelsmenu.standardbody.scrollTop,e=this._offsets.top+this._dimensions.submenuh,g=this._istoplevel?this._offsets.left+("sidebar"==f?this._dimensions.w:0):this._dimensions.w;if(this._offsets.left+this._dimensions.submenuw+(this._istoplevel&&"topbar"==f?0:this._dimensions.w)-
c>ddlevelsmenu.docwidth)g+=-this._dimensions.submenuw+(this._istoplevel&&"topbar"==f?this._dimensions.w:-this._dimensions.w);a.style.left=g+"px";g=this._istoplevel?this._offsets.top+("sidebar"==f?0:this._dimensions.h):this.offsetTop;e-d>ddlevelsmenu.docheight&&(g=this._dimensions.submenuh<this._offsets.top+("sidebar"==f?this._dimensions.h:0)-d?g+(-this._dimensions.submenuh+(this._istoplevel&&"topbar"==f?-this._dimensions.h:this._dimensions.h)):g+(-(this._offsets.top-d)+(this._istoplevel&&"topbar"==
f?-this._dimensions.h:0)));a.style.top=g+"px";ddlevelsmenu.enableshim&&(!1==ddlevelsmenu.effects.enableswipe||ddlevelsmenu.nonFF)?ddlevelsmenu.positionshim(b,a,f,c,d):a.FFscrollInfo={x:c,y:d};ddlevelsmenu.showmenu(b,a,f)}},"mouseover");this.addEvent(b,function(a){var b=ddlevelsmenu.subuls[this._master][parseInt(this._pos)];this._istoplevel?!ddlevelsmenu.isContained(this,a)&&!ddlevelsmenu.isContained(b,a)&&ddlevelsmenu.hidemenu(b):!this._istoplevel&&!ddlevelsmenu.isContained(this,a)&&ddlevelsmenu.hidemenu(b)},
"mouseout")},setopacity:function(a,b){a.style.opacity=b;"string"!=typeof a.style.opacity&&(a.style.MozOpacity=b,a.filters&&(a.style.filter="progid:DXImageTransform.Microsoft.alpha(opacity="+100*b+")"))},showmenu:function(a,b,c){if(this.effects.enableswipe||this.effects.enablefade){if(this.effects.enableswipe){var e=a._istoplevel&&"topbar"==c?a._dimensions.submenuh:a._dimensions.submenuw;b.style.width=b.style.height=0;b.style.overflow="hidden"}this.effects.enablefade&&this.setopacity(b,0);b._curanimatedegree=
0;b.style.visibility="visible";clearInterval(b._animatetimer);b._starttime=(new Date).getTime();b._animatetimer=setInterval(function(){ddlevelsmenu.revealmenu(a,b,e,c)},10)}else b.style.visibility="visible"},revealmenu:function(a,b,c,e){var d=(new Date).getTime()-b._starttime;d<this.effects.duration?(this.effects.enableswipe&&(0==b._curanimatedegree&&(b.style[a._istoplevel&&"topbar"==e?"width":"height"]="auto"),b.style[a._istoplevel&&"topbar"==e?"height":"width"]=b._curanimatedegree*c+"px"),this.effects.enablefade&&
this.setopacity(b,b._curanimatedegree)):(clearInterval(b._animatetimer),this.effects.enableswipe&&(b.style.width="auto",b.style.height="auto",b.style.overflow="visible"),this.effects.enablefade&&(this.setopacity(b,1),b.style.filter=""),this.enableshim&&b.FFscrollInfo&&this.positionshim(a,b,e,b.FFscrollInfo.x,b.FFscrollInfo.y));b._curanimatedegree=(1-Math.cos(d/this.effects.duration*Math.PI))/2},hidemenu:function(a){"undefined"!=typeof a._pos&&(this.css(this.topitems[a._master][parseInt(a._pos)],"selected",
"remove"),this.enableshim&&this.hideshim());clearInterval(a._animatetimer);a.style.left=0;a.style.top="-1000px";a.style.visibility="hidden"},addEvent:function(a,b,c){a.addEventListener?a.addEventListener(c,b,!1):a.attachEvent&&a.attachEvent("on"+c,function(){return b.call(a,window.event)})},domready:function(a){dd_domreadycheck?a():(document.addEventListener?document.addEventListener("DOMContentLoaded",function(){document.removeEventListener("DOMContentLoaded",arguments.callee,!1);a();dd_domreadycheck=
!0},!1):document.attachEvent&&document.documentElement.doScroll&&window==window.top&&function(){if(dd_domreadycheck)a();else{try{document.documentElement.doScroll("left")}catch(b){setTimeout(arguments.callee,0);return}a();dd_domreadycheck=!0}}(),document.attachEvent&&0<parent.length&&this.addEvent(window,function(){a()},"load"))},init:function(a,b){this.standardbody="CSS1Compat"==document.compatMode?document.documentElement:document.body;this.ulindex=this.topitemsindex=-1;this.topmenuids.push(a);
this.topitems[a]=[];this.subuls[a]=[];this.hidetimers[a]=[];this.enableshim&&!this.shimadded&&(this.shimmy={},this.shimmy.topshim=this.addshimmy(document.body),this.shimmy.bottomshim=this.addshimmy(document.body),this.shimadded=!0);var c=document.getElementById(a).getElementsByTagName("a");this.getwindowsize();for(var e=0;e<c.length;e++)if(c[e].getAttribute("rel")){this.topitemsindex++;this.ulindex++;var d=c[e];this.topitems[a][this.topitemsindex]=d;var f=document.getElementById(d.getAttribute("rel"));
document.body.appendChild(f);f.style.zIndex=2E3;f._master=a;f._pos=this.topitemsindex;this.addEvent(f,function(){ddlevelsmenu.hidemenu(this)},"click");var h="sidebar"==b?"rightarrowpointer":"downarrowpointer",i="sidebar"==b?this.arrowpointers.rightarrow:this.arrowpointers.downarrow;this.arrowpointers.showarrow.toplevel&&this.addpointer(d,h,i,"sidebar"==b?"before":"after");this.buildmenu(a,d,f,this.ulindex,!0,b);f.onmouseover=function(){clearTimeout(ddlevelsmenu.hidetimers[this._master][this._pos])};
this.addEvent(f,function(a){if(!ddlevelsmenu.isContained(this,a)&&!ddlevelsmenu.isContained(ddlevelsmenu.topitems[this._master][parseInt(this._pos)],a)){var b=this;ddlevelsmenu.enableshim&&ddlevelsmenu.hideshim();ddlevelsmenu.hidetimers[this._master][this._pos]=setTimeout(function(){ddlevelsmenu.hidemenu(b)},ddlevelsmenu.hideinterval)}},"mouseout");d=f.getElementsByTagName("ul");for(f=0;f<d.length;f++)this.ulindex++,h=d[f].parentNode,this.arrowpointers.showarrow.sublevel&&this.addpointer(h.getElementsByTagName("a")[0],
"rightarrowpointer",this.arrowpointers.rightarrow,"before"),this.buildmenu(a,h,d[f],this.ulindex,!1,b)}this.addEvent(window,function(){ddlevelsmenu.getwindowsize();ddlevelsmenu.gettopitemsdimensions()},"resize")},setup:function(a,b){this.domready(function(){ddlevelsmenu.init(a,b)})}};
