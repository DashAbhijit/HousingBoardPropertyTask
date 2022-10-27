package com.csmtech.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="applicant_details")
@Getter
@Setter
@ToString

public class Applicant implements Serializable {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="applicant_id")
	private  Long applicantId;
	
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="property_id")
	private Property property;
	
	
	private String name;
	
	
	private String email;
	
	
	@Column(name="mobile_no")
	private Long mobileNo;
	
	private Long age;
//	private String age;
	
	private String gender;
	
	@Column(name="id_prove")
	private String idProve;
	
	@Column(name="id_name")
	private String idName;
	
	@Column(name="is_delete")
	private String isDelete;
	
	private Date date;
	
	
	

	
	
}
