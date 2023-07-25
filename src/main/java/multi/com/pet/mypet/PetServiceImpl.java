package multi.com.pet.mypet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PetServiceImpl implements PetService {
	PetDAO dao;

	@Autowired
	public PetServiceImpl(PetDAO dao) {
		super();
		this.dao = dao;
	}

	@Override
	public int insert(PetDTO pet) {
		return dao.insert(pet);
	}

	@Override
	public PetDTO read(String pet_id) {
		return dao.read(pet_id);
	}

	@Override
	public int update(PetDTO pet) {
		return dao.update(pet);
	}

	@Override
	public int delete(String pet_id) {
		return dao.delete(pet_id);
	}

	@Override
	public int insertfile(PetFileDTO pet) {
		System.out.println("PetServiceImpl PetFileDTO : " +pet);
		return dao.insertFile(pet);
	}
}
