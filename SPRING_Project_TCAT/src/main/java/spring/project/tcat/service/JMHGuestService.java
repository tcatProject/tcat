package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface JMHGuestService {
	
	//아이디,비밀번호 찾기
	public void findIdPwd(HttpServletRequest req,Model model);
	//아이디, 비밀번호 찾기 결과 
	public void findResult(HttpServletRequest req,Model model);
	//로그인 처리
	public void loginPro(HttpServletRequest req,Model model);
	//마이페이지 정보가져오기
	public void myPageInfo(HttpServletRequest req,Model model);
	
	//공연정보 리스트 가져오기
	public void  getPerfList(HttpServletRequest req,Model model);
	//스토어 리스 가져오기
	public void  getStoreList(HttpServletRequest req,Model model);
	//공연 상세 정보 가져오기
	public void  getContent(HttpServletRequest req,Model model);
	//스토어 상세정보
	public void  getContent_store(HttpServletRequest req,Model model);
	
	//위시 리스트
	public void getWishList(HttpServletRequest req,Model model);
	//addWishList 위시리스트 추가
	public void  addWishList(HttpServletRequest req,Model model);
	//해당 위시리스트 삭제
	public void delWishList(HttpServletRequest req,Model model);
	//getWishListIn 위시리스트 해당 공연 존재 확인
	public void getWishListIn(HttpServletRequest req,Model model);
	
	//결제취소
	public void buyCancel(HttpServletRequest req,Model model);
	//perfRefund 환불요청
	public void perfRefund(HttpServletRequest req,Model model);
	
}
