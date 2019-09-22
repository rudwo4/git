package spring.project.Mybatis.persistence;

import java.util.List;
import java.util.Map;

import spring.project.Mybatis.vo.QnAVO;
import spring.project.Mybatis.vo.faqVO;
import spring.project.Mybatis.vo.guestVO;
import spring.project.Mybatis.vo.orderVO;
import spring.project.Mybatis.vo.productVO;

public interface guestDAO {
	
	// 회원상세 정보
	public Map<String,Object> selectUser(String userid);
	
	// 중복확인 체크
	public int confirmId(String strId);
	
	// 회원가입 처리 
	public int guestAgreePro(guestVO vo);
	
	// 로그인 처리
	public int loginPro(Map<String,Object> map);
	
	// 정보수정 view
	public guestVO modifyView(String strId);
	
	//고객 현재 주문 현황 보기
	public int currentOrder(String strId);
	
	// 정보수정 처리
	public int modifyPro(guestVO vo);
	
	// Q&A 마이페이지
	public QnAVO QnAmyPage(String strId);
	
	// 회원 탈퇴 처리
	public int deletePro(String strId);
	
	//공지 존재 여부
	public int getArticleCnt();
	
	//공지 목록 조회
	public List<faqVO> getArticleList(Map<String,Object> map);
	
	//공지 상세 조회
	public faqVO notice_content(int num);
	
	//공지 작성 처리
	public int noticeWritePro(faqVO vo);
	
	//1:1 문의 사항 전달
	public int QnAsend(QnAVO vo);
	
	//1:1 문의 사항 내용 있는지 확인
	public int getQnA(String strId);
	
	//목록 조회
	public List<QnAVO> getQnAList(Map<String,Object> map);
	
	//1:1 관리자 문의 사항 내용 있는지 확인
	public int MangetQnA();
	
	// email인증
	public void sendmail(String toEmail, String key);
	
	// email 값 테이블에 넣기
	public int emailKey(Map<String,Object> EmailChkmap);
	
	// email 키 값 체크
	public int chkKey(Map<String,Object> map);
	
	//공지 삭제 처리
	public int deleteNoticePro(int num);
	
	//공지 수정 전 비밀번호 체크
	public int modifyPwdChk(Map<String,Object> map);
	
	//1:1 문의사항 내용 전달
	public int QnaSend(QnAVO vo);
	
	//공지 수정값 입력
	public int modifyInsert(faqVO vo);
	
	//1:1 문의 사항 상세보기
	public QnAVO QnaContent(int num);
	
	//고객이 자기가 보낸 문의 목록 조회
	public List<QnAVO> guestQnAList(Map<String,Object> map);
	
	//관리자 회원 정보 조회
	public List<guestVO> custInfo(Map<String,Object> map);
	
	//관리자 목록 유무 조회
	public int custInfoCnt();
	
	//상품 목록 유무 조회
	public int productInfo();
	
	//상품 정보 조회
	public List<productVO> proInfo(Map<String,Object> map);
	
	//상품 업로드
	public int uploadpd(productVO vo);
	
	//업로드 상품 상세 조회
	public productVO productView(int num);
	
	//장바구니 추가 연결
	public int cartInsert(productVO vo);
	
	//장바구니 목록 조회
	public int cartInfoCnt(String strId);
	
	//장바구니 정보 조회
	public List<productVO>cartInfo(Map<String,Object> map);
	
	//장바구니 삭제
	public int deleteCart(String num);
	
	//주문 상품 조회
	public productVO orderProductView(String p_code);
	
	//개인 장바구니 정보 주문 처리
	public List<productVO>priCartOrd(Map<String,Object> map);
	
	//주문 상품 입력
	public int insertOrder(orderVO vo);
	
	//관리자 주문 유무 확인
	public int hostOrderChk();
	
	//관리자 주문 목록 유무 확인
	public List<orderVO> orderInfo(Map<String,Object> map);
	
	//관리자 판매 확정
	public int orderSaleChk(String num);
	
	//총판매액 그래프
	public int totalSale();
	
	//신발 종류별 그래프
	public List<productVO> FirstChat();
	
	//남녀 별 그래프
	public List<guestVO> SecondChat();	
	
	//고객 나의 주문 현황 보기
	public int guestMyOrderCnt(String strId);
	
	//고객 나의 주문 현황 보기
	public List<orderVO> guestMyOrder(Map<String,Object> map);
	
	//발주 상품 보기
	public List<productVO> hostOrdPro(Map<String,Object> map);
	
	//발주상품 목록보기
	public int hostOrdCnt();
	
	//발주상품 사이즈 수량 추가
	public int addCountSize(Map<String,Object> map);
	
	//상품 발주
	public int SCorderPro(Map<String,Object> map);
	
	//관리자 로그인 처리
	public int HostloginPro(Map<String,Object> map);
	
	//이메일 아이디 찾기 체크
	public int NameEmailChk(Map<String,Object> map);
	
	//이메일 아이디 체크 후 값 가져오기
	public guestVO getNameEmailChk(Map<String, Object> map);
	
	//아이디 체크 후이메일로 가입된 아이디 보내기
	public void sendtoId(String toEmail, String key);
	
	//이메일 비밀번호 찾기 체크
	public int PwEmailChk(Map<String,Object> map);
	
	//이메일 비밀번호 체크 후 값 가져오기
	public guestVO getPwEmailChk(Map<String, Object> map);
	
	//아이디 체크 후이메일로 가입된 비밀번호 보내기
	public void sendtoPw(String toEmail, String key);
	
	//검색어 기능 목록 조회
	public int keywordCnt(String keyword);
	
	//검색어 기능 목록 보여주기
	public List<productVO> keyword(Map<String,Object> map);
	
	//주문 즉시 장바구니 삭제
	public void ordCartDel(Map<String,Object> map);
	
	//상품 환불 및 취소 신청
	public int orderNum(String orderNum);
}


