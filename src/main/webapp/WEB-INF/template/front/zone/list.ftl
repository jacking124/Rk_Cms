<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>游戏服列表</title>
<!-- <link rel="stylesheet" type="text/css" href="${base}/resources/front/css/selectarea.css"  charset="UTF-8"/>-->
<link rel="stylesheet" type="text/css" href="${base}/resources/front/css/style.css"/>
<style>
#theServiceList{padding:18px;width:700px;border:#660099 1px solid;height:425px; overflow:hidden;overflow-y:auto; position:relative;}
.wy_serverT .wy_lastLogin { color:#70502c}
.serSortstag { color:#70502c; font-size:12px; line-height:22px; width:100%; text-align:left; font-weight:bold}
.txidnt { text-indent:11px; margin-bottom:4px}
.servrlishad {}
.wy_banner {display:none}
.wy_lastLogin{display:none}
.wlop_area{display:none}
.wlop_area_tab{display:none}
.display_checkbox {margin:0px 0px 0px 0px}
</style>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js" charset="UTF-8"></script>
<script type="text/javascript">
function loginZone(zoneid)
{
	var loginPath = "${base}/app/redirect.rk";
	location.href = loginPath + "?id=" + zoneid;
}
</script>
<body>
<div class="w717">
    <div class="wy_name s_sp"><b class="fl mt6 wy_favicon"></b><h3 class="fl stroke">facebook ID:${accountID}</h3></div>
    <div class="wy_box s_bd">
        <!--推荐\最近服务器列表-->
        <div id="zjdl">
            <div class="wy_serverT"><div><h4>推荐服务器</h4></div></div>
            <div class="wy_recommend">
                <div class="wy_recommend_btn">
                   <a href="javascript:void(0);" onclick="javascript:loginZone('${top.id}');return false;"><em>${top.name}</em><span>进入游戏</span></a>
            	</div>                
            <div class="wy_serStatus">
                <p>我们根据您使用的网络环境为您推荐左侧服务器</p>
                <i class="wy_ico_b wy_ico"></i><b>繁忙</b><i class="wy_ico_c wy_ico"></i><b>拥挤</b><i class="wy_ico_o wy_ico"></i><b>畅通</b><i class="wy_ico_m wy_ico"></i><b>维护</b>
            </div>
            </div>
            <div class="tabCnt zjtj_server">
                <ul class="wy_serList zltj_server c">
                	<li><a href="javascript:void(0);" onclick="javascript:loginZone('${top.id}');return false;"><em class="fl">${top.name}</em><b class="wy_ico_o wy_ico"></b><b class="wy_ico_new wy_ico"></b><b class="wy_ico_j wy_ico"></b></a></li>
            	</ul>
            </div>
            <div class="tabbox_x c">
                <div class="wy_serverT"><div><h4>最近登录服务器</h4></div></div>
                <div class="tabMenu">
                    <ul class="c">
                        <li id="dlnav0" onClick="settab('dlnav',0,2)" class="hover"><b>上次登录</b></li>
                        <li id="dlnav1" onClick="settab('dlnav',1,2)"><b>我的服务器</b></li>
                    </ul>
                </div>
                <div class="tabCnt">
                    <div id="con_dlnav_0">
                        <ul class="wy_serList zjdl_list c">
            				<li><a href="javascript:void(0);" onclick="javascript:loginZone('${obj.id}');return false;"><em class="fl">${obj.name}</em><b class="wy_ico_o wy_ico"></b></a><span class="time"></span></li>
        				</ul>
                    </div>
                    <div id="con_dlnav_1" style="display:none">
                        <ul class="wy_serList zjdl_list c">
	                       	<#list zones as zone>
	                        <li><a href="javascript:void(0);" onclick="javascript:loginZone('${zone.id}');return false;"><em class="fl">${zone.name }</em><b class="wy_ico_o wy_ico"></b></a><span class="time"></span></li>
	                        </#list>
        				</ul>
                        <div style="padding:10px;float:right;">本栏目最多显示5个我最近登录过的服务器</div>
                    </div>
                </div>
            </div>
        </div>
        <div id="sevlist">
            <div class="wy_serverT"><div><h4 id="font1">所有服务器</h4></div></div>
				<div class="tabbox_x c">
		    			<div class="tabCnt"><div id="con_daqu_0" >
			             <ul class="wy_serList c">
			             <#list zones as zone>
			             	<li>
			                    <a href="javascript:void(0);" onclick="javascript:loginZone(${zone.id});return false;">
			                        <em class="fl">${zone.name}</em>
			                        <#if zone.open><b class="wy_ico_o wy_ico"></b></#if>
			                        <#if zone.fresh><b class="wy_ico_m wy_ico"></b></#if>
			                        <#if zone.status=0><b class="wy_ico_new wy_ico"></b><#elseif zone.status=1><b class="wy_ico_j wy_ico"></b></#if>
								</a>
			                </li>
			            </#list>
			            </ul>
			        </div>
			    </div>
			</div>
		</div>
    </div>
</div>
<script type="text/javascript">
function serlist()
{
	document.getElementById("sevlist").style.display="block";
	document.getElementById("zjdl").style.display="none";
}
function zjdllist()
{
	document.getElementById("zjdl").style.display="block";
	document.getElementById("sevlist").style.display="none";
}
function settab(name,cursel,n){
	for(i=0;i<n;i++){
		var menu=document.getElementById(name+i);
		var con=document.getElementById("con_"+name+"_"+i);
		menu.className=i==cursel?"hover":"";
		con.style.display=i==cursel?"block":"none"; 
	}
}
function changeTab(id) {
       var i=0;
       var total = 0;
       total = 3;
       for( i=0; i<=total; i++ ){
          var daqu = "daqu_"+i;
          var area_server = "area_"+i;
          $("#"+daqu).attr("class","");
          $("#"+area_server).css('display','none');
       }
       select_daqu = "daqu_"+id;
       select_area_server = "area_"+id;
       $("#"+select_daqu).attr("class","hover");
       $("#"+select_area_server).css('display','block');
}
</body>
</html>