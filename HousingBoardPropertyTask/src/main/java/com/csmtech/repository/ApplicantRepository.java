package com.csmtech.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.csmtech.model.Applicant;

@Repository
public interface ApplicantRepository extends JpaRepository<Applicant, Long> {

	@Transactional
	@Modifying
	@Query("Update Applicant set isDelete='Yes' WHERE applicantId=:applicantId")
	void deleteByApplicantId(Long applicantId);

	
	@Query("FROM Applicant WHERE isDelete='No'")
	List<Applicant> findAllNotDeleted();
	
}
