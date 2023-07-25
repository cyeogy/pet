package multi.com.pet.erp;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class LoginUserDTO {
	private String user_type;
	private String name;
	
	private String sitter_id;
	private String sitter_code;
	private String sitter_gender;
	private String sitter_email;
	private String sitter_phone;
	private String sitter_addr1;
	private String sitter_addr2;
	private Date sitter_startdate;
	private Date sitter_enddate;
	private String sitter_status;
	private Date sitter_birthdate;
	private String service_area;
	private String sitter_info;
	private String valid;
	private	String sitter_certificate;
	private	String sitter_rate;
	//추가 by 최여경 (01/15)
	private String sitter_age;
	//추가 (01/17)
		
	private String member_id;
	private String member_no; 
	// 필요 없는 테이블인 같음
	private String member_email;
	private String member_gender;
	private String member_phone;
	private String member_addr1;
	private String member_addr2;
	private MultipartFile member_photo;
	private Date start_date;
	private Date end_date;
	private String member_code;
	private String member_status;
	private String member_shortAddr;
	//멤버 생년월일 추가
	private Date member_birthdate;
	private int member_age;
	//동물병원 정보를 회원정보에 넣음
	private String hospital_name;
	private String hospital_addr;
	
	
	// 멤버용 (동물병원 수정)
	public LoginUserDTO(String user_type, String name, String member_id, String member_no, String member_gender, String member_email,
			String member_phone, String member_addr1, String member_addr2, MultipartFile member_photo, Date start_date,
			Date end_date, String member_code, String member_status, String hospital_name, String hospital_addr) {
		super();
		this.user_type = user_type;
		this.name = name;
		this.member_id = member_id;
		this.member_no = member_no;
		this.member_gender = member_gender;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_addr1 = member_addr1;
		this.member_addr2 = member_addr2;
		this.member_photo = member_photo;
		this.start_date = start_date;
		this.end_date = end_date;
		this.member_code = member_code;
		this.member_status = member_status;
		this.hospital_addr = hospital_addr;
		this.hospital_name = hospital_name;
	}
	
	// 시터용
	public LoginUserDTO(String user_type, String name, String sitter_id, String sitter_code, String sitter_gender, String sitter_email,
			String sitter_phone, String sitter_addr1, String sitter_addr2, Date sitter_startdate, Date sitter_enddate,
			String sitter_status, Date sitter_birthdate, String service_area, String sitter_info, String valid,
			String sitter_certificate, String sitter_rate) {
		super();
		this.user_type = user_type;
		this.name = name;
		this.sitter_id = sitter_id;
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
	}


	@Override
	public String toString() {
		return "LoginUserDTO [user_type=" + user_type + ", name=" + name + ", sitter_id=" + sitter_id + ", sitter_code="
				+ sitter_code + ", sitter_gender=" + sitter_gender + ", sitter_email=" + sitter_email
				+ ", sitter_phone=" + sitter_phone + ", sitter_addr1=" + sitter_addr1 + ", sitter_addr2=" + sitter_addr2
				+ ", sitter_startdate=" + sitter_startdate + ", sitter_enddate=" + sitter_enddate + ", sitter_status="
				+ sitter_status + ", sitter_birthdate=" + sitter_birthdate + ", service_area=" + service_area
				+ ", sitter_info=" + sitter_info + ", valid=" + valid + ", sitter_certificate=" + sitter_certificate
				+ ", sitter_rate=" + sitter_rate + ", sitter_age=" + sitter_age + ", member_id=" + member_id
				+ ", member_no=" + member_no + ", member_email=" + member_email + ", member_gender=" + member_gender
				+ ", member_phone=" + member_phone + ", member_addr1=" + member_addr1 + ", member_addr2=" + member_addr2
				+ ", member_photo=" + member_photo + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", member_code=" + member_code + ", member_status=" + member_status + ", member_shortAddr="
				+ member_shortAddr + ", member_birthdate=" + member_birthdate + ", member_age=" + member_age
				+ ", hospital_name=" + hospital_name + ", hospital_addr=" + hospital_addr + "]";
	}

	public String getUser_type() {
		return user_type;
	}
	
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public LoginUserDTO(String name) {
		super();
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getSitter_rate() {
		return sitter_rate;
	}

	public void setSitter_rate(String sitter_rate) {
		this.sitter_rate = sitter_rate;
	}

	public String getSitter_id() {
		return sitter_id;
	}

	public void setSitter_id(String sitter_id) {
		this.sitter_id = sitter_id;
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

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_no() {
		return member_no;
	}

	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_addr1() {
		return member_addr1;
	}

	public void setMember_addr1(String member_addr1) {
		this.member_addr1 = member_addr1;
	}

	public String getMember_addr2() {
		return member_addr2;
	}

	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}

	public MultipartFile getMember_photo() {
		return member_photo;
	}

	public void setMember_photo(MultipartFile member_photo) {
		this.member_photo = member_photo;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getMember_code() {
		return member_code;
	}

	public void setMember_code(String member_code) {
		this.member_code = member_code;
	}

	public String getMember_status() {
		return member_status;
	}

	public void setMember_status(String member_status) {
		this.member_status = member_status;
	}
	
	public String getMember_shortAddr() {
		return member_shortAddr;
	}
	
	public void setMember_shortAddr(String member_shortAddr) {
		this.member_shortAddr = member_shortAddr;
	}

	public Date getMember_birthdate() {
		return member_birthdate;
	}

	public void setMember_birthdate(Date member_birthdate) {
		this.member_birthdate = member_birthdate;
	}
	

	public String getSitter_age() {
		return sitter_age;
	}

	public void setSitter_age(String sitter_age) {
		this.sitter_age = sitter_age;
	}

	public int getMember_age() {
		return member_age;
	}

	public void setMember_age(int member_age) {
		this.member_age = member_age;
	}

	public String getHospital_name() {
		return hospital_name;
	}

	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}

	public String getHospital_addr() {
		return hospital_addr;
	}

	public void setHospital_addr(String hospital_addr) {
		this.hospital_addr = hospital_addr;
	}

	public String createShortAddr() {
		String newAddr = member_addr1;
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
		return shortAddr;
	}
		
	
}
