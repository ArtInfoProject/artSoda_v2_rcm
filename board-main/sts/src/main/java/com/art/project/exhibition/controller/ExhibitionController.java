package com.art.project.exhibition.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.art.project.common.Page;
import com.art.project.common.UploadFileUtils;
import com.art.project.exhibition.dto.ExhibitionDTO;
import com.art.project.exhibition.service.ExhibitionService;

@Controller
@RequestMapping("exhibition")
public class ExhibitionController {

   @Autowired
   private ExhibitionService exhibitionService;

   @Resource(name = "uploadPath")
   private String uploadPath;
   
   @GetMapping("exhibitionList")
   public String exhibitionSolo(Model model,
         @RequestParam(value = "listPageNum") int listPageNum,
         @RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
         @RequestParam(value = "keyword" , required = false, defaultValue = "") String keyword,
         @RequestParam(value = "category" , required = false, defaultValue = "") String category,
         @RequestParam(value = "status" , required = false, defaultValue = "") String status) throws Exception{ // 개인전목록

      Page page = new Page();

      page.setListPageNum(listPageNum);
      page.updateCount(exhibitionService.searchCount(searchType, keyword, category, status));
      page.setSearchType(searchType);
      page.setKeyword(keyword);
      
      List<ExhibitionDTO> list;
      list = exhibitionService.exhibitionSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword, category, status);

      model.addAttribute("list", list);
      model.addAttribute("page", page);
      model.addAttribute("selectPageNum", listPageNum);
      return "tiles/exhibition/exhibitionList?listPageNum=1";
   }

   @GetMapping("write")
   public String getWrite() { // 전시회 작성폼페이지

      return "tiles/exhibition/exhibitionWriteForm";
   }

   @PostMapping("write")
   @PreAuthorize("isAuthenticated()")
   public String postWrite(ExhibitionDTO exhibitionDTO, @RequestParam("file") MultipartFile file) throws Exception { // 전시회 작성폼페이지
	   String imgUploadPath = uploadPath + File.separator + "imgUpload";
	   String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
	   String fileName = null;
		
		if (file != null && file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
		    fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
		    fileName = ""; // 기본 이미지 파일 이름
		}

		if (!fileName.isEmpty()) {
			exhibitionDTO.setExhibition_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			exhibitionDTO.setExhibitionThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		}
      exhibitionService.write(exhibitionDTO);

      return "redirect:exhibitionList?listPageNum=1";
   }

   @GetMapping("detail")
   public String getDetail(Model model, @RequestParam(value = "exhibition_idx") int idx) {
      ExhibitionDTO detail = exhibitionService.detail(idx);
      model.addAttribute("detail", detail);

      return "tiles/exhibition/detail";
   }

   @GetMapping("update")
   public String getUpdate(Model model, @RequestParam(value = "exhibition_idx") int idx) { // 글 수정(기존 writeform에 적어놓앗던
                                                                     // 정보 불러오기위해 이 메소드 사용)
      ExhibitionDTO detail = exhibitionService.detail(idx);
      model.addAttribute("detail", detail);

      return "tiles/exhibition/exhibitionUpdateForm";
   }

   @PostMapping("update")
   @PreAuthorize("isAuthenticated()")
   public String PostUpdate(ExhibitionDTO exhibitionDTO,  @RequestParam("file") MultipartFile file,
			HttpServletRequest request) throws Exception {// 글 수정(기존 writeform에 적어놓앗던 정보 불러오기위해 이 메소드 사용)
	   if (file != null && file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
		    // 기존 파일을 삭제
		    new File(uploadPath + request.getParameter("community_file")).delete();
		    new File(uploadPath + request.getParameter("communityThumbImg")).delete();

		    // 새로 첨부한 파일을 등록
		    String imgUploadPath = uploadPath + File.separator + "imgUpload";
		    String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		    String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

		    exhibitionDTO.setExhibition_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		    exhibitionDTO.setExhibitionThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + fileName);
		}
	   exhibitionService.update(exhibitionDTO);

      return "redirect:exhibitionList?listPageNum=1";
   }

   @GetMapping("delete")
   @PreAuthorize("isAuthenticated()")
   public String getDelete(@RequestParam(value = "exhibition_idx") int idx) {
      
	   exhibitionService.delete(idx);

      return "redirect:exhibitionList?listPageNum=1";
   }
}