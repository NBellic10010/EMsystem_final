package com.emsys.servlet;
import com.emsys.pojo.jiuyuan;
import com.emsys.toolbean.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "search_servlet", urlPatterns = "/search_servlet")
public class search_serlvet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DbUtil db = new DbUtil();
        String query = req.getParameter("query");
        boolean flag = true;
        for (int i = 0; i < query.length(); i++) {
            if (!Character.isDigit(query.charAt(i))) {flag=false;break;}
        }
        try {
            jiuyuan g = null;
            if(flag) {
                int queryint = Integer.parseInt(query);
                g = db.chaxun_jiuyuan(queryint);
            }
            else {
                g = db.chaxun_jiuyuan(query);
            }
            if(g == null) req.setAttribute("found", false);
            else {
                req.setAttribute("found", true);
                req.setAttribute("result", g);
            }
            //res.getRequestDispatcher("/index_guanli.jsp");
            req.getRequestDispatcher("index_guanli.jsp").forward(req, resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
