package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class ServiceTest {
	
	@Autowired
	private BoardService service;
	
	//목록보기
	@Test
	public void testGetList() {
		Criteria cri = new Criteria();
		service.getList(cri).forEach(vo -> log.info(vo));
	}
	
	//글 등록
	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		
		vo.setTitle("aaa");
		vo.setContent("bbbbbbb");
		vo.setWriter("cc");
		
		service.register(vo);
	}
	
	//글 삭제
	@Test
	public void testRemove() {
		log.info("삭제된 글의 개수는:"+ service.remove(21L));
	}
	
	//글 수정
	@Test
	public void testModify() {
		BoardVO vo = new BoardVO();
		vo.setBno(81L);
		vo.setTitle("aaaaaaa");
		vo.setContent("bbbbbbbbbb");
		vo.setWriter("bbbbccccc");
	}
	
	//글 상세보기
	@Test
	public void testRead() {
		log.info("상세보기:" + service.get(101L));
}
	
	
}
