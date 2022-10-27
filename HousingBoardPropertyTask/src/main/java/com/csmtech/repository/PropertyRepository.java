package com.csmtech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.csmtech.model.Property;

@Repository
public interface PropertyRepository extends JpaRepository<Property, Long> {

	@Query("FROM Property WHERE project.projectId=:projectId")
	List<Property> getPropertyTypeByPrject(Long projectId);

	@Query("SELECT propertyCost FROM Property WHERE propertyId=:propertyId")
	Double getPropertyByCost(Long propertyId);

	

}
