package com.csmtech.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.csmtech.model.Applicant;
import com.csmtech.model.Project;
import com.csmtech.model.Property;
import com.csmtech.service.ApplicantSerice;
import com.csmtech.service.ProjectService;
import com.csmtech.service.PropertyService;
import com.csmtech.util.CommonFileDownload;

@Controller
public class MyController {

	@Autowired
	private ProjectService projectService;

	@Autowired
	private PropertyService propertyService;

	@Autowired
	private ApplicantSerice applicantService;

	@GetMapping("/add")
	public String add(Model model) {
		List<Project> projectList = projectService.getAllProject();
		model.addAttribute("projectList", projectList);
		model.addAttribute("ListShowData", applicantService.getALlShowData());
		return "add";
	}

	@GetMapping("/getPropertyTypeByPrject")
	public void getPropertyTypeByPrject(@RequestParam("projectId") Long projectId, Model model,
			HttpServletResponse resp) throws IOException {
		PrintWriter pw = resp.getWriter();
		// System.out.println(coutId);
		List<Property> propertytList = propertyService.getPropertyTypeByPrject(projectId);
		System.out.println(propertytList);
		String t = "";
		t += "<option value='" + 0 + "'>" + "-select-" + "</option>";
		for (Property x : propertytList) {
			t += "<option value='" + x.getPropertyId() + "'>" + x.getPropertyType() + "</option>";
		}
		pw.print(t);
	}

	@GetMapping("/getPropertyCost")
	public void getPropertyCost(@RequestParam("propertyId") Long propertyId, Model model, HttpServletResponse resp)
			throws IOException {
		// System.out.println(mobileNumber);
		PrintWriter pw = resp.getWriter();

		Property property = propertyService.findPropertyByCost(propertyId);

		model.addAttribute("propertyList", property);
		System.out.println(property.getPropertyCost());
		String t = "<input  disabled class='form-control' type='text' value='" + property.getPropertyCost() + "'>";
		// pw.print(t);

		Double propertyCost = propertyService.getPropertyByCost(propertyId);
		pw.println(propertyCost);
	}

	@PostMapping("/savedata")
	public String savedata(@RequestParam("name") String name, @RequestParam("propertyName") Property property_id,
			@RequestParam("email") String email, @RequestParam("mobileNo") Long mobileNo,
			@RequestParam("age") String age, @RequestParam("gender") String gender,
			@RequestParam("idProve") MultipartFile idProve, Model model) throws IOException {

		/*
		 * File file = new File("D://Myfile3/" + idProve.getOriginalFilename());
		 * BufferedOutputStream bf = null; try { byte[] bytes = idProve.getBytes(); bf =
		 * new BufferedOutputStream(new FileOutputStream(file)); bf.write(bytes);
		 * bf.close();
		 * 
		 * } catch (IOException e1) { e1.printStackTrace(); }
		 */

		Applicant applicant = new Applicant();
		applicant.setProperty(property_id);
		applicant.setName(name);
		applicant.setEmail(email);
		applicant.setMobileNo(mobileNo);
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-mm-dd").parse(age);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date today = new Date();
		Long agee = (long) (today.getYear() - date.getYear());

		applicant.setAge(agee);
		applicant.setDate(new Date());
		applicant.setGender(gender);

		applicant.setIsDelete("No");
		applicant.setIdName(idProve.getOriginalFilename());
		applicant.setIdProve(CommonFileDownload.singleFileUplaod(idProve, "idProve"));
		System.out.println(applicant);
		applicantService.SaveData(applicant);

		return "redirect:./add";
	}

	@GetMapping("/showData")
	public String showData(Model model) {

		model.addAttribute("ListShowData", applicantService.getALlShowData());

		return "views";

	}

	@GetMapping("/deleteApplicantForm")
	public String deleteBooking(@RequestParam("applicantId") Long applicantId) {

		applicantService.deleteByApplicantId(applicantId);

		return "redirect:./add";

	}

	@GetMapping("/search")
	public String search(@RequestParam("projectName") Long projectName, @RequestParam("propertyName") Long propertyName,
			Model model) {
		System.out.println(projectName);
		System.out.println(propertyName);
		List<Applicant> applicantList = null;
		if (projectName != 0 && propertyName != 0) {
			System.out.println("yesssssss");
			applicantList = applicantService.getAll(projectName, propertyName);
			System.out.println(applicantList);
			System.out.println("Length is= " + applicantList.size());

		}
		model.addAttribute("ListShowData", applicantList);
		model.addAttribute("projectList", projectService.getAllProject());

		return "add";
	}

	@GetMapping("/downloadFile")
	public void downloadFile(@RequestParam("applicantId") Long applicantId, HttpServletResponse response)
			throws IOException {
		System.out.println("Inside Download File--------->>");
		Applicant applicant = applicantService.getDocumentDetailsByApplicantId(applicantId);
		CommonFileDownload.downloadFile(response, applicant.getIdProve());
	}

}
