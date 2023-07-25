package multi.com.pet.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	SqlSession sqlSession;
	
	@Autowired
	public ReviewDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	// insert
	@Override
	public int insert(ReviewDTO review) {
		System.out.println(review);
		return sqlSession.insert("mutli.com.pet.review.insert", review);
	}

	@Override
	public List<ReviewDTO> read() {
		List<ReviewDTO> list = sqlSession.selectList("mutli.com.pet.review.read");
		System.out.println("daoImpl " + list);
		return list;
	}

	@Override
	public int update(ReviewDTO review) {
		System.out.println(review);
		return sqlSession.update("mutli.com.pet.review.update", review);
	}

	@Override
	public int delete(String review_no) {
		return sqlSession.delete("mutli.com.pet.review.delete", review_no);
	}

	@Override
	public ReviewDTO read_update(String review_no) {
		return sqlSession.selectOne("mutli.com.pet.review.read_detail", review_no);
	}

	@Override
	public ReviewDTO read_detail(String review_no) {
		return sqlSession.selectOne("mutli.com.pet.review.read_detail", review_no);
	}

	@Override
	public ReviewDTO read_detail_ajax(String review_no) {
		ReviewDTO data = sqlSession.selectOne("mutli.com.pet.review.read_detail_ajax", review_no);
		System.out.println("data=> " + data);
		return data;
	}

	@Override
	public ReviewDTO read_detail_ajax_next(String review_no) {
		ReviewDTO data = sqlSession.selectOne("mutli.com.pet.review.read_detail_ajax_next", review_no);
		System.out.println("data=> " + data);
		return data;
	}
	
	@Override
	public ReviewDTO review_no_sitter(String sitter_id) {
		ReviewDTO review_no = sqlSession.selectOne("mutli.com.pet.review.review_no_sitter", sitter_id);
		return review_no;
	}

	

}
