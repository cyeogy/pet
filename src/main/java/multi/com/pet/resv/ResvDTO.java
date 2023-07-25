package multi.com.pet.resv;

import java.sql.Date;

public class ResvDTO {
	private String resv_no;
	private String member_id;
	private String resv_date;
	private String resv_change_date;
	private int resv_status = 0;
	private String pay_method;
	private Date visit_date;
	private String visit_place;
	private int service_starttime;
	private int service_endtime;
	private int service_time;
	private char default_service='Y';
	private char bath_service='N';
	private char walk_service='N';
	private char beauty_service='N';
	private String sitter_id;
	private String sitter_name;
	private String service_note;
	private int total_price = 25000;
	private String match_method;
	private String prefer_gender;
	private String prefer_size;
	private String visit_method;
	private String common_pass;
	private String home_pass;
	private String direct_meet;
	private String parking;
	private String supplies_place;
	private String cleaning_method;
	private String emergency_phone;
	private String pet_idlist;
	private String pet_codelist;
	private String pet_namelist;
	private String pet_sizelist;
	
	public ResvDTO() {
	}
	
	//resv1페이지(예약페이지 1번째)에서 입력할때
	public ResvDTO(Date visit_date, String visit_place, int service_starttime, int service_time, String service_note) {
		super();
		this.visit_date = visit_date;
		this.visit_place = visit_place;
		this.service_starttime = service_starttime;
		this.service_time = service_time;
		this.service_note = service_note;
	}
	
	//resv2페이지(예약페이지2번째)의 hidden타입
	public ResvDTO(Date visit_date, String visit_place, int service_starttime, int service_endtime, int service_time, char default_service, char bath_service, char walk_service, char beauty_service, String service_note) {
		super();
		this.visit_date = visit_date;
		this.visit_place = visit_place;
		this.service_starttime = service_starttime;
		this.service_endtime = service_endtime;
		this.service_time = service_time;
		this.default_service = default_service;
		this.bath_service = bath_service;
		this.walk_service = walk_service;
		this.beauty_service = beauty_service;
		this.service_note = service_note;
	}

	public ResvDTO(Date visit_date, int service_starttime, int service_endtime, int service_time, char default_service,char bath_service, char walk_service, char beauty_service, String service_note, String match_method,String prefer_gender, String prefer_size, String visit_method, String common_pass, String home_pass,	String direct_meet, String parking, String supplies_place, String cleaning_method, String emergency_phone) {
		super();
		this.visit_date = visit_date; 
		this.service_starttime = service_starttime; 
		this.service_endtime = service_endtime; 
		this.service_time = service_time; 
		this.default_service = default_service;   
		this.bath_service = bath_service; 
		this.walk_service = walk_service; 
		this.beauty_service = beauty_service; 
		this.service_note = service_note;
		this.match_method = match_method; 
		this.prefer_gender = prefer_gender; 
		this.prefer_size = prefer_size; 
		this.visit_method = visit_method;  
		this.common_pass = common_pass; 
		this.home_pass = home_pass; 
		this.direct_meet = direct_meet; 
		this.parking = parking; 
		this.supplies_place = supplies_place; 
		this.cleaning_method = cleaning_method; 
		this.emergency_phone = emergency_phone; 

	}
	public String getResv_no() {
		return resv_no;
	}

	public void setResv_no(String resv_no) {
		this.resv_no = resv_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getResv_date() {
		return resv_date;
	}

	public void setResv_date(String resv_date) {
		
		
		this.resv_date = resv_date;
	}

	public String getResv_change_date() {
		return resv_change_date;
	}

	public void setResv_change_date(String resv_change_date) {
		
		this.resv_change_date = resv_change_date;
	}

	public int getResv_status() {
		return resv_status;
	}

	public void setResv_status(int resv_status) {
		this.resv_status = resv_status;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public Date getVisit_date() {
		return visit_date;
	}

	public void setVisit_date(Date visit_date) {
		this.visit_date = visit_date;
	}

	public String getVisit_place() {
		return visit_place;
	}

	public void setVisit_place(String visit_place) {
		this.visit_place = visit_place;
	}

	public int getService_starttime() {
		return service_starttime;
	}

	public void setService_starttime(int service_starttime) {
		this.service_starttime = service_starttime;
	}

	public int getService_endtime() {
		return service_endtime;
	}

	public void setService_endtime(int service_endtime) {
		this.service_endtime = service_endtime;
	}

	public int getService_time() {
		return service_time;
	}

	public void setService_time(int service_time) {
		this.service_time = service_time;
	}

	public char getDefault_service() {
		return default_service;
	}

	public void setDefault_service(char default_service) {
		this.default_service = default_service;
	}

	public char getBath_service() {
		return bath_service;
	}

	public void setBath_service(char bath_service) {
		this.bath_service = bath_service;
	}

	public char getWalk_service() {
		return walk_service;
	}

	public void setWalk_service(char walk_service) {
		this.walk_service = walk_service;
	}

	public char getBeauty_service() {
		return beauty_service;
	}

	public void setBeauty_service(char beauty_service) {
		this.beauty_service = beauty_service;
	}

	public String getSitter_id() {
		return sitter_id;
	}

	public void setSitter_id(String sitter_id) {
		this.sitter_id = sitter_id;
	}

	public String getService_note() {
		return service_note;
	}

	public void setService_note(String service_note) {
		this.service_note = service_note;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getMatch_method() {
		return match_method;
	}

	public void setMatch_method(String match_method) {
		this.match_method = match_method;
	}

	public String getPrefer_gender() {
		return prefer_gender;
	}

	public void setPrefer_gender(String prefer_gender) {
		this.prefer_gender = prefer_gender;
	}

	public String getPrefer_size() {
		return prefer_size;
	}

	public void setPrefer_size(String prefer_size) {
		this.prefer_size = prefer_size;
	}
	

	public String getVisit_method() {
		return visit_method;
	}

	public void setVisit_method(String visit_method) {
		this.visit_method = visit_method;
	}

	public String getCommon_pass() {
		return common_pass;
	}

	public void setCommon_pass(String common_pass) {
		this.common_pass = common_pass;
	}

	public String getHome_pass() {
		return home_pass;
	}

	public void setHome_pass(String home_pass) {
		this.home_pass = home_pass;
	}

	public String getDirect_meet() {
		return direct_meet;
	}

	public void setDirect_meet(String direct_meet) {
		this.direct_meet = direct_meet;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getSupplies_place() {
		return supplies_place;
	}

	public void setSupplies_place(String supplies_place) {
		this.supplies_place = supplies_place;
	}

	public String getCleaning_method() {
		return cleaning_method;
	}

	public void setCleaning_method(String cleaning_method) {
		this.cleaning_method = cleaning_method;
	}

	public String getEmergency_phone() {
		return emergency_phone;
	}

	public void setEmergency_phone(String emergency_phone) {
		this.emergency_phone = emergency_phone;
	}
	
	public String getPet_idlist() {
		return pet_idlist;
	}
	public void setPet_idlist(String pet_idlist) {
		this.pet_idlist = pet_idlist;
	}
	public String getPet_codelist() {
		return pet_codelist;
	}
	public void setPet_codelist(String pet_codelist) {
		this.pet_codelist = pet_codelist;
	}
	
	public String getPet_namelist() {
		return pet_namelist;
	}
	public void setPet_namelist(String pet_namelist) {
		this.pet_namelist = pet_namelist;
	}
	
	public String getSitter_name() {
		return sitter_name;
	}
	public void setSitter_name(String sitter_name) {
		this.sitter_name = sitter_name;
	}
	

	public String getPet_sizelist() {
		return pet_sizelist;
	}

	public void setPet_sizelist(String pet_sizelist) {
		this.pet_sizelist = pet_sizelist;
	}

	public ResvDTO(String resv_no, String member_id, String resv_date, String resv_change_date, int resv_status,
			String pay_method, Date visit_date, String visit_place, int service_starttime, int service_endtime,
			int service_time, char default_service, char bath_service, char walk_service, char beauty_service,
			String sitter_id, String sitter_name, String service_note, int total_price, String match_method,
			String prefer_gender, String prefer_size, String visit_method, String common_pass, String home_pass,
			String direct_meet, String parking, String supplies_place, String cleaning_method, String emergency_phone,
			String pet_idlist, String pet_codelist,
			String pet_namelist) {
		super();
		this.resv_no = resv_no;
		this.member_id = member_id;
		this.resv_date = resv_date;
		this.resv_change_date = resv_change_date;
		this.resv_status = resv_status;
		this.pay_method = pay_method;
		this.visit_date = visit_date;
		this.visit_place = visit_place;
		this.service_starttime = service_starttime;
		this.service_endtime = service_endtime;
		this.service_time = service_time;
		this.default_service = default_service;
		this.bath_service = bath_service;
		this.walk_service = walk_service;
		this.beauty_service = beauty_service;
		this.sitter_id = sitter_id;
		this.sitter_name = sitter_name;
		this.service_note = service_note;
		this.total_price = total_price;
		this.match_method = match_method;
		this.prefer_gender = prefer_gender;
		this.prefer_size = prefer_size;
		this.visit_method = visit_method;
		this.common_pass = common_pass;
		this.home_pass = home_pass;
		this.direct_meet = direct_meet;
		this.parking = parking;
		this.supplies_place = supplies_place;
		this.cleaning_method = cleaning_method;
		this.emergency_phone = emergency_phone;
		this.pet_idlist = pet_idlist;
		this.pet_codelist = pet_codelist;
		this.pet_namelist = pet_namelist;
	}
	

	
	@Override
	public String toString() {
		return "ResvDTO [resv_no=" + resv_no + ", member_id=" + member_id + ", resv_date=" + resv_date
				+ ", resv_change_date=" + resv_change_date + ", resv_status=" + resv_status + ", pay_method="
				+ pay_method + ", visit_date=" + visit_date + ", visit_place=" + visit_place + ", service_starttime="
				+ service_starttime + ", service_endtime=" + service_endtime + ", service_time=" + service_time
				+ ", default_service=" + default_service + ", bath_service=" + bath_service + ", walk_service="
				+ walk_service + ", beauty_service=" + beauty_service + ", sitter_id=" + sitter_id + ", sitter_name="
				+ sitter_name + ", service_note=" + service_note + ", total_price=" + total_price + ", match_method="
				+ match_method + ", prefer_gender=" + prefer_gender + ", prefer_size=" + prefer_size + ", visit_method="
				+ visit_method + ", common_pass=" + common_pass + ", home_pass=" + home_pass + ", direct_meet="
				+ direct_meet + ", parking=" + parking + ", supplies_place=" + supplies_place + ", cleaning_method="
				+ cleaning_method + ", emergency_phone=" + emergency_phone + ", pet_idlist=" + pet_idlist
				+ ", pet_codelist=" + pet_codelist + ", pet_namelist=" + pet_namelist + ", pet_sizelist=" + pet_sizelist
				+ "]";
	}

	public static Date getTodayDate() {
		long miliseconds = System.currentTimeMillis();
		Date date = new Date(miliseconds);
		return date;
	}
	
}
