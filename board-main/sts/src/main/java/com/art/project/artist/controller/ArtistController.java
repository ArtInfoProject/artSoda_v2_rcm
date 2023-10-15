package com.art.project.artist.controller;

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

import com.art.project.artist.dto.ArtistDTO;
import com.art.project.artist.service.ArtistService;
import com.art.project.common.Page;
import com.art.project.common.UploadFileUtils;

@Controller
@RequestMapping("artist")
public class ArtistController {

	@Autowired
	private ArtistService artistService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;

	// 아티스트 리스트
	@GetMapping("artistList")
	public String getList(Model model, @RequestParam(value = "listPageNum") int listPageNum,
			@RequestParam(value = "searchType", required = false, defaultValue = "name") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {

		Page page = new Page();

		page.setListPageNum(listPageNum);
		page.updateCount(artistService.searchCount(searchType, keyword));

		page.setSearchType(searchType);
		page.setKeyword(keyword);

		List<ArtistDTO> list = null;

		list = artistService.artistSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("selectPageNum", listPageNum);
		return "tiles/artist/artistList?listPageNum=1";

	}

	// 아티스트 정보
	@GetMapping("detail")
	public String getDetail(Model model, ArtistDTO artistDTO) {
		ArtistDTO detailArtist = artistService.detailArtist(artistDTO);
		List<ArtistDTO> detailPicture = artistService.detailPicture(artistDTO);

		model.addAttribute("detailArtist", detailArtist);
		model.addAttribute("detailPicture", detailPicture);

		return "tiles/artist/detail";
	}

	// 아티스트 등록 페이지로 이동(관리자만)
	@GetMapping("write")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_ADMIN')")
	public String getWrite() {

		return "tiles/artist/artistWriteForm";
	}

	// 아티스트 등록(관리자만)
	@PostMapping("write")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_ADMIN')")
	public String postWrite(ArtistDTO artistDTO, @RequestParam("file") MultipartFile file) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if (file != null && file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
		    fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
		    fileName = ""; // 기본 이미지 파일 이름
		}

		if (!fileName.isEmpty()) {
			artistDTO.setArtist_photo(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			artistDTO.setArtistThumbImg(
			        File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		}
		artistService.write(artistDTO);

		return "redirect:artistList?listPageNum=1";
	}

	// 아티스트 정보 수정 페이지로 이동(관리자만)
	@GetMapping("update")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_ADMIN')")
	public String getUpdate(Model model, ArtistDTO artistDTO) {

		ArtistDTO detailArtist = artistService.detailArtist(artistDTO);
		model.addAttribute("detailArtist", detailArtist);

		return "tiles/artist/artistUpdateForm";
	}

	// 아티스트 정보 수정(관리자만)
	@PostMapping("update")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_ADMIN')")
	public String postUpdate(ArtistDTO artistDTO, @RequestParam("file") MultipartFile file,
			HttpServletRequest request) throws Exception {
		if (file != null && file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
		    // 기존 파일을 삭제
		    new File(uploadPath + request.getParameter("community_file")).delete();
		    new File(uploadPath + request.getParameter("communityThumbImg")).delete();

		    // 새로 첨부한 파일을 등록
		    String imgUploadPath = uploadPath + File.separator + "imgUpload";
		    String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		    String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

		    artistDTO.setArtist_photo(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		    artistDTO.setArtistThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + fileName);
		}
		
		artistService.update(artistDTO);

		return "redirect:artistList?listPageNum=1";
	}

	// 아티스트 작품 등록 페이지로 이동(관리자만)
	@GetMapping("registrationWork")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_ADMIN')")
	public String getRegistrationWork() {
		return "tiles/artist/registrationWrite"; // ArtistDTO artistDTO, Model model
	}

	// 아티스트 작품 등록(관리자만)
	@PostMapping("registrationWork")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_ADMIN')")
	public String postRegistrationWork(ArtistDTO artistDTO, @RequestParam("file") MultipartFile file) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if (file != null && file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
		    fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
		    fileName = ""; // 기본 이미지 파일 이름
		}
		if (!fileName.isEmpty()) {
			artistDTO.setPicture_file(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			artistDTO.setPictureThumbImg(
			        File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		}
		
		artistService.registrationWork(artistDTO);

		return "redirect:detail?artist_idx=" + artistDTO.getArtist_idx();
	}

	// 아티스트 작품 정보 수정 페이지로 이동(관리자만)
	@GetMapping("updatePicture")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_ADMIN')")
	public String getPictureUpdate(Model model, ArtistDTO artistDTO) {
		ArtistDTO detailPicture = artistService.listOnePicture(artistDTO);

		System.out.println("여기?"+detailPicture);
		model.addAttribute("detailPicture", detailPicture);
		return "tiles/artist/picturesUpdateForm";
	}

	// 아티스트 작품 정보 수정(관리자만)
	@PostMapping("updatePicture")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_ADMIN')")
	public String postPictureUpdate(ArtistDTO artistDTO, @RequestParam("file") MultipartFile file,
			HttpServletRequest request)  throws Exception {
		if (file != null && file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
		    // 기존 파일을 삭제
		    new File(uploadPath + request.getParameter("community_file")).delete();
		    new File(uploadPath + request.getParameter("communityThumbImg")).delete();

		    // 새로 첨부한 파일을 등록
		    String imgUploadPath = uploadPath + File.separator + "imgUpload";
		    String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		    String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

		    artistDTO.setPicture_file(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			artistDTO.setPictureThumbImg(
			        File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		}
//		System.out.println("여기?"+artistDTO);
		artistService.updatePicture(artistDTO);

		return "redirect:detail?artist_idx=" + artistDTO.getArtist_idx();
	}

	// 아티스트 삭제(관리자만)
	@GetMapping("artistDelete")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_ADMIN')")
	public String artistDelete(@RequestParam(value = "artist_idx") int idx) {
		artistService.artistDelete(idx);

		return "redirect:artistList?listPageNum=1";
	}

	// 아티스트 작품 삭제(관리자만)
	@GetMapping("pictureDelete")
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_ADMIN')")
	public String pictureDelete(@RequestParam(value = "picture_idx") int idx,@RequestParam(value = "artist_idx") int artist_idx) {
//		@RequestParam(value = "picture_idx") int idx,
//		System.out.println("따라와?" + artistDTO.getArtist_idx());
		System.out.println("따라와?" + artist_idx);
		artistService.pictureDelete(idx, artist_idx);
		return "redirect:detail?artist_idx=" + artist_idx;
	}
}
