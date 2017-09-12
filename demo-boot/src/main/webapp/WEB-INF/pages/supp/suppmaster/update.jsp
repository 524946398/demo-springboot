<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="submitForm" class="form-horizontal">
	<input name="id" value="${supplierMaster.id}" type="text" hidden="hidden">
    <div class="form-group">
        <label class="col-sm-3 control-label" for="roleid">单位名称：</label>
		<div class="col-sm-8">
			<input class="form-control" type="text" id="unitName" name="unitName" placeholder="单位名称" value="${supplierMaster.unitName}"/>
		</div>
	</div>
	
    <div class="form-group">
        <label class="col-sm-3 control-label" for="username">单位编码：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="unitCode" name="unitCode" placeholder="单位编码" value="${supplierMaster.unitCode}"/>
            <div id="validation-username" class="validate-error help-block"></div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">主联系人：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="password" name="masterContacts" placeholder="请填写主联系人" value="${supplierMaster.masterContacts}"/>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="useable">联系人电话：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="masterPhone" name="masterPhone" placeholder="请填写联系人电话" value="${supplierMaster.masterPhone}"/>
        </div>
    </div>
        <div class="form-group">
        <label class="col-sm-3 control-label" for="email">联系人邮箱：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="masterMail" name="masterMail" placeholder="请填写联系人邮箱 " value="${supplierMaster.masterMail}"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">联系人传真：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="masterFax" name="masterFax" placeholder="请填写联系人传真" value="${supplierMaster.masterFax}"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">跟进人：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="follerPersion" name="follerPersion" placeholder="请填写跟进人" value="${supplierMaster.follerPersion}"/>
        </div>
    </div>
</form>
<script type="text/javascript">
	submit = function(){
		frmValidate();
		var data = $("#submitForm").serialize();
		ajaxRequest("admin/suppmaster/update", data);
	}
</script>