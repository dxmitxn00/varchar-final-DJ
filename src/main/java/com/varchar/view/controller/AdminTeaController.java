package com.varchar.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.varchar.biz.category.CategoryService;
import com.varchar.biz.category.CategoryVO;
import com.varchar.biz.common.AlertVO;
import com.varchar.biz.image.ImageService;
import com.varchar.biz.image.ImageVO;
import com.varchar.biz.member.MemberService;
import com.varchar.biz.member.MemberService;
import com.varchar.biz.member.MemberVO;
import com.varchar.biz.tea.TeaService;
import com.varchar.biz.tea.TeaVO;


@Controller
public class AdminTeaController {
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private TeaService teaService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private MemberService memberService;

	
	// --------------------------------- 관리자 홈(메인) 페이지 이동 ---------------------------------
	@RequestMapping(value = "/admin.do")
	public String adminPage(CategoryVO categoryVO, MemberVO memberVO ,Model model, HttpSession session) {
		
		if(session.getAttribute("sessionMemberGrade") != null) {
			int memberGrade = (int)session.getAttribute("sessionMemberGrade");
			
			if(memberGrade == 1) {
				List<CategoryVO> categoryDatas = categoryService.selectAll(null); //이거 NULL 없애는 방향 고려
				model.addAttribute("categoryDatas", categoryDatas);
				
				List<MemberVO> memberDatas = memberService.selectAll(null); //이거 NULL 없애는 방향 고려
				model.addAttribute("memberDatas", memberDatas);
				
				
				return "admin.jsp";
			}
		}
		return "main.do";
		
		
	}
	
	// --------------------------------- 관리자 카테고리 페이지 이동 ---------------------------------
	@RequestMapping(value = "/adminCategory.do")
	public String adminCategoryPage(TeaVO teaVO, CategoryVO categoryVO, Model model) {

		teaVO.setTeaCondition("카테고리");
		List<TeaVO> teaDatas = teaService.selectAll(teaVO);
		
		List<CategoryVO> categoryDatas = categoryService.selectAll(null); //이거 NULL 없애는 방향 고려
		
		model.addAttribute("teaDatas", teaDatas);
		model.addAttribute("categoryDatas", categoryDatas);
		
		return "adCategory.jsp";
	}
	
	// --------------------------------- 관리자 카테고리 체크박스 변경 ---------------------------------
	@RequestMapping(value = "/changeCategory.do")
	public String adminCategory(@RequestParam(value="teaNums[]") List<String> teaNums, @RequestParam(value="categoryNum") int categoryNum, TeaVO teaVO, Model model) {
		
		System.out.println("teaNums: "+teaNums);
		System.out.println("teaNums 0번째: "+teaNums.get(0));
		System.out.println("categoryNum: "+categoryNum);
		
		teaVO.setTeaCondition("카테고리일괄변경");
		teaVO.setCategoryNum(categoryNum);
		for(int i = 0; i<teaNums.size(); i++) {
			teaVO.setTeaNum((Integer.parseInt(teaNums.get(i))));
			teaService.update(teaVO);
			
			AlertVO sweetAlertVO = new AlertVO("상품 카테고리 변경", "상품 카테고리 변경 성공!", null, "success", "admin.do");
			model.addAttribute("sweetAlert", sweetAlertVO);
		}
		
		return "alertTrue.jsp";

	}
	
	// --------------------------------- 카테고리 추가 ---------------------------------
	@RequestMapping(value = "/insertCategory.do")
	public String insertCategory(CategoryVO categoryVO, Model model) {
		
		if(categoryService.insert(categoryVO)) {
			AlertVO sweetAlertVO = new AlertVO("카테고리 추가", "상품 카테고리 추가 성공!", null, "success", "admin.do");
			model.addAttribute("sweetAlert", sweetAlertVO);
		}
		
		return "alertTrue.jsp";
	}
	
	// --------------------------------- 카테고리 삭제 ---------------------------------
	@RequestMapping(value = "/deleteCategory.do")
	public String deleteCategory(CategoryVO categoryVO, TeaVO teaVO, Model model) {
		
		categoryVO = categoryService.selectOne(categoryVO);
		
		if(categoryVO != null){	// 존재 확인

			if(categoryService.delete(categoryVO)) {
			
			teaVO.setTeaCondition("카테고리변경");
			teaVO.setCategoryNum(categoryVO.getCategoryNum());
			teaService.update(teaVO);
			
			AlertVO sweetAlertVO = new AlertVO("카테고리 삭제", "상품 카테고리 삭제 성공!", null, "success", "admin.do");
			model.addAttribute("sweetAlert", sweetAlertVO);
			}
		}

		return "alertTrue.jsp";
	}
	
	// --------------------------------- 카테고리 변경 ---------------------------------
	@RequestMapping(value = "/updateCategory.do")
	public String updateCategory(CategoryVO categoryVO, TeaVO teaVO, Model model) {
		
		System.out.println("updateCategory.do 진입 확인");
		System.out.println("categoryVO" +categoryVO);
		
		// 해당되는 카테고리에 있는 상품이 있을 수 있으므로 해당없음으로 변경해줘야 함
		if(categoryService.selectOne(categoryVO) != null){	// 존재 확인
			
			if(categoryService.update(categoryVO)) {
			
			teaVO.setTeaCondition("카테고리변경");
			teaVO.setCategoryNum(categoryVO.getCategoryNum());
			teaService.update(teaVO);
			
			AlertVO sweetAlertVO = new AlertVO("카테고리 변경", "상품 카테고리 변경 성공!", null, "success", "admin.do");
			model.addAttribute("sweetAlert", sweetAlertVO);
			}
			
		}
		
		return "alertTrue.jsp";
	}
	
	
	// --------------------------------- 상품관리 페이지 이동 ---------------------------------
	@RequestMapping(value = "/adminTea.do")
	public String adminTeaPage(TeaVO teaVO, Model model) {
		
		List<CategoryVO> categoryDatas = categoryService.selectAll(null); //이거 NULL 없애는 방향 고려
		model.addAttribute("categoryDatas", categoryDatas);
		
		return "adteaManage.jsp";
	}
	
	// --------------------------------- 상품 추가 ---------------------------------
	@RequestMapping(value = "/insertTea.do")
	public String insertTea(TeaVO teaVO, ImageVO imageVO, Model model, HttpServletRequest request) {

		final String path = request.getSession().getServletContext().getRealPath("images");

		List<MultipartFile> fileUpload = teaVO.getFileUpload();	
		
		if (teaService.insert(teaVO)) {
			teaVO.setTeaCondition("마지막 상품");
			int TeaNum = teaService.selectOne(teaVO).getTeaNum();
			imageVO.setTeaReviewNum(TeaNum);
			for (MultipartFile file : fileUpload) {
				if (!file.isEmpty()) {
					String originFileName = file.getOriginalFilename();
					String ext = originFileName.substring(originFileName.lastIndexOf("."));
					String ranFileName = UUID.randomUUID().toString() + ext;
					
					try {
						file.transferTo(new File(path + "\\" + ranFileName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					
					imageVO.setImageUrl("images/" + ranFileName);
					imageService.insert(imageVO);
					
					AlertVO sweetAlertVO = new AlertVO("상품 추가", "상품 추가 성공!", null, "success", "adminTea.do");
					model.addAttribute("sweetAlert", sweetAlertVO);
				}
			}
		}
		return "alertTrue.jsp";
	}
	
	// --------------------------------- 상품 삭제 ---------------------------------
	@RequestMapping(value = "/deleteTea.do")
	public String deleteTea(TeaVO teaVO, Model model) {
		
		teaVO = teaService.selectOne(teaVO);
		if (teaVO != null) { // 존재 확인
			
			teaVO.setTeaCondition("현재 해당 쿼리 없음 추후 맞는 서치컨디션 입력");
			if (teaService.delete(teaVO)) {
				//이미지 삭제 필요
				System.out.println("삭제 성공 후 진입");
				AlertVO sweetAlertVO = new AlertVO("상품 삭제", "상품 삭제 성공!", null, "success", "adminTea.do");
				model.addAttribute("sweetAlert", sweetAlertVO);
			}
		}
		return "alertTrue.jsp";
	}
	
	// --------------------------------- 상품 변경 ---------------------------------
	@RequestMapping(value = "/updateTea.do")
	public String updateTea(TeaVO teaVO, Model model) {
		
		if(teaService.selectOne(teaVO) != null) { // 존재 확인
			
			teaVO.setTeaCondition("상품변경");
			// 재고 or 가격 or 둘다 ---> 서치컨디션으로 set할듯
			if(teaService.update(teaVO)) {
				
			}
		}
		AlertVO sweetAlertVO = new AlertVO("상품 변경", "상품 변경 성공!", null, "success", "adminTea.do");
		model.addAttribute("sweetAlert", sweetAlertVO);
		
		return "alertTrue.jsp";
	}
	

}
