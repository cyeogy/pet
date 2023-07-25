package multi.com.pet.review;

import java.util.List;

public interface ReviewDAO {
	// insert
	int insert(ReviewDTO review);
	
	ReviewDTO read_detail(String review_no);
	List<ReviewDTO> read();

	ReviewDTO read_update(String review_no);
	int update(ReviewDTO review);
	int delete(String review_no);

	// detail ajax
	ReviewDTO read_detail_ajax(String review_no);
	ReviewDTO read_detail_ajax_next(String review_no);
	
	// 가장 최근 후기
	ReviewDTO review_no_sitter(String sitter_id);

}
