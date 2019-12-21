package com.emsys.servlet;

import com.emsys.pojo.gunali;
import com.emsys.pojo.jiuyuan;
import com.emsys.toolbean.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

//修改救援信息
@WebServlet(name = "jiuyuan_dorefactor", urlPatterns = "/jiuyuan_dorefactor")
public class jiuyuan_dorefactor extends HttpServlet {
        private static final long serialVersionUID = 1L;

        /**
         * @see HttpServlet#HttpServlet()
         */
        public jiuyuan_dorefactor() {
            super();
            // TODO Auto-generated constructor stub
        }

        //接受数据只要不为空就执行setter方法
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                HttpSession s = req.getSession();
                DbUtil db = new DbUtil();
                jiuyuan g;
                if(s.getAttribute(("id_jiuyuan")) == null) {
                        int gonghao = Integer.parseInt(req.getParameter("gonghao"));
                        try {
                                g = db.chaxun_jiuyuan(gonghao);
                                String xingming = req.getParameter("xingming");
                                //String mima = (String)req.getAttribute("mima_r");
                                String danwei = req.getParameter("danwei");
                                String dianhua = req.getParameter("dianhua");
                                String idnumber = req.getParameter("idnumber");
                                try {
                                        if(!danwei.equals("")) g.setDanwei(Integer.parseInt(danwei));
                                        if(!xingming.equals("")) g.setXingming(xingming);
                                        //if(mima != "") g.setMima(mima);
                                        if(!dianhua.equals("")) g.setDianhua(dianhua);
                                        if(!idnumber.equals("")) g.setIdnumber(idnumber);
                                        db.xiugai_jiuyuan(g);
                                } catch (ClassNotFoundException | SQLException e) {
                                        e.printStackTrace();
                                }
                                req.getRequestDispatcher("guanli_servlet").forward(req, resp);
                        } catch (ClassNotFoundException | SQLException e) {
                                e.printStackTrace();
                        }

                }else {
                        g = (jiuyuan) s.getAttribute("id_jiuyuan");
                        String xingming = req.getParameter("xingming");
                        //String mima = (String)req.getAttribute("mima_r");
                        String danwei = req.getParameter("danwei");
                        String dianhua = req.getParameter("dianhua");
                        String idnumber = req.getParameter("idnumber");
                        try {
                                if(!danwei.equals("")) g.setDanwei(Integer.parseInt(danwei));
                                if(!xingming.equals("")) g.setXingming(xingming);
                                //if(mima != "") g.setMima(mima);
                                if(!dianhua.equals("")) g.setDianhua(dianhua);
                                if(!idnumber.equals("")) g.setIdnumber(idnumber);
                                db.xiugai_jiuyuan(g);
                                req.getRequestDispatcher("jiuyuan_servlet").forward(req, resp);
                        } catch (ClassNotFoundException | SQLException e) {
                                e.printStackTrace();
                        }
                }




        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            doGet(req, resp);
        }

}
