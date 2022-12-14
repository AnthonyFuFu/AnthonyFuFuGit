package com.cartdetail.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.cartdetail.model.*;
import com.membercoupon.model.MemberCouponService;
import com.membercoupon.model.MemberCouponVO;

@WebServlet("/front-end/cartdetail/CartDetail.do")
public class CartDetailServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("get_value".equals(action)) {
			System.out.println(action);
			Integer cptpid = Integer.valueOf(req.getParameter("cptpid")); 
			System.out.println(cptpid);
			
			MemberCouponService mcSvc = new MemberCouponService();
			MemberCouponVO mcVO = mcSvc.getOneMemberCoupon(cptpid);
			Integer dis = mcVO.getCpTpVO().getCpDiscount();
			Integer memcpid	= mcVO.getMemCpid();		
			JSONArray json = new JSONArray();
			try {
				json.put(dis);
				json.put(memcpid);
			} catch (JSONException e) {
				e.printStackTrace();
			}
			res.getWriter().print(json);
			
		}
		
		if("checkout".equals(action)) {
			String list = req.getParameter("jsonstr");
			JSONArray array = new JSONArray(list);
			
			
			JSONObject one = array.getJSONObject(0);
			Integer oneid = one.getInt("memid");
			
			CartDetailService cartSvc = new CartDetailService();
			List<CartDetailVO> vo = cartSvc.getOnes(oneid);
			req.setAttribute("list", vo);
			
			Integer subtotal = Integer.valueOf(req.getParameter("subtotal"));			Integer memid = Integer.valueOf(req.getParameter("memid"));
			Integer total = Integer.valueOf(req.getParameter("total"));
			Integer memCpid = Integer.valueOf(req.getParameter("memCpid_form"));
			String pdidstr = req.getParameter("pdid");
			String pdNumberstr = req.getParameter("pdNumber");
			String pdPrice = req.getParameter("pdPrice");
			String pdDiscount = req.getParameter("pdDiscount");
//			String vo = req.getParameter("list");
//			System.out.println(vo);
			
			JSONArray pdidArray = new JSONArray(pdidstr);
			JSONArray pdNumberArray = new JSONArray(pdNumberstr);
			JSONArray pdPriceArray = new JSONArray(pdPrice);
			JSONArray pdDisArray = new JSONArray(pdDiscount);
			
			List<Integer> pdidList = new ArrayList<Integer>();
			List<Integer> pdNumberList = new ArrayList<Integer>();
			List<Integer> pdPriceList = new ArrayList<Integer>();
			List<Integer> pdDisList = new ArrayList<Integer>();
			
			for(int i = 0; i < pdidArray.length(); i++) {
				pdidList.add(pdidArray.getInt(i));
				pdNumberList.add(pdNumberArray.getInt(i));
				pdPriceList.add(pdPriceArray.getInt(i));
				pdDisList.add(pdDisArray.getInt(i));
			}
			
			req.setAttribute("memid", memid);
			req.setAttribute("subtotal", subtotal);
			req.setAttribute("total", total);
			req.setAttribute("memCpid", memCpid);
			req.setAttribute("pdid", pdidList);
			req.setAttribute("pdNumber", pdNumberList);
			req.setAttribute("pdPrice", pdPriceList);
			req.setAttribute("pdDis", pdDisList);
			
			String url = "/front-end/cartdetail/checkout.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
		
//		if ("checkoutDisplay".equals(action)){
//			HttpSession session = req.getSession();
//			Integer memid =  Integer.valueOf( (String) session.getAttribute("memid") );
//			session.setAttribute("memid", memid);
//			
//			CartDetailService cartDetailService = new CartDetailService();
//			List<CartDetailVO> cartDetailVOs = cartDetailService.getOnes(memid);
//			JSONArray carts = new JSONArray(cartDetailVOs );
//			res.getWriter().print(carts);
//			 
//			
//		}
		
		if ("getOne_For_Display".equals(action)) { // ??????select_page.jsp?????????
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.?????????????????? - ??????????????????????????? **********************/
			Integer memid = 0;
			String memidStr = req.getParameter("memid");
			String memidReg = "^[(0-9)]{3}$";
			
			if(!memidStr.matches(memidReg)) {
				errorMsgs.add("????????????: ??????????????? , ??????????????????3");
			} else if(memidStr == null || memidStr.trim().length() == 0) {
				errorMsgs.add("????????????: ????????????");
				memidStr = "";
			} else {
				memid = Integer.valueOf(memidStr);
			}
			req.setAttribute("memid", memid);
			
//			String pdidstr = req.getParameter("pdid");
//			
//			Integer pdid = Integer.valueOf(pdidstr);
			
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/cartdetail/select_page.jsp");
				failureView.forward(req, res);
				return;// ???????????? 
			}

			/*************************** 2.?????????????????? *****************************************/
			req.setAttribute("memid", memid);
			CartDetailService resv = new CartDetailService();
			List<CartDetailVO> list = resv.getOnes(memid);
			if (list == null) {
				errorMsgs.add("????????????");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/cartdetail/select_page.jsp");
				failureView.forward(req, res);
				return;// ????????????
			}

			/*************************** 3.????????????,????????????(Send the Success view) *************/
			req.setAttribute("cartDetailVO", list); // ??????????????????empVO??????,??????req
			String url = "/front-end/cartdetail/NewFile.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ???????????? listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("getOne_For_Update".equals(action)) { // ??????listAllEmp.jsp?????????

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.?????????????????? ****************************************/
			Integer memid = Integer.valueOf(req.getParameter("memid"));
			
			Integer pdid = Integer.valueOf(req.getParameter("pdid"));

			/*************************** 2.?????????????????? ****************************************/
			CartDetailService resv = new CartDetailService();
			CartDetailVO cartDetailVO = resv.getOne(memid, pdid);

			/*************************** 3.????????????,????????????(Send the Success view) ************/
			req.setAttribute("cartDetailVO", cartDetailVO); 
			String url = "/front-end/cartdetail/update_cartdetail_input.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

		if ("update".equals(action)) { // ??????update_emp_input.jsp?????????

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.?????????????????? - ??????????????????????????? **********************/

			Integer memid = Integer.valueOf(req.getParameter("memid").trim());
			
			Integer pdid = Integer.valueOf(req.getParameter("pdid").trim());
			
			Integer pdNumber = null;

			String pdNumstr = req.getParameter("pdNumber");
			if (pdNumstr == null || (pdNumstr.trim()).length() == 0) {
				errorMsgs.add("?????????????????????");
			} else {
				try {
					pdNumber = Integer.valueOf(pdNumstr);
					if(pdNumber <= 0) {
						errorMsgs.add("???????????????????????????0?????????");
					}
				} catch (NumberFormatException e) {
					errorMsgs.add("???????????????????????????");
				}
			}
			
			CartDetailVO cartDetailVO = new CartDetailVO();
			cartDetailVO.setMemid(memid);
			cartDetailVO.setPdid(pdid);
			cartDetailVO.setPdNumber(pdNumber);
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("cartDetailVO", cartDetailVO); // ???????????????????????????empVO??????,?????????req
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/cartdetail/update_cartdetail_input.jsp");
				failureView.forward(req, res);
				return; // ????????????
			}

			/*************************** 2.?????????????????? *****************************************/
			CartDetailService ordSvc = new CartDetailService();
			cartDetailVO = ordSvc.updateCartDetail(pdNumber, memid, pdid);

			/*************************** 3.????????????,????????????(Send the Success view) *************/
			req.setAttribute("cartDetailVO", cartDetailVO); // ?????????update?????????,????????????empVO??????,??????req
			String url ="CartDetail.do?action=getOne_For_Display";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ???????????????,??????listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("insert".equals(action)) { // ??????addEmp.jsp?????????

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.?????????????????? - ??????????????????????????? *************************/
			Integer memid = 0;
			String memidStr = req.getParameter("memid");
			String memidReg = "^[(0-9)]{3}$";
			
			if(!memidStr.matches(memidReg)) {
				errorMsgs.add("????????????: ??????????????? , ??????????????????3");
			} else if(memidStr == null || memidStr.trim().length() == 0) {
				errorMsgs.add("????????????: ????????????");
				memidStr = "";
			} else {
				memid = Integer.valueOf(memidStr);
			}
			
			Integer pdid = 0;
			String pdidStr = req.getParameter("pdid");
			String pdidReg = "^[4]{1}[0-9]{3}$";
			
			if(!pdidStr.matches(pdidReg)) {
				errorMsgs.add("????????????: ????????????4???????????????4?????????");
			} else if(pdidStr == null || pdidStr.trim().length() == 0) {
				errorMsgs.add("????????????????????????");
				pdidStr = "";
			} else {
				pdid = Integer.valueOf(pdidStr);
			}
			
			Integer pdNumber = 0;
			String pdNumstr = req.getParameter("pdNumber");
			if (pdNumstr == null || (pdNumstr.trim()).length() == 0) {
				errorMsgs.add("?????????????????????");
			} else {
				try {
					pdNumber = Integer.valueOf(pdNumstr);
					if(pdNumber <= 0) {
						errorMsgs.add("???????????????????????????0?????????");
					}
				} catch (NumberFormatException e) {
					errorMsgs.add("???????????????????????????");
				}
			}
			
			CartDetailVO cartDetailVO = new CartDetailVO();
			
			cartDetailVO.setMemid(memid);
			cartDetailVO.setPdid(pdid);
			cartDetailVO.setPdNumber(pdNumber);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("cartDetailVO", cartDetailVO); // ???????????????????????????empVO??????,?????????req
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/cartdetail/addCartDetail.jsp");
				failureView.forward(req, res);
				return; // ????????????
			}

			/*************************** 2.?????????????????? ***************************************/
			CartDetailService cartSvc = new CartDetailService();
			cartDetailVO = cartSvc.addCartDetail(memid, pdid, pdNumber);
			
			/*************************** 3.????????????,????????????(Send the Success view) ***********/
			String url = "/front-end/cartdetail/listAllCartDetail.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ???s???W?????????\???????????????listAllEmp.jsp
			successView.forward(req, res);
		}
		
		if ("delete".equals(action)) { // ??????listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.?????????????????? ***************************************/
			Integer memid = Integer.valueOf(req.getParameter("memid"));
			Integer pdid = Integer.valueOf(req.getParameter("pdid"));

			/*************************** 2.?????????????????? ***************************************/
			CartDetailService cartSvc = new CartDetailService();
			cartSvc.deleteCartDeatil(memid, pdid);

			/*************************** 3.????????????,????????????(Send the Success view) ***********/
			req.setAttribute("memid", memid);
			String url = "/front-end/cartdetail/NewFile.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// ???R???????????????\??????,?????????^???e???X???R????????????????????????????????
			successView.forward(req, res);
		}
		
		if ("minus".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			/*************************** 1.?????????????????? ***************************************/
			Integer memid = Integer.valueOf(req.getParameter("memid"));
			Integer pdid = Integer.valueOf(req.getParameter("pdid"));
			Integer pdNumber = Integer.valueOf(req.getParameter("pdNumber"));
			/*************************** 2.?????????????????? ***************************************/
			CartDetailService cartSvc = new CartDetailService();
			if(pdNumber == 1) {
				cartSvc.deleteCartDeatil(memid, pdid);
				req.setAttribute("memid", memid);
				String url = "/front-end/cartdetail/NewFile.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ???R???????????????\??????,?????????^???e???X???R????????????????????????????????
				successView.forward(req, res);
				return;
			}
			
			cartSvc.minus(memid, pdid);
			/*************************** 3.????????????,????????????(Send the Success view) ***********/
			req.setAttribute("memid", memid);
			String url = "/front-end/cartdetail/NewFile.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// ???R???????????????\??????,?????????^???e???X???R????????????????????????????????
			successView.forward(req, res);
		}
		
		if ("plus".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			/*************************** 1.?????????????????? ***************************************/
			Integer memid = Integer.valueOf(req.getParameter("memid"));
			Integer pdid = Integer.valueOf(req.getParameter("pdid"));
			/*************************** 2.?????????????????? ***************************************/
			CartDetailService cartSvc = new CartDetailService();
			cartSvc.plus(memid, pdid);
			/*************************** 3.????????????,????????????(Send the Success view) ***********/
			req.setAttribute("memid", memid);
			String url = "/front-end/cartdetail/NewFile.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// ???R???????????????\??????,?????????^???e???X???R????????????????????????????????
			successView.forward(req, res);
		}
		
//		if ("checkout".equals(action)) {
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			/*************************** 1.?????????????????? ***************************************/
//			Integer total = Integer.valueOf(req.getParameter("total"));
////			System.out.println(total);
//			JSONArray jpdid = null; 
//			JSONArray jpdNumber = null;
//			JSONArray jpdPrice = null;
//			JSONArray jpdDiscount = null;
//			Integer memid = Integer.valueOf(req.getParameter("memid"));
//			try {
//				jpdid = new JSONArray(req.getParameter("pdid"));
//				jpdNumber = new JSONArray(req.getParameter("pdNumber"));
//				jpdPrice = new JSONArray(req.getParameter("pdPrice"));
//				jpdDiscount = new JSONArray(req.getParameter("pdDiscount"));
////				System.out.println(jpdid);
////				System.out.println(jpdNumber);
////				System.out.println(jpdPrice);
////				System.out.println(jpdDiscount);
////				System.out.println(jpdid.getInt(0));
//			} catch (JSONException e) {
//				e.printStackTrace();
//			}
//		}
	}
}
