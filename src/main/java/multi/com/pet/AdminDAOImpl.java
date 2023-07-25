package multi.com.pet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import multi.com.pet.erp.SitterDTO;
import multi.com.pet.erp.SitterImgDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {
	SqlSession sqlSession;
	
	public AdminDAOImpl() {
		
	}
	@Autowired
	public AdminDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public List<SitterDTO> sitterList() {
		List<SitterDTO> sitterlist = sqlSession.selectList("mutli.com.pet.erp.sitterList");
		System.out.println(sitterlist);
		return sitterlist;
	}

	@Override
	public SitterDTO read(String sitter_id) {
		
		return sqlSession.selectOne("mutli.com.pet.erp.sitter_read", sitter_id);
	}

	@Override
	public int update(String valid_data,String sitter_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("valid", valid_data);
		map.put("id", sitter_id);
		return sqlSession.update("mutli.com.pet.update", map);
	}

	@Override
	public List<SitterDTO> search(String category, String search_val) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("search_val", search_val);
		
		return sqlSession.selectList("mutli.com.pet.dynamicSearch",map);
	}

	@Override
	public List<SitterDTO> findByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<SitterDTO> search(String data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(SitterDTO sitter, List<SitterImgDTO> sitterfiledtolist) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public SitterDTO getsitterInfo(String sitter_id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int delete(String sitter_id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<SitterImgDTO> getFileList(String sitter_id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public SitterImgDTO getFile(SitterImgDTO sitterinputdata) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<SitterDTO> sitterlList() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public SitterDTO getSitterInfo(String sitter_id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<SitterDTO> titlesearch(String tag, String data) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("tag", tag);
		map.put("data", data);
		System.out.println("tag-----"+tag);
		System.out.println("data===="+data);
		return sqlSession.selectList("mutli.com.pet.dynamicSearch",map);
	}
	@Override
	public List<SitterDTO> adminList() {
		return sqlSession.selectList("mutli.com.pet.adminList");
	}

}
