package spring.project.Mybatis.service;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.project.Mybatis.persistence.guestDAO;
import spring.project.Mybatis.vo.QnAVO;
import spring.project.Mybatis.vo.faqVO;
import spring.project.Mybatis.vo.guestVO;
import spring.project.Mybatis.vo.orderVO;
import spring.project.Mybatis.vo.productVO;
@Service
public class guestServiceImpl implements guestService{
	@Autowired
	BCryptPasswordEncoder passwordEncoder;	//비밀번호 암화 객체
	
	@Autowired
	guestDAO dao;
	//아이디 중복 확인 체크	
	@Override
	public void confirmId(HttpServletRequest req, Model model) {
		String strId = req.getParameter("ID");
		
		int confirmCnt = dao.confirmId(strId);
		
		model.addAttribute("confirmCnt", confirmCnt);
		model.addAttribute("strId", strId);
		
		System.out.println(confirmCnt); //확인완료
	}
	
	
	//회원가입정보 처리 페이지
	
	@Override
	public void guestAgreePro(HttpServletRequest req, Model model) {
		
		String passwd= req.getParameter("passwd");
		String encryptPassword = passwordEncoder.encode(passwd);
		
		guestVO vo = new guestVO();
		
		//값 받아오기
		vo.setId(req.getParameter("userid"));
		vo.setPwd(encryptPassword);
		vo.setName(req.getParameter("userName"));
		vo.setEmail(req.getParameter("userEmail"));
		vo.setPhone(req.getParameter("userPhone"));
		vo.setBirth(req.getParameter("userBirth"));
		vo.setGender(req.getParameter("gender"));
		
		//실행
		int guestCnt = dao.guestAgreePro(vo);

		model.addAttribute("guestCnt", guestCnt);
		
		System.out.println(guestCnt);
	}
	
	//로그인 처리
	/*
	@Override
	public void loginPro(HttpServletRequest req, Model model) {
		String strId = req.getParameter("userid");
		String strPw = req.getParameter("userpw");
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("strId", strId);
		map.put("strPw", strPw);
		
		int loginCnt = dao.loginPro(map);

		if(loginCnt == 1) {
			req.getSession().setAttribute("strId", strId);
		}
		
		model.addAttribute("loginCnt", loginCnt);
		model.addAttribute("strId", strId);
		
		System.out.println("loginCnt 테스트 : " + loginCnt);
		//0이면 아이디 없음 ,1이면 로그인 성공,2는 비밀번호 틀림
	
	}
	*/
	// 고객 마이 페이지 메뉴 상단 	
	@Override
	public void sessionId(HttpServletRequest req, Model model) {
		String strId = (String)req.getSession().getAttribute("strId");
		
		int currentOrder = dao.currentOrder(strId);
		guestVO vo = dao.modifyView(strId);
		
		model.addAttribute("cnt", 1);
		model.addAttribute("vo", vo);
		model.addAttribute("currentOrder", currentOrder);
		
		System.out.println("currentOrder : " + currentOrder);
	}
	
	//개인 정보 수정 창 출력
	@Override
	public void modifyView(HttpServletRequest req, Model model) {
		String strId = (String)req.getSession().getAttribute("strId");
		String strPw = req.getParameter("pwd");
		
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("strId", strId);
			map.put("strPw", strPw);
			
			int cnt = dao.loginPro(map);
			
			//입력한 아이디와 비밀번호의 정보가 맞으면 1
			if(cnt == 1) {
				guestVO vo = dao.modifyView(strId);
				System.out.println(vo.getId());
				model.addAttribute("vo", vo);
			}
			model.addAttribute("cnt", cnt);
			System.out.println(cnt);
	}
	
	// 정보 수정 처리
	@Override
	public void modifyPro(HttpServletRequest req, Model model) {
		String strId = (String)req.getSession().getAttribute("strId");
		String strPwd = req.getParameter("userPwd");
		String strEmail = req.getParameter("userEmail");
		String strPhone = req.getParameter("userPhone");
		
		guestVO vo = new guestVO();
		
		vo.setId(strId);
		vo.setPwd(strPwd);
		vo.setEmail(strEmail);
		vo.setPhone(strPhone);
		
		int modifyCnt = dao.modifyPro(vo);
		
		model.addAttribute("modifyCnt", modifyCnt);
		System.out.println(modifyCnt);
	}
	
	// 마이 페이지 Q&A 상세 보기
	@Override
	public void QnAmyPage(HttpServletRequest req, Model model) {
		String strId = (String)req.getSession().getAttribute("strId");
		
		QnAVO vo = dao.QnAmyPage(strId);
		
		model.addAttribute("vo", vo);
	}
	//회원 탈퇴 처리
	@Override
	public void deletePro(HttpServletRequest req, Model model) {
		String strId = (String)req.getSession().getAttribute("strId");
		String strPw = req.getParameter("pwd");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("strId", strId);
		map.put("strPw", strPw);
		
		int cnt = dao.loginPro(map);
		if(cnt == 1) {
			int deleteCnt = dao.deletePro(strId);
			model.addAttribute("deleteCnt", deleteCnt);
			System.out.println("deleteCnt : " + deleteCnt);
		}
	}
	
	// 글목록 존재 여부

	@Override
	public void boardList(HttpServletRequest req, Model model) {
		int pageSize = 5;		//한 페이지당 출력 글 갯수
		int pageBlock = 5;		//한 블럭당 페이지 갯수
		
		int cnt = 0;			//글의 갯수
		int start = 0;			//페이지 시작 글번호
		int end = 0;			//페이지 마지막 글번호
		int number = 0;			//출력용 글번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		cnt = dao.getArticleCnt();
		
		System.out.println("글 갯수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		System.out.println("현재 페이지 : " + currentPage);
		
		pageCount = (cnt/ pageSize) + (cnt % pageSize > 0 ? 1:0); // 페이지 갯수
		
		start = (currentPage -1) * pageSize + 1;	//현재 페이지 시작 글번호
		
		end = (start + pageSize) -1;	//현재 페이지 마지막 글번호
		
		if(end>cnt) end = cnt;		//마지막 글번호와 글 갯수 맞쳐주기
		
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		
		
		if(cnt > 0) {
			//게시글 목록 조회
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			
			List<faqVO> dtos = dao.getArticleList(map);
			model.addAttribute("dtos", dtos);	//게시글 갯수
		}
		
		//시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		//마지막 페이지
		endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		//값 주기
		model.addAttribute("cnt", cnt);	// 글 갯수
		model.addAttribute("number", number);//출력용 글번호
		model.addAttribute("pageNum", pageNum);//페이지 번호
		
		if(cnt>0) {
			model.addAttribute("startPage", startPage);		//시작 페이지
			model.addAttribute("endPage", endPage);			//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); 		//페이지 갯수
			model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
	}
	
	//공지 내용 상세보기
	@Override
	public void notice_content(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		faqVO vo = dao.notice_content(num);
		
		model.addAttribute("dto", vo);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
	}
	
	//공지사항 작성 페이지
	@Override
	public void noticeWrite(HttpServletRequest req, Model model) {
		int pageNum = 0;
		
		//이거 선택해서 글쓸 수 있게 넘겨주기
		pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		model.addAttribute("pageNum", pageNum);
	}
	
	//공지사항 작성 처리
	@Override
	public void noticeWritePro(HttpServletRequest req, Model model) {
		faqVO vo = new faqVO();
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		vo.setHostId(req.getParameter("writer"));
		vo.setHostPwd(req.getParameter("pw"));
		vo.setKind(req.getParameter("kind"));
		vo.setSubject(req.getParameter("subject"));
		vo.setContent(req.getParameter("content"));
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		int insertCnt = dao.noticeWritePro(vo);
		
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("pageNum", pageNum);
	}
	
	//고객 1:1 문의사항 전달
	@Override
	public void QnAsend(HttpServletRequest req, Model model) {
		String strId = (String)req.getSession().getAttribute("strId");
		String kind = req.getParameter("kind");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		
		QnAVO vo = new QnAVO();
		
		vo.setStrId(strId);
		vo.setKind(kind);
		vo.setSubject(subject);
		vo.setContent(content);
		
		int sendCnt = dao.QnAsend(vo);
		
		model.addAttribute("sendCnt", sendCnt);
	}

	//관리자 QnA내용 보여주기
	@Override
	public void QnaView(HttpServletRequest req, Model model) {
		int pageSize = 5;		//한 페이지당 출력 글 갯수
		int pageBlock = 5;		//한 블럭당 페이지 갯수
		
		int cnt = 0;			//글의 갯수
		int start = 0;			//페이지 시작 글번호
		int end = 0;			//페이지 마지막 글번호
		int number = 0;			//출력용 글번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		cnt = dao.MangetQnA();
		
		System.out.println("글 갯수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		System.out.println("현재 페이지 : " + currentPage);
		
		pageCount = (cnt/ pageSize) + (cnt % pageSize > 0 ? 1:0); // 페이지 갯수
		
		start = (currentPage -1) * pageSize + 1;	//현재 페이지 시작 글번호
		
		end = (start + pageSize) -1;	//현재 페이지 마지막 글번호
		
		if(end>cnt) end = cnt;		//마지막 글번호와 글 갯수 맞쳐주기
		
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		
		if(cnt > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			
			//QnA 목록 조회
			List<QnAVO> dtos = dao.getQnAList(map);
			model.addAttribute("dtos", dtos);	//게시글 갯수
		}
		
		//시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		//마지막 페이지
		endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		//값 주기
		model.addAttribute("cnt", cnt);	// 글 갯수
		model.addAttribute("number", number);//출력용 글번호
		model.addAttribute("pageNum", pageNum);//페이지 번호
		
		if(cnt>0) {
			model.addAttribute("startPage", startPage);		//시작 페이지
			model.addAttribute("endPage", endPage);			//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); 		//페이지 갯수
			model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
	}
	

	
	//이메일 인증
	@Override
	public void emailsend(HttpServletRequest req, Model model) {
		
		String toEmail = req.getParameter("userEmail");
		req.getSession().setAttribute("userEmail", toEmail);
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for(int i = 0; i < 6; i++) {
			int rIndex = rnd.nextInt(2);
			switch(rIndex) {
			case 0:
				//A-Z
				temp.append((char)((int)(rnd.nextInt(26))+65));
				break;
			case 1:
				// 0-9
				temp.append(rnd.nextInt(10));
				break;
			}
		}
		String key = temp.toString();
		
		System.out.println(toEmail);
	
		//실행
		dao.sendmail(toEmail, key);
		
		//이메일,키값 테이블에 넣기
		Map<String,Object> EmailChkmap = new HashMap<String,Object>();
		EmailChkmap.put("toEmail", toEmail);
		EmailChkmap.put("key", key);
		
		dao.emailKey(EmailChkmap);
		model.addAttribute("userEmail", toEmail);
	}
	
	//이메일 키값 인증
	@Override
	public void emailKeyChk(HttpServletRequest req, Model model) {
		String emailChk = req.getParameter("EmailChk");
		String userEmail = req.getParameter("userEmail");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("emailChk", emailChk);
		map.put("userEmail", userEmail);
		
		int emailCnt = dao.chkKey(map);
		model.addAttribute("emailCnt", emailCnt);
	}
	
	//공지사항 삭제 처리
	@Override
	public void deleteNoticePro(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String pwd = req.getParameter("pwd");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("num", num);
		map.put("pwd", pwd);
		
		int insertCnt = dao.modifyPwdChk(map);
		
		System.out.println("insertCnt 정상 출력시 1 : " + insertCnt);
		if(insertCnt == 1) {
			int deleteCnt = dao.deleteNoticePro(num);
			
			System.out.println("deleteCnt 정상 출력시 1 : " + deleteCnt);
			
			model.addAttribute("deleteCnt", deleteCnt);
			model.addAttribute("num", num);
			model.addAttribute("pageNum", pageNum);
		}
	}

	//공지 수정 전 비밀번호 체크 후 뷰어
	@Override
	public void modifyPwdChk(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		String pageNum = (String)req.getParameter("pageNum");
		String pwd = req.getParameter("pwd");
		
		faqVO vo = null;
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("num", num);
		map.put("pwd", pwd);
		
		int modifyCnt = dao.modifyPwdChk(map);
		
		System.out.println("modifyCnt : " + modifyCnt);
		if(modifyCnt == 1) {
			vo = dao.notice_content(num);
			System.out.println("정상출력");
		}
		model.addAttribute("dto", vo);
		model.addAttribute("modifyCnt", modifyCnt);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
	}
	
	//고객 1:1 문의 사항 답글 전달	
	@Override
	public void custQnASend(HttpServletRequest req, Model model) {
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int num = Integer.parseInt(req.getParameter("num"));
		String content = req.getParameter("content");
		
		QnAVO vo = new QnAVO();
		vo.setA_content(content);
		vo.setNum(num);
		
		int sendCnt = dao.QnaSend(vo);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("sendCnt", sendCnt);
		System.out.println("sendCnt : " + sendCnt);
	}
	
	//공지사항 수정값 입력
	@Override
	public void modifyInsert(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String hostId = req.getParameter("writer");
		String hostPw = req.getParameter("pw");
		String kind = req.getParameter("kind");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		
		faqVO vo = new faqVO();
		
		vo.setNum(num);
		vo.setHostId(hostId);
		vo.setHostPwd(hostPw);
		vo.setKind(kind);
		vo.setSubject(subject);
		vo.setContent(content);
		
		int insertCnt = dao.modifyInsert(vo);
		System.out.println("insertCnt 정상 출력시 1 : " + insertCnt);
		
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("insertCnt", insertCnt);
	}
	
	//관리자 1:1문의 상세 보기
	@Override
	public void QnaContent(HttpServletRequest req, Model model) {
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int num = Integer.parseInt(req.getParameter("num"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		QnAVO vo = dao.QnaContent(num);
		
		model.addAttribute("vo", vo);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("num", num);
		model.addAttribute("number", number);
	}
	//고객 1:1 문의 조회
	@Override
	public void QnACustView(HttpServletRequest req, Model model) {
		String strId = (String)req.getSession().getAttribute("strId");
		int pageSize = 5;		//한 페이지당 출력 글 갯수
		int pageBlock = 5;		//한 블럭당 페이지 갯수
		
		int cnt = 0;			//글의 갯수
		int start = 0;			//페이지 시작 글번호
		int end = 0;			//페이지 마지막 글번호
		int number = 0;			//출력용 글번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		cnt = dao.getQnA(strId);
		
		System.out.println("글 갯수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		System.out.println("현재 페이지 : " + currentPage);
		
		pageCount = (cnt/ pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수
		
		start = (currentPage -1) * pageSize + 1;	//현재 페이지 시작 글번호
		
		end = start + pageSize -1;	//현재 페이지 마지막 글번호
		System.out.println("페이지 블록 : "+pageBlock);
		System.out.println("스타트 : "+start);
		System.out.println("엔드 : "+end);
		
		if(end>cnt) end = cnt;		//마지막 글번호와 글 갯수 맞쳐주기
		
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		
		if(cnt > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("Id", strId);
			
			//게시글 목록 조회
			List<QnAVO> dtos = dao.guestQnAList(map);
			model.addAttribute("dtos", dtos);	//게시글 갯수
		}
		
		//시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		//마지막 페이지
		endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		//값 주기
		model.addAttribute("cnt", cnt);	// 글 갯수
		model.addAttribute("number", number);//출력용 글번호
		model.addAttribute("pageNum", pageNum);//페이지 번호
		
		if(cnt>0) {
			model.addAttribute("startPage", startPage);		//시작 페이지
			model.addAttribute("endPage", endPage);			//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); 		//페이지 갯수
			model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
	}
	
	//관리자 회원 정보 조회
	@Override
	public void custInfo(HttpServletRequest req, Model model) {
		int pageSize = 5;		//한 페이지당 출력 글 갯수
		int pageBlock = 5;		//한 블럭당 페이지 갯수
		
		int cnt = 0;			//글의 갯수
		int start = 0;			//페이지 시작 글번호
		int end = 0;			//페이지 마지막 글번호
		int number = 0;			//출력용 글번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		cnt = dao.custInfoCnt();
		
		System.out.println("글 갯수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		System.out.println("현재 페이지 : " + currentPage);
		
		pageCount = (cnt/ pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수
		
		start = (currentPage -1) * pageSize + 1;	//현재 페이지 시작 글번호
		
		end = start + pageSize -1;	//현재 페이지 마지막 글번호
		System.out.println("페이지 블록 : "+pageBlock);
		System.out.println("스타트 : "+start);
		System.out.println("엔드 : "+end);
		
		if(end>cnt) end = cnt;		//마지막 글번호와 글 갯수 맞쳐주기
		
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		
		if(cnt > 0) {
			//게시글 목록 조회
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			
			List<guestVO> dtos = dao.custInfo(map);
			model.addAttribute("dtos", dtos);	//게시글 갯수
		}
		
		//시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		//마지막 페이지
		endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		//값 주기
		model.addAttribute("cnt", cnt);	// 글 갯수
		model.addAttribute("number", number);//출력용 글번호
		model.addAttribute("pageNum", pageNum);//페이지 번호
		
		if(cnt>0) {
			model.addAttribute("startPage", startPage);		//시작 페이지
			model.addAttribute("endPage", endPage);			//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); 		//페이지 갯수
			model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
	}
		
	//관리자 재고 조회
	@Override
	public void productInfo(HttpServletRequest req, Model model) {
			int pageSize = 5;		//한 페이지당 출력 글 갯수
			int pageBlock = 5;		//한 블럭당 페이지 갯수
			
			int cnt = 0;			//글의 갯수
			int start = 0;			//페이지 시작 글번호
			int end = 0;			//페이지 마지막 글번호
			int number = 0;			//출력용 글번호
			String pageNum = "";	//페이지 번호
			int currentPage = 0;	//현재 페이지
			
			int pageCount = 0;		//페이지 갯수
			int startPage = 0;		//시작 페이지
			int endPage = 0;		//마지막 페이지
			
			cnt = dao.productInfo();
			
			System.out.println("글 갯수 : " + cnt);
			
			pageNum = req.getParameter("pageNum");
			
			if(pageNum == null) {
				pageNum = "1";
			}
			
			currentPage = Integer.parseInt(pageNum); // 현재 페이지
			System.out.println("현재 페이지 : " + currentPage);
			
			pageCount = (cnt/ pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수
			
			start = (currentPage -1) * pageSize + 1;	//현재 페이지 시작 글번호
			
			end = start + pageSize -1;	//현재 페이지 마지막 글번호
			System.out.println("페이지 블록 : "+pageBlock);
			System.out.println("스타트 : "+start);
			System.out.println("엔드 : "+end);
			
			if(end>cnt) end = cnt;		//마지막 글번호와 글 갯수 맞쳐주기
			
			number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
			
			if(cnt > 0) {
				//게시글 목록 조회
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("start", start);
				map.put("end", end);
				
				List<productVO> dtos = dao.proInfo(map);
				model.addAttribute("dtos", dtos);	//게시글 갯수
			}
			
			//시작 페이지
			startPage = (currentPage / pageBlock) * pageBlock + 1;
			
			if(currentPage % pageBlock == 0) startPage -= pageBlock;
			
			//마지막 페이지
			endPage = startPage + pageBlock -1;
			
			if(endPage > pageCount) endPage = pageCount;
			
			//값 주기
			model.addAttribute("cnt", cnt);	// 글 갯수
			model.addAttribute("number", number);//출력용 글번호
			model.addAttribute("pageNum", pageNum);//페이지 번호
			
			if(cnt>0) {
				model.addAttribute("startPage", startPage);		//시작 페이지
				model.addAttribute("endPage", endPage);			//마지막 페이지
				model.addAttribute("pageBlock", pageBlock);		//출력할 페이지 갯수
				model.addAttribute("pageCount", pageCount); 		//페이지 갯수
				model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
	}
	
	//파일 업로드
	@Override
	public void uploadfile(MultipartHttpServletRequest req, Model model) {
		MultipartFile file = req.getFile("p_img");
		MultipartFile file1 = req.getFile("p_img1");
		MultipartFile file2 = req.getFile("p_img2");
		MultipartFile file3 = req.getFile("p_img3");
		
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/pd_img/");	//임시 파일이 저장되는 경로
		
		String realDir = "C:\\Users\\rudwo\\Desktop\\JAVA\\spring_project_Mybatis(lkj)\\spring_project_Mybatis\\src\\main\\webapp\\resources\\pd_img\\pd";//업로드할 파일이 위치하게될 경로
		
		try {
			file.transferTo(new File(saveDir+file.getOriginalFilename()));
			file1.transferTo(new File(saveDir+file1.getOriginalFilename()));
			file2.transferTo(new File(saveDir+file2.getOriginalFilename()));
			file3.transferTo(new File(saveDir+file3.getOriginalFilename()));
			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileInputStream fis1 = new FileInputStream(saveDir + file1.getOriginalFilename());
			FileInputStream fis2 = new FileInputStream(saveDir + file2.getOriginalFilename());
			FileInputStream fis3 = new FileInputStream(saveDir + file3.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
			FileOutputStream fos1 = new FileOutputStream(realDir + file1.getOriginalFilename());
			FileOutputStream fos2 = new FileOutputStream(realDir + file2.getOriginalFilename());
			FileOutputStream fos3 = new FileOutputStream(realDir + file3.getOriginalFilename());
			
			int data = 0;
			
			while((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();
			
			while((data = fis1.read()) != -1) {
				fos1.write(data);
			}
			fis1.close();
			fos1.close();
			
			while((data = fis2.read()) != -1) {
				fos2.write(data);
			}
			fis2.close();
			fos2.close();
			
			while((data = fis3.read()) != -1) {
				fos3.write(data);
			}
			fis3.close();
			fos3.close();
			
			productVO vo = new productVO();
			
			vo.setNum(req.getParameter("num"));
			vo.setP_code(req.getParameter("p_code"));
			vo.setP_image(file.getOriginalFilename());
			vo.setP_name(req.getParameter("p_name"));
			vo.setP_size(req.getParameter("p_size"));
			vo.setP_color(req.getParameter("p_color"));
			vo.setP_count(req.getParameter("p_count"));
			vo.setP_kind(req.getParameter("p_kind"));
			vo.setP_salePrice(req.getParameter("p_salePrice"));
			vo.setP_purchaseCost(req.getParameter("p_purchaseCost"));
			vo.setP_image1(file1.getOriginalFilename());
			vo.setP_image2(file2.getOriginalFilename());
			vo.setP_image3(file3.getOriginalFilename());
			
			int resultCnt = dao.uploadpd(vo);
			
			model.addAttribute("resultCnt", resultCnt);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//로그인 시 strId 넘기기
	@Override
	public void loginStrId(HttpServletRequest req, Model model) {
		String strId = req.getParameter("strId");
		System.out.println(strId);
		
		model.addAttribute("strId", strId);	//로그인 여부
		
		int pageSize = 9;		//한 페이지당 출력 글 갯수
		int pageBlock = 5;		//한 블럭당 페이지 갯수
		
		int cnt = 0;			//글의 갯수
		int start = 0;			//페이지 시작 글번호
		int end = 0;			//페이지 마지막 글번호
		int number = 0;			//출력용 글번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		cnt = dao.productInfo();
		
		System.out.println("글 갯수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		System.out.println("현재 페이지 : " + currentPage);
		
		pageCount = (cnt/ pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수
		
		start = (currentPage -1) * pageSize + 1;	//현재 페이지 시작 글번호
		
		end = start + pageSize -1;	//현재 페이지 마지막 글번호
		System.out.println("페이지 블록 : "+pageBlock);
		System.out.println("스타트 : "+start);
		System.out.println("엔드 : "+end);
		
		if(end>cnt) end = cnt;		//마지막 글번호와 글 갯수 맞쳐주기
		
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		
		if(cnt > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			
			List<productVO> dtos = dao.proInfo(map);
			model.addAttribute("dtos", dtos);
		}
		//시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		//마지막 페이지
		endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		//값 주기
		model.addAttribute("cnt", cnt);	// 글 갯수
		model.addAttribute("number", number);//출력용 글번호
		model.addAttribute("pageNum", pageNum);//페이지 번호
		
		if(cnt>0) {
			model.addAttribute("startPage", startPage);		//시작 페이지
			model.addAttribute("endPage", endPage);			//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); 		//페이지 갯수
			model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
	}	
	
	//상품 정보보기
	@Override
	public void productView(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		productVO vo = dao.productView(num);
		
		model.addAttribute("dto", vo);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		
	}
	
	//장바구니 연결
	@Override
	public void cartPro(HttpServletRequest req, Model model) {
		
		String strId = req.getParameter("strId");
		
		String p_code = req.getParameter("p_code");
		String p_image = req.getParameter("p_image");
		String p_name = req.getParameter("p_name");
		String size = req.getParameter("size");
		String count = req.getParameter("amount");
		String p_salePrice = req.getParameter("p_salePrice");
		String sum = req.getParameter("sum");
		String p_color = req.getParameter("p_color");
		String p_kind = req.getParameter("p_kind");
		
		productVO vo = new productVO();
		
		vo.setId(strId);
		vo.setP_image(p_image);
		vo.setP_code(p_code);
		vo.setP_name(p_name);
		vo.setP_size(size);
		vo.setP_count(count);
		vo.setP_salePrice(p_salePrice);
		vo.setSum(sum);
		vo.setP_color(p_color);
		vo.setP_kind(p_kind);
		
		int cartCnt = dao.cartInsert(vo);
		
		model.addAttribute("p_color", p_color);
		model.addAttribute("cartCnt", cartCnt);
		model.addAttribute("p_kind", p_kind);
	}
	
	//장바구니 상세 조회
	@Override
	public void cartForm(HttpServletRequest req, Model model) {
		String strId = (String)req.getSession().getAttribute("strId");
		
		int pageSize = 5;		//한 페이지당 출력 글 갯수
		int pageBlock = 5;		//한 블럭당 페이지 갯수
		
		int cnt = 0;			//글의 갯수
		int start = 0;			//페이지 시작 글번호
		int end = 0;			//페이지 마지막 글번호
		int number = 0;			//출력용 글번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		cnt = dao.cartInfoCnt(strId);
		
		System.out.println("글 갯수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		System.out.println("현재 페이지 : " + currentPage);
		
		pageCount = (cnt/ pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수
		
		start = (currentPage -1) * pageSize + 1;	//현재 페이지 시작 글번호
		
		end = start + pageSize -1;	//현재 페이지 마지막 글번호
		System.out.println("페이지 블록 : "+pageBlock);
		System.out.println("스타트 : "+start);
		System.out.println("엔드 : "+end);
		
		if(end>cnt) end = cnt;		//마지막 글번호와 글 갯수 맞쳐주기
		
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		
		if(cnt > 0) {
			//게시글 목록 조회
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			
			List<productVO> dtos = dao.cartInfo(map);
			model.addAttribute("dtos", dtos);	//게시글 갯수
		}
		
		//시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		//마지막 페이지
		endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		//값 주기
		model.addAttribute("cnt", cnt);	// 글 갯수
		model.addAttribute("number", number);//출력용 글번호
		model.addAttribute("pageNum", pageNum);//페이지 번호
		
		if(cnt>0) {
			model.addAttribute("startPage", startPage);		//시작 페이지
			model.addAttribute("endPage", endPage);			//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); 		//페이지 갯수
			model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
	}
	
	//장바구니 삭제
	@Override
	public void deleteCart(HttpServletRequest req, Model model) {
		String[] select = req.getParameterValues("select");
		String pageNum = req.getParameter("pageNum");
		
		for(int i=0;i<select.length;i++) {
			System.out.println("장바구니 테스트 :"+select[i]);
			int saleCnt = dao.deleteCart(select[i]);
			model.addAttribute("saleCnt", saleCnt);
		}
		model.addAttribute("pageNum", pageNum);
	}
	
	//상품 주문 폼 만들기
	@Override
	public void orderProductForm(HttpServletRequest req, Model model) {
		String strId = req.getParameter("strId");
		String p_code =req.getParameter("p_code");
		String size = req.getParameter("size");
		String amount = req.getParameter("amount");
		String salePrice = req.getParameter("salePrice");
		String sum = req.getParameter("sum");
		
		productVO dto = dao.orderProductView(p_code);

		guestVO vo =dao.modifyView(strId);//구매자 정보
		
		model.addAttribute("p_code", p_code);
		model.addAttribute("size", size);
		model.addAttribute("amount", amount);
		model.addAttribute("salePrice", salePrice);
		model.addAttribute("sum", sum);
		model.addAttribute("dto", dto);
		model.addAttribute("vo", vo);//구매자 정보
	}
	
	//장바구니 전체 결제 화면
	@Override
	public void cartTotalOrder(HttpServletRequest req, Model model) {
		String strId = (String)req.getSession().getAttribute("strId");
		String select = req.getParameter("select");
		
		String p_code = req.getParameter("p_code");
		String p_name = req.getParameter("p_name");
		String size = req.getParameter("p_size");
		String count = req.getParameter("p_count");
		String p_salePrice = req.getParameter("p_salePrice");
		String sum = req.getParameter("sum");
		String p_color = req.getParameter("p_color");
		String p_kind = req.getParameter("p_kind");
		
		
		model.addAttribute("p_size", size);
		model.addAttribute("p_count", count);
		model.addAttribute("p_salePrice", p_salePrice);
		model.addAttribute("sum", sum);
		model.addAttribute("p_kind", p_kind);
		model.addAttribute("p_color", p_color);
		
		int pageSize = 5;		//한 페이지당 출력 글 갯수
		int pageBlock = 5;		//한 블럭당 페이지 갯수
		
		int cnt = 0;			//글의 갯수
		int start = 0;			//페이지 시작 글번호
		int end = 0;			//페이지 마지막 글번호
		int number = 0;			//출력용 글번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		cnt = dao.cartInfoCnt(strId);
		
		System.out.println("장바구니 갯수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		System.out.println("현재 페이지 : " + currentPage);
		
		pageCount = (cnt/ pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수
		
		start = (currentPage -1) * pageSize + 1;	//현재 페이지 시작 글번호
		
		end = start + pageSize -1;	//현재 페이지 마지막 글번호
		System.out.println("페이지 블록 : "+pageBlock);
		System.out.println("스타트 : "+start);
		System.out.println("엔드 : "+end);
		
		if(end>cnt) end = cnt;		//마지막 글번호와 글 갯수 맞쳐주기
		
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		
		if(cnt > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("num", select);
			List<productVO> dtos = dao.priCartOrd(map);
			//게시글 목록 조회
			model.addAttribute("dtos", dtos);
		}
		 
		//시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		//마지막 페이지
		endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		//값 주기
		model.addAttribute("cnt", cnt);	// 글 갯수
		model.addAttribute("number", number);//출력용 글번호
		model.addAttribute("pageNum", pageNum);//페이지 번호
		
		if(cnt>0) {
			model.addAttribute("startPage", startPage);		//시작 페이지
			model.addAttribute("endPage", endPage);			//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); 		//페이지 갯수
			model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
		guestVO vo =dao.modifyView(strId);
		
		model.addAttribute("vo", vo);
		model.addAttribute("p_code", p_code);
		model.addAttribute("p_name", p_name);
	}
		
	
	//상품 주문 처리
	@Override
	public void orderProductPro(HttpServletRequest req, Model model) {
		String strId = req.getParameter("strId");
		String p_code = req.getParameter("p_code");
		String p_name = req.getParameter("p_name");
		String p_size = req.getParameter("p_size");
		String p_color = req.getParameter("p_color");
		String p_count = req.getParameter("p_count");
		String p_price = req.getParameter("p_price");
		String p_kind = req.getParameter("p_kind");
		String o_address = req.getParameter("add1")+req.getParameter("add2");
		
		orderVO vo = new orderVO();
		
		//값 받아오기
		vo.setId(strId);
		vo.setP_code(p_code);
		vo.setP_name(p_name);
		vo.setP_size(p_size);
		vo.setP_color(p_color);
		vo.setP_count(p_count);
		vo.setP_price(p_price);
		vo.setP_kind(p_kind);
		vo.setO_address(o_address);
	
		//실행
		int orderCnt = dao.insertOrder(vo);
		
		
		model.addAttribute("orderCnt", orderCnt);
		if(orderCnt == 1) {
			model.addAttribute("strId", null);
			Map<String,Object> map =new HashMap<String,Object>();
			
			map.put("p_code", p_code);
			map.put("strId", strId);
			
			dao.ordCartDel(map);
		}
		
		System.out.println("strId 체크 : " + strId);
		
		System.out.println(orderCnt);
	}
	
	//관리자 주문 처리 조회
	@Override
	public void hostOrderChk(HttpServletRequest req, Model model) {
		int pageSize = 5;		//한 페이지당 출력 글 갯수
		int pageBlock = 5;		//한 블럭당 페이지 갯수
		
		int cnt = 0;			//글의 갯수
		int start = 0;			//페이지 시작 글번호
		int end = 0;			//페이지 마지막 글번호
		int number = 0;			//출력용 글번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		cnt = dao.hostOrderChk();
		
		System.out.println("글 갯수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		System.out.println("현재 페이지 : " + currentPage);
		
		pageCount = (cnt/ pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수
		
		start = (currentPage -1) * pageSize + 1;	//현재 페이지 시작 글번호
		
		end = start + pageSize -1;	//현재 페이지 마지막 글번호
		System.out.println("페이지 블록 : "+pageBlock);
		System.out.println("스타트 : "+start);
		System.out.println("엔드 : "+end);
		
		if(end>cnt) end = cnt;		//마지막 글번호와 글 갯수 맞쳐주기
		
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		
		if(cnt > 0) {
			//게시글 목록 조회
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			
			List<orderVO> dtos = dao.orderInfo(map);
			model.addAttribute("dtos", dtos);	//게시글 갯수
		}
		
		//시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		//마지막 페이지
		endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		//값 주기
		model.addAttribute("cnt", cnt);	// 글 갯수
		model.addAttribute("number", number);//출력용 글번호
		model.addAttribute("pageNum", pageNum);//페이지 번호
		
		if(cnt>0) {
			model.addAttribute("startPage", startPage);		//시작 페이지
			model.addAttribute("endPage", endPage);			//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); 		//페이지 갯수
			model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
	}
	
	//관리자 구매 확정
	@Override
	public void hostSaleChk(HttpServletRequest req, Model model) {
		String[] num = req.getParameterValues("order");
		String pageNum = req.getParameter("pageNum");
		
		for(int i=0;i<num.length;i++) {
			int saleCnt = dao.orderSaleChk(num[i]);
			model.addAttribute("saleCnt", saleCnt);
		}
		model.addAttribute("pageNum", pageNum);
	}
	
	//결산 그래프
	@Override
	public void resultGrape(HttpServletRequest req, Model model) {
		
		int totalSale = dao.totalSale();
		
		model.addAttribute("totalSale", totalSale);
		
		List<productVO> list = dao.FirstChat();
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("total", 0);
		map.put("운동화", 0);
		map.put("스포츠,레저", 0);
		map.put("구두", 0);
		map.put("샌들", 0);
		map.put("부츠", 0);
		map.put("용품", 0);
		
		for(productVO vo : list) {
			map.put(vo.getP_kind(), Integer.parseInt(vo.getP_count()));
		}
		model.addAttribute("firstChat", map);
		
		List<guestVO> list1 = dao.SecondChat();
		
		Map<String,Integer> map1 = new HashMap<String,Integer>();
		map1.put("남자", 0);
		map1.put("여자", 0);
		
		for(guestVO vo : list1) {
			map1.put(vo.getGender(), Integer.parseInt(vo.getP_count()));
		}
		model.addAttribute("secondChat", map1);
	}
	
	//고객 나의 주문 현황
	@Override
	public void guestMyOrder(HttpServletRequest req, Model model) {
		String strId = (String)req.getSession().getAttribute("strId");
		
		int pageSize = 5;		//한 페이지당 출력 글 갯수
		int pageBlock = 5;		//한 블럭당 페이지 갯수
		
		int cnt = 0;			//글의 갯수
		int start = 0;			//페이지 시작 글번호
		int end = 0;			//페이지 마지막 글번호
		int number = 0;			//출력용 글번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		cnt = dao.guestMyOrderCnt(strId);
		
		System.out.println("글 갯수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		System.out.println("현재 페이지 : " + currentPage);
		
		pageCount = (cnt/ pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수
		
		start = (currentPage -1) * pageSize + 1;	//현재 페이지 시작 글번호
		
		end = start + pageSize -1;	//현재 페이지 마지막 글번호
		System.out.println("페이지 블록 : "+pageBlock);
		System.out.println("스타트 : "+start);
		System.out.println("엔드 : "+end);
		
		if(end>cnt) end = cnt;		//마지막 글번호와 글 갯수 맞쳐주기
		
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		
		if(cnt > 0) {
			//게시글 목록 조회
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("Id", strId);
			List<orderVO> dtos = dao.guestMyOrder(map);
			model.addAttribute("dtos", dtos);	//게시글 갯수
		}
		
		//시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		//마지막 페이지
		endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		//값 주기
		model.addAttribute("cnt", cnt);	// 글 갯수
		model.addAttribute("number", number);//출력용 글번호
		model.addAttribute("pageNum", pageNum);//페이지 번호
		
		if(cnt>0) {
			model.addAttribute("startPage", startPage);		//시작 페이지
			model.addAttribute("endPage", endPage);			//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); 		//페이지 갯수
			model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
	}
	
	//고객 현재 주문 현황
	@Override
	public void currentOrder(HttpServletRequest req, Model model) {
		String strId = (String)req.getSession().getAttribute("strId");
		
		int pageSize = 5;		//한 페이지당 출력 글 갯수
		int pageBlock = 5;		//한 블럭당 페이지 갯수
		
		int cnt = 0;			//글의 갯수
		int start = 0;			//페이지 시작 글번호
		int end = 0;			//페이지 마지막 글번호
		int number = 0;			//출력용 글번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		cnt = dao.currentOrder(strId);
		
		System.out.println("글 갯수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		System.out.println("현재 페이지 : " + currentPage);
		
		pageCount = (cnt/ pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수
		
		start = (currentPage -1) * pageSize + 1;	//현재 페이지 시작 글번호
		
		end = start + pageSize -1;	//현재 페이지 마지막 글번호
		System.out.println("페이지 블록 : "+pageBlock);
		System.out.println("스타트 : "+start);
		System.out.println("엔드 : "+end);
		
		if(end>cnt) end = cnt;		//마지막 글번호와 글 갯수 맞쳐주기
		
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		
		if(cnt > 0) {
			//게시글 목록 조회
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("Id", strId);
			List<orderVO> dtos = dao.guestMyOrder(map);
			model.addAttribute("dtos", dtos);	//게시글 갯수
		}
		
		//시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		//마지막 페이지
		endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		//값 주기
		model.addAttribute("cnt", cnt);	// 글 갯수
		model.addAttribute("number", number);//출력용 글번호
		model.addAttribute("pageNum", pageNum);//페이지 번호
		
		if(cnt>0) {
			model.addAttribute("startPage", startPage);		//시작 페이지
			model.addAttribute("endPage", endPage);			//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); 		//페이지 갯수
			model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
	}
	
	//관리자 회원 강제 탈퇴
	@Override
	public void hostDelCust(HttpServletRequest req, Model model) {
		String[] custId = req.getParameterValues("select");
		String pageNum = req.getParameter("pageNum");
		
		int delCnt = 0;
		
		for(int i=0;i<custId.length;i++) {
			System.out.println("관리자 회원 탈퇴 테스트 :"+custId[i]);
			delCnt = dao.deletePro(custId[i]);
		}
		
		model.addAttribute("delCnt", delCnt);
		model.addAttribute("pageNum", pageNum);
	}
	
	//상품 발주 화면
	@Override
	public void pdCountSize(HttpServletRequest req, Model model) {
		String code = req.getParameter("code");
		String img = req.getParameter("img");
		
		model.addAttribute("img", img);
		model.addAttribute("code", code);
		
		System.out.println("code 테스트" + code);
		
		int pageSize = 5;		//한 페이지당 출력 글 갯수
		int pageBlock = 5;		//한 블럭당 페이지 갯수
		
		int cnt = 0;			//글의 갯수
		int start = 0;			//페이지 시작 글번호
		int end = 0;			//페이지 마지막 글번호
		int number = 0;			//출력용 글번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		cnt = dao.hostOrdCnt();
		
		System.out.println("글 갯수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		System.out.println("현재 페이지 : " + currentPage);
		
		pageCount = (cnt/ pageSize) + (cnt % pageSize > 0 ? 1:0); // 페이지 갯수
		
		start = (currentPage -1) * pageSize + 1;	//현재 페이지 시작 글번호
		
		end = (start + pageSize) -1;	//현재 페이지 마지막 글번호
		
		if(end>cnt) end = cnt;		//마지막 글번호와 글 갯수 맞쳐주기
		
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		
		if(cnt > 0) {
			//게시글 목록 조회
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("code", code);
			List<productVO> dtos = dao.hostOrdPro(map);
			model.addAttribute("dtos", dtos);	//게시글 갯수
		}
		
		//시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		//마지막 페이지
		endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		//값 주기
		model.addAttribute("cnt", cnt);	// 글 갯수
		model.addAttribute("number", number);//출력용 글번호
		model.addAttribute("pageNum", pageNum);//페이지 번호
		
		if(cnt>0) {
			model.addAttribute("startPage", startPage);		//시작 페이지
			model.addAttribute("endPage", endPage);			//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); 		//페이지 갯수
			model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
	}
	
	//발주 상품 사이즈 수량 추가
	@Override
	public void addCountSize(HttpServletRequest req, Model model) {
		String ordCode = req.getParameter("p_code");
		String ordSize = req.getParameter("p_size");
		String ordCount = req.getParameter("orderCount");
		String pageNum = req.getParameter("pageNum");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("ordCode", ordCode);
		map.put("ordSize", ordSize);
		map.put("ordCount", ordCount);
		
		int cnt = dao.addCountSize(map);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);
	}
	
	//발주 신청
	@Override
	public void SCorderPro(HttpServletRequest req, Model model) {
		String productCount = req.getParameter("productCount");
		String p_code = req.getParameter("p_code");
		String pageNum = req.getParameter("pageNum");
		
		System.out.println("productCount"+productCount);
		System.out.println("p_code"+p_code);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("p_code", p_code);
		map.put("productCount", productCount);
		int orderCnt = dao.SCorderPro(map);
		
		model.addAttribute("orderCnt", orderCnt);
		model.addAttribute("pageNum", pageNum);
	}
	
	//관리자 로그인
	@Override
	public void hostLogin(HttpServletRequest req, Model model) {
		String strId = req.getParameter("userid");
		String strPw = req.getParameter("userpw");
		System.out.println(strId);
		System.out.println(strPw);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("strId", strId);
		map.put("strPw", strPw);
		
		int loginCnt = dao.HostloginPro(map);

		if(loginCnt == 1) {
			req.getSession().setAttribute("strId", strId);
		}
		
		model.addAttribute("loginCnt", loginCnt);
		model.addAttribute("strId", strId);
		
		System.out.println("loginCnt : " + loginCnt);
		//0이면 아이디 없음 ,1이면 로그인 성공,2는 비밀번호 틀림
	}

	//이메일 인증 후 id찾기
	@Override
	public void findIdPro(HttpServletRequest req, Model model) {
		String userName = req.getParameter("userIdName");
		String userEmail = req.getParameter("userIdEmail");
		String userBirth = req.getParameter("userIdBirth");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userName", userName);
		map.put("userEmail", userEmail);
		map.put("userBirth", userBirth);
		
		int NameMailCnt = dao.NameEmailChk(map);
		
		String key ="";
		
		if(NameMailCnt == 1) {
			guestVO vo = dao.getNameEmailChk(map);
			key = vo.getId();
			dao.sendtoId(userEmail, key);
		}
		model.addAttribute("NameMailCnt",NameMailCnt);
		System.out.println("NameMailCnt : " + NameMailCnt);
	}
	
	//이메일 인증 후 비밀번호 찾기
	@Override
	public void findPwPro(HttpServletRequest req, Model model) {
		String userId = req.getParameter("userPwid");
		String userEmail = req.getParameter("userPwEmail");
		String userName = req.getParameter("userPwName");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userName", userName);
		map.put("userEmail", userEmail);
		map.put("userId", userId);
		
		int NameMailCnt = dao.PwEmailChk(map);
		
		String key ="";
		
		if(NameMailCnt == 1) {
			guestVO vo = dao.getPwEmailChk(map);
			
			key = vo.getPwd();
			dao.sendtoPw(userEmail, key);
		}
		model.addAttribute("NameMailCnt",NameMailCnt);
		System.out.println("NameMailCnt : " + NameMailCnt);
	}

	//검색어 기능
	@Override
	public void searchData(HttpServletRequest req, Model model) {
		String keyword = req.getParameter("keyword");
		String strId = req.getParameter("strId");
		
		model.addAttribute("strId", strId);	//로그인 여부
		
		int pageSize = 9;		//한 페이지당 출력 글 갯수
		int pageBlock = 5;		//한 블럭당 페이지 갯수
		
		int cnt = 0;			//글의 갯수
		int start = 0;			//페이지 시작 글번호
		int end = 0;			//페이지 마지막 글번호
		int number = 0;			//출력용 글번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		cnt = dao.keywordCnt(keyword);
		
		System.out.println("글 갯수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		System.out.println("현재 페이지 : " + currentPage);
		
		pageCount = (cnt/ pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수
		
		start = (currentPage -1) * pageSize + 1;	//현재 페이지 시작 글번호
		
		end = start + pageSize -1;	//현재 페이지 마지막 글번호
		System.out.println("페이지 블록 : "+pageBlock);
		System.out.println("스타트 : "+start);
		System.out.println("엔드 : "+end);
		
		if(end>cnt) end = cnt;		//마지막 글번호와 글 갯수 맞쳐주기
		
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		
		if(cnt > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("keyword", keyword);
			
			List<productVO> dtos = dao.keyword(map);
			model.addAttribute("dtos", dtos);
		}
		//시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		//마지막 페이지
		endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		//값 주기
		model.addAttribute("cnt", cnt);	// 글 갯수
		model.addAttribute("number", number);//출력용 글번호
		model.addAttribute("pageNum", pageNum);//페이지 번호
		model.addAttribute("keyword", keyword);
		if(cnt>0) {
			model.addAttribute("startPage", startPage);		//시작 페이지
			model.addAttribute("endPage", endPage);			//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); 	//페이지 갯수
			model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
	}

	//환불 및 취소 신청
	@Override
	public void cancleOrder(HttpServletRequest req, Model model) {
		String orderNum = req.getParameter("orderNum");
		int orderNumCnt = dao.orderNum(orderNum);
		
		model.addAttribute("orderNumCnt",orderNumCnt);
	}
	
}
