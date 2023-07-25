package multi.com.pet.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	ReviewDAO dao;
	
	@Autowired
	public ReviewServiceImpl(ReviewDAO dao) {
		super();
		this.dao = dao;
	}
	
	@Override
	public int insert(ReviewDTO review) {
		System.out.println(review);
		return dao.insert(review);
	}
	
	@Override
	public List<ReviewDTO> read() {
		return dao.read();
	}

	@Override
	public int update(ReviewDTO review) {
		return dao.update(review);	
		}

	@Override
	public int delete(String review_no) {
		return dao.delete(review_no);
	}
	
	@Override
	public ReviewDTO read_update(String review_no) {
		return dao.read_update(review_no);
	}
	
	@Override
	public ReviewDTO read_detail(String review_no) {
		return dao.read_detail(review_no);
	}
	
	@Override
	public ReviewDTO read_detail_ajax(String review_no) {
		System.out.println("Service read_detail_ajax");
		return dao.read_detail_ajax(review_no);
	}

	@Override
	public ReviewDTO read_detail_ajax_next(String review_no) {
		return dao.read_detail_ajax_next(review_no);
	}

	@Override
	public ReviewDTO review_no_sitter(String sitter_id) {
		return dao.review_no_sitter(sitter_id);
	}
	
	
}
