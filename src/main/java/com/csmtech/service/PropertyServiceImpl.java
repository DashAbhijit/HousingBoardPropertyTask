package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.Property;
import com.csmtech.repository.PropertyRepository;

@Service
public class PropertyServiceImpl implements PropertyService {

	@Autowired
	private PropertyRepository propertyRepository;
	
	@Override
	public List<Property> getPropertyTypeByPrject(Long projectId) {
		return propertyRepository.getPropertyTypeByPrject(projectId);
	}

	@Override
	public Property findPropertyByCost(Long propertyId) {

		return propertyRepository.findById(propertyId).get();
	}

	@Override
	public Double getPropertyByCost(Long propertyId) {
		return propertyRepository.getPropertyByCost(propertyId);
	}

	

}
