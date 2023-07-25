package multi.com.pet.erp;

import java.util.List;

import multi.com.pet.mypet.PetDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import multi.com.pet.resv.ResvDTO;

@Service
public class MemberServiceImpl implements MemberService {
	MemberDAO dao;
	
	@Autowired
	public MemberServiceImpl(MemberDAO dao) {
		super();
		this.dao = dao;
	}
	
	// login - member
	@Override
	public MemberDTO login(MemberDTO loginUserInfo) {
		MemberDTO user = dao.login(loginUserInfo);
		return user;
	}

	// login - sitter
	@Override
	public SitterDTO login(SitterDTO loginUserInfo) {
		SitterDTO user = dao.login(loginUserInfo);
		return user;
	}

	// login - pet
	@Override
	public List<PetDTO> petList(MemberDTO loginUser) {
		return dao.petList(loginUser);

	}
	
	@Override
	public List<PetDTO> petList(String member_id) {
		return dao.petList(member_id);
	}
	
	// read - sitter
	@Override
	public SitterDTO sitter_read(String sitter_id) {
		return dao.sitter_read(sitter_id);
	}
	
	// read - member
	@Override
	public MemberDTO member_read(String member_id) {
		return dao.member_read(member_id);
	}
	
	// update
	@Override
	public int update(SitterDTO sitter) {
		return dao.update(sitter);
	}

	@Override
	public int certi_update(SitterDTO sitter) {
		return dao.certi_update(sitter);
	}

	@Override
	public int update(MemberDTO member) {
		return dao.update(member);
	}
	
	// insert
	@Override
	public int insert(SitterDTO sitter) {
		return dao.insert(sitter);
	}

	@Override
	public int insert(MemberDTO member) {
		return dao.insert(member);
	}

	// delete
	@Override
	public int delete(SitterDTO sitter) {
		return dao.delete(sitter);
	}

	@Override
	public int delete(MemberDTO member) {
		return dao.delete(member);
	}

	@Override
	public List<SitterDTO> sitterList() {
		
		
		return dao.sitterList();
	}

	@Override
	public MemberDTO idcheck(String id) {
		return dao.idcheck(id);
	}
	
	@Override
	public SitterDTO sitteridcheck(String id) {
		return dao.sitteridcheck(id);
	}

	@Override
	public List<ResvDTO> resvlist(String member_id) {
		return dao.resvlist(member_id);
	}

	@Override
	public List<ResvDTO> sitter_resvlist(String sitter_id) {
		return dao.sitter_resvlist(sitter_id);
	}

	@Override
	public double sitter_rate_update(String sitter_id, String review_rate) {
		// 분모

		double denominator = dao.sitter_reviewlist(sitter_id).size(); 
		System.out.println("denominator:"+denominator);
		// 분자
		double tmp1;
		String tmp3 = null;
		try {
			tmp3 = dao.sitter_read(sitter_id).getSitter_rate();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		if(tmp3 == null) {
			tmp1 = 0;
		}else {
			tmp1 = Double.valueOf(tmp3);
		}
		double tmp2 = Integer.parseInt(review_rate); // 후기가 0개 // 후기가 1개
		double numerator = (tmp1 * (denominator - 1) + tmp2);
		System.out.println(tmp1);
		System.out.println(tmp2);
		System.out.println(tmp3); //null
		System.out.println(denominator);
		
		// sitter_rate
		String rate = String.valueOf(numerator / (double)denominator);
		
		//double rate = numerator / (double)denominator;
		System.out.println(rate);
		SitterDTO sitter_rate = new SitterDTO(sitter_id, rate);
		System.out.println(sitter_rate);
		return dao.sitter_rate_update(sitter_rate);
	}
	
	
	

}
