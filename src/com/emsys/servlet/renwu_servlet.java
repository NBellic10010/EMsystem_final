package com.emsys.servlet;

import com.emsys.pojo.renwu;
import com.emsys.toolbean.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "renwu_servlet", urlPatterns = "/renwu_servlet")
public class renwu_servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DbUtil db = new DbUtil();
        renwu r = new renwu();
        r.setMiaoshu(req.getParameter("description"));
        r.setX(Float.parseFloat(req.getParameter("x")));
        r.setY(Float.parseFloat(req.getParameter("y")));
        r.setJiuyuan_gonghao(Integer.parseInt(req.getParameter("jiuyuan_gonghao")));
        try {
            db.tianjia_renwu(r);
            req.getRequestDispatcher("guanli_servlet").forward(req, resp);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
