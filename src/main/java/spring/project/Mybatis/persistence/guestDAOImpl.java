package spring.project.Mybatis.persistence;

import java.util.List;
import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
/*
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
*/
import org.springframework.stereotype.Repository;

import spring.project.Mybatis.vo.QnAVO;
import spring.project.Mybatis.vo.faqVO;
import spring.project.Mybatis.vo.guestVO;
import spring.project.Mybatis.vo.orderVO;
import spring.project.Mybatis.vo.productVO;
@Repository
public class guestDAOImpl implements guestDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//아이디 중복확인
	@Override
	public int confirmId(String strId) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.confirmId",strId);
	}
	
	// 회원가입 처리
	@Override
	public int guestAgreePro(guestVO vo) {
		
		return sqlSession.insert("spring.project.Mybatis.persistence.guestDAO.guestAgreePro",vo);
	}
	
	// 로그인 처리
	@Override
	public int loginPro(Map<String,Object> map) {

		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.loginPro",map);
	}
	
	// 정보 수정 view 값 불러오기
	@Override
	public guestVO modifyView(String strId) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.modifyView",strId);
	}
	
	//고객 현재 주문 현황 보기
	@Override
	public int currentOrder(String strId) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.currentOrder",strId);
	}
	
	
	// 정보 수정 처리 페이지
	@Override
	public int modifyPro(guestVO vo) {

		return sqlSession.update("spring.project.Mybatis.persistence.guestDAO.modifyPro",vo);
	}
	
	// Q&A 마이페이지 보기
	@Override
	public QnAVO QnAmyPage(String strId) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.QnAmyPage",strId);
	}
	// 회원 탈퇴 처리
	@Override
	public int deletePro(String strId) {

		return sqlSession.delete("spring.project.Mybatis.persistence.guestDAO.deletePro",strId);
	}
	
	// 글목록 존재 여부
	@Override
	public int getArticleCnt() {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.getArticleCnt");
	}

	// 글 목록 조회
	@Override
	public List<faqVO> getArticleList(Map<String,Object> map) {
		
		return sqlSession.selectList("spring.project.Mybatis.persistence.guestDAO.getArticleList",map);
	}
	
	// 게시글 상세 조회 페이지
	@Override
	public faqVO notice_content(int num) {

		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.notice_content",num);
	}
	
	// 공지사항 작성 처리
	@Override
	public int noticeWritePro(faqVO vo) {
		
		return sqlSession.insert("spring.project.Mybatis.persistence.guestDAO.noticeWritePro",vo);
	}
	
	// 1:1문의 사항 전달 처리
	@Override
	public int QnAsend(QnAVO vo) {
		
		return sqlSession.insert("spring.project.Mybatis.persistence.guestDAO.QnAsend",vo);
	}
	// 관리자 QnA 존재 여부 확인
	@Override
	public int MangetQnA() {
		
		guestDAO dao = sqlSession.getMapper(guestDAO.class);
		return dao.MangetQnA();
	}
	// QnA 존재 여부 확인
	@Override
	public int getQnA(String strId) {
	
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.getQnA",strId);
	}
	// QnA 상세 조회
	@Override
	public List<QnAVO> getQnAList(Map<String,Object> map) {
		
		guestDAO dao = sqlSession.getMapper(guestDAO.class);
		return dao.getQnAList(map);
	}

	
	 // gmail 이용 전송 세팅 #gmail -> 환경설정 -> 전달 및 pop/IMAP -> IMAP 액세스 -> IMAP 사용 설정 : #내
	 // 계정 -> 로그인 및 보안 -> 연결된 앱 및 사이트 -> 보안 수준이 낮은 앱 허용 : 사용으로 변경
	// 이메일 인증 처리
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public void sendmail(String toEmail, String key) {

		try {
			MimeMessage message = mailSender.createMimeMessage();

			String txt = "다이슈 회원가입 인증 메일 입니다. 인증번호를를 입력하여 회원가입을 완료하세요. " + "인증 번호 : " + key; // 글내용

			message.setSubject("다이슈 회원가입 인증메일"); // 이메일 내용
			message.setText(txt, "UTF-8","html"); // 글내용을 html 타입 charset설정
			message.setFrom(new InternetAddress("admin@daishoe.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(toEmail));
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	}
	
	//이메일 키 체크
	@Override
	public int emailKey(Map<String,Object> EmailChkmap) {
		
		return sqlSession.insert("spring.project.Mybatis.persistence.guestDAO.emailKey",EmailChkmap);
	}
	
	//이메일 인증 키값 확인
	@Override
	public int chkKey(Map<String,Object> map) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.chkKey",map);
	}
	
	// 수정 전 번호와 비밀번호 체크
	@Override
	public int modifyPwdChk(Map<String,Object> map) {

		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.modifyPwdChk",map);
	}
	
	// 공지 삭제 처리
	@Override
	public int deleteNoticePro(int num) {
		
		return sqlSession.delete("spring.project.Mybatis.persistence.guestDAO.deleteNoticePro",num);
	}
	// 고객 1:1문의 사항 전달
	@Override
	public int QnaSend(QnAVO vo) {
		
		return sqlSession.update("spring.project.Mybatis.persistence.guestDAO.QnaSend",vo);
	}	
	
	// 수정 내용 입력
	@Override
	public int modifyInsert(faqVO vo) {
		
		return sqlSession.update("spring.project.Mybatis.persistence.guestDAO.modifyInsert",vo);
	}
	
	// 1:1문의 상세보기
	@Override
	public QnAVO QnaContent(int num) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.QnaContent",num);
	}
	
	//고객 문의 리스트
	@Override
	public List<QnAVO> guestQnAList(Map<String,Object> map) {
		
		return sqlSession.selectList("spring.project.Mybatis.persistence.guestDAO.guestQnAList",map);
	}
	
	// 관리자 회원 정보 조회
	@Override
	public List<guestVO> custInfo(Map<String,Object> map) {
		
		return sqlSession.selectList("spring.project.Mybatis.persistence.guestDAO.custInfo",map);
	}

	// 관리자 회원 정보 조회
	@Override
	public int custInfoCnt() {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.custInfoCnt");
	}
	
	// 상품 정보 조회
	@Override
	public List<productVO> proInfo(Map<String,Object> map) {
		
		return sqlSession.selectList("spring.project.Mybatis.persistence.guestDAO.proInfo",map);
	}

	// 상품 목록 조회
	@Override
	public int productInfo() {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.productInfo");
	}
	
	// 상품 업로드
	@Override
	public int uploadpd(productVO vo) {
		
		guestDAO dao = sqlSession.getMapper(guestDAO.class);
		return dao.uploadpd(vo);
	}
	
	// 상품 상세 조회
	@Override
	public productVO productView(int num) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.productView",num);
	}

	// 장바구니 값 입력
	@Override
	public int cartInsert(productVO vo) {
		
		return sqlSession.insert("spring.project.Mybatis.persistence.guestDAO.cartInsert",vo);
	}
	
	// 장바구니 목록 조회
	@Override
	public int cartInfoCnt(String strId) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.cartInfoCnt",strId);
	}

	// 장바구니 정보 조회
	@Override
	public List<productVO> cartInfo(Map<String,Object> map) {
		
		return sqlSession.selectList("spring.project.Mybatis.persistence.guestDAO.cartInfo",map);
	}	
	
	//장바구니 삭제
	@Override
	public int deleteCart(String num) {
		
		return sqlSession.delete("spring.project.Mybatis.persistence.guestDAO.deleteCart",num);
	}
	
	// 주문 상품 조회
	@Override
	public productVO orderProductView(String p_code) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.orderProductView",p_code);
	}
	 //개인 장바구니 주문 처리 
	@Override
	public List<productVO> priCartOrd(Map<String,Object> map) {
		
		return sqlSession.selectList("spring.project.Mybatis.persistence.guestDAO.priCartOrd",map);
	}
	
	// 주문 입력
	@Override
	public int insertOrder(orderVO vo) {
		
		return sqlSession.insert("spring.project.Mybatis.persistence.guestDAO.insertOrder",vo);
	}
	
	// 관리자 주문 여부 체크
	@Override
	public int hostOrderChk() {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.hostOrderChk");
	}
		
	// 관리자 주문 목록 유무 확인
	@Override
	public List<orderVO> orderInfo(Map<String,Object> map) {
		
		return sqlSession.selectList("spring.project.Mybatis.persistence.guestDAO.orderInfo",map);
	}
	
	// 관리자 판매 확정
	@Override
	public int orderSaleChk(String num) {
		
		return sqlSession.update("spring.project.Mybatis.persistence.guestDAO.orderSaleChk",num);
	}
	// 총 판매액
	@Override
	public int totalSale() {

		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.totalSale");
	}
	//신발 종류별
	@Override 
	public List<productVO> FirstChat() { 
		
	  	return sqlSession.selectList("spring.project.Mybatis.persistence.guestDAO.FirstChat"); 
	  }
	//남녀별
	@Override 
	public List<guestVO> SecondChat() { 
		   
		return sqlSession.selectList("spring.project.Mybatis.persistence.guestDAO.SecondChat"); 
	  }
	 
	//고객 나의 주문현황 보기
	@Override
	public int guestMyOrderCnt(String strId) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.guestMyOrderCnt",strId);
	}

	@Override
	public List<orderVO> guestMyOrder(Map<String,Object> map) {
		
		return sqlSession.selectList("spring.project.Mybatis.persistence.guestDAO.guestMyOrder",map);
	}
	
	//발주 상품 상세 보기
	@Override
	public List<productVO> hostOrdPro(Map<String,Object> map) {
		
		return sqlSession.selectList("spring.project.Mybatis.persistence.guestDAO.hostOrdPro",map);
	}
	
	//발주목록 조회
	@Override
	public int hostOrdCnt() {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.hostOrdCnt");
	}

	//발주 상품 사이즈 수량 추가
	@Override
	public int addCountSize(Map<String,Object> map) {
		
		return sqlSession.insert("spring.project.Mybatis.persistence.guestDAO.addCountSize",map);
	}

	@Override
	public int SCorderPro(Map<String,Object> map) {
		
		return sqlSession.update("spring.project.Mybatis.persistence.guestDAO.SCorderPro",map);
	}
	
	//관리자 로그인 처리
	@Override
	public int HostloginPro(Map<String,Object> map) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.HostloginPro",map);
	}
	
	//이메일 아이디 찾기 체크
	@Override
	public int NameEmailChk(Map<String, Object> map) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.NameEmailChk",map);
	}
	
	//이메일 아이디 체크 후 값 가져오기
	@Override
	public guestVO getNameEmailChk(Map<String, Object> map) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.getNameEmailChk",map);
	}
	
	//이메일로 가입된 아이디 보내기
	@Override
	public void sendtoId(String toEmail, String key) {

		try {
			MimeMessage message = mailSender.createMimeMessage();

			String txt = "다이슈 회원가입 된 회원님의 아이디는 : " + key + " 입니다"; // 글내용

			message.setSubject("다이슈 아이디 찾기 메일"); // 이메일 내용
			message.setText(txt, "UTF-8","html"); // 글내용을 html 타입 charset설정
			message.setFrom(new InternetAddress("admin@daishoe.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(toEmail));
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	}
	//이메일 비밀번호 찾기 체크
	@Override
	public int PwEmailChk(Map<String, Object> map) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.PwEmailChk",map);
	}
	
	//이메일 비밀번호 체크 후 값 가져오기
	@Override
	public guestVO getPwEmailChk(Map<String, Object> map) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.getPwEmailChk",map);
	}
	
	//이메일로 가입된 아이디 보내기
	@Override
	public void sendtoPw(String toEmail, String key) {

		try {
			MimeMessage message = mailSender.createMimeMessage();

			String txt = "다이슈 회원가입 된 회원님의 비밀번호는 : " + key + " 입니다"; // 글내용

			message.setSubject("다이슈 비밀번호 찾기 메일"); // 이메일 내용
			message.setText(txt, "UTF-8","html"); // 글내용을 html 타입 charset설정
			message.setFrom(new InternetAddress("admin@daishoe.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(toEmail));
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	}
	
	//검색어 기능 목록 조회
	@Override
	public int keywordCnt(String keyword) {
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.keywordCnt",keyword);
	}
	
	//검색어 기능 목록 보여주기
	@Override
	public List<productVO> keyword(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.Mybatis.persistence.guestDAO.keyword",map);
	}
	
	//주문시 장바구니 삭제
	@Override
	public void ordCartDel(Map<String, Object> map) {
		sqlSession.delete("spring.project.Mybatis.persistence.guestDAO.ordCartDel",map);
	}
	
	//주문 환불 및 취소 신청
	@Override
	public int orderNum(String orderNum) {
		return sqlSession.update("spring.project.Mybatis.persistence.guestDAO.orderNum",orderNum);
	}

	@Override
	public Map<String, Object> selectUser(String userid) {
		
		return sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.selectUser",userid);
	}
}	
