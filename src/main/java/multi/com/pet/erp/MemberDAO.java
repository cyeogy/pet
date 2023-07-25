package multi.com.pet.erp;

import java.util.List;

import multi.com.pet.mypet.PetDTO;
import multi.com.pet.resv.ResvDTO;

public interface MemberDAO {
	// 로그인 (멤버)
	MemberDTO login(MemberDTO loginUserInfo);
	SitterDTO login(SitterDTO loginUserInfo);
	List<PetDTO> petList(MemberDTO loginUserInfo);
	List<PetDTO> petList(String member_id);
	List<ResvDTO> resvlist(String member_id);
	List<ResvDTO> sitter_resvlist(String sitter_id);

	// 아이디 중복 확인
	MemberDTO idcheck(String id);
	SitterDTO sitteridcheck(String id);
	
	// 읽기
	MemberDTO member_read(String member_id);
	SitterDTO sitter_read(String sitter_id);
	
	// 업데이트
	int update(SitterDTO sitter);
	int update(SitterImgDTO sitter_img);
	int certi_update(SitterDTO sitter);
	int update(MemberDTO member);

	// 등록
	int insert(SitterDTO sitter);
	int insert(MemberDTO member);
	
	// 삭제
	int delete(SitterDTO sitter);
	int delete(MemberDTO member);
	
	// sitter list
	List<SitterDTO> sitterList();
	
	// sitter rate
	double sitter_rate_update(SitterDTO sitter);
	
	// sitter_rate
	List<ResvDTO> sitter_reviewlist(String sitter_id);
	
}