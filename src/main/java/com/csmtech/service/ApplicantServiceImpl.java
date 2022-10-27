package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.Applicant;
import com.csmtech.repository.ApplicantRepository;

@Service
public class ApplicantServiceImpl implements ApplicantSerice {

	@Autowired
	private ApplicantRepository applicantionRepository;
	
	@Override
	public Applicant SaveData(Applicant applicant) {

		return applicantionRepository.save(applicant);
	}

	@Override
	public List<Applicant> getALlShowData() {

		return applicantionRepository.findAllNotDeleted();
	}

	@Override
	public void deleteByApplicantId(Long applicantId) {
		
		applicantionRepository.deleteByApplicantId(applicantId);
	}

	@Override
	public List<Applicant> getAll(Long projectName, Long propertyName) {
		
		return applicantionRepository.getAll(projectName,propertyName);
	}

	@Override
	public Applicant getDocumentDetailsByApplicantId(Long applicantId) {
		
		return applicantionRepository.getDocumentDetailsByApplicantId(applicantId);
	}



}
