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

}
