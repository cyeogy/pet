package multi.com.pet.review;

public class ReviewFileDTO {
	private String review_no;
	private String originalFilename;
	private String storeFilename;
	private String reviewFileno;

	
	public ReviewFileDTO() {
	}
	
	public ReviewFileDTO(String originalFilename, String storeFilename) {
		super();
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
	}
	
	//boardfile의 상세정보 - insert
	public ReviewFileDTO(String originalFilename, String storeFilename, String reviewFileno) {
		super();
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
		this.reviewFileno = reviewFileno;
	}
	
	//select
	public ReviewFileDTO(String review_no, String originalFilename, String storeFilename, String reviewFileno) {
		super();
		this.review_no = review_no;
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
		this.reviewFileno = reviewFileno;
	}


	@Override
	public String toString() {
		return "ReviewFileDTO [review_no=" + review_no + ", originalFilename=" + originalFilename + ", storeFilename="
				+ storeFilename + ", reviewFileno=" + reviewFileno + "]";
	}

	public String getReview_no() {
		return review_no;
		
	}

	public void setReview_no(String review_no) {
		this.review_no = review_no;
	}

	public String getReviewFileno() {
		return reviewFileno;
	}

	public void setReviewFileno(String reviewFileno) {
		this.reviewFileno = reviewFileno;
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
