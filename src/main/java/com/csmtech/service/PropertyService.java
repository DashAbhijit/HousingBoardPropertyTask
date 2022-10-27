package com.csmtech.service;

import java.util.List;

import com.csmtech.model.Property;

public interface PropertyService {

	List<Property> getPropertyTypeByPrject(Long projectId);


	Property findPropertyByCost(Long propertyId);


	Double getPropertyByCost(Long propertyId);

}
