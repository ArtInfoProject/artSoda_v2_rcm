package com.art.project.artist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.art.project.artist.dto.ReplyDTO;
import com.art.project.artist.service.ReplyService;

@Controller
@RequestMapping("reply")
public class ReplyController {

   @Autowired
   private ReplyService replyService;

   // 글 쓰기페이지로 이동
   @GetMapping("write")
   public String getWrite(ReplyDTO ReplyDTO) {
      return "tiles/reply/write";

   }

   @PostMapping("write")
   @PreAuthorize("isAuthenticated()")
   public ResponseEntity<ReplyDTO> writeReply(@RequestBody ReplyDTO replyDTO) throws Exception {
      System.out.println("controller 부분" + replyDTO);
      replyService.write(replyDTO);

      return new ResponseEntity<ReplyDTO>(replyDTO, HttpStatus.OK);
   }
}