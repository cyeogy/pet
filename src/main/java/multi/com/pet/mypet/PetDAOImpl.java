package multi.com.pet.mypet;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PetDAOImpl implements PetDAO {
	SqlSession sqlsession;

	@Autowired
	public PetDAOImpl(SqlSession sqlsession) {
		super();
		this.sqlsession = sqlsession;
	}

	@Override
	public int insert(PetDTO pet) {
		return sqlsession.insert("mutli.com.pet.mypet.insert", pet);
	}

	@Override
	public PetDTO read(String pet_id) {
		return sqlsession.selectOne("mutli.com.pet.mypet.read", pet_id);
	}

	@Override
	public int update(PetDTO pet) {
		return sqlsession.update("mutli.com.pet.mypet.update", pet);
	}

	@Override
	public int delete(String pet_id) {
		return sqlsession.delete("mutli.com.pet.mypet.delete", pet_id);
	}
	
	@Override public int insertFile(PetFileDTO pet) {
		System.out.println("PetDAOImpl PetFileDTO : " +pet);
		return sqlsession.insert("mutli.com.pet.review.fileinsert", pet); 
	}
}
