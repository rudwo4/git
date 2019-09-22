package spring.project.Mybatis.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.project.Mybatis.service.guestService;

@Controller
public class projectController {
	
	private static final Logger logger = LoggerFactory.getLogger(projectController.class);
	
	@Autowired
	guestService guest;
	/*
	//HomeController
	@RequestMapping("/")
	public String index(Model model) {
		
		logger.info("url => index");
		return "index";
	}
	*/
	//권한이 없는 사용자에게 안내 페이지 출력 -403에러
	@RequestMapping("/user/denied")
	public String denied(HttpServletRequest req, Model model, Authentication authentication) {
		
		logger.info("url => denied");
		AccessDeniedException ade = (AccessDeniedException) req.getAttribute(WebAttributes.ACCESS_DENIED_403);
		
		model.addAttribute("errMsg",ade);
		return "/Project_JSP/common/denied";
	}
	
	//메인 첫 페이지
	@RequestMapping("main")
	public String main(Model model) {
		
		logger.info("url => main");
		return "/Project_JSP/site/main";
	}
	
	//회원 가입 폼
	@RequestMapping("guestAgree")
	public String guestAgree(HttpServletRequest req, Model model) {
		
		logger.info("url => guestAgree");
		return "/Project_JSP/guest/guestAgree";
	}
	//아이디 중복확인
	@RequestMapping("confirmId")
	public String confirmId(HttpServletRequest req, Model model) {
		
		logger.info("url => confirmId");
		guest.confirmId(req, model);
		return "/Project_JSP/guest/confirmId";
	}
	
	//회원가입 처리
	@RequestMapping("/user/insertUser")
	public String insertUser(HttpServletRequest req, Model model) {
		
		logger.info("url => insertUser");
		guest.guestAgreePro(req, model);
		return "/Project_JSP/guest/login";
	}
	
	//내일 여기 집중해서 보기
	/*
	@RequestMapping("guestAgree_next")
	public String guestAgree_next(HttpServletRequest req, Model model) {
		
		logger.info("url => guestAgree_next");
		guest.guestAgreePro(req, model);
		return "/Project_JSP/guest/guestAgree_next";
	}
	*/
	
	//로그인 폼
	@RequestMapping("login")
	public String login(HttpServletRequest req, Model model) {
		
		logger.info("url => login");
		
		return "/Project_JSP/guest/login";
	}
	/*
	//로그인 처리
	@RequestMapping("loginPro")
	public String loginPro(HttpServletRequest req, Model model) {
		
		logger.info("url => loginPro");
		
		return "/Project_JSP/guest/loginPro";
	}
	*/
	//이메일 인증 전송 버튼
	@RequestMapping("emailchk")
	public String emailchk(HttpServletRequest req, Model model) {
		
		logger.info("url=> emailchk");
		guest.emailsend(req, model);
		return "/Project_JSP/guest/emailchk";
	}
	
	//이메일 인증번호 확인
	@RequestMapping("emailChkPro")
	public String emailChkPro(HttpServletRequest req, Model model) {
		
		logger.info("url=> emailChkPro");
		guest.emailKeyChk(req, model);
		return "/Project_JSP/guest/emailChkPro";
	}
	//고객 로그인 후 메인
	@RequestMapping("logAftMain")
	public String logAftMain(HttpServletRequest req, Model model) {
		
		logger.info("url => logAftMain");
		return "/Project_JSP/site/logAftMain";
	}
	//고객 로그인 후 상단
	@RequestMapping("Aft_top_main")
	public String Aft_top_main(HttpServletRequest req, Model model) {
		
		logger.info("url => Aft_top_main");
		return "/Project_JSP/common/Aft_top_main";
	}
	//고객 로그 아웃 처리
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		logger.info("url => logout");
		return "/Project_JSP/guest/login";
	}
	//관리자 로그 아웃 처리
	@RequestMapping("Manlogout")
	public String Manlogout(HttpServletRequest req, Model model) {
		
		logger.info("url => Manlogout");
		req.getSession().removeAttribute("strId");
		return "/Project_JSP/host/hostloginForm";
	}
	
	//고객 로그인 후 고객 센터
	@RequestMapping("Aft_cust_manage")
	public String Aft_cust_manage(HttpServletRequest req, Model model) {
		
		logger.info("url => Aft_cust_manage");
		return "/Project_JSP/common/Aft_cust_manage";
	}
	
	//고객 마이페이지 
	@RequestMapping("guestMyPage")
	public String guestMyPage(HttpServletRequest req, Model model) {
		
		logger.info("url => guestMyPage");
		guest.sessionId(req, model);
		return "/Project_JSP/guest/guestMyPage";
	}
	
	//비밀번호 확인 후 정보 수정 폼
	@RequestMapping("modifyForm")
	public String modifyForm(HttpServletRequest req, Model model) {
		logger.info("url => modifyForm");
		return "/Project_JSP/guest/modifyForm";
	}
	
	//마이페이지 정보 페이지
	@RequestMapping("guestInfoView")
	public String guestInfoView(HttpServletRequest req, Model model) {
		
		logger.info("url => guestInfoView");
		guest.modifyView(req, model);
		return "/Project_JSP/guest/guestInfoView";
	}
	
	//수정 처리 페이지
	@RequestMapping("guestinfoPro")
	public String guestinfoPro(HttpServletRequest req, Model model) {
		
		logger.info("url => guestinfoPro");
		guest.modifyPro(req, model);
		return "/Project_JSP/guest/guestinfoPro";
	}
	//Q&A 마이 페이지
	@RequestMapping("QnAmyPage")
	public String QnAmyPage(HttpServletRequest req, Model model) {
		
		logger.info("url => QnAmyPage");
		
		guest.QnAmyPage(req, model);
		return "/Project_JSP/guest/QnAmyPage";
	}
	
	//회원 탈퇴 폼
	@RequestMapping("deleteForm")
	public String deleteForm(HttpServletRequest req, Model model) {
		
		logger.info("url => deleteForm");
		
		return "/Project_JSP/guest/deleteForm";
	}
	//회원 탈퇴 처리	
	@RequestMapping("deletePro")
	public String deletePro(HttpServletRequest req, Model model) {
		
		logger.info("url => deletePro");
		guest.deletePro(req, model);
		return "/Project_JSP/guest/deletePro";
	}
	
	//고객센터 진입 페이지
	@RequestMapping("cust_manage")
	public String cust_manage(HttpServletRequest req, Model model) {
		
		logger.info("url => cust_manage");
		return "/Project_JSP/guest/FAQ/cust_manage";
	}
	
	//공지사항 출력 페이지
	@RequestMapping("cust_notice")
	public String cust_notice(HttpServletRequest req, Model model) {
		
		logger.info("url => cust_notice");
		guest.boardList(req, model);
		return "/Project_JSP/guest/FAQ/cust_notice";
	}
	//공지사항 상세 페이지
	@RequestMapping("notice_content")
	public String notice_content(HttpServletRequest req, Model model) {
		
		logger.info("url => notice_content");
		guest.notice_content(req, model);
		return "/Project_JSP/guest/FAQ/notice_content";
	}
	//관리자 공지사항 출력 페이지
	@RequestMapping("adminnoticeMan")
	public String noticeMan(HttpServletRequest req, Model model) {
		
		logger.info("url => noticeMan");
		guest.boardList(req, model);
		return "/Project_JSP/host/notice/adminnoticeMan";
	}
	
	//공지사항 상세 페이지
	@RequestMapping("adminhostNoticeContent")
	public String hostNoticeContent(HttpServletRequest req, Model model) {
		
		logger.info("url => hostNoticeContent");
		guest.notice_content(req, model);
		return "/Project_JSP/host/notice/adminhostNoticeContent";
	}
	
	//관리자 공지사항 작성 페이지	
	@RequestMapping("adminnoticeWrite")
	public String noticeWrite(HttpServletRequest req, Model model) {
		
		logger.info("url => noticeWrite");
		guest.noticeWrite(req, model);
		return "/Project_JSP/host/notice/adminnoticeWrite";
	}
	
	//공지사항 작성 처리
	@RequestMapping("adminnoticeWritePro")
	public String noticeWritePro(HttpServletRequest req, Model model) {
		
		logger.info("url => noticeWritePro");
		guest.noticeWritePro(req, model);
		return "/Project_JSP/host/notice/adminnoticeWritePro";
	}
	//공지사항 삭제 폼
	@RequestMapping("admindeleteNoticeForm")
	public String deleteNoticeForm(HttpServletRequest req, Model model) {
		
		logger.info("url => deleteNoticeForm");
		return "/Project_JSP/host/notice/admindeleteNoticeForm";
	}
	//공지사항 삭제 처리
	@RequestMapping("admindeleteNoticePro")
	public String deleteNoticePro(HttpServletRequest req, Model model) {
		
		logger.info("url => deleteNoticePro");
		guest.deleteNoticePro(req, model);
		return "/Project_JSP/host/notice/admindeleteNoticePro";
	}
	//공지사항 수정 전 비밀번호 체크 
	@RequestMapping("adminnoticeModifyForm")
	public String noticeModifyForm(HttpServletRequest req, Model model) {
		
		logger.info("url => noticeModifyForm");
		int num= Integer.parseInt(req.getParameter("num"));
		System.out.println("num" + num);
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		return "/Project_JSP/host/notice/adminnoticeModifyForm";
	}
	//공지사항 수정 폼
	@RequestMapping("adminnoticeModify")
	public String noticeModify(HttpServletRequest req, Model model) {
		logger.info("url => noticeModify");
		
		guest.modifyPwdChk(req, model);
		return "/Project_JSP/host/notice/adminnoticeModify";
	}
	//공지사항 수정한 입력값 입력	
	@RequestMapping("adminnoticeModifyPro")
	public String noticeModifyPro(HttpServletRequest req, Model model) {
		logger.info("url => noticeModifyPro");
		
		guest.modifyInsert(req, model);
		return "/Project_JSP/host/notice/adminnoticeModifyPro";
	}
	//고객 1:1문의 처리
	@RequestMapping("1to1Main")
	public String OnetoOneMain(HttpServletRequest req, Model model) {
		
		logger.info("url => 1to1Main");
		return "/Project_JSP/guest/FAQ/1to1Main";
	}
	//고객 1:1문의 	전송
	@RequestMapping("1to1Pro")
	public String OnetoOnePro(HttpServletRequest req, Model model) {
		
		logger.info("url => 1to1Pro");
		guest.QnAsend(req, model);
		return "/Project_JSP/guest/FAQ/1to1Pro";
	}
	//관리자에게 1:1문의 사항 내용 확인
	@RequestMapping("adminQandAmanage")
	public String QandAmanage(HttpServletRequest req, Model model) {
		
		logger.info("url => Q&A_manage");
		guest.QnaView(req, model);
		return "/Project_JSP/host/1to1/adminQ&A_manage";
	}
	
	//관리자가 1:1 문의 사항 상세히 확인
	@RequestMapping("adminQandAcontent")
	public String QandAcontent(HttpServletRequest req, Model model) {
		
		logger.info("url => QandAcontent");
		guest.QnaContent(req, model);
		return "/Project_JSP/host/1to1/adminQ&A_content";
	}
	//고객 1:1 문의 사항 답글 전달	
	@RequestMapping("adminQandASend")
	public String QandASend(HttpServletRequest req, Model model) {
		
		logger.info("url => QandASend");
		guest.custQnASend(req, model);
		return "/Project_JSP/host/1to1/adminQ&A_Send";
	}
	//고객 나의 문의 사항 조회
	@RequestMapping("adminQandAcustView")
	public String QandAcustView(HttpServletRequest req, Model model) {
		
		logger.info("url => QandAcustView");
		guest.QnACustView(req, model);
		return "/Project_JSP/host/1to1/adminQ&A_custView";
	}
	//고객 나의 문의 사항 상세 조회
	@RequestMapping("adminQandAcustContent")
	public String QandAcustContent(HttpServletRequest req, Model model) {
		
		logger.info("url => QandAcustContent");
		guest.QnaContent(req, model);
		return "/Project_JSP/host/1to1/adminQ&A_custContent";
	}	
	//관리자 고객 정보 조회	
	@RequestMapping("adminCust_inf")
	public String Cust_inf(HttpServletRequest req, Model model) {
		
		logger.info("url => Cust_inf");
		guest.custInfo(req, model);
		return "/Project_JSP/host/cust/adminCust_inf";
	}		
	//관리자 재고 조회
	@RequestMapping("adminproduct_view")
	public String product_view(HttpServletRequest req, Model model) {
		
		logger.info("url => product_view");
		guest.productInfo(req, model);
		return "/Project_JSP/host/product/adminproduct_view";
	}		
	//관리자 재고 상품 추가 폼
	@RequestMapping("adminuploadfile")
	public String uploadfile(HttpServletRequest req, Model model) {
		
		logger.info("url => uploadfile");
		
		return "/Project_JSP/host/product/adminproductAdd";
	}          
	//관리자 재고 상품 추가 처리
	@RequestMapping("adminProAddPro")
	public String ProAddPro(MultipartHttpServletRequest req, Model model) {
		
		logger.info("url => ProAddPro");
		guest.uploadfile(req, model);
		return "/Project_JSP/host/product/adminProAddPro";
	}	
	//관리자 로그인 폼
	@RequestMapping("hostloginForm")
	public String hostloginForm(HttpServletRequest req, Model model) {
		
		logger.info("url => hostloginForm");
		
		return "/Project_JSP/host/hostloginForm";
	}
	//관리자 로그인 처리
	@RequestMapping("hostlogin")
	public String hostlogin(HttpServletRequest req, Model model) {
		
		logger.info("url => hostlogin");
		guest.hostLogin(req, model);
		return "/Project_JSP/host/hostlogin";
	}
	
	//관리자 페이지
	@RequestMapping("adminhostMain")
	public String hostMain(HttpServletRequest req, Model model) {
		
		logger.info("url => adminhostMain");
		String strId = req.getParameter("strId");
		model.addAttribute("strId", strId);
		return "/Project_JSP/host/adminhostMain";
	}
	
	//운동화 페이지 출력
	@RequestMapping("runningShoes")
	public String runningShoes(HttpServletRequest req, Model model) {
		
		logger.info("url => runningShoes");
		guest.loginStrId(req, model);
		return "/Project_JSP/common/showProduct/runningShoes";
	}	
	
	//운동화 상품 상세 페이지 출력
	@RequestMapping("shoesContent")
	public String shoesContent(HttpServletRequest req, Model model) {
		
		logger.info("url => shoesContent");
		guest.productView(req, model);
		return "/Project_JSP/common/showProduct/shoesContent";
	}	
	//장바구니에 담기 출력
	@RequestMapping("cartPro")
	public String cartPro(HttpServletRequest req, Model model) {
		
		logger.info("url => cartPro");
		guest.cartPro(req, model);
		return "/Project_JSP/common/cart/cartPro";
	}
	
	//장바구니에 담기 출력
	@RequestMapping("cartForm")
	public String cartForm(HttpServletRequest req, Model model) {
		
		logger.info("url => cartForm");
		guest.cartForm(req, model);
		return "/Project_JSP/common/cart/cartForm";
	}	
	
	//장바구니 삭제
	@RequestMapping("deleteCart")
	public String deleteCart(HttpServletRequest req, Model model) {
		
		logger.info("url => deleteCart");
		guest.deleteCart(req, model);
		return "/Project_JSP/common/cart/deleteCart";
	}	
	
	//장바구니 상품 주문	
	@RequestMapping("cartOrder")
	public String cartOrder(HttpServletRequest req, Model model) {
		
		logger.info("url => cartOrder");
		guest.cartTotalOrder(req, model);
		return "/Project_JSP/order/cartOrder";
	}	
	
	//상품 주문	
	@RequestMapping("orderProductForm")
	public String orderProductForm(HttpServletRequest req, Model model) {
		
		logger.info("url => orderProductForm");
		guest.orderProductForm(req, model);
		return "/Project_JSP/order/orderProductForm";
	}	
	
	//상품 주문 처리
	@RequestMapping("orderProductPro")
	public String orderProductPro(HttpServletRequest req, Model model) {
		
		logger.info("url => orderProductPro");
		guest.orderProductPro(req, model);
		return "/Project_JSP/order/orderProductPro";
	}
	//관리자 주문 상품 확인
	@RequestMapping("adminorderChk")
	public String orderChk(HttpServletRequest req, Model model) {
		
		logger.info("url => orderChk");
		guest.hostOrderChk(req, model);
		return "/Project_JSP/host/manageOrd/adminorderChk";
	}
	//관리자 판매 확정
	@RequestMapping("adminorderSaleChk")
	public String orderSaleChk(HttpServletRequest req, Model model) {
		
		logger.info("url => orderSaleChk");
		guest.hostSaleChk(req, model);
		return "/Project_JSP/host/manageOrd/adminorderSaleChk";
	}
	//결산 그래프
	@RequestMapping("adminresult")
	public String result(HttpServletRequest req, Model model) {
		
		logger.info("url => result");
		try {
			guest.resultGrape(req, model);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/Project_JSP/result/adminresult";
	}
	//나의 주문 현황	
	@RequestMapping("myOrder")
	public String myOrder(HttpServletRequest req, Model model) {
		
		logger.info("url => myOrder");
		guest.guestMyOrder(req, model);
		return "/Project_JSP/order/guestMyOrder";
	}
	//고객 현재 주문 현황
	@RequestMapping("currentOrder")
	public String currentOrder(HttpServletRequest req, Model model) {
		
		logger.info("url => currentOrder");
		guest.currentOrder(req, model);
		return "/Project_JSP/order/currentOrder";
	}
	
	//강제 회원 탈퇴
	@RequestMapping("adminhostDelCust")
	public String hostDelCust(HttpServletRequest req, Model model) {
		
		logger.info("url => hostDelCust");
		guest.hostDelCust(req, model);
		return "/Project_JSP/host/cust/adminhostDelCust";
	}
	//상품 발주 창	
	@RequestMapping("adminaddCountSize")
	public String addCountSize(HttpServletRequest req, Model model) {
		
		logger.info("url => addCountSize");
		guest.addCountSize(req, model);
		return "/Project_JSP/host/product/adminaddCountSize";
	}
	//발주 수량 사이즈 추가 창
	@RequestMapping("adminpdCountSize")
	public String pdCountSize(HttpServletRequest req, Model model) {
		
		logger.info("url => pdCountSize");
		guest.pdCountSize(req, model);
		return "/Project_JSP/host/product/adminpdCountSize";
	}
	//발주신청
	@RequestMapping("adminSCorderPro")
	public String SCorderPro(HttpServletRequest req, Model model) {
		
		logger.info("url => SCorderPro");
		guest.SCorderPro(req, model);
		return "/Project_JSP/host/product/adminSCorderPro";
	}
	
	//고객센터
	@RequestMapping("center")
	public String center(HttpServletRequest req, Model model) {
		
		logger.info("url => center");
		return "/Project_JSP/common/center";
	}
	//as센터
	@RequestMapping("asCenter")
	public String asCenter(HttpServletRequest req, Model model) {
		
		logger.info("url => asCenter");
		return "/Project_JSP/common/asCenter";
	}
	//faq
	@RequestMapping("faq")
	public String faq(HttpServletRequest req, Model model) {
		
		logger.info("url => faq");
		return "/Project_JSP/common/faq";
	}	
	//손님faq	
	@RequestMapping("faq_guest")
	public String faq_guest(HttpServletRequest req, Model model) {
		
		logger.info("url => faq_guest");
		return "/Project_JSP/site/faq_guest";
	}	
	//as faq
	@RequestMapping("faq_as")
	public String faq_as(HttpServletRequest req, Model model) {
		
		logger.info("url => faq_as");
		return "/Project_JSP/site/faq_as";
	}	
	//order faq
	@RequestMapping("faq_order")
	public String faq_order(HttpServletRequest req, Model model) {
		
		logger.info("url => faq_order");
		return "/Project_JSP/site/faq_order";
	}		
	//배송 faq
	@RequestMapping("faq_delivery")
	public String faq_delivery(HttpServletRequest req, Model model) {
		
		logger.info("url => faq_delivery");
		return "/Project_JSP/site/faq_delivery";
	}		
	//멤버쉽 faq 
	@RequestMapping("faq_membership")
	public String faq_membership(HttpServletRequest req, Model model) {
		
		logger.info("url => faq_membership");
		return "/Project_JSP/site/faq_membership";
	}
	//아이디 비밀번호 찾기 폼
	@RequestMapping("findIdPw")
	public String findPw(HttpServletRequest req, Model model) {
		
		logger.info("url => findIdPw");
		return "/Project_JSP/guest/findIdPw";
	}
	
	//아이디 찾기
	@RequestMapping("findIdPro")
	public String findIdPro(HttpServletRequest req, Model model) {
		
		logger.info("url => findIdPro");
		guest.findIdPro(req, model);
		return "/Project_JSP/guest/findIdPro";
	}
	
	//비밀번호 찾기
	@RequestMapping("findPwPro")
	public String findPwPro(HttpServletRequest req, Model model) {
		
		logger.info("url => findPwPro");
		guest.findPwPro(req, model);
		return "/Project_JSP/guest/findIdPro";
	}
	
	//검색어 기능
	@RequestMapping("searchData")
	public String searchData(HttpServletRequest req, Model model) {
		
		logger.info("url => searchData");
		guest.searchData(req, model);
		return "/Project_JSP/common/showProduct/searchData";
	}
	//구매 상품 환불 및 취소 신청 
	@RequestMapping("cancleOrder")
	public String cancleOrder(HttpServletRequest req, Model model) {
		
		logger.info("url => cancleOrder");
		guest.cancleOrder(req, model);
		return "/Project_JSP/order/cancleOrder";
	}
}
