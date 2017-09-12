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
import com.xe.demo.model.SupplierContacts;
import com.xe.demo.model.SupplierMaster;
import com.xe.demo.service.SupplierContactsService;
import com.xe.demo.service.SupplierMasterService;

@Controller
@RequestMapping("/admin/suppcontacts/")
public class SupplierContactsController extends BaseController {

	@Autowired
	private SupplierContactsService contactsService;
	@Autowired
	private SupplierMasterService masterService;
	 

	@Authority(opCode = "0402", opName = "联系人管理界面")
	@RequestMapping("mainPage")
	public String mainPage(Map<String, Object> map) {
		List<SupplierContacts> list = contactsService.queryAll();
		map.put("list", list);
		return "supp/suppcontacts/main";
	}
	
	@ControllerLog("查询供应商列表")
	@RequestMapping("queryPage")
	@ResponseBody
	@Authority(opCode = "0402", opName = "查询供应商列表")
	public PageAjax<SupplierContacts> queryPage(PageAjax<SupplierContacts> page, SupplierContacts contacts) {
		return contactsService.queryPage(page, contacts);
	}
	
	@Authority(opCode = "040201", opName = "添加联系人页面")
	@RequestMapping("addPage")
	public String addPage(Map<String, Object> map) {
		List<SupplierMaster> list = masterService.queryAll();
		map.put("list", list);
		return "supp/suppcontacts/add";
	}

	@ControllerLog("添加联系人")
	@RequestMapping("add")
	@ResponseBody
	@Authority(opCode = "040201", opName = "添加联系人")
	public AjaxResult add(SupplierContacts contacts) {
		return contactsService.saveSupplierContacts(contacts);
	}

	@Authority(opCode = "040202", opName = "更新联系人")
	@RequestMapping("updatePage/{id}")
	public String updatePage(@PathVariable("id") int id, Map<String, Object> map) {
		List<SupplierMaster> list = masterService.queryAll();
		map.put("list", list);
		
		SupplierContacts contacts = contactsService.queryByID(id);
		map.put("contacts", contacts);
		return "supp/suppcontacts/update";
	}

	@ControllerLog("修改联系人")
	@RequestMapping("update")
	@ResponseBody
	@Authority(opCode = "040202", opName = "修改联系人")
	public AjaxResult update(SupplierContacts contacts) {
		return contactsService.updateSupplierContacts(contacts);
	}
	
	@ControllerLog("删除联系人")
	@RequestMapping("deleteByID/{id}")
	@ResponseBody
	@Authority(opCode = "040203", opName = "删除联系人")
	public AjaxResult deleteByID(@PathVariable("id") int id) {
		return contactsService.deleteByID(id);
	}

 
}
