<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="submitForm" class="form-horizontal">
	 <div class="form-group">
        <label class="col-sm-3 control-label" for="roleid"><font color="red">*</font>所属单位：</label>
		<div class="col-sm-8">
			<select class="form-control span2" id="masterId" name="masterId">
				<c:forEach items="${list}" var="master">
					<option <c:if test="${master.id == contacts.masterId}">selected</c:if> value="${role.roleid}">${master.unitName}</option>
				</c:forEach>
			</select>
		</div>
	</div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="roleid"><font color="red">*</font>联系人：</label>
		<div class="col-sm-8">
			 <input class="form-control" type="text" id="name" name="name" placeholder="联系人" value="${contacts.name}"/>
		</div>
	</div>
	
    <div class="form-group">
        <label class="col-sm-3 control-label" for="username"><font color="red">*</font>称谓：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="title" name="title" placeholder="称谓" value="${contacts.title}"/>
            <div id="validation-username" class="validate-error help-block"></div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="password"><font color="red">*</font>部门：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="dept" name="dept" placeholder="部门" value="${contacts.dept}"/>
            <div id="validation-password" class="validate-error help-block"></div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="rePass"><font color="red">*</font>手机：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="phone" name="phone" placeholder="手机" value="${contacts.phone}"/>
            <div id="validation-password" class="validate-error help-block"></div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">传真：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="fax" name="fax" placeholder="传真 " value="${contacts.fax}"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">家庭电话：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="homeTel" name="homeTel" placeholder="家庭电话" value="${contacts.homeTel}"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">单位电话：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="unitTel" name="unitTel" placeholder="单位电话" value="${contacts.unitTel}"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">QQ/微信：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="qqWx" name="qqWx" placeholder="QQ/微信" value="${contacts.qqWx}"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">单位邮编：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="zipcode" name="zipcode" placeholder="单位邮编" value="${contacts.zipcode}"/>
        </div>
    </div>
     
</form>
<script type="text/javascript">
	submit = function(){
		frmValidate();
		var data = $("#submitForm").serialize();
		ajaxRequest("admin/suppcontacts/update", data);
	}
</script>