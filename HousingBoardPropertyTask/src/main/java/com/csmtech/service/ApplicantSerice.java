package com.csmtech.service;

import java.util.List;

import com.csmtech.model.Applicant;

public interface ApplicantSerice {

	Applicant SaveData(Applicant applicant);

	List<Applicant> getALlShowData();

	void deleteByApplicantId(Long applicantId);

	

}
