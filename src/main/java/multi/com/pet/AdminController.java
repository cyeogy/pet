package multi.com.pet;

import java.util.List;

import multi.com.pet.erp.MemberService;
import multi.com.pet.erp.SitterDTO;
import multi.com.pet.mypet.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {
	MemberService memeber_service;
	PetService pet_service;
	AdminService admin_service;
	@Autowired
	public AdminController(MemberService memeber_service, PetService pet_service, AdminService admin_servieService) {
		super();
		this.memeber_service = memeber_service;
		this.pet_service = pet_service;
		this.admin_service = admin_servieService;
	}
	//3. 서비스를 상속하는 serviceImpl만들고
	//4. dao를 상속하는 daoImpl에 메소드만들기
	//5. mapper에 sql명령어 추가
	//   => board.xml에서 update부분을 참고해서 만들

	@RequestMapping(value="/valid/update.do", method=RequestMethod.GET)
	public String valid_update(String valid_data,String sitter_id) {
		System.out.println(valid_data+","+sitter_id);
		String msg = "";
		admin_service.update(valid_data,sitter_id);
		if(valid_data.equals("1")) {
			msg = "1";
			System.out.println("승인");
		}else {
			msg = "0";
			System.out.println("미승인");
		}
		return "redirect:/erp/admin.do";
	}
	/*
	 * @RequestMapping(value = "/admin/popup", method = RequestMethod.GET) public
	 * String adminpop() { return null; }
	 */
	@RequestMapping("/search.do")
	public ModelAndView search(String category,String search_val) {
		System.out.println("search컨트롤러");
		ModelAndView mav = new ModelAndView("mypage/admin");
		List<SitterDTO> sitterlist = admin_service.search(category,search_val);
		System.out.println(sitterlist);
		
		//전체 펫시터 목록 가져오기
		List<SitterDTO> totallist = admin_service.adminList();
		
		
		int total = totallist.size();
		int atotal = 0;//valid가 1인 경우
		int untotal = 0;
		for(int i=0; i<totallist.size();i++) {
			SitterDTO sDto =  totallist.get(i);
			System.out.println(sDto);
			if(sDto.getValid().equals("1")) {
				System.out.println("활동승인");
				atotal++;
			}else  {
				System.out.println("미승인");
				untotal++;
			}
			
		}
		
		mav.addObject("sitterlist", sitterlist);
		mav.addObject("total",total);
		mav.addObject("atotal",atotal);
		mav.addObject("untotal",untotal);
		System.out.println("tag-----"+category);
		System.out.println("data===="+search_val);
		return mav;
	}
	@RequestMapping(value = "/admin/ajax/list.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<SitterDTO> ajaxlist(String category) {
		System.out.println("category=>"+category);
		
		List<SitterDTO> sitterlist = admin_service.findByCategory(category);
		System.out.println("ajax통신:"+sitterlist);
		return sitterlist;
	}
	
}