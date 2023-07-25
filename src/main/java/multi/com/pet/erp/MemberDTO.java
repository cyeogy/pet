package multi.com.pet.erp;

import java.sql.Date;
import java.util.Calendar;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
	private String user_type;
	private String member_id;
	private String member_pass;
	private String member_no;
	private String member_name;
	private String member_gender;
	private String member_email;
	private String member_phone;
	private String member_addr1;
	private String member_addr2;
	private MultipartFile member_photo;
	private Date start_date;
	private Date end_date;
	private String member_code;
	private String member_status;
	
	//필요해서 추가함 by 최여경
	private String member_shortAddr; //00특별시 00구와 같은 주소 문자열 변수
	
	//필요해서 추가함 by 최여경 (01/15)
	private Date member_birthdate; //이용자의 생년월일
	private int member_age;

	//동물병원 정보를 회원정보에 넣음
	private String hospital_name;
	private String hospital_addr;
	
	public MemberDTO() {
		super();
	}
	
	public MemberDTO(String user_type, String member_id, String member_pass, String member_no, String member_name,
			String member_gender, String member_email, String member_phone, String member_addr1, String member_addr2,
			MultipartFile member_photo, Date start_date, Date end_date, String member_code, String member_status) {
		super();
		this.user_type = user_type;
		this.member_id = member_id;
		this.member_pass = member_pass;
		this.member_no = member_no;
		this.member_name = member_name;
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
	}


	@Override
	public String toString() {
		return "MemberDTO [user_type=" + user_type + ", member_id=" + member_id + ", member_pass=" + member_pass
				+ ", member_no=" + member_no + ", member_name=" + member_name + ", member_gender=" + member_gender
				+ ", member_email=" + member_email + ", member_phone=" + member_phone + ", member_addr1=" + member_addr1
				+ ", member_addr2=" + member_addr2 + ", member_photo=" + member_photo + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", member_code=" + member_code + ", member_status=" + member_status
				+ ", member_shortAddr=" + member_shortAddr + ", member_birthdate=" + member_birthdate + ", member_age="
				+ member_age + ", hospital_name=" + hospital_name + ", hospital_addr=" + hospital_addr + "]";
	}
	
	public String getUser_type() {
		return user_type;
	}
	
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}	

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pass() {
		return member_pass;
	}

	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}

	public String getMember_no() {
		return member_no;
	}

	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
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

	//나이 구하는 메소드
	public  int  calcAge() {
		 Calendar cal = Calendar.getInstance();
	        
        int currentYear  = cal.get(Calendar.YEAR);
        int currentMonth = cal.get(Calendar.MONTH) + 1;
        int currentDay   = cal.get(Calendar.DAY_OF_MONTH);
        
        System.out.println(currentYear);
        
        cal.setTime(member_birthdate);
  
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
