package com.art.project.community.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.art.project.common.Page;
import com.art.project.common.UploadFileUtils;
import com.art.project.community.dto.CommunityDTO;
import com.art.project.community.service.CommunityService;
import com.art.project.member.service.SecurityUser;

@Controller
@RequestMapping("community")
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 글 목록
	@GetMapping("communityList")
	public String getListPage(Model model, @RequestParam(value = "listPageNum") int listPageNum,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "category", required = false, defaultValue = "") String category) throws Exception {

		Page page = new Page();

		page.setListPageNum(listPageNum); // 현재 페이지번호 설정
		page.updateCount(communityService.searchCount(searchType, keyword, category)); // 검색 결과를 페이징처리(count 총글의 갯수)
		page.setSearchType(searchType);
		page.setKeyword(keyword);

		List<CommunityDTO> list = null;
		list = communityService.communitySearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword,
				category);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("selectPageNum", listPageNum);
		return "tiles/community/communityList?listPageNum=1";
	}

	// 글 쓰기페이지로 이동
	@GetMapping("write")
	public String getWrite(CommunityDTO communityDTO) {
		return "tiles/community/communitywrite";

	}

	// 글 쓰기
	@PostMapping("write")
	@PreAuthorize("isAuthenticated()")
	public String postWrite(CommunityDTO communityDTO, Authentication authentication,
			@RequestParam("file") MultipartFile file) throws Exception {
		SecurityUser scUser = (SecurityUser) authentication.getPrincipal();
		communityDTO.setMember_idx(scUser.getMember().getMember_idx());
		communityDTO.setMember_name(scUser.getUsername());

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if (file != null && file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
		    fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
		    fileName = ""; // 기본 이미지 파일 이름
		}

		if (!fileName.isEmpty()) {
		    communityDTO.setCommunity_file(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		    communityDTO.setCommunityThumbImg(
		        File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		}
		communityService.write(communityDTO);
		
		return "redirect:communityList?listPageNum=1";
	}

	@GetMapping("detail")
	public String getDetail(Model model, @RequestParam(value = "community_idx") int idx) {
		CommunityDTO detail = communityService.detail(idx);
		communityService.incrementHitCount(idx);
		model.addAttribute("detail", detail);
		return "tiles/community/detail";
	}

	// 글 수정페이지 이동
	@GetMapping("update")
	@PreAuthorize("isAuthenticated()")
	public String getUpdate(Model model, @RequestParam(value = "community_idx") int idx) {
		CommunityDTO detail = communityService.detail(idx);
		model.addAttribute("detail", detail);
		return "tiles/community/communityupdateform";
	}

	// 글 수정
	@PostMapping("update")
	@PreAuthorize("isAuthenticated()")
	public String postUpdate(CommunityDTO communityDTO, @RequestParam("file") MultipartFile file,
			HttpServletRequest request) throws Exception {

		if (file != null && file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
		    // 기존 파일을 삭제
		    new File(uploadPath + request.getParameter("community_file")).delete();
		    new File(uploadPath + request.getParameter("communityThumbImg")).delete();

		    // 새로 첨부한 파일을 등록
		    String imgUploadPath = uploadPath + File.separator + "imgUpload";
		    String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		    String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

		    communityDTO.setCommunity_file(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		    communityDTO.setCommunityThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + fileName);
		}
		communityService.update(communityDTO);
		return "redirect:communityList?listPageNum=1";
	}

	// 글 삭제
	@GetMapping("delete")
	@PreAuthorize("isAuthenticated()")
	public String getDelete(@RequestParam(value = "community_idx") int idx) {
		communityService.delete(idx);
		return "redirect:communityList?listPageNum=1";
	}

}
