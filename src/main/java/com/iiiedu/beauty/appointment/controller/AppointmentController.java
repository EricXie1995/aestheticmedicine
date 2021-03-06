package com.iiiedu.beauty.appointment.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iiiedu.beauty.appointment.dao.AppointmentRepository;
import com.iiiedu.beauty.appointment.dao.AppointmentTimeTableDao;
import com.iiiedu.beauty.appointment.service.AppointmentCityService;
import com.iiiedu.beauty.appointment.service.AppointmentDistService;
import com.iiiedu.beauty.appointment.service.AppointmentItemsService;
import com.iiiedu.beauty.appointment.service.AppointmentService;
import com.iiiedu.beauty.clinic.service.ClinicService;
import com.iiiedu.beauty.member.services.MemberServices;
import com.iiiedu.beauty.model.Appointment;
import com.iiiedu.beauty.model.City;
import com.iiiedu.beauty.model.Dist;
import com.iiiedu.beauty.model.Items;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.TimeTable;

@Controller
@RequestMapping("/appointment")
public class AppointmentController {

	@Autowired
	AppointmentCityService appointmentCityService;

	@Autowired
	AppointmentDistService appointmentDistService;

	@Autowired
	AppointmentItemsService appointmentItemsService;

	@Autowired
	ClinicService signUpService;

	@Autowired
	AppointmentService appointmentService;

	@Autowired
	MemberServices memberSignUpService;

	@Autowired
	MemberServices memberService;

	@Autowired
	AppointmentTimeTableDao appointmentTimeTableDao;
	
	@Autowired
	AppointmentRepository appointmentRepository;

	// 跳到預約畫面
	@GetMapping(value = "/appointment1")
	public String page() {
		return "appointments1";
	}
	
	//跳到預約查詢畫面
	@GetMapping(value = "/appointmentsInquiry")
	public String userAppointmentList(Model model,Integer memberPkId, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		if(member != null) {
			Integer memberPkId1 = member.getMemberPkId();
			List<Appointment> page1 = appointmentRepository.appointmentUserList(memberPkId1);
			model.addAttribute("page",page1);
		} else {
			return "login";
		}
		
		return "appointmentsInquiry";
	}
	
//	 // 接收行政區的fetch
//	 @GetMapping(value = "/getDist{cityPkId}")
//	 public @ResponseBody List<Dist> getDist(@PathVariable("cityPkId") String cityPkId) {
//	  System.out.println("111111111111111");
//	  int cityId = 0;
//	  cityId = Integer.parseInt(cityPkId);
//	  List<Dist> dists= appointmentDistService.getDist(cityId);
//	  return dists;
//	 }

	
	
	
	 //接收行政區的fetch
	@GetMapping(path = "/getDist", produces = "application/json")
	public @ResponseBody List<Dist> getDist(@RequestParam("cityPkId") String cityPkId) {
		
		
		int cityId = 0;
		cityId = Integer.parseInt(cityPkId);
		System.out.println("1111111111111111111");
//		int cityId = Integer.valueOf(cityPkId);
		List<Dist> dists = appointmentDistService.getDist(cityId);
		return dists;
		
		
		
		
		
	}

	
	
	
	
	
	// 選取預約時間和搜尋
	@GetMapping(value = "/appointment2")
	public String getAllCity(Model model) {
		List<City> cities = appointmentCityService.findAll();
		model.addAttribute("cities", cities);
		List<Items> items = appointmentItemsService.findAll();
		model.addAttribute("items", items);
		return "appointments2";
	}

	// 讀取使用者選擇的日期，利用weekDay取值
	@GetMapping(path = "/getTimeTable", produces = "application/json")
	public @ResponseBody List<TimeTable> getTimeTable(@RequestParam("appointDate") String date) throws Exception {
		System.out.println("111111111111111111");
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		String[] weekDays = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" };
		Calendar cal = Calendar.getInstance();
		Date datet = null;
		try {
			datet = f.parse(date);
			cal.setTime(datet);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
		if (w < 0)
			w = 0;
		String day = weekDays[w].toString();
		List<TimeTable> date1 = appointmentTimeTableDao.findAllByWeek(day);
		return date1;
	}

//	    //使用者輸入的項目時段診所搜尋出醫生
//		@GetMapping(path = "/searchDoctor", produces = "application/json")
//		public @ResponseBody List<Dentist> searchDoctor(
//				@RequestParam(value = "timeTablePkId") String timeTablePkId,
//				@RequestParam(value = "itemPkId") String itemPkId,
//				@RequestParam(value = "clinicDist") String clinicPkId,
//				@RequestParam("dateString") String appointmentDate) {
//			int item = Integer.valueOf(itemPkId);
//			int time = Integer.valueOf(timeTablePkId);
//			int clinic = Integer.valueOf(clinicPkId);
//			//將list轉成map並利用日期和時段判斷是否有重複2次，如同醫生已有2次預約即不可預約
//			List<Dentist> dentistList = appointmentService.getDoctor(item, time, clinic);
//			Map<Integer, Dentist> dentistMap = new LinkedHashMap<Integer, Dentist>();
//			for (int i = 0; i < dentistList.size(); i++) {
//				dentistMap.put(i, dentistList.get(i));
//			}
//			for (int i = 0; i < dentistMap.size(); i++) {
//				List<Appointment> a = appointmentService.checkFull(dentistMap.get(i),timeTablePkId, appointmentDate);
//				if(a.size()>=1) {
//					dentistMap.remove(i);
//				}
//			}
//			
//			List<Dentist> newDentistList = new ArrayList<Dentist>(dentistMap.values());
//			
//			System.out.println(dentistList);
//			return newDentistList;
//		}

	// <form:form表單 需要先寫一個GetMapping為空白表單>
	@GetMapping("/addAp")
	public String memberAppointForm(Model model) {
		Appointment a = new Appointment();
		model.addAttribute("addAp", a);
		return "member/appointment";
	}

	// <form:form表單 可直接放入ModelAttribute新增預約 >
//		@PostMapping("/addAp")
//		public String memberAddAppointment(
//				@ModelAttribute("LoginOK") Member member,
//				RedirectAttributes ra,
//		        @ModelAttribute("addAp") Appointment ap) throws java.text.ParseException{
//			
//			
//			java.sql.Date apDate = java.sql.Date.valueOf(ap.getAppointmentPkId());
//			ap.setAppointDate(apDate);
//			ap.setClinicBean(appointmentService.getClinicBeanByClinicPkId(ap.getClinicId()));
//		    ap.setDentistBean(appointmentService.getDentistBeanByDentistPkId(ap.getDentistId()));
//			ap.setItemBean(appointmentService.getItemsBeanByItemPkId(ap.getItemId()));
//			ap.setTimeTableBean(appointmentService.getTimeTableBeanByTimePkId(ap.getTimetableId()));
//			ap.setMemberBean(member);
//			ap.setPatientIdNumber(member.getMemberIdNumber());
//			ap.setPatientName(member.getMemberName());
//			ap.setPatientPhone(member.getMemberPhone());
//			System.out.println(ap);
//			appointmentService.InsertAppointment(ap);
//			return "redirect:/appointmentRecord";
//		}	
}
