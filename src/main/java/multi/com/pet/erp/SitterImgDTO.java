package multi.com.pet.erp;

public class SitterImgDTO {
	private String sitter_id;
	private String originalImgName;
	private String storeImgName;
	
	public SitterImgDTO() {
		super();
	}

	public SitterImgDTO(String sitter_id, String originalImgName, String storeImgName) {
		super();
		this.sitter_id = sitter_id;
		this.originalImgName = originalImgName;
		this.storeImgName = storeImgName;
	}

	@Override
	public String toString() {
		return "SitterImgDTO [sitter_id=" + sitter_id + ", originalImgName=" + originalImgName + ", storeImgName="
				+ storeImgName + "]";
	}

	public String getSitter_id() {
		return sitter_id;
	}

	public void setSitter_id(String sitter_id) {
		this.sitter_id = sitter_id;
	}

	public String getOriginalImgName() {
		return originalImgName;
	}

	public void setOriginalImgName(String originalImgName) {
		this.originalImgName = originalImgName;
	}

	public String getStoreImgName() {
		return storeImgName;
	}

	public void setStoreImgName(String storeImgName) {
		this.storeImgName = storeImgName;
	}

}
