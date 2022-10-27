package com.csmtech.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
@Table(name="property_type")
public class Property implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="property_id")
	private Long propertyId;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="project_id")
	private Project project;
	
	@Column(name="property_type")
	private String propertyType;
	
	@Column(name="property_cost")
	private Double propertyCost;
	
	
}
