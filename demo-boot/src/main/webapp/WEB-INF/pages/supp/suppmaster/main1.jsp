<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-header" style="padding:10px 20px;margin:-18px 0px 0px">
  <div id="searchForm">
  	<div class="col-md-2" style="width: 200px">
		<input type="text" class="form-control search-query" name="unitName" placeholder="单位名称">
	</div>
  	<div class="col-md-2" style="width: 200px">
		<input type="text" class="form-control search-query" name="unitCode" placeholder="单位编码">
	</div>
    <div class="col-md-1" style="width: 105px;">
        <button id="searchBtn" class="btn btn-labeled btn-info" onclick="javascript:formSubmit();"><span class="btn-label icon fa fa-search"></span>搜索</button>
    </div>
    <div class="col-md-3" style="text-align: left;padding-bottom: unset">
        <button id="addBtn" class="btn btn-labeled btn-primary" onclick="javascript:showModal('添加供应商', 'admin/suppmaster/addPage');"><span class="btn-label icon fa fa-plus"></span>添加供应商</button>
    </div>
  </div>
</div>
<div class="openAppGrid">
	<div id="openAppGrid"></div>
</div>
<div>
	<ul id="myTab" class="nav nav-tabs">
	    <li class="active">
	        <a href="#home" data-toggle="tab">联系人</a>
	    </li>
	    <li><a href="#ios" data-toggle="tab">iOS</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
	    <div class="tab-pane fade in active" id="home">
			<div class="col-md-2" style="text-align: left;padding-bottom: unset">
		        <button id="addBtn" class="btn btn-labeled btn-primary" onclick="javascript:showModal('添加联系人', 'admin/suppcontacts/addPage');"><span class="btn-label icon fa fa-plus"></span>添加联系人</button>
		    </div>
	        <div class="openAppGrid">
				<div id="supplierContacts"></div>
			</div>
	    </div>
	    <div class="tab-pane fade" id="ios">
	        <p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple
	            TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
	    </div>
	</div>
</div>
<script type="text/javascript">
    $(function (){
        $("#openAppGrid").sgrid({
            columns:[
                {field:"id",text:"供应商ID", sortColumn:"id"},
                {field:"unitCode", text:"单位编码"},
                {field:"unitName", text:"单位名称"},
                {field:"masterContacts", text:"主联系人"},
                {field:"masterPhone", text:"联系人电话"},
                {field:"masterMail", text:"联系人邮箱"},
                {field:"masterFax", text:"联系人传真"},
                {field:"follerPersion", text:"跟进人"},
                {field:"id", text:"操作",width:80, style:"text-align:center", formatter:function(index, content, data){
                	if("admin" == data.username){
                		return "禁止操作超级管理员";
                	}else{
	                    var editUrl = "admin/suppmaster/updatePage/" + content;
	                    var delUrl = "admin/suppmaster/deleteByID/" + content;
	                    return "<a href='javascript:showModal(\"更新\", \""+editUrl+"\");' data-original-title='修改' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-pencil'>修改</i></a>"
	                        + "&nbsp;<a href='javascript:showCfm(\"确定删除该记录\", \""+delUrl+"\");'  data-original-title='删除' class='btn btn-xs btn-danger add-tooltip'><i class='fa fa-times'>删除</i></a>"
	                        + "<a href='javascript:showTab(\""+content+"\");' data-original-title='查看' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-pencil'>查看</i></a>" ;
                	}
                }}
            ],
            cls: "",
            url: _urlPath + "admin/suppmaster/queryPage",
            sort:"id",
            order:"desc",
            pagination:true,
            onLoad:function(){
                $(".add-tooltip").tooltip();
            }
        });
    });
    var supplierId;
    function showTab(id) {
    	supplierId = id;
    	 $("#supplierContacts").sgrid({
             columns:[
                 {field:"id",text:"联系人ID", sortColumn:"id"},
                 {field:"masterId",text:"masterId"},
                 {field:"name", text:"姓名"},
                 {field:"title", text:"称谓"},
                 {field:"dept", text:"部门"},
                 {field:"phone", text:"手机"},
                 {field:"unitTel", text:"单位电话"},
                 {field:"homeTel", text:"家庭电话"},
                 {field:"fax", text:"传真"},
                 {field:"qqWx", text:"QQ/微信"},
                 {field:"id", text:"操作",width:80, style:"text-align:center", formatter:function(index, content, data){
	                    var editUrl = "admin/suppcontacts/updatePage/" + content;
		                var delUrl = "admin/suppcontacts/deleteByID/" + content;
		                return "<a href='javascript:showModal(\"更新\", \""+editUrl+"\");' data-original-title='修改' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-pencil'>修改</i></a>"
		                        + "&nbsp;<a href='javascript:showCfm(\"确定删除该记录\", \""+delUrl+"\");'  data-original-title='删除' class='btn btn-xs btn-danger add-tooltip'><i class='fa fa-times'>删除</i></a>";

                 }}
             ],
             cls: "",
             url: _urlPath + "admin/suppcontacts/querySupplierContactsList/1",
             sort:"id",
             order:"desc",
             pagination:true,
             onLoad:function(){
                 $(".add-tooltip").tooltip();
             }
         });
    }
</script>