package multi.com.pet.resv;

import java.util.List;

import multi.com.pet.erp.LoginUserDTO;
import multi.com.pet.erp.SitterDTO;
import multi.com.pet.review.ReviewDTO;

public interface ResvService {
	//선호하는 펫시터 불러오기기
	List<SitterDTO> directlist(String gender, String size, String code, String shortAddr);
	//자동매칭
	List<SitterDTO> autolist(String gender, String size, String code, String shortAddr);
	//과거에 이용했던 펫시터들 불러오기
	List<SitterDTO> pastlist(String code, String member_id, String shortAddr);
	SitterDTO readSitter(String sitter_id);
	//자동매칭 외 방법 insert
	int insert(ResvDTO resvdto);
	//자동매칭 insert
	//int autoinsert(ResvDTO resvdto);
	List<ResvDTO> resvlist(LoginUserDTO user);
	
	//예약번호로 예약 정보 받아오기
	ResvDTO resvread(String resv_no);
	
	//예약상태 갱신
	int changeStatus();
	//예약취소
	int cancelResv(String resv_no, LoginUserDTO user);
	//예약신청 승인(시터가 이용자가 신청한 매칭을 승인해줌)
	int approve(String resv_no, String sitter_id);

	/*
	 * //자동매칭을 승인한 경우 나머지 자동매칭내약예약들을 없앰 int autochange(ResvDTO resvdto);
	 */
	//예약리스트를 매개변수로 받아서 각각의 예약내역의 이용후기 여부를 확인
	public List<String> checkReview(List<ResvDTO> resvdto);
	//예약번호로 리뷰상세페이지 열기
	//돌봄완료된 시터의 해당 경력 1씩 증가시키고 해당 예약내역의 resv_status를 5로 바꾸기
	public int updateFinish(); 
	public ReviewDTO readReview(String resv_no);
	//top에 추가할 new 의 근거
	public List<ResvDTO> readStatus(String sitter_id);

	
}
