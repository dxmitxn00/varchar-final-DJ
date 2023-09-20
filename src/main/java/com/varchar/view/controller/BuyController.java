package com.varchar.view.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.varchar.biz.buy.BuyDetailService;
import com.varchar.biz.buy.BuyDetailVO;
import com.varchar.biz.buy.BuyService;
import com.varchar.biz.buy.BuyVO;
import com.varchar.biz.member.MemberService;
import com.varchar.biz.member.MemberVO;
import com.varchar.biz.payment.PaymentService;
import com.varchar.biz.payment.PaymentVO;
import com.varchar.biz.review.ReviewService;
import com.varchar.biz.review.ReviewVO;
import com.varchar.biz.tea.TeaService;
import com.varchar.biz.tea.TeaVO;

@Controller
public class BuyController {

	@Autowired
	private BuyService buyService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private BuyDetailService buyDetailService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private TeaService teaService;
	
	@Autowired
	private JavaMailSender mailSender;

	////////////////////////////////////////////////////////////////////////////////////
	// 주문 목록 페이지 이동
	@RequestMapping(value = "/buyListPage.do")
	public String buyListPage(HttpSession session, Model model, BuyVO buyVO) {

		buyVO.setMemberId((String) session.getAttribute("sessionMemberId"));

		List<BuyVO> buyDatas = buyService.selectAll(buyVO);

		model.addAttribute("buyDatas", buyDatas);
		System.out.println(" log: BuyListPageAction: buyDatas: " + buyDatas);

		return "buyList.jsp";
	}

	////////////////////////////////////////////////////////////////////////////////////
	// 주문 페이지 이동
	@RequestMapping(value = "/buyPage.do")
	public String buyPage(HttpSession session, Model model, MemberVO memberVO) {

		List<TeaVO> cart = (List<TeaVO>) session.getAttribute("cart");

		int i = 0;
		final int ship = 3000;
		
		int total = ship;
		for (TeaVO t : cart) {
			int teaTotal = t.getTeaCnt() * t.getTeaPrice();
			cart.get(i).setTeaTotal(teaTotal);
			total += teaTotal;
			i++;
		}

		// 아래꺼 model로 바꿀까 고민중,,,
		session.setAttribute("buyList", cart);
		session.setAttribute("total", total);

		// ** 해당 회원 NULL 혹은 로그인 안함 ---> 유효성 추가 필요 */
		memberVO.setMemberId((String) session.getAttribute("sessionMemberId"));
		memberVO.setMemberSearch("회원정보변경");
		memberVO = memberService.selectOne(memberVO);

		System.out.println("BuyPageAction memberVO log:" + memberVO);
		model.addAttribute("memberVO", memberVO);

		System.out.println("BuyPageAction buyList log:" + cart);
		System.out.println("BuyPageAction total log:" + total);

		return "buy.jsp";
	}

	////////////////////////////////////////////////////////////////////////////////////
	// 주문상세 페이지 이동
	@RequestMapping(value = "/buyDetailPage.do")
	public String buyDetailPage(Model model, BuyDetailVO buyDetailVO, ReviewVO reviewVO) {

		// ** 해당 주문 상세 내역이 없을 경우 ---> 유효성 추가 필요 */
		buyDetailVO.setBuySearch("주문상세");
		List<BuyDetailVO> buyDetailDatas = buyDetailService.selectAll(buyDetailVO);

//		ReviewDAO rDAO = new ReviewDAO();

		if (buyDetailDatas != null) {
			reviewVO.setReviewSearch("리뷰확인");
			for (BuyDetailVO bddata : buyDetailDatas) {
				bddata.setReviewDone(false);
				reviewVO.setBuySerial(bddata.getBuySerial());
				if (reviewService.selectOne(reviewVO) == null) {
					bddata.setReviewDone(true);
					System.out.println("BuyDetailPageAction reviewVO null 로그 : " + reviewService.selectOne(reviewVO));
				} else {
					System.out.println(
							"BuyDetailPageAction reviewVO Not null  로그 : " + reviewService.selectOne(reviewVO));
				}
			}
			model.addAttribute("buyDetailDatas", buyDetailDatas);
			// View님들 bddatas를 buyDetailDatas로 변수명 바꿔주셈 ---> ㅋㅋㅋㅋㅋㅋ귀엽네
		}

		return "buyDetail.jsp";
	}

	// --------------------------------- 토스 결제 후 성공시  ---------------------------------
	@RequestMapping(value = "/paySuccess.do")
	public String paySuccess(HttpServletRequest request, HttpSession session, BuyVO buyVO, BuyDetailVO buyDetailVO,
			TeaVO teaVO, PaymentVO paymentVO, Model model, MemberVO memberVO) throws IOException {

		// 결제 승인 API 호출하기

		String orderName = request.getParameter("orderName");
		String orderId = request.getParameter("orderId");
		String paymentKey = request.getParameter("paymentKey");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String secretKey = "test_sk_zXLkKEypNArWmo50nX3lmeaxYG5R:";

		System.out.println("orderId" + orderId);
		System.out.println("paymentKey" + paymentKey);
		System.out.println("amount" + amount);
		Encoder encoder = Base64.getEncoder();
		byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
		String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);

		paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);

		URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");

		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestProperty("Authorization", authorizations);
		connection.setRequestProperty("Content-Type", "application/json");
		connection.setRequestMethod("POST");
		connection.setDoOutput(true);
		JSONObject obj = new JSONObject();
		obj.put("paymentKey", paymentKey);
		obj.put("orderId", orderId);
		obj.put("amount", amount);
		obj.put("orderName", orderName);

		OutputStream outputStream = connection.getOutputStream();
		outputStream.write(obj.toString().getBytes("UTF-8"));

		int code = connection.getResponseCode();
		boolean isSuccess = code == 200 ? true : false;

		InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();

		Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
		JSONParser parser = new JSONParser();
		try {
			System.out.println("try 들어옴");

			JSONObject jsonObject = (JSONObject) parser.parse(reader);
			request.setAttribute("JSONObject", jsonObject);
			request.setAttribute("isSuccess", isSuccess);

			// 이거 안되서 뭔가 생각좀 해봐야 될거 같은데
			// 그냥 우리가 가진 VO DAO로 출력하는게 제일 나을거 같다는 생각이 듦.....
			System.out.println("로그: jsonObject " + jsonObject);
			model.addAttribute("data", jsonObject);

//====================================================== 기존 로직 ======================================================
			List<TeaVO> buyList = (List<TeaVO>) session.getAttribute("buyList");
			System.out.println("로그 buyList: "+ buyList);
			String buyListText;

			String memberId = (String) session.getAttribute("sessionMemberId");
			buyVO.setMemberId(memberId);

			if (buyService.insert(buyVO)) {
				buyDetailVO.setMemberId(memberId);
				buyDetailVO.setBuySearch("주문번호");
				buyDetailVO = buyDetailService.selectOne(buyDetailVO); // 방금 주문한 번호 (buy_num) 저장

				for (int i = 0; i < buyList.size(); i++) { // 상품 종류만큼 반복
					buyDetailVO.setTeaNum(buyList.get(i).getTeaNum()); // 구매한 상품 번호 set
					buyDetailVO.setBuyCnt(buyList.get(i).getTeaCnt()); // 구매한 상품 갯수 set

					teaVO.setTeaNum(buyList.get(i).getTeaNum());
					teaVO.setTeaCnt(buyList.get(i).getTeaCnt());

					// ** 상세 주문 추가 / 재고 변경(검사도 필요) 각각 실패시 ---> 유효성 추가 필요 */
					buyDetailService.insert(buyDetailVO); // 상세 주문 추가
					teaVO.setTeaCondition("재고변경");
					teaService.update(teaVO); // 상품 재고 변경
				}
				paymentVO.setPaymentName(memberId);
				paymentVO.setPaymentCustomer(memberId);
				// ** 결제 정보 추가 실패시 ---> 유효성 추가 필요 */
				paymentService.insert(paymentVO);
				session.removeAttribute("buyList");
				model.addAttribute("buyCart", session.getAttribute("cart"));
				session.removeAttribute("cart");
			}

//			//주문내역 이메일 안내
//			memberVO.setMemberSearch("이메일"); // 아무거나 쓴거임 솔트로 바꿔도 무방
//			memberVO.setMemberId(memberId);
//			memberVO = memberService.selectOne(memberVO);
//			String receiver = memberVO.getMemberEmail();
//			String htag = "<style>\r\n"
//					+ "table.type07 {\r\n"
//					+ "  border-collapse: collapse;\r\n"
//					+ "  text-align: left;\r\n"
//					+ "  line-height: 1.5;\r\n"
//					+ "  border: 1px solid #ccc;\r\n"
//					+ "  margin: 20px 10px;\r\n"
//					+ "}\r\n"
//					+ "table.type07 thead {\r\n"
//					+ "  border-right: 1px solid #ccc;\r\n"
//					+ "  border-left: 1px solid #ccc;\r\n"
//					+ "  background: #e7708d;\r\n"
//					+ "}\r\n"
//					+ "table.type07 thead th {\r\n"
//					+ "  padding: 10px;\r\n"
//					+ "  font-weight: bold;\r\n"
//					+ "  vertical-align: top;\r\n"
//					+ "  color: #fff;\r\n"
//					+ "}\r\n"
//					+ "table.type07 tbody th {\r\n"
//					+ "  width: 150px;\r\n"
//					+ "  padding: 10px;\r\n"
//					+ "  font-weight: bold;\r\n"
//					+ "  vertical-align: top;\r\n"
//					+ "  border-bottom: 1px solid #ccc;\r\n"
//					+ "  background: #fcf1f4;\r\n"
//					+ "}\r\n"
//					+ "table.type07 td {\r\n"
//					+ "  width: 350px;\r\n"
//					+ "  padding: 10px;\r\n"
//					+ "  vertical-align: top;\r\n"
//					+ "  border-bottom: 1px solid #ccc;\r\n"
//					+ "}\r\n"
//					+ "</style>\r\n"
//					+ "\r\n"
//					+ "<table class=\"type07\">\r\n"
//					+ "  <thead>\r\n"
//					+ "  <tr>\r\n"
//					+ "    <th scope=\"cols\">주문번호: 00</th>\r\n"
//					+ "    <th scope=\"cols\">상품정보</th>\r\n"
//					+ "    <th scope=\"cols\">가격</th>\r\n"
//					+ "    <th scope=\"cols\">수량</th>\r\n"
//					+ "  </tr>\r\n"
//					+ "  </thead>\r\n"
//					+ "\r\n"
//					+ "  <tbody>\r\n"
//					+ "\r\n"
//					+ "  <tr>\r\n"
//					+ "    <th scope=\"row\"><div class=\"img\" style=\"background-image: url('');\"></th>\r\n"
//					+ "    <td>상품이름</td>\r\n"
//					+ "    <td>000원</td>\r\n"
//					+ "    <td>0개</td>\r\n"
//					+ "  </tr>\r\n"
//					+ "\r\n"
//					+ "  </tbody>\r\n"
//					+ "</table>";
//			if (receiver != null) {
//				String title = "[var茶] 주문내역 안내";
//				String name = memberVO.getMemberName();
//				String content = "<h2>" + name + "님의 주문내역을 안내드립니다~!!</h2><br>" + "var茶의 상품을 주문해주셔서 정말 감사합니다.<br>"
//						+ "앞으로 더 나은 서비스를 제공하겠습니다!"
//						+ htag;
//				String from = "TryCathers";
//				// 이메일 제목과 내용 설정
//
//				try {
//					MimeMessage mail = mailSender.createMimeMessage();
//					MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
//
//					mailHelper.setFrom(from);
//					mailHelper.setTo(receiver);
//					mailHelper.setSubject(title);
//					mailHelper.setText(content, true);
//
//					mailSender.send(mail);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}

// 해당 로직은 결제 단건 VO / DAO 만든거 같아서 참고용으로 둡니다
//====================================================== 별빛역 로직 ======================================================
//		         HttpSession session = request.getSession();// 세션 객체 생성
//		         String mid = (String) session.getAttribute("mid");// 세션에 저장된 사용자 아이디 값
//		         MemberVO mVO = new MemberVO();// 사용자 객체
//		         MemberDAO mDAO = new MemberDAO();
//
//		         OrderVO oVO = new OrderVO();// 구매 목록 객체
//		         OrderDAO oDAO = new OrderDAO();
//		         
//		         ProductVO pVO = new ProductVO();
//		         ProductDAO pDAO = new ProductDAO();
//		         
//		         OrderdetailVO odVO = new OrderdetailVO();// 구매 상세정보 객체
//		         OrderdetailDAO odDAO = new OrderdetailDAO();
//
//		         // 구독인지의 여부를 확인할 세션 가져오기
//		         if (session.getAttribute("subNum") == null) {
//		        	// 물건 구매라면
//		            // 물건 여러개인지 아닌지 확인
//		            if (session.getAttribute("cartFlag") == null) {
//		               String address = request.getParameter("address");
//
//		               oVO.setmID(mid);// 아이디(세션)
//		               oVO.setoAddress("경기도");// 사용자가 입력한 주소
//		               oVO.setoPrice(amount);// 사용자가 구매한 가격
//		               oVO.setoState("결제 완료");// 결제 상태
//
//		               oDAO.insert(oVO);// DB에 삽입
//
//		               oVO = oDAO.selectOne(oVO);// 주문 번호를 가져오기 위한 장치
//		               int pnum = (int) session.getAttribute("pnum");
//		               pVO.setpNum(pnum);
//		               pVO = pDAO.selectOne(pVO);
//		               int cnt = amount/pVO.getpPrice();
//		               odVO.setpNum(pnum);// 상품 번호
//		               odVO.setoNum(oVO.getoNum());// 주문 번호 
//		               odVO.setOdCnt(cnt);// 구매한 상품 개수
//		               
//		               odDAO.insert(odVO);
//		               forward = new ActionForward();// 객체 생성
//		               forward.setPath("success.jsp");// 이동 경로
//		               forward.setRedirect(false);// 넘겨줄 값 없음
//		               
//		            }
//		            // 장바구니 구매라면
//		            else if (session.getAttribute("cartFlag").equals("cart")) {
//		               //장바구니 세션 가져오기
//		               ArrayList<HashMap<Integer, ProductVO>>cart = (ArrayList<HashMap<Integer, ProductVO>>) session.getAttribute("cart");
//		               //이거를 DB에 넣어주기
//		               oVO.setmID(mid);// 아이디(세션)
//		               oVO.setoAddress("경기도");// 사용자가 입력한 주소
//		               oVO.setoPrice(amount);// 사용자가 구매한 가격
//		               oVO.setoState("결제 완료");// 결제 상태
//
//		               oDAO.insert(oVO);// DB에 삽입
//
//		               oVO = oDAO.selectOne(oVO);// 주문 번호를 가져오기 위한 장치
//
//		               
//		               
//		               
//		               for(int i =0; i< cart.size();i++) {
//		                  HashMap<Integer, ProductVO> hashMap = cart.get(i);// 키 값
//		                  Set<Integer> keySet = hashMap.keySet();
//		                  ArrayList<Integer> keyList = new ArrayList<Integer>();
//		                  for (int v : keySet) {
//		                     keyList.add(v);
//		                  }
////		                  System.out.println("확인: "+keyList);
//		                  for (int v : keyList) {
//		                     pVO = hashMap.get(v);
//		                     odVO.setpNum(pVO.getpNum());// 상품 번호
//		                     odVO.setoNum(oVO.getoNum());// 주문 번호
//		                     odVO.setOdCnt(pVO.getTmpCnt());// 구매한 상품 개수
//		                     odDAO.insert(odVO);
//		                  }
//		               }
//		               
//		               
//		               
//		               
//		               session.removeAttribute("cart");
//		               forward = new ActionForward();// 객체 생성
//		               forward.setPath("success.jsp");// 이동 경로
//		               forward.setRedirect(false);// 넘겨줄 값 없음
//
//		            }
//
//		         }
//		         // 구독 상품 구매라면
//		         else {
//		            int subNum = (int) session.getAttribute("subNum");
//		            SubsinfoVO subVO = new SubsinfoVO();
//		            SubsinfoDAO subDAO = new SubsinfoDAO();
//
//		            subVO.setmID(mid);// 사용자 아이디
//		            subVO.setSubNum(subNum);// 구매할려는 구독 상품 세팅
//
//		            subDAO.insert(subVO);// DB에 구독 정보 추가
//
//		            // 구독 정보 추가 후 구독 여부 변경하기
//		            mVO.setSk("CHANGESUBS");// 구독 변경 SK
//		            mVO.setmID(mid);// 사용자 아이디 세팅
//
//		            mDAO.update(mVO);// 구독 여부 변경(0에서 1로 변경)
//
//		            forward = new ActionForward();// 객체 생성
//		            forward.setPath("success.jsp");// 이동 경로
//		            forward.setRedirect(false);// 넘겨줄 값 없음
//
//		            session.removeAttribute("subNum");// 구매후 세션 제거(구독 상품 여부)
//
//		         }

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		responseStream.close();

		// =================================================================

		return "paySuccess.jsp";
	}
}
