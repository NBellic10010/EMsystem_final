package com.emsys.servlet;

import com.emsys.pojo.daiban;
import com.emsys.toolbean.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

//发表待办事项servlet
@WebServlet(name = "daiban_insert_servlet", urlPatterns = "/daiban_insert_servlet")
public class daiban_insert_servlet extends HttpServlet {
    @Override
    //get请求的方法
    /*
    *请求转发
    *
    */
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DbUtil db = new DbUtil();
        daiban d = new daiban();
        d.setZhuti((String)req.getAttribute("zhuti"));
        d.setNeirong((String)req.getAttribute("neirong"));
        try {
            db.tianjia_daiban(d);
            req.getRequestDispatcher("guanli_servlet").forward(req, resp);
            
            //转发到管理servlet
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
