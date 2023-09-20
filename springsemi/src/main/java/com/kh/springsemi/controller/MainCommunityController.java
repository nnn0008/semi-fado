package com.kh.springsemi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springsemi.dao.MainCommunityDao;
import com.kh.springsemi.dao.MemberDao;
import com.kh.springsemi.dto.MainCommunityDto;
import com.kh.springsemi.dto.MemberDto;
import com.kh.springsemi.error.NoTargetException;
import com.kh.springsemi.vo.PaginationVO;

@Controller
@RequestMapping("/helper")
public class MainCommunityController {

	@Autowired
	private MainCommunityDao mainCommunityDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
//	private AttachDao attachDao;
	
	
	
	@GetMapping("/write")  //메인 커뮤니티 글작성-get
	public String insert() {
		return "/WEB-INF/views/helper/community/write";
	}
	
	@PostMapping("/write")  //메인 커뮤니티 글작성-post
	public String insert(@ModelAttribute MainCommunityDto mainCommunityDto,
						@RequestParam MultipartFile attach) {
		//커뮤니티 글 등록
		int mainCommunityNo = mainCommunityDao.sequence();
		mainCommunityDto.setMainCommunityNo(mainCommunityNo);
		mainCommunityDao.insert(mainCommunityDto);
		
//		//첨부파일 등록
//		if(!attach.isEmpty()) {
			//파일 있음
//			int attachNo = attachDao.sequence();
			
//		}
		
		
	}
	
	@GetMapping("/edit")  //메인 커뮤니티 글수정-get
	public String edit(@RequestParam int mainCommunityNo, Model model) {
		MainCommunityDto mainCommunityDto = mainCommunityDao.selectOne(mainCommunityNo);
		model.addAttribute("mainCommunityDto", mainCommunityDto);
		return "/WEB-INF/views/helper/community/edit.jsp";
	}
	
	
	@PostMapping("/edit")  //메인 커뮤니티 글수정-post
	public String edit(@ModelAttribute MainCommunityDto mainCommunityDto) {
		boolean result = mainCommunityDao.update(mainCommunityDto);
		if(result) return "redirect:detail?mainCommunityNo="+mainCommunityDto.getMainCommunityNo();
		else throw new NoTargetException("존재하지 않는 글번호");
	}
	
	
	@RequestMapping("/list")  //메인 커뮤니티 글 목록
	public String list(@ModelAttribute(name = "vo") PaginationVO vo, Model model) {
		int count = mainCommunityDao.countList(vo);  //페이지 네이션 카운트 메소드
		model.addAttribute("vo", vo);
		vo.setCount(count);
		
		List<MainCommunityDto> list = mainCommunityDao.selectList(vo);
		model.addAttribute("list", list);
		
		return "/WEB-INF/views/helper/community/list.jsp";
		
	}
	
	
	@RequestMapping("/detail")  //메인 커뮤니티 글 상세
	public String detail(@RequestParam int mainCommunityNo, Model model, HttpSession session) {
		MainCommunityDto mainCommunityDto = mainCommunityDao.selectOne(mainCommunityNo);
		model.addAttribute("mainCommunityDto", mainCommunityDto);
		String mainCommunityWriter = mainCommunityDto.getMainCommunityWriter();
		if(mainCommunityWriter != null) {
			MemberDto memberDto = memberDao.selectOne(mainCommunityWriter);
			model.addAttribute("WriterDto", memberDto);  //writerDto = model 저장명 이름
		}
		return "/WEB-INF/views/helper/community/detail.jsp";
	}
	
	
	@RequestMapping("/delete")  //메인 커뮤니티 글 삭제
	public String delete(@RequestParam int mainCommunityNo) {
		boolean result = mainCommunityDao.delete(mainCommunityNo);
		if(result) return "redirect:list";
		else throw new NoTargetException("존재하지 않는 글번호");
	}
	
	
}