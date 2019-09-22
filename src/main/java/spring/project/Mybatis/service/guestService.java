package spring.project.Mybatis.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface guestService {
	
	//중복 확인 처리
	public void confirmId(HttpServletRequest req, Model model);

	//회원정보 처리 페이지
	public void guestAgreePro(HttpServletRequest req, Model model);
	
	//로그인 처리
	//public void loginPro(HttpServletRequest req, Model model);
	
	//메뉴 상단 
	public void sessionId(HttpServletRequest req, Model model);
	
	//정보 수정 창 출력
	public void modifyView(HttpServletRequest req, Model model);
		
	//정보 수정 처리
	public void modifyPro(HttpServletRequest req, Model model);
		
	//마이 페이지 질문 조회
	public void QnAmyPage(HttpServletRequest req, Model model);
	
	//회원 탈퇴 처리
	public void deletePro(HttpServletRequest req, Model model);
		
	//공지사항 존재 여부
	public void boardList(HttpServletRequest req, Model model);
	
	//공지사항 내용 상세 보기
	public void notice_content(HttpServletRequest req, Model model);
	
	//공지사항 작성 페이지
	public void noticeWrite(HttpServletRequest req, Model model);
	
	//공지사항 작성 처리
	public void noticeWritePro(HttpServletRequest req, Model model);
	
	//고객 1:1 문의 사항 전달
	public void QnAsend(HttpServletRequest req, Model model);
	
	//관리자 1:1 문의 사항 보기
	public void QnaView(HttpServletRequest req, Model model);
			
	//이메일 인증
	public void emailsend(HttpServletRequest req, Model model);
	
	//이메일 키값 확인
	public void emailKeyChk(HttpServletRequest req, Model model);
	
	//공지사항 삭제 처리
	public void deleteNoticePro(HttpServletRequest req, Model model);
		
	//공지사항 수정 전 비밀번호 체크 후 뷰어
	public void modifyPwdChk(HttpServletRequest req, Model model);
	
	//고객 1:1 문의 사항 답글 전달	
	public void custQnASend(HttpServletRequest req, Model model);
	
	//공지사항 수정 값 입력
	public void modifyInsert(HttpServletRequest req, Model model);
	
	//관리자 1:1 문의 상세 보기
	public void QnaContent(HttpServletRequest req, Model model);
	
	//고객 1:1문의 사항 조회
	public void QnACustView(HttpServletRequest req, Model model);
	
	//관리자 회원 정보 조회
	public void custInfo(HttpServletRequest req, Model model);
	
	//관리자 재고 조회
	public void productInfo(HttpServletRequest req, Model model);
	
	//업로드 파일
	public void uploadfile(MultipartHttpServletRequest req, Model model);
	
	//로그인 시 strId넘길때
	public void loginStrId(HttpServletRequest req, Model model);
	
	//상품 상세 페이지
	public void productView(HttpServletRequest req, Model model);
	
	//장바구니 연결
	public void cartPro(HttpServletRequest req, Model model);
	
	//장바구니 조회
	public void cartForm(HttpServletRequest req, Model model);
	
	//장바구니 삭제
	public void deleteCart(HttpServletRequest req, Model model);
	
	//상품 주문 폼
	public void orderProductForm(HttpServletRequest req, Model model);
	
	//장바구니 한번에 주문 처리
	public void cartTotalOrder(HttpServletRequest req, Model model);
	
	//주문 처리 페이지
	public void orderProductPro(HttpServletRequest req, Model model);
	
	//관리자 주문 체크 페이지
	public void hostOrderChk(HttpServletRequest req, Model model);
	
	//관리자 판매 확정  페이지
	public void hostSaleChk(HttpServletRequest req, Model model);
	
	//결산 그래프 출력
	public void resultGrape(HttpServletRequest req, Model model);
	
	//고객 나의 주문
	public void guestMyOrder(HttpServletRequest req, Model model);
	
	//고객 현재 주문
	public void currentOrder(HttpServletRequest req, Model model);
	
	//관리자 고객 강제 탈퇴
	public void hostDelCust(HttpServletRequest req, Model model);
	
	//관리자 발주 창 출력
	public void pdCountSize(HttpServletRequest req, Model model);
	
	//발주 상품 사이즈 카운트 창 추가
	public void addCountSize(HttpServletRequest req, Model model);
	
	//상품  발주
	public void SCorderPro(HttpServletRequest req, Model model);
	
	//관리자 로그인
	public void hostLogin(HttpServletRequest req, Model	model);
	
	//아이디 찾기
	public void findIdPro(HttpServletRequest req, Model	model);
	
	//비밀번호 찾기
	public void findPwPro(HttpServletRequest req, Model model);
	
	//검색어 기능
	public void searchData(HttpServletRequest req, Model model);
	
	//환불 및 취소 신청
	public void cancleOrder(HttpServletRequest req, Model model);
}
