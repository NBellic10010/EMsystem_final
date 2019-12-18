package com.emsys.servlet;

import com.emsys.pojo.daiban;
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
import java.util.List;

@WebServlet(name = "jiuyuan_servlet", urlPatterns = "/jiuyuan_servlet")
public class jiuyuan_servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s = req.getSession();
        jiuyuan g = (jiuyuan)s.getAttribute("id_jiuyuan");
        int gonghao = g.getGonghao();
        DbUtil db = new DbUtil();
        try {
            List<daiban> l = db.chazhao_daiban(gonghao);
            req.setAttribute("daiban_list", l);
            req.getRequestDispatcher("/index_jiuyuan.jsp").forward(req, resp);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
