package com.xe.demo.mapper;

import com.xe.demo.common.dao.MyMapper;
import com.xe.demo.model.SupplierMaster;

public interface SupplierMasterMapper extends MyMapper<SupplierMaster> {

	SupplierMaster queryByUsername(String unitName);
}