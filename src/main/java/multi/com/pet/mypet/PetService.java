package multi.com.pet.mypet;

public interface PetService {
	// insert
	public int insert(PetDTO pet);
	public int insertfile(PetFileDTO pet);
	
	// read
	public PetDTO read(String pet_id);
	
	// update
	public int update(PetDTO pet);
	
	// delete
	public int delete(String pet_id);
	
	
}
