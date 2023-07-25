package multi.com.pet;

import java.util.List;

import multi.com.pet.erp.SitterDTO;
import multi.com.pet.erp.SitterImgDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
	AdminDAO dao;
	
	@Autowired
	public AdminServiceImpl(AdminDAO dao) {
		super();
		this.dao = dao;
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
	public int update(String valid_data,String sitter_id) {
		// TODO Auto-generated method stub
		return dao.update(valid_data, sitter_id);
	}

	@Override
	public List<SitterDTO> search(String data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SitterDTO> search(String category, String search_val) {
		// TODO Auto-generated method stub
		return dao.search(category, search_val);
	}

	@Override
	public List<SitterDTO> findByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SitterDTO> sitterList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SitterDTO read(String sitter_id) {
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
	public List<SitterDTO> titlesearch(String tag, String data) {
		System.out.println("tag-----"+tag);
		System.out.println("data===="+data);
		return dao.titlesearch(tag, data);
	}
	//관리자페이지 처음 들어갔을 때 시터 목록 조회
	@Override
	public List<SitterDTO> adminList() {
		return dao.adminList();
	}

}
