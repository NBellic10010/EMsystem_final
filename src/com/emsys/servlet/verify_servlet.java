package com.emsys.servlet;

import com.emsys.pojo.gunali;
import com.emsys.toolbean.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "verify_servlet", urlPatterns = "/verify_servlet")
public class verify_servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DbUtil db = new DbUtil();
        HttpSession s = req.getSession();
        gunali g = (gunali)s.getAttribute("id_guanli");
        String oldpassword = req.getParameter("oldpassword");
        if(oldpassword.equals(g.getMima())) {
            req.setAttribute("verify_ok", "ok");
        }
        req.getRequestDispatcher("/guanli_refactor.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
