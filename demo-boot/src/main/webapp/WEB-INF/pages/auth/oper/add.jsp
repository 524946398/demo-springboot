<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="submitForm" class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-3 control-label" for="roleid"><font color="red">*</font>权限值：</label>
		<div class="col-sm-8">
			<input class="form-control" type="text" id="opcode" name="opcode" placeholder="请填权限值" />
		</div>
	</div>
	
    <div class="form-group">
        <label class="col-sm-3 control-label" for="username"><font color="red">*</font>权限名称：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="opname" name="opname" placeholder="请填写权限名称"/>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="password"><font color="red">*</font>操作链接：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="ophref" name="ophref" placeholder="请填写权限操作链接" />
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="rePass"><font color="red">*</font>显示顺序：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="opseq" name="opseq" placeholder="请填写显示顺序" />
        </div>
    </div>
    
</form>
<script type="text/javascript">
	submit = function(){
		frmValidate();
		var data = $("#submitForm").serialize();
		ajaxRequest("admin/oper/add", data);
	}
</script>