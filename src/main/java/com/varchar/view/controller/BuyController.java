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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
			JSONObject jsonObject = (JSONObject) parser.parse(reader);

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
