package multi.com.pet.resv;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import multi.com.pet.erp.LoginUserDTO;
import multi.com.pet.erp.MemberDTO;
import multi.com.pet.erp.MemberService;
import multi.com.pet.erp.SitterDTO;
import multi.com.pet.mypet.PetDTO;
import multi.com.pet.mypet.PetService;
import multi.com.pet.review.ReviewService;

@Controller
public class ResvController {
	ResvService service;
	ReviewService reviewservice;
	MemberService mbservice;
	PetService petservice;
	
	@Autowired
	public ResvController(ResvService service, ReviewService reviewservice, MemberService mbservice, PetService petservice) {
		super();
		this.service = service;
		this.reviewservice = reviewservice;
		this.mbservice = mbservice;
		this.petservice = petservice;
	}
	

	@RequestMapping("/reserve/resv1_mb.do")
	public String resv1(ResvDTO resvdto, String servicecode, String pet_idlist, String pet_codelist,  HttpSession session, Model model) {
		//첫번째 예약 1화면에서 입력한 데이터를 불러와서 가공한 다음 예약dto에 저장해서 예약2화면으로 넘기는 곳 
		//servicecode : 서비스선택에서 돌봄/목욕/산책/미용 중에서 선택한 서비스의 값을 total_price에 셋팅해준다
		System.out.println("resv1컨트롤러");
		System.out.println(resvdto);
		System.out.println(servicecode);
		System.out.println(pet_idlist);
		System.out.println(pet_codelist);
		
		//servicecode : 서비스선택에서 돌봄/목욕/산책/미용 중에서 선택한 서비스의 값을 total_price에 셋팅해준다	
		if(servicecode.contains("bath_service")) {
			resvdto.setBath_service('Y');
			resvdto.setTotal_price(resvdto.getTotal_price()+5000);
		}
		if(servicecode.contains("walk_service")) {
			resvdto.setWalk_service('Y');
			resvdto.setTotal_price(resvdto.getTotal_price()+3000);
		}
		if(servicecode.contains("beauty_service")) {
			resvdto.setBeauty_service('Y');
			resvdto.setTotal_price(resvdto.getTotal_price()+5000);
		}
		

		//시작시간+서비스시간 = 종료시간 설정
		int endtime= resvdto.getService_starttime()+resvdto.getService_time();
		resvdto.setService_endtime(endtime);

		//pet_codelist에 DOG, CAT 둘다 포함이 되어있으면(서비스를 맡길 반려동물의 종), 설정한 codearray를 모델에 넣어준다
		if(pet_codelist.contains("CAT")&&pet_codelist.contains("DOG")) {
			model.addAttribute("pet_codearray", "A");
		}else if(pet_codelist.contains("CAT")) {//고양이만 맡긴다면
			model.addAttribute("pet_codearray", "C");
		}else {//강아지만 맡긴다면
			model.addAttribute("pet_codearray", "D");
		}

		System.out.println(resvdto);
		
		//resvdto를 가지고 지정뷰로 이동
		model.addAttribute("resvdto", resvdto);
		
		return "resv/resv_2";
	}



	@RequestMapping("/reserve/resv2_mb.do")
	public String resv2(ResvDTO resvdto, String codearray, Model model, HttpSession session) {
		//매칭방법과 선호성별, 선호사이즈, 서비스에 맡길 동물종을 가져온다(자동매칭은 시터가 아직 안정해져있어서 선택x)
		//codearray는 강아지만 맡긴다면 'D', 고양이만 맡긴다면 'C', 둘다맡긴다면 'A'
		//직접선택과 과거에 이용했던 펫시터는 시터를 이미 한 명 정했기 때문에 선택한 시터아이디가 이미 예약 정보에 담겨있다.

		//자동매칭인경우
		if(resvdto.getMatch_method().equals("auto_match")) {
			String gender  = "";
			if(resvdto.getPrefer_gender().equals("male")) {//예약2페이지에서 선택한 선호성별이 남성일경우
				gender = "M";
			}else if(resvdto.getPrefer_gender().equals("female")) {//여성일경우
				gender = "F";
			}else {// 상관없을 경우
				gender = "A";
			}
			
			String size ="";
			if(!codearray.equals("C")) {//선호하는 돌봄경험횟수의 동물사이즈가
				if(resvdto.getPrefer_size().equals("small")) {//소형견일경우
					size = "S";
				}else if(resvdto.getPrefer_size().equals("medium")) {//중형견일경우
					size = "M";
				}else if(resvdto.getPrefer_size().equals("large")){//대형견일경우
					size = "L";
				}else {//상관없을 경우
					size = "A";
				}
			}	
			String code = codearray; //codearray(서비스를 맡길 동물종류를 code라는 새변수에 담는다)
			System.out.println("code:"+code);
			//세션에서 로그인한 유저정보를 가져온다
			LoginUserDTO user = (LoginUserDTO)session.getAttribute("user");
			//해당 아이디로 이용자 객체를 가져온다
			MemberDTO member = mbservice.member_read(user.getMember_id());
			//주소를 간략하게 만드는 메소드(서울특별시 강남구.... -> 서울 강남구)를 이용하여 짧은 주소를 가져온다
			String shortAddr = member.createShortAddr();
			//위의 선호하는 성별, 사이즈, 서비스에 맡길 동물종류, 짧은 주소를 이용해서 해당되는 시터리스트를 가져온다.
			List<SitterDTO> sitterlist = service.autolist(gender, size, code, shortAddr);
			//위의 시터리스트에서 for문을 돌려서 해당되는 시터아이디들을 [sitterid1, sitterid2..]형식으로 문자열로 만들어준다.
			String sitteridlist = "";
			if(sitterlist.size()!=0) {
				sitteridlist += sitterlist.get(0).getSitter_id();
				for(int i=1; i<sitterlist.size(); i++) {
					sitteridlist += "," + sitterlist.get(i).getSitter_id();
				}
			}else {
				sitteridlist = " ";
			}
			//예약정보의 시터아이디부분에 위의 sitteridlist를 넣어준다
			resvdto.setSitter_id(sitteridlist);
			System.out.println(resvdto.getSitter_id());
			System.out.println(sitterlist);
			
		}
//		else {//자동매칭이 아닌경우
//		System.out.println("sittername:"+resvdto.getSitter_name());
//		String gender = resvdto.getPrefer_gender(); //선호 성별
//		String size= resvdto.getPrefer_size(); //선호 사이즈
//		String method = resvdto.getMatch_method(); //매칭 방법
//		
//		System.out.println(gender);
//		System.out.println(size);
//		System.out.println(method);
//		
//		}
//		System.out.println(resvdto);
		model.addAttribute("resvdto", resvdto);
		//해당 예약정보객체를 예약3번째 페이지로 넘겨준다.
		return "resv/resv_3";
	}
	
	@RequestMapping("/reserve/resv3_mb.do")
	public String resv3(ResvDTO resvdto, Model model,  HttpSession session) {
		//예약3페이지에서 입력한 데이터를 불러온다
		System.out.println("컨트롤러3");
		
		//서비스에 맡길 반려동물(들)의 아이디(pet_idlist), 동물종(pet_codelist), 동물이름(pet_namelist)를 
		//쉼표를 기준을 split해서 배열에 담는다
		String[] idArray = resvdto.getPet_idlist().split(",");
		String[] codeArray = resvdto.getPet_codelist().split(",");
		String[] nameArray = resvdto.getPet_namelist().split(",");
		//서비스방문장소주소를 가져온다
		String simpleAddr = resvdto.getVisit_place();
		
		//매칭방법이 자동매칭이 아니라면(시터가 이미 정해져있다면)
		if(!resvdto.getMatch_method().equals("auto_match")) {
			//시터아이디로 해당시터객체를 가져온다.
			SitterDTO sitter = mbservice.sitter_read(resvdto.getSitter_id());
			//시터의 생년월일로 시터의 나이값을 가져와서 시터객체의 sitter_age에 저장한다 
			sitter.setSitter_age(sitter.calcAge());
			//시터객체를 모델에 넣는다
			model.addAttribute("sitter", sitter);
		}
		
		if(idArray.length == 2) {//서비스에 맡길 반려동물이 두 마리이면 해당 변동값을 total_price에 저장한다
			resvdto.setTotal_price(resvdto.getTotal_price()+10000);
		}
		
		if(idArray.length == 3) {//서비스에 맡길 반려동물이 세 마리이면 해당 변동값을 total_price에 저장한다
			resvdto.setTotal_price(resvdto.getTotal_price()+20000);
		}
		
		//예약된 반려동물들의 id로 해당 pet객체를 가져오기
		List<PetDTO> petlist = new ArrayList<PetDTO>();
		for(int i=0; i<idArray.length; i++) {
			petlist.add(petservice.read(idArray[i]));
		}
	
		
		for(int i=0; i<nameArray.length;i++) {
			System.out.println("nameArray:"+nameArray[i]);
		}
		
		//반려동물 idlist, codelist, namelist 객체를 만들어서 해당 값을 for문에 집어넣는다
		ArrayList<String> idlist = new ArrayList<String>();
		ArrayList<String> codelist = new ArrayList<String>();
		ArrayList<String> namelist = new ArrayList<String>();
		
		for(int i=0; i<idArray.length;i++) {
			idlist.add(idArray[i]);
			codelist.add(codeArray[i]);
			namelist.add(nameArray[i]);
		}
		
		//로그인한 유저 정보를 가져와서 해당 이용자의 주소1와 주소2(상세주소)값을 예약정보의 방문장소값에 넣는다.
		LoginUserDTO user = (LoginUserDTO)session.getAttribute("user");
		String addr = user.getMember_addr1() + " " + user.getMember_addr2();
		resvdto.setVisit_place(addr);
		System.out.println("서비스이용장소:"+resvdto.getVisit_place());
		
		//위의 idlist, codelist, namelist, petlist, resvdto를 모델에 넣어서 예약확인/결제페이지로 넘긴다
		model.addAttribute("idlist", idlist);
		model.addAttribute("codelist", codelist);		
		model.addAttribute("namelist", namelist);
		model.addAttribute("petlist", petlist);
		model.addAttribute("resvdto", resvdto);
		return "resv/resv_pay";
	}
	
	@RequestMapping("/reserve/insert.do")
	public String insert(ResvDTO resvdto, Model model, HttpSession session) {
		System.out.println("예약테이블에 넣기 컨트롤러");
		System.out.println(resvdto);
		LoginUserDTO user =  (LoginUserDTO) session.getAttribute("user");
		String id = user.getMember_id();
		resvdto.setMember_id(id);
		if(resvdto.getMatch_method().equals("auto_match")) {
			System.out.println("자동매칭");
			int autocount = service.insert(resvdto);
			System.out.println(autocount);
		}else {
			service.insert(resvdto);
		}
		
		
		
		System.out.println(resvdto);
		System.out.println(resvdto);
		session.setAttribute("user", user);
		
		return "redirect:/reserve/list.do";
	}
	
	@RequestMapping("/reserve/list.do")
	public String list(Model model, HttpSession session) {
		
		LoginUserDTO user =  (LoginUserDTO) session.getAttribute("user");
		System.out.println("user객체:"+user);
		System.out.println("userid:"+user.getMember_id());
		System.out.println("userid:"+user.getSitter_id());
		System.out.println("userid:"+user.getUser_type());

		// 돌봄완료시 해당 커리어를 1씩 증가시킴
		// 예약리스트를 불러올때 예약상태(resv_status) 갱신
		// 0: 매칭요청중, 1: 매칭성공, 2: 매칭기간초과실패,3: 이용자가 취소, 4: 펫시터가 거절, 5: 돌봄완료, 6:자동매칭요청중
		int count = service.changeStatus();
		service.updateFinish();
		System.out.println("count:"+count);
		List<ResvDTO> resvlist = service.resvlist(user);
		//갖고 온 예약리스트의 이용후기작성 여부를 확인한다. 리뷰테이블에 존재하는 예약번호가 String리스트에 담아져서 반환된다.
		System.out.println("#############################"+resvlist);
		
		List<String> reviewlist = null;
		if(resvlist.size()!=0) {
			reviewlist = service.checkReview(resvlist);
			System.out.println(reviewlist);
		}
		
		
		//수정전
		//List<String> reviewlist = service.checkReview(resvlist);
		
		
		String view = "";
		if(user.getUser_type().equals("M")) {
			System.out.println("mblist");
			view = "resv/resvmb_list";
		}else {
			view = "resv/resvst_list";

		}
		
		model.addAttribute("resvlist", resvlist);
		model.addAttribute("reviewlist", reviewlist);
		System.out.println(resvlist);
		return view;
	}
	
	@RequestMapping("/reserve/read.do")
	public String read(String resv_no, Model model, HttpSession session) {
		System.out.println("예약번호:"+resv_no);
		ResvDTO resvdto = service.resvread(resv_no);
		String[] codearray = resvdto.getPet_codelist().split(",");
		String[] namearray = resvdto.getPet_namelist().split(",");
		
		String memberid = resvdto.getMember_id();
		MemberDTO member = (MemberDTO) mbservice.member_read(memberid);
		String addr1 = member.getMember_addr1();
		member.setMember_age(member.calcAge());
		
		List<String> codelist = new ArrayList<String>();
		List<String> namelist = new ArrayList<String>();
		
		for(int i=0;i<codearray.length;i++) {
			codelist.add(codearray[i]);
			namelist.add(namearray[i]);
		}
		
		//예약된 반려동물들의 id로 해당 pet객체를 가져오기
		String[] idarray = resvdto.getPet_idlist().split(",");
		List<PetDTO> petlist = new ArrayList<PetDTO>();
		for(int i=0; i<idarray.length; i++) {
			petlist.add(petservice.read(idarray[i]));
		}
		
		String view = "";
		//자동매칭 이외의 방법이면(sitter가 이미 정해져있는 상태라면)
		if(!resvdto.getMatch_method().equals("auto_match")||resvdto.getResv_status()==1 || resvdto.getResv_status() == 5) {
			//예약정보의 시터 아이디로 시터 객체를 불러옴	
			SitterDTO sitter = service.readSitter(resvdto.getSitter_id());
			//시터 이름을 불러와서 예약정보의 시터 이름에 저장함
			String sitter_name =  sitter.getSitter_name();
			resvdto.setSitter_name(sitter_name);
			//생년월일로 나이를 계산하는 메소드를 호출하여 해당 나이를 시터 객체의 나이 변수에 저장함
			sitter.setSitter_age(sitter.calcAge());
			
			
			LoginUserDTO user = (LoginUserDTO) session.getAttribute("user");
			if(user.getUser_type().equals("M")) { //현재 로그인한 유저가 멤버라면
				view = "resv/resvmb_read";
				model.addAttribute("sitter", sitter);
				model.addAttribute("member", member);
			}else {//시터라면
				view = "resv/resvst_read";
				model.addAttribute("member", member);
			}
			
		}else{//자동매칭방법이라면
			LoginUserDTO user = (LoginUserDTO) session.getAttribute("user");
			if(user.getUser_type().equals("M")) {
				view = "resv/resvmb_read";
				model.addAttribute("member", member);
			}else {
				view = "resv/resvst_read";
				model.addAttribute("member", member);
			}
		}
		model.addAttribute("petlist", petlist);
		model.addAttribute("codelist", codelist);
		model.addAttribute("namelist", namelist);
		model.addAttribute("resvdto", resvdto);
		model.addAttribute("addr1", addr1);
		System.out.println(resvdto);
		System.out.println(resvdto.getPet_codelist());
		System.out.println(resvdto.getPet_namelist());
		return view;
	}
	
	@RequestMapping("/reserve/approve.do")
	public String approve(String resv_no, Model model, HttpSession session) {
		//모든 매칭방법에 대해서 동일
		//시터가 예약을 승인할ㅇ때
		System.out.println("매칭승인");
		//로그인한 유저(시터)객체를 불러온다
		LoginUserDTO user = (LoginUserDTO) session.getAttribute("user");
		//시터의 아이디를 가져온다
		String sitterid = user.getSitter_id();
		//예약번호로 예약정보객체를 가져온다
		ResvDTO resvdto = service.resvread(resv_no);
		//예약정보에 해당시터의 id를 저장한다.
		//자동매칭이 아닌경우에는 sitter_id에 한 시터의 아이디만 저장되어있지만
		//자동매칭인 경우에는 [sitterid1, sitterid2,..]의 형식으로 저장되어있기 때문에
		//승인을 해준 시터의 id만 저장되도록 다시 설정한다.
		resvdto.setSitter_id(sitterid);
		//승인을 해준 시터id를 불러온다
		sitterid = resvdto.getSitter_id();
		//예약번호와 시터아이디를 가지고 승인하기
		//(db의 해당예약내역의 sitter_id에 승인을 해준 sitterid로 바꿔준다)
		service.approve(resv_no, sitterid);

		System.out.println(user);
		session.setAttribute("user", user);
		return "redirect:/reserve/list.do";
	}
	

	
	//예약번호로 해당 리뷰 상세보기
//	@RequestMapping(value= "/reserve/review/read.do", method = RequestMethod.GET)
//	public ModelAndView read_detail(String resv_no) { 
//		ModelAndView mav = new ModelAndView("review/read");
//		ReviewDTO readlist = reviewservice.read_detail(resv_no);
//		mav.addObject("review",readlist);
//		System.out.println(readlist);
//		return mav;
//	}
//	
//	//예약번호로 해당 리뷰 쓰기
//	@RequestMapping(value= "/reserve/review/write.do", method = RequestMethod.GET)
//	public ModelAndView write_detail(String resv_no) { 
//		ModelAndView mav = new ModelAndView("review/read");
//		ReviewDTO readlist = reviewservice.read_detail(resv_no);
//		mav.addObject("review",readlist);
//		System.out.println(readlist);
//		return mav;
//	}	
	@RequestMapping("/reserve/cancel.do")
	public String cancel(String resv_no, Model model, HttpSession session) {
		System.out.println("결제취소");
		LoginUserDTO user =  (LoginUserDTO) session.getAttribute("user");
		service.cancelResv(resv_no, user);
		System.out.println(user);
		session.setAttribute("user", user);
		return "redirect:/reserve/list.do";
	}
	
	
	@RequestMapping(value="/sitter/ajax/list.do", produces="application/json;charset=utf-8")
	@ResponseBody
	public List<SitterDTO> directlist(String gender, String size, String code, HttpSession session){
		System.out.println(gender);
		System.out.println(size);
		System.out.println(code);
		
		LoginUserDTO user =  (LoginUserDTO) session.getAttribute("user");
		String shortAddr = user.createShortAddr();
		System.out.println(shortAddr);
		List<SitterDTO> sitterlist =  service.directlist(gender, size, code, shortAddr);
		//불러온 시터중에서 관리자가 포함되어 있다면 빼기
		for(int i=0;i<sitterlist.size();i++) {
			if(sitterlist.get(i).getSitter_id().equals("admin")) {
				sitterlist.remove(sitterlist.get(i));
			}

		}
		
		System.out.println(sitterlist);
		
		return sitterlist;
	}
	
	@RequestMapping(value="/sitter/ajax/pastlist.do", produces="application/json;charset=utf-8")
	@ResponseBody
	public List<SitterDTO> pastlist(String code, HttpSession session){
		LoginUserDTO user =  (LoginUserDTO) session.getAttribute("user");
		String member_id = user.getMember_id();
		String shortAddr = user.createShortAddr();
		List<SitterDTO> sitterlist = service.pastlist(code, member_id, shortAddr);
		System.out.println("과거이용:"+sitterlist);
		return sitterlist;
	}
	
	@RequestMapping(value="/sitter/ajax/read.do", produces="application/json;charset=utf-8")
	@ResponseBody
	SitterDTO readSitter(String sitter_id) {
		System.out.println(sitter_id);
		SitterDTO sitter = service.readSitter(sitter_id);
		//sitter.calcAge(sitter.getSitter_birthdate());
		sitter.setSitter_shortAddr("");
		sitter.setSitter_age(sitter.calcAge());
		System.out.println(sitter.getSitter_age());
		System.out.println(sitter.getSitter_shortAddr());
		
		System.out.println(sitter);
		return sitter;
	}
	
	
}
