package com.xe.demo.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xe.demo.common.annotation.Authority;
import com.xe.demo.common.annotation.ControllerLog;
import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.pojo.PageAjax;
import com.xe.demo.model.AuthOperation;
import com.xe.demo.service.OperationService;

@Controller
@RequestMapping("/admin/oper/")
public class OperationController extends BaseController {

	@Autowired
	private OperationService opService;

	@Authority(opCode = "0103", opName = "权限管理界面")
	@RequestMapping("mainPage")
	public String mainPage(){
		return "auth/oper/main";
	}

	@ControllerLog("查询权限列表")
    @RequestMapping("queryPage")
    @ResponseBody
    @Authority(opCode = "0103", opName = "查询权限列表")
    public PageAjax<AuthOperation> queryPage(PageAjax<AuthOperation> page, AuthOperation oper) {
        return opService.queryPage(page, oper);
    }
	
	@Authority(opCode = "010301", opName = "添加操作页面")
	@RequestMapping("addPage")
	public String addPage(Map<String, Object> map) {
		return "auth/oper/add";
	}

	@ControllerLog("添加用户")
	@RequestMapping("add")
	@ResponseBody
	@Authority(opCode = "010301", opName = "添加用户")
	public AjaxResult add(AuthOperation op) {
		return opService.saveOp(op);
	}
}
