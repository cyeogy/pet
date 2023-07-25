package multi.com.pet;

import java.util.List;

import multi.com.pet.erp.MemberService;
import multi.com.pet.erp.SitterDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	MemberService service;
	
	@Autowired
	public HomeController(MemberService service) {
		super();
		this.service = service;
	}

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home(Model model) {
		List<SitterDTO> sitterlist = service.sitterList();
		model.addAttribute("sitterlist", sitterlist);
		return "home";
	}
	
	@RequestMapping(value="/top", method=RequestMethod.GET)
	public String footer() {
		return "/layout/top";
	}
	
	@RequestMapping(value="/menu/test.do", method=RequestMethod.GET)
	public String test() {
		return "test";
	}
}