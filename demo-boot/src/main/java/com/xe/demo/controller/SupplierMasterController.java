package com.xe.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xe.demo.common.annotation.Authority;
import com.xe.demo.common.annotation.ControllerLog;
import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.pojo.PageAjax;
import com.xe.demo.model.SupplierMaster;
import com.xe.demo.service.SupplierMasterService;

@Controller
@RequestMapping("/admin/suppmaster/")
public class SupplierMasterController extends BaseController {

	@Autowired
	private SupplierMasterService masterService;
	 

	@Authority(opCode = "0401", opName = "供应商管理界面")
	@RequestMapping("mainPage")
	public String mainPage(Map<String, Object> map) {
		List<SupplierMaster> list = masterService.queryAll();
		map.put("list", list);
		return "supp/suppmaster/main";
	}
	
	@ControllerLog("查询供应商列表")
	@RequestMapping("queryPage")
	@ResponseBody
	@Authority(opCode = "0401", opName = "查询供应商列表")
	public PageAjax<SupplierMaster> queryPage(PageAjax<SupplierMaster> page, SupplierMaster supplierMaster) {
		return masterService.queryPage(page, supplierMaster);
	}
	
	@Authority(opCode = "040101", opName = "添加供应商页面")
	@RequestMapping("addPage")
	public String addPage(Map<String, Object> map) {
		return "supp/suppmaster/add";
	}

	@ControllerLog("添加用户")
	@RequestMapping("add")
	@ResponseBody
	@Authority(opCode = "040101", opName = "添加供应商")
	public AjaxResult add(SupplierMaster supplierMaster) {
		return masterService.saveSupplierMaster(supplierMaster);
	}

	@Authority(opCode = "040102", opName = "更新供应商页面")
	@RequestMapping("updatePage/{id}")
	public String updatePage(@PathVariable("id") int id, Map<String, Object> map) {
		SupplierMaster supplierMaster = masterService.queryByID(id);
		map.put("supplierMaster", supplierMaster);
		return "supp/suppmaster/update";
	}

	@ControllerLog("修改供应商")
	@RequestMapping("update")
	@ResponseBody
	@Authority(opCode = "040102", opName = "修改供应商")
	public AjaxResult update(SupplierMaster supplierMaster) {
		return masterService.updateSupplierMaster(supplierMaster);
	}
	
	@ControllerLog("删除用户")
	@RequestMapping("deleteByID/{id}")
	@ResponseBody
	@Authority(opCode = "040103", opName = "删除用户")
	public AjaxResult deleteByID(@PathVariable("id") int id) {
		return masterService.deleteByID(id);
	}

 
}
