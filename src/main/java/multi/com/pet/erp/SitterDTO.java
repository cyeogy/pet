package multi.com.pet.erp;

import java.sql.Date;
import java.util.Calendar;

import org.springframework.web.multipart.MultipartFile;

public class SitterDTO {
	private String user_type;
	private String sitter_id;
	private String sitter_name;
	private String sitter_pass;
	private String sitter_code;
	private String sitter_gender;
	private String sitter_email;
	private String sitter_phone;
	private String sitter_addr1;
	private String sitter_addr2;
	private Date sitter_startdate;
	private Date sitter_enddate;
//	private String sitter_state;
	private String sitter_status;
	private Date sitter_birthdate;
	private String service_area;
	private String sitter_info;
	private String valid = "0";
	private String sitter_certificate;
	private String sitter_rate;


	private int small_career;
	private int medium_career;
	private int large_career;
	private int cat_career;

	// 변경함 by 오승영
	private String sitter_photo;
	private MultipartFile sitter_img;
	private String sitter_resvNum;

	
	//추가함 by 최여경
	private int sitter_age;
	private String sitter_shortAddr; //00시 00구 혹은 경기도 00시 00구로 축약시킨 주소 String
	
	public SitterDTO() {
		
	}
	
	//추가함 by 오승영
	public SitterDTO(String sitter_id, String sitter_rate) {
		super();
		this.sitter_id = sitter_id;
		this.sitter_rate = sitter_rate;
	}

	
	
	@Override
	public String toString() {
		return "SitterDTO [user_type=" + user_type + ", sitter_id=" + sitter_id + ", sitter_name=" + sitter_name
				+ ", sitter_pass=" + sitter_pass + ", sitter_code=" + sitter_code + ", sitter_gender=" + sitter_gender
				+ ", sitter_email=" + sitter_email + ", sitter_phone=" + sitter_phone + ", sitter_addr1=" + sitter_addr1
				+ ", sitter_addr2=" + sitter_addr2 + ", sitter_startdate=" + sitter_startdate + ", sitter_enddate="
				+ sitter_enddate + ", sitter_status=" + sitter_status + ", sitter_birthdate=" + sitter_birthdate
				+ ", service_area=" + service_area + ", sitter_info=" + sitter_info + ", valid=" + valid
				+ ", sitter_certificate=" + sitter_certificate + ", sitter_rate=" + sitter_rate + ", small_career="
				+ small_career + ", medium_career=" + medium_career + ", large_career=" + large_career + ", cat_career="
				+ cat_career + ", sitter_photo=" + sitter_photo + ", sitter_img=" + sitter_img + ", sitter_resvNum="
				+ sitter_resvNum + ", sitter_age=" + sitter_age + ", sitter_shortAddr=" + sitter_shortAddr + "]";
	}

	// insert
	public SitterDTO(String sitter_id, String sitter_name, String sitter_code, String sitter_pass, String sitter_gender,
			String sitter_email, String sitter_phone, String sitter_addr1, String sitter_addr2, Date sitter_birthdate,
			String service_area, String sitter_info, String valid, String sitter_certificate,
			String sitter_photo) {
		super();
		this.sitter_id = sitter_id;
		this.sitter_pass = sitter_pass;
		this.sitter_name = sitter_name;
		this.sitter_code = sitter_code;
		this.sitter_gender = sitter_gender;
		this.sitter_email = sitter_email;
		this.sitter_phone = sitter_phone;
		this.sitter_addr1 = sitter_addr1;
		this.sitter_addr2 = sitter_addr2;
		this.sitter_birthdate = sitter_birthdate;
		this.service_area = service_area;
		this.sitter_info = sitter_info;
		this.valid = valid;
		this.sitter_certificate = sitter_certificate;
		this.sitter_photo = sitter_photo;
	}

	// All
	public SitterDTO(String user_type, String sitter_id, String sitter_name, String sitter_pass, String sitter_code,
			String sitter_gender, String sitter_email, String sitter_phone, String sitter_addr1, String sitter_addr2,
			Date sitter_startdate, Date sitter_enddate, String sitter_status, Date sitter_birthdate,
			String service_area, String sitter_info, String valid, String sitter_certificate, String sitter_rate,
			int small_career, int medium_career, int large_career, int cat_career, String sitter_photo,
			MultipartFile sitter_img, String sitter_resvNum, int sitter_age, String sitter_shortAddr) {
		super();
		this.user_type = user_type;
		this.sitter_id = sitter_id;
		this.sitter_name = sitter_name;
		this.sitter_pass = sitter_pass;
		this.sitter_code = sitter_code;
		this.sitter_gender = sitter_gender;
		this.sitter_email = sitter_email;
		this.sitter_phone = sitter_phone;
		this.sitter_addr1 = sitter_addr1;
		this.sitter_addr2 = sitter_addr2;
		this.sitter_startdate = sitter_startdate;
		this.sitter_enddate = sitter_enddate;
		this.sitter_status = sitter_status;
		this.sitter_birthdate = sitter_birthdate;
		this.service_area = service_area;
		this.sitter_info = sitter_info;
		this.valid = valid;
		this.sitter_certificate = sitter_certificate;
		this.sitter_rate = sitter_rate;
		this.small_career = small_career;
		this.medium_career = medium_career;
		this.large_career = large_career;
		this.cat_career = cat_career;
		this.sitter_photo = sitter_photo;
		this.sitter_img = sitter_img;
		this.sitter_resvNum = sitter_resvNum;
		this.sitter_age = sitter_age;
		this.sitter_shortAddr = sitter_shortAddr;
	}

	public String getSitter_resvNum() {
		return sitter_resvNum;
	}

	public void setSitter_resvNum(String sitter_resvNum) {
		this.sitter_resvNum = sitter_resvNum;
	}

	public String getUser_type() {
		return user_type;
	}


	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getSitter_id() {
		return sitter_id;
	}

	public void setSitter_id(String sitter_id) {
		this.sitter_id = sitter_id;
	}

	public String getSitter_name() {
		return sitter_name;
	}

	public void setSitter_name(String sitter_name) {
		this.sitter_name = sitter_name;
	}

	public String getSitter_pass() {
		return sitter_pass;
	}

	public void setSitter_pass(String sitter_pass) {
		this.sitter_pass = sitter_pass;
	}

	public String getSitter_code() {
		return sitter_code;
	}

	public void setSitter_code(String sitter_code) {
		this.sitter_code = sitter_code;
	}

	public String getSitter_gender() {
		return sitter_gender;
	}

	public void setSitter_gender(String sitter_gender) {
		this.sitter_gender = sitter_gender;
	}

	public String getSitter_email() {
		return sitter_email;
	}

	public void setSitter_email(String sitter_email) {
		this.sitter_email = sitter_email;
	}

	public String getSitter_phone() {
		return sitter_phone;
	}

	public void setSitter_phone(String sitter_phone) {
		this.sitter_phone = sitter_phone;
	}

	public String getSitter_addr1() {
		return sitter_addr1;
	}

	public void setSitter_addr1(String sitter_addr1) {
		this.sitter_addr1 = sitter_addr1;
	}

	public String getSitter_addr2() {
		return sitter_addr2;
	}

	public void setSitter_addr2(String sitter_addr2) {
		this.sitter_addr2 = sitter_addr2;
	}

	public Date getSitter_startdate() {
		return sitter_startdate;
	}

	public void setSitter_startdate(Date sitter_startdate) {
		this.sitter_startdate = sitter_startdate;
	}

	public Date getSitter_enddate() {
		return sitter_enddate;
	}

	public void setSitter_enddate(Date sitter_enddate) {
		this.sitter_enddate = sitter_enddate;
	}

	public String getSitter_status() {
		return sitter_status;
	}

	public void setSitter_status(String sitter_status) {
		this.sitter_status = sitter_status;
	}

	public Date getSitter_birthdate() {
		return sitter_birthdate;
	}

	public void setSitter_birthdate(Date sitter_birthdate) {
		this.sitter_birthdate = sitter_birthdate;
	}

	public String getService_area() {
		return service_area;
	}

	public void setService_area(String service_area) {
		this.service_area = service_area;
	}

	public String getSitter_info() {
		return sitter_info;
	}

	public void setSitter_info(String sitter_info) {
		this.sitter_info = sitter_info;
	}

	public String getValid() {
		return valid;
	}

	public void setValid(String valid) {
		this.valid = valid;
	}

	public String getSitter_certificate() {
		return sitter_certificate;
	}

	public void setSitter_certificate(String sitter_certificate) {
		this.sitter_certificate = sitter_certificate;
	}

	public String getSitter_rate() {
		return sitter_rate;
	}

	public void setSitter_rate(String sitter_rate) {
		this.sitter_rate = sitter_rate;
	}

	public int getSmall_career() {
		return small_career;
	}

	public void setSmall_career(int small_career) {
		this.small_career = small_career;
	}

	public int getMedium_career() {
		return medium_career;
	}

	public void setMedium_career(int medium_career) {
		this.medium_career = medium_career;
	}

	public int getLarge_career() {
		return large_career;
	}

	public void setLarge_career(int large_career) {
		this.large_career = large_career;
	}

	public int getCat_career() {
		return cat_career;
	}

	public void setCat_career(int cat_career) {
		this.cat_career = cat_career;
	}

	public String getSitter_photo() {
		return sitter_photo;
	}

	public void setSitter_photo(String sitter_photo) {
		this.sitter_photo = sitter_photo;
	}

	public MultipartFile getSitter_img() {
		return sitter_img;
	}

	public void setSitter_img(MultipartFile sitter_img) {
		this.sitter_img = sitter_img;
	}

	public int getSitter_age() {
		return sitter_age;
	}

	public void setSitter_age(int sitter_age) {
		this.sitter_age = sitter_age;
	}

	public String getSitter_shortAddr() {
		return sitter_shortAddr;
	}

	public void setSitter_shortAddr(String sitter_shortAddr) {
		String newAddr = sitter_addr1;
		String shortAddr; //최종적으로 들어갈 간략주소 변수
		if(!newAddr.contains("경기")) {//기존 주소가 경기도가 아니라 광역시나 특별시라면
			String[] splitAddr = newAddr.split(" "); //띄어쓰기 기준으로 split
			shortAddr = splitAddr[0] + " "+ splitAddr[1]; //처음의 시와 구만 뽑아서 새 주소를 만든다.
		}else {//기존 주소가 경기도라면
			String[] splitAddr = newAddr.split(" "); //띄어쓰기 기준으로 split
			if(splitAddr[2].charAt(splitAddr[2].length()-1) == '구' ) { // 경기도 ㅇㅇ시 ㅇㅇ구 
				shortAddr = splitAddr[0] + " "+ splitAddr[1] + " " + splitAddr[2]; 
			}else {//경기도 ㅇㅇ시 ㅇㅇ로
			shortAddr = splitAddr[0] + " "+ splitAddr[1]; //처음의 도와 시만 뽑아서 새 주소를 만든다.
			}
		}
		this.sitter_shortAddr = shortAddr;
	}
	

	//나이 구하는 메소드
	public  int  calcAge() {
		 Calendar cal = Calendar.getInstance();
	        
        int currentYear  = cal.get(Calendar.YEAR);
        int currentMonth = cal.get(Calendar.MONTH) + 1;
        int currentDay   = cal.get(Calendar.DAY_OF_MONTH);
        
        System.out.println(currentYear);
        
        cal.setTime(sitter_birthdate);
        
        
        
        int birthYear  = cal.get(Calendar.YEAR);
        int birthMonth  = cal.get(Calendar.MONTH);
        int birthDay   = cal.get(Calendar.DAY_OF_MONTH);
        System.out.println(birthYear);
        // 만 나이 구하기 2022-1995=27 (현재년-태어난년)
        int age = currentYear - birthYear;
        // 만약 생일이 지나지 않았으면 -1
        if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) { 
       	 // 5월 26일 생은 526
            // 현재날짜 5월 25일은 525
            // 두 수를 비교 했을 때 생일이 더 클 경우 생일이 지나지 않은 것이다.
            age--;
        }    
       
		return age;
	}
	
}
