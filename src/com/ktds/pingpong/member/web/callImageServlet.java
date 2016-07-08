package com.ktds.pingpong.member.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ktds.pingpong.member.vo.MemberVO;

/**
 * Servlet implementation class callImageServlet
 */
public class callImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public callImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("_MEMBER_");
		
		String picname = loginMember.getPic_name();
		
		 File file = new File("D:\\" + picname);
	     String i = URLConnection.guessContentTypeFromName(file.getName());
	     
	     response.setContentType(i);
	       response.setContentLength((int)file.length());
	       try {
	          FileInputStream in = new FileInputStream(file);
	          OutputStream out = response.getOutputStream();
	          // Copy the contents of the file to the output stream
	          byte[] buf = new byte[1024];
	          int count = 0;
	          while ((count = in.read(buf)) >= 0) {
	             out.write(buf, 0, count);
	          }
	          
	          out.close();
	          in.close();
	       }
	       catch ( FileNotFoundException fnfe ) {
	          //throw new RuntimeException(fnfe.getMessage(), fnfe);
	       }

	     
	}

}
