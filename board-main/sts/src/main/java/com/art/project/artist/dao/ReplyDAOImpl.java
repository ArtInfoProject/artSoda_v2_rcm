package com.art.project.artist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.art.project.artist.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

   @Autowired
   SqlSession sqlSession;
   
   @Override
   public List<ReplyDTO> list(int artist_idx) throws Exception {

      return sqlSession.selectList("artist.replyList", artist_idx);
   }

   @Override
   public void write(ReplyDTO replyDTO) throws Exception {
      System.out.println("여긴 dao부분"+replyDTO);
      sqlSession.insert("artist.replyWrite", replyDTO);
      
   }

   @Override
   public void update(ReplyDTO replyDTO) throws Exception {
      sqlSession.update("artist.replyUpdate", replyDTO);
      
   }

   @Override
   public void delete(ReplyDTO replyDTO) throws Exception {
      sqlSession.delete("artist.replyDelete", replyDTO);
   }

}