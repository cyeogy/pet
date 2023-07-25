package multi.com.pet.review;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import multi.com.pet.etc.FileUploadLogic;
import multi.com.pet.resv.ResvDTO;
import multi.com.pet.resv.ResvService;
import multi.com.pet.erp.MemberService;

@Controller
public class ReviewController {
	FileUploadLogic fileUploadService;
	ReviewService service;
	ResvService rs;
	MemberService ms;
	
	@Autowired
	public ReviewController(FileUploadLogic fileUploadService, ReviewService service, ResvService rs, MemberService ms) {
		super();
		this.fileUploadService = fileUploadService;
		this.service = service;
		this.rs = rs;
		this.ms = ms;
	}
	
	// 게시판 글쓰기
	@RequestMapping(value = "/menu/review/write.do")
	public String review_write(String resv_no, Model model) {
		ResvDTO resv = rs.resvread(resv_no);
		System.out.println(resv);
		model.addAttribute("resv", resv);
		return "review/write";	
	}

	// 텍스트 + 파일 insert
	@RequestMapping(value = "/review/insert.do", method = RequestMethod.POST)
	public String insert(ReviewDTO review, HttpSession session) throws IllegalStateException, IOException {
		System.out.println("review==========:"+review);
		MultipartFile img = review.getReview_file();
		String path = WebUtils.getRealPath(session.getServletContext(), "/resources/review");
		ReviewDTO review_img = fileUploadService.ReviewUploadImg(review, img, path);
		int result = service.insert(review_img);
		if(result == 1) {
			ms.sitter_rate_update(review.getSitter_id(), review.getReview_rate());
		}
		return "redirect:/menu/review.do";
	}
	
	// 게시판 뷰
	@RequestMapping(value= "/menu/review.do", method = RequestMethod.GET)
	public ModelAndView read() {
		ModelAndView mav = new ModelAndView("review");
		List<ReviewDTO> readlist = service.read();
		System.out.println("reviewreadlist:"+readlist);
		mav.addObject("review", readlist);
		return mav;
	}
	
	// 	게시판 상세보기
	@RequestMapping(value= "/menu/review/detail.do", method = RequestMethod.GET)
	public ModelAndView read_detail(String review_no) {
		ModelAndView mav = new ModelAndView("review/read");
		ReviewDTO read = service.read_detail(review_no);
		mav.addObject("review", read);
		System.out.println("ReviewController read_detail");
		System.out.println(read);
		return mav;
	}
	
	// 게시판 상세 보기 중 왼쪽으로 이동 
	@RequestMapping(value ="/menu/review/ajax_detail_prev", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ReviewDTO ajax_prev(String review_no) {
		ReviewDTO review = service.read_detail_ajax(review_no);
		return review;
	}
	
	// 게시판 상세 보기 중 오른쪽으로 이동
	@RequestMapping(value ="/menu/review/ajax_detail_next", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ReviewDTO ajax_next(String review_no) {
		ReviewDTO review = service.read_detail_ajax_next(review_no);
		return review;
	}
	
	// 게시판 수정 뷰
	@RequestMapping(value ="/review/update_read.do", method = RequestMethod.GET )
	public ModelAndView read_update(String review_no) {
		ModelAndView mav = new ModelAndView("review/update");
		ReviewDTO read = service.read_update(review_no);
		mav.addObject("review", read);
		System.out.println("컨트롤러~~~~~ " + read);
		return mav;
	}
	
	// 게시판 수정 컨트롤러
	@RequestMapping(value = "/review/update.do", method = RequestMethod.POST)
	public String update(ReviewDTO review, HttpSession session) throws IOException {
		MultipartFile img = review.getReview_file();
		String path = WebUtils.getRealPath(session.getServletContext(), "/resources/review");
		ReviewDTO review_img = fileUploadService.ReviewUploadImg(review, img, path);
		int result = service.update(review_img);
		if(result == 1) {
			ms.sitter_rate_update(review.getSitter_id(), review.getReview_rate());
		}
		return "redirect:/menu/review/detail.do?review_no="+review.getReview_no();
	}
	
	// 게시판 글 삭제
	@RequestMapping("/review/delete.do")
	public String delete(String review_no) {
		int result = service.delete(review_no);
		return "redirect:/menu/review.do";
	}

	

	
}
