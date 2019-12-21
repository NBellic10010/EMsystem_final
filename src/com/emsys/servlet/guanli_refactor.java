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
import java.sql.SQLException;

//修改管理员servlet
//
@WebServlet(name = "guanli_refactor", urlPatterns = "/guanli_refactor")
public class guanli_refactor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public guanli_refactor() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s = req.getSession();
        String refact_password = req.getParameter("password1");
        gunali g = (gunali)s.getAttribute("id_guanli");
        DbUtil db = new DbUtil();
        try {
            db.xiugai_guanli(refact_password, g.getGonghao());
            req.getRequestDispatcher("guanli_servlet").forward(req, resp);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        //getServletConfig().getServletContext().getRequestDispatcher("/index_guanli.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req, resp);
    }
}
