package com.xe.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.utils.AppUtil;
import com.xe.demo.mapper.SupplierMasterMapper;
import com.xe.demo.model.SupplierMaster;

@Service
public class SupplierMasterService extends AbstratService<SupplierMaster> {

	@Autowired
	private SupplierMasterMapper supplierMasterMapper;
	
	public AjaxResult saveSupplierMaster(SupplierMaster supplierMaster) {
		String result = null;
		SupplierMaster $user = supplierMasterMapper.queryByUsername(supplierMaster.getUnitName());
		if (null == $user) {
			save(supplierMaster);
		} else {
			result = supplierMaster.getUnitCode() + "供应商已存在";
		}
		return AppUtil.returnObj(result);
	}

	public AjaxResult updateSupplierMaster(SupplierMaster supplierMaster) {
		String result = null;
		SupplierMaster $supplierMaster = supplierMasterMapper.queryByUsername(supplierMaster.getUnitName());
		if (null != $supplierMaster && $supplierMaster.getId() != supplierMaster.getId()) {
			result = "供应商已存在";
		} else {
			updateByID(supplierMaster);
		}
		return AppUtil.returnObj(result);
	}
}
