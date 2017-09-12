package com.xe.demo.service;

import org.springframework.stereotype.Service;

import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.utils.AppUtil;
import com.xe.demo.model.SupplierContacts;

@Service
public class SupplierContactsService extends AbstratService<SupplierContacts> {

	public AjaxResult saveSupplierContacts(SupplierContacts contacts) {
		String result = null;
		save(contacts);
		return AppUtil.returnObj(result);
	}

	public AjaxResult updateSupplierContacts(SupplierContacts contacts) {
		String result = null;
		updateByID(contacts);
		return AppUtil.returnObj(result);
	}
}
