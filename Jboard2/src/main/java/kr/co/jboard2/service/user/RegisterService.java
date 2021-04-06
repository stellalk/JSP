package kr.co.jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.dao.UserDao;
import kr.co.jboard2.service.CommonService;
import kr.co.jboard2.vo.UserVo;

public class RegisterService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		//if post request
		if(req.getMethod().equals("POST")) {
			
			//data
			String uid   = req.getParameter("uid");
			String pass  = req.getParameter("pass1");
			String name  = req.getParameter("name");
			String nick  = req.getParameter("nick");
			String email = req.getParameter("email");
			String hp    = req.getParameter("hp");
			String zip   = req.getParameter("zip");
			String addr1 = req.getParameter("addr1");
			String addr2 = req.getParameter("addr2");
			String regip = req.getRemoteAddr();
			
			UserVo vo = new UserVo();
			vo.setUid(uid);
			vo.setPass(pass);
			vo.setName(name);
			vo.setNick(nick);
			vo.setEmail(email);
			vo.setHp(hp);
			vo.setZip(zip);
			vo.setAddr1(addr1);
			vo.setAddr2(addr2);
			vo.setRegip(regip);
			
			try {
				UserDao.getInstance().insertUser(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//redirect to login page
			return "redirect:/Jboard2/user/login.do";
			
		}else {
			return "/user/register.jsp";
		}
		
	}

}
