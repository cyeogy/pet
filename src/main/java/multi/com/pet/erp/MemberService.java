package multi.com.pet.erp;

import java.util.List;

import multi.com.pet.mypet.PetDTO;
import multi.com.pet.resv.ResvDTO;

public interface MemberService {
	// 로그인
	MemberDTO login(MemberDTO loginUser);
	SitterDTO login(SitterDTO loginUser);
	List<PetDTO> petList(MemberDTO loginUser);
	List<PetDTO> petList(String member_id);
	List<ResvDTO> resvlist(String member_id);
	List<ResvDTO> sitter_resvlist(String sitter_id);

	// id check
	MemberDTO idcheck(String id);
	SitterDTO sitteridcheck(String id);
	
	// 읽기
	MemberDTO member_read(String member_id);
	SitterDTO sitter_read(String sitter_id);
	
	// 업데이트
	int update(SitterDTO sitter);
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
	double sitter_rate_update(String sitter_id, String review_rate);
	
}
