package multi.com.pet.erp;

import java.util.List;

import multi.com.pet.mypet.PetDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import multi.com.pet.resv.ResvDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	SqlSession sqlSession;
	
	@Autowired
	public MemberDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	// login - member
	@Override
	public MemberDTO login(MemberDTO loginUserInfo) {
		return sqlSession.selectOne("mutli.com.pet.erp.user_login", loginUserInfo); 
	}

	// login - pet
	@Override
	public List<PetDTO> petList(MemberDTO loginUserInfo) {
		return sqlSession.selectList("mutli.com.pet.mypet.mypet1", loginUserInfo);
	}
	
	@Override
	public List<PetDTO> petList(String member_id) {
		return sqlSession.selectList("mutli.com.pet.mypet.mypet2", member_id);
	}
	
	// login - sitter
	@Override
	public SitterDTO login(SitterDTO loginUserInfo) {
		return sqlSession.selectOne("mutli.com.pet.erp.sitter_login", loginUserInfo);
	}
	
	// read - member
	@Override
	public MemberDTO member_read(String member_id) {
		return sqlSession.selectOne("mutli.com.pet.erp.member_read", member_id);
	}

	// read - sitter
	@Override
	public SitterDTO sitter_read(String sitter_id) {
		return sqlSession.selectOne("mutli.com.pet.erp.sitter_read", sitter_id);
	}

	// update
	@Override
	public int update(SitterDTO sitter) {
		return sqlSession.update("mutli.com.pet.erp.sitter_update", sitter);
	}
	@Override
	public int update(SitterImgDTO sitter_img) {
		return sqlSession.update("mutli.com.pet.erp.sitter_img_update", sitter_img);
	}
	@Override
	public int certi_update(SitterDTO sitter) {
		return sqlSession.update("mutli.com.pet.erp.sitter_certi_update", sitter);
	}

	public int update(MemberDTO member) {
		return sqlSession.update("mutli.com.pet.erp.member_update", member);
	}
	
	// insert
	@Override
	public int insert(SitterDTO sitter) {
		System.out.println("#####"+sitter);
		return sqlSession.insert("mutli.com.pet.erp.sitter_insert", sitter);
	}

	@Override
	public int insert(MemberDTO member) {
		return sqlSession.update("mutli.com.pet.erp.member_insert", member);
	}

	// delete
	@Override
	public int delete(SitterDTO sitter) {
		return sqlSession.update("mutli.com.pet.erp.sitter_delete", sitter);
	}
				
	@Override
	public int delete(MemberDTO member) {
		return sqlSession.update("mutli.com.pet.erp.member_delete", member);
	}

	@Override
	public List<SitterDTO> sitterList() {
		List<SitterDTO> sitterlist = sqlSession.selectList("mutli.com.pet.erp.sitterList");
		return sitterlist;
	}

	@Override
	public MemberDTO idcheck(String id) {
		return sqlSession.selectOne("mutli.com.pet.erp.idcheck", id);
	}
	
	@Override
	public SitterDTO sitteridcheck(String id) {
		return sqlSession.selectOne("mutli.com.pet.erp.sitteridcheck", id);
	}

	// 예약 리스트
	@Override
	public List<ResvDTO> resvlist(String member_id) {
		return sqlSession.selectList("mutli.com.pet.erp.resvlist", member_id);
	}
	@Override
	public List<ResvDTO> sitter_resvlist(String sitter_id) {
		return sqlSession.selectList("mutli.com.pet.erp.sitter_resvlist", sitter_id);
	}
	@Override
	public List<ResvDTO> sitter_reviewlist(String sitter_id) {
		return sqlSession.selectList("mutli.com.pet.erp.sitter_reviewlist", sitter_id);
	}

	// sitter rate update
	@Override
	public double sitter_rate_update(SitterDTO sitter) {
		return sqlSession.update("mutli.com.pet.erp.sitter_rate_update", sitter);
	}
	
	

	
}
