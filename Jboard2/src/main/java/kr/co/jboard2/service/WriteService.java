package kr.co.jboard2.service;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jboard2.dao.ArticleDao;
import kr.co.jboard2.vo.ArticleVo;

public class WriteService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("POST")) {

			String path = req.getServletContext().getRealPath("/file");
			int maxSize = 1024 * 1024 * 10;
			
			MultipartRequest mRequest = null;
			
			try {
				mRequest = new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			String title   = mRequest.getParameter("title");
			String content = mRequest.getParameter("content");
			String uid = mRequest.getParameter("uid");
			String file    = mRequest.getFilesystemName("file");
			String regip   = req.getRemoteAddr();
			
			ArticleVo vo = new ArticleVo();
			vo.setTitle(title);
			vo.setContent(content);
			vo.setFile(file != null ? 1 : 0);
			vo.setUid(uid);
			vo.setRegip(regip);
			
			int seq = ArticleDao.getInstance().insertArticle(vo);
			
			makeFileNameAndInsert(seq, file, path);
			
			return "redirect:/Jboard2/list.do";
			
		}else {
			return "/write.jsp";	
		}
	}
	
	public void makeFileNameAndInsert(int seq, String file, String path) {
		
		// 파일첨부를 했을 경우
		if(file != null){
			// 고유한 파일명 생성
			int i = file.lastIndexOf(".");
			String ext = file.substring(i);
			
			String uuid = UUID.randomUUID().toString();
			String newName = uuid+ext;
			
			// 저장된 파일명 수정(스트림)
			File oldFile = new File(path+"/"+file);
			File newFile = new File(path+"/"+newName);
			oldFile.renameTo(newFile);
			
			// 파일 테이블 INSERT
			ArticleDao.getInstance().insertFile(seq, file, newName);
		}
		
	}
	
	

}


