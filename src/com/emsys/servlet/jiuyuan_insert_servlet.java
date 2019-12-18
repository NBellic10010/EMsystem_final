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

@WebServlet(name = "jiuyuan_insert_servlet", urlPatterns = "/jiuyuan_insert_servlet")
public class jiuyuan_insert_servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DbUtil db = new DbUtil();
        int danwei = Integer.parseInt(req.getParameter("danwei_refactor"));
        String dianhua = req.getParameter("dianhua_refactor");
        String idnum = req.getParameter("dianhua_refactor");
        String xingming = req.getParameter("xingming_refactor");
        String mima = req.getParameter("mima_refactor");
        jiuyuan g = new jiuyuan();
        g.setDanwei(danwei);
        g.setDianhua(dianhua);
        g.setIdnumber(idnum);
        g.setXingming(xingming);
        g.setMima(mima);
        try {
            db.tianjia_jiuyuan(g);
            req.getRequestDispatcher("/start.jsp").forward(req, resp);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
