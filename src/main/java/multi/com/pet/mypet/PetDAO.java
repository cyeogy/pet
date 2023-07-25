package multi.com.pet.mypet;

public interface PetDAO {
	// insert
	public int insert(PetDTO pet);
	
	// read
	public PetDTO read(String pet_id);
	
	// update
	public int update(PetDTO pet);
	
	// delete
	public int delete(String pet_id);

	public int insertFile(PetFileDTO pet); 
	
}
