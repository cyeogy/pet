package multi.com.pet.etc;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import multi.com.pet.erp.SitterDTO;
import multi.com.pet.mypet.PetDTO;
import multi.com.pet.review.ReviewDTO;

@Service
public class FileUploadLogic {
	
//	Sitter Img 삽입
	public SitterDTO sitterUploadimg(SitterDTO sitter, MultipartFile file, String path) throws IllegalStateException, IOException{
		String originalFileName = file.getOriginalFilename();
		String storeFileName = createStoreFileName(originalFileName);
		file.transferTo(new File(path + File.separator + storeFileName));
		SitterDTO sitter_img  = new SitterDTO(sitter.getSitter_id(), sitter.getSitter_name(), sitter.getSitter_code(), sitter.getSitter_pass(), sitter.getSitter_gender(),
				sitter.getSitter_email(), sitter.getSitter_phone(), sitter.getSitter_addr1(), sitter.getSitter_addr2(), sitter.getSitter_birthdate(),
				sitter.getService_area(), sitter.getSitter_info(), sitter.getValid(), sitter.getSitter_certificate(), storeFileName);
		return sitter_img;
	}
	
//	Pet Img 삽입
	public PetDTO petUploadImg(PetDTO pet, MultipartFile file, String path) throws IllegalStateException, IOException{
		String originalFileName = file.getOriginalFilename();
		String storeFileName = createStoreFileName(originalFileName);
		file.transferTo(new File(path + File.separator + storeFileName));
		PetDTO pet_img = new PetDTO(pet.getPet_id(), pet.getMember_id(), pet.getPet_name(), pet.getPet_gender(), pet.getPet_code(), pet.getPet_kind(),
				pet.getPet_birthdate(), pet.getPet_weight(), pet.getPet_size(), pet.getNeuter(), storeFileName, pet.getPet_note(), pet.getPet_number());
		return pet_img;
	}

//	Review Img 삽입
	public ReviewDTO ReviewUploadImg(ReviewDTO review, MultipartFile file, String path) throws IllegalStateException, IOException{
		String originalFileName = file.getOriginalFilename();
		String storeFileName = createStoreFileName(originalFileName);
		file.transferTo(new File(path + File.separator + storeFileName));
		ReviewDTO review_img = new ReviewDTO(review.getReview_no(), review.getMember_id(), review.getReview(), review.getResv_no(), storeFileName, review.getReview_rate(), review.getMember_addr1(), review.getMember_photo(), review.getSitter_id());
		return review_img; 
	}
	
	private String createStoreFileName(String originalFileName) {
		int pos = originalFileName.lastIndexOf(".");
		String ext = originalFileName.substring(pos + 1);
		String uuId = UUID.randomUUID().toString();
		return uuId + "." + ext;
	}

}
