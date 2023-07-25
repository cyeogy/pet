package multi.com.pet.mypet;

public class PetFileDTO {
	private String petphoto;
	private String originalFilename;
	private String storeFilename;

	
	public PetFileDTO(){
	}
	
	public PetFileDTO(String originalFilename, String storeFilename) {
		super();
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
	}
	
	//boardfile의 상세정보 - insert

	
	//select
	public PetFileDTO(String petphoto, String originalFilename, String storeFilename) {
		super();
		this.petphoto = petphoto;
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
	}


	@Override
	public String toString() {
		return "PetFileDTO [petphoto=" + petphoto + ", originalFilename=" + originalFilename + ", storeFilename="
				+ storeFilename + "]";
	}

	public String getPetphoto() {
		return petphoto;
	}

	public void setPetphoto(String petphoto) {
		this.petphoto = petphoto;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getStoreFilename() {
		return storeFilename;
	}
	public void setStoreFilename(String storeFilename) {
		this.storeFilename = storeFilename;
	}
}
