package net.Omarket.main;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import net.Omarket.login.loginDTO;
import net.Omarket.mypage.mypageDTO;

@Controller
public class mainController {
	
	@Inject
	@Autowired
	ServletContext application;
	
	@Inject
	@Autowired
	mainDAO mdao;
	
	private static final Logger logger = LoggerFactory.getLogger(mainController.class);
	
	@RequestMapping("/product_write.do")
	public String main_write(Model model, HttpSession session) {
		loginDTO ldto = (loginDTO) session.getAttribute("daum");
		String u_code_seller = ldto.getU_code();
		String u_nick = ldto.getU_nick();
		model.addAttribute("u_code_seller", u_code_seller);
		model.addAttribute("u_nick", u_nick);
		return "product_write";
	}//end
	
	@RequestMapping(value = "/product_insert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String main_insert(MultipartHttpServletRequest mtf, mainDTO mdto) {
		mdao.mainInsert(mdto);
		
		List<MultipartFile> fileList = mtf.getFiles("file");
		String path = application.getRealPath("/resources/upload");		
		for(MultipartFile mf : fileList) {
			String fileonmae = mf.toString();
			String filename = mf.getOriginalFilename();
			long fileSize = mf.getSize();
			System.out.println("name : " + fileonmae);
			System.out.println("originFileName : " + filename);
			System.out.println("fileSize : " + fileSize);
			File file = new File(path, filename);
			mdto.setPic_name(filename);
			mdto.setPic_oname(fileonmae);				
			mdto.setPic_size(fileSize);
			mdao.mainFileInsert(mdto);
			//String safeFile = path + System.currentTimeMillis() + filename;
			try{mf.transferTo(file);} catch (Exception e) {}
		}//for end
		
		return "redirect:/product_list.do";
	}//end
	
	@RequestMapping("/product_list.do")
	public String main_list(Model model, HttpServletRequest request) {	
		int pagecount, pageNum, start, end, GGtotal, temp, startpage, endpage;
		String p_category = request.getParameter("cate");
		if(p_category==null||p_category.equals("")) {
			p_category = "";
		}
			
		GGtotal = mdao.mainSelectCount(p_category);
		String pnum = request.getParameter("pageNum");
		if(pnum=="" || pnum==null) 
			pnum="1";
		
		
		pageNum = Integer.parseInt(pnum);	
		start = GGtotal-(pageNum-1)*9 - 8;
		end = GGtotal-(pageNum-1)*9;
		
		if(GGtotal%9==0) {pagecount=GGtotal/9;}
		else {pagecount=(GGtotal/9)+1;}
		
		String returnpage = "&cate="+p_category;
		
		temp = (pageNum-1)%5;
		startpage = pageNum-temp;
		endpage = startpage+4;
		if(endpage>pagecount) {endpage=pagecount;}
		
		List<mainDTO> list = mdao.mainSelectAll(p_category, start, end);
		List<mainDTO> list2 =mdao.mainSelectPremium(p_category); 
		model.addAttribute("list", list);		
		model.addAttribute("list2", list2);	
		model.addAttribute("returnpage", returnpage);
		model.addAttribute("pagecount", pagecount);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("GGtotal", GGtotal);
		model.addAttribute("pageNum", pageNum);
		return "product_list";
	}//end
	
	
	@RequestMapping("/product_list_search.do")
	public String main_list_search(Model model,HttpServletRequest request) {		
		String keyword = request.getParameter("keyword");
		
		if(keyword==null||keyword.equals("")) {
			return "product_list_search_nonthing";
		}else {
		
		List<mainDTO> listNam = mdao.mainSelectSearch("p_name",keyword);
		List<mainDTO> listLoc = mdao.mainSelectSearch("p_location",keyword);
		
		int cntNam = mdao.mainSearchCount("p_name", keyword);
		int cntLoc = mdao.mainSearchCount("p_location", keyword);
		
		if(cntNam==0&&cntLoc==0) {
			return "product_list_search_nonthing";
		}else {
		model.addAttribute("keyword", keyword);
		model.addAttribute("listNam", listNam);
		model.addAttribute("listLoc", listLoc);
		model.addAttribute("cntNam", cntNam);
		model.addAttribute("cntLoc", cntLoc);
		
		return "product_list_search";
		}//cnt if END
		}//if END
	}//end
	
	
	@RequestMapping("/product_detail.do")
	public String main_detail(Model model, HttpSession session, HttpServletRequest request) {
		int p_code = Integer.parseInt(request.getParameter("p_code"));
		int u_code_seller = Integer.parseInt(request.getParameter("u_code_seller"));

		String u_code = (String) session.getAttribute("u_code");
		String u_id = (String) session.getAttribute("u_id");
		
		if(u_code == "" || u_id == "" || u_code == null || u_id == null) {
			u_code = "0";
			u_id = "0";
		}
		
		List<mainDTO> jlist = mdao.mainJjimSelect(u_code);
		
		mainDTO mdto = mdao.mainDetail(p_code);
		List<mainDTO> flist = mdao.mainFileDetail(p_code);
		mdao.mainHit(p_code); 
		List<mainDTO> slist = mdao.mainSelectSellList(u_code_seller);
		
		model.addAttribute("jlist", jlist);
		model.addAttribute("u_code", u_code);
		model.addAttribute("u_id", u_id);
		model.addAttribute("mdto", mdto);
		model.addAttribute("flist", flist);
		model.addAttribute("slist", slist);
		return "product_detail";
	}//end
	
	
	@RequestMapping("/product_jjim.do")
	public String main_delete(HttpSession session, HttpServletRequest request, RedirectAttributes redirect) {	
		int p_code = Integer.parseInt(request.getParameter("p_code"));
		int u_code_seller = Integer.parseInt(request.getParameter("u_code_seller"));
		loginDTO ldto = (loginDTO) session.getAttribute("daum");
		ldto.setP_code(p_code);
		mdao.mainJjim(ldto);
		mdao.mainJjimCnt(p_code);
		redirect.addAttribute("p_code", p_code);
		redirect.addAttribute("u_code_seller", u_code_seller);
		return "redirect:/product_detail.do";
	}//end
	
	
	@RequestMapping("/product_delete.do")
	public String main_delete(@RequestParam("p_code") int p_code) {		
		mdao.mainDelete(p_code);
		mdao.mainDeleteFile(p_code);
		return "redirect:/product_list.do";
	}//end
	
	
	@RequestMapping("/product_preEdit.do")
	public String main_preEdit(Model model, @RequestParam("p_code") int p_code) {		
		mainDTO mdto = mdao.mainDetail(p_code);
		List<mainDTO> flist = mdao.mainFileDetail(p_code);
		model.addAttribute("mdto", mdto);
		model.addAttribute("flist", flist);
		model.addAttribute("p_code", p_code);
		return "product_edit";
	}//end
	
	
	@RequestMapping("/product_edit.do")
	public ModelAndView main_edit(MultipartHttpServletRequest mtf, mainDTO mdto) {
		ModelAndView mav = new ModelAndView();
		mdao.mainEdit(mdto);
		
		List<MultipartFile> fileList = mtf.getFiles("file");
		String path = application.getRealPath("/resources/upload");		
		for(MultipartFile mf : fileList) {
			String fileonmae = mf.toString();
			String filename = mf.getOriginalFilename();
			long fileSize = mf.getSize();
			File file = new File(path, filename);
			mdto.setPic_name(filename);
			mdto.setPic_oname(fileonmae);				
			mdto.setPic_size(fileSize);
			mdao.mainNewInsertFile(mdto);
			//String safeFile = path + System.currentTimeMillis() + filename;
			try{mf.transferTo(file);} catch (Exception e) {}
		}//for end

		String pic_code_cont = mdto.getPic_code_cont();
		String codes = pic_code_cont.trim();
		String[] codes2 = codes.split(" ");
		
		for(int i=0; i<codes2.length; i++) {
			System.out.println("코드="+codes2[i]);
			mdao.mainFileEdit(codes2[i]);
		}

		mav.addObject("p_code", mdto.getP_code());
		mav.addObject("u_code_seller", mdto.getU_code_seller());
		mav.setViewName("redirect:/product_detail.do");
		return mav;
	}//end
	
	
	@RequestMapping("/trade_insert.do")
	@ResponseBody
	public Map<String, String> trade_insert(Model model, @RequestBody mypageDTO dto) {		
		mdao.tradeInsert(dto);
		Map<String, String> result = new HashMap<String, String>();
		return result;
	}//end
	
	
//	@ResponseBody
//	@RequestMapping(value = "/mannerNick.do", method = RequestMethod.POST)	
//	public Map<String, String> mannerNick(Model model, @RequestBody mypageDTO dto) {
//		System.out.println("mannerNick.do");
//		System.out.println(dto.getU_nick());
//		mypageDTO nickCheck = dao.getMannerNick(dto);
//		
//		String status="false";
//		
//		if(nickCheck.getCnt()==1)
//			status="success";
////		String result = "{\"status\" : "+nick+"}";
//		Map<String, String> result = new HashMap<String, String>();
//		result.put("status", status);
//		result.put("u_code", nickCheck.getU_code());
//		
//		return  result;
//	}//-----------------------------------------------------매너온도 닉네임 체크 END
	
	
}//class END
