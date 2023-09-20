package com.varchar.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.varchar.biz.category.CategoryService;
import com.varchar.biz.category.CategoryVO;
import com.varchar.biz.tea.TeaService;
import com.varchar.biz.tea.TeaVO;


@Controller
public class AdminTeaController {
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private TeaService teaService;

	
	// --------------------------------- 관리자 홈(메인) 페이지 이동 ---------------------------------
	@RequestMapping(value = "/admin.do")
	public String adminPage(CategoryVO categoryVO, Model model) {
		
		List<CategoryVO> categoryDatas = categoryService.selectAll(null); //이거 NULL 없애는 방향 고려
		model.addAttribute("categoryDatas", categoryDatas);
		return "admin.jsp";
	}
	
	// --------------------------------- 카테고리 추가 ---------------------------------
	@RequestMapping(value = "/insertCategory.do", method=RequestMethod.GET)
	public String insertCategoryPage(CategoryVO categoryVO) {
		
		/*
		 * if(categoryService.insert(categoryVO)) {
		 * 
		 * }
		 */
		
		return "";
	}

	@RequestMapping(value = "/insertCategory.do", method=RequestMethod.POST)
	public String insertCategory(CategoryVO categoryVO) {
		
		if(categoryService.insert(categoryVO)) {
			
		}
		
		return "admin.do";
	}
	
	// --------------------------------- 카테고리 삭제 ---------------------------------
	@RequestMapping(value = "/deleteCategory.do")
	public String deleteCategory(CategoryVO categoryVO, TeaVO teaVO) {
		
		categoryVO = categoryService.selectOne(categoryVO);
		
		if(categoryVO != null){	// 존재 확인
			
			//categoryVO.setCategoryCondition("현재 해당 쿼리 없음 추후 맞는 서치컨디션 입력");
			if(categoryService.delete(categoryVO)) {
			
			teaVO.setTeaCondition("카테고리변경");
			teaVO.setCategoryNum(categoryVO.getCategoryNum());
			teaService.update(teaVO);
			}
		}

		return "admin.do";
	}
	
	// --------------------------------- 카테고리 변경 ---------------------------------
	@RequestMapping(value = "/updateCategory.do")
	public String updateCategory(CategoryVO categoryVO, TeaVO teaVO) {
		
		System.out.println("updateCategory.do 진입 확인");
		System.out.println("categoryVO" +categoryVO);
//		System.out.println("categoryName" +categoryName);
//		categoryVO.setCategoryName(categoryName);
//		categoryVO.setCategoryNum(categoryNum);
		
		// 해당되는 카테고리에 있는 상품이 있을 수 있으므로 해당없음으로 변경해줘야 함
		if(categoryService.selectOne(categoryVO) == null){	// 존재 확인
			
			//categoryVO.setCategoryCondition("현재 해당 쿼리 없음 추후 맞는 서치컨디션 입력");
			if(categoryService.update(categoryVO)) {
			
			teaVO.setTeaCondition("카테고리변경");
			teaVO.setCategoryNum(categoryVO.getCategoryNum());
			teaService.update(teaVO);
			}
			
		}
		
		return "admin.do";
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
	public String insertTea(TeaVO teaVO) {
		
		System.out.println("insertTea.do: " + teaVO);
		
		if (teaService.insert(teaVO)) {
			
		}
		
		return "adminTea.do";
	}
	
	// --------------------------------- 상품 삭제 ---------------------------------
	@RequestMapping(value = "/deleteTea.do")
	public String deleteTea(TeaVO teaVO) {
		
		if (teaService.selectOne(teaVO) != null) { // 존재 확인
			
			teaVO.setTeaCondition("현재 해당 쿼리 없음 추후 맞는 서치컨디션 입력");
			if (teaService.delete(teaVO)) {
				// 이미지도 지워야 함
			}
		}
		
		
		return "adminTea.do";
	}
	
	// --------------------------------- 상품 변경 ---------------------------------
	@RequestMapping(value = "/updateTea.do")
	public String updateTea(TeaVO teaVO) {
		
		if(teaService.selectOne(teaVO) != null) { // 존재 확인
			
			teaVO.setTeaCondition("상품변경");
			// 재고 or 가격 or 둘다 ---> 서치컨디션으로 set할듯
			if(teaService.update(teaVO)) {
				
			}
		}
		
		
		return "adminTea.do";
	}
	

}
