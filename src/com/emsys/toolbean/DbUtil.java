package com.emsys.toolbean;
import com.emsys.pojo.daiban;
import com.emsys.pojo.gunali;
import com.emsys.pojo.jiuyuan;
import com.emsys.pojo.renwu;
import com.google.gson.internal.$Gson$Preconditions;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DbUtil {
    //数据库url
    public static final String URL = "jdbc:mysql://localhost:3306/emd";
    //用户名root
    public static final String USER = "root";
    //密码默认为空
    public static final String PASSWORD = "";
    private Connection conn;
    {
        try {
            //驱动类
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            //数据库连接对象初始化
            this.conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //查询所有救援员
    public List<jiuyuan> suoyou_jiuyuan() throws ClassNotFoundException, SQLException {
        Statement stmt = this.conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM jiuyuan");
        List<jiuyuan> res = new ArrayList<>();
        jiuyuan g = null;
        while(rs.next()){
            g = new jiuyuan();
            g.setDanwei(rs.getInt("danwei"));
            g.setDianhua(rs.getString("dianhua"));
            g.setXingming(rs.getString("xingming"));
            g.setIdnumber(rs.getString("idnumber"));
            g.setGonghao(rs.getInt("gonghao"));
            g.setZhuangtai(rs.getBoolean("zhuangtai"));
            //System.out.println(rs.getInt("gonghao"));
            res.add(g);
        }
        return res;
    }
    
    //根据名字查询救援员
    public jiuyuan chaxun_jiuyuan(String name) throws ClassNotFoundException, SQLException {
        Statement stmt = this.conn.createStatement();
        String sql = "SELECT * FROM jiuyuan where xingming=?";
        //ResultSet rs = stmt.executeQuery("SELECT * FROM jiuyuan where name=?");
        PreparedStatement ptmt = this.conn.prepareStatement(sql);
        ptmt.setString(1, name);
        ResultSet rs = ptmt.executeQuery();
        jiuyuan g = null;
        while (rs.next()) {
            g = new jiuyuan();
            g.setDanwei(rs.getInt("danwei"));
            g.setDianhua(rs.getString("dianhua"));
            g.setXingming(rs.getString("xingming"));
            g.setIdnumber(rs.getString("idnumber"));
            g.setGonghao(rs.getInt("gonghao"));
        }
        ptmt.close();
        return g;
    }
    
    //根据工号查询救援员
    public jiuyuan chaxun_jiuyuan(int gonghao) throws ClassNotFoundException, SQLException {
        Statement stmt = this.conn.createStatement();
        String sql = "SELECT * FROM jiuyuan where gonghao=?";
        //ResultSet rs = stmt.executeQuery("SELECT * FROM jiuyuan where name=?");
        PreparedStatement ptmt = this.conn.prepareStatement(sql);
        ptmt.setInt(1, gonghao);
        ResultSet rs = ptmt.executeQuery();
        jiuyuan g = null;
        while (rs.next()) {
            g = new jiuyuan();
            g.setDanwei(rs.getInt("danwei"));
            g.setDianhua(rs.getString("dianhua"));
            g.setXingming(rs.getString("xingming"));
            g.setIdnumber(rs.getString("idnumber"));
            g.setGonghao(rs.getInt("gonghao"));
        }
        System.out.println("查询工号：" + g.getGonghao());
        ptmt.close();
        return g;
    }

    
    public jiuyuan chaxun_jiuyuan(int gonghao, String mima) throws ClassNotFoundException, SQLException {
        //Statement stmt = this.conn.createStatement();
        String sql = "SELECT * FROM jiuyuan where gonghao=? and mima=?";
        //ResultSet rs = stmt.executeQuery("SELECT * FROM jiuyuan where name=?");
        PreparedStatement ptmt = this.conn.prepareStatement(sql);
        ptmt.setInt(1, gonghao);
        ptmt.setString(2, mima);

        ResultSet rs = ptmt.executeQuery();

        jiuyuan g = null;
        while (rs.next()) {
            g = new jiuyuan();
            g.setDanwei(rs.getInt("danwei"));
            g.setDianhua(rs.getString("dianhua"));
            g.setXingming(rs.getString("xingming"));
            g.setIdnumber(rs.getString("idnumber"));
            g.setGonghao(rs.getInt("gonghao"));
            g.setMima(rs.getString("mima"));
        }
        ptmt.close();
        //assert g != null;
        //System.out.println("救援员:" + g.getGonghao());
        return g;

    }
    
    //根据名字查询管理员
    public gunali chaxun_guanli(String name) throws ClassNotFoundException, SQLException {
        Statement stmt = this.conn.createStatement();
        String sql = "SELECT * FROM guanli where name=?";
        //ResultSet rs = stmt.executeQuery("SELECT * FROM jiuyuan where name=?");
        PreparedStatement ptmt = this.conn.prepareStatement(sql);
        ptmt.setString(1, name);
        ResultSet rs = ptmt.executeQuery();
        gunali g = null;
        while (rs.next()) {
            g = new gunali();
            g.setMima(rs.getString("mima"));
            g.setGonghao(rs.getInt("gonghao"));
        }
        ptmt.close();
        return g;
    }
    
    
    public gunali chaxun_guanli(int gonghao, String password) throws ClassNotFoundException, SQLException {
        Statement stmt = this.conn.createStatement();
        String sql = "SELECT * FROM guanli where gonghao=? and mima=?";
        //ResultSet rs = stmt.executeQuery("SELECT * FROM jiuyuan where name=?");
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setInt(1, gonghao);
        ptmt.setString(2, password);
        ResultSet rs = ptmt.executeQuery();
        gunali g = null;
        while (rs.next()) {
            g = new gunali();
            g.setMima(rs.getString("mima"));
            g.setGonghao(rs.getInt("gonghao"));
        }
        ptmt.close();
        return g;
    }

    public void tianjia_jiuyuan(jiuyuan g) throws ClassNotFoundException, SQLException {
        //Statement stmt = conn.createStatement();
        String sql = "INSERT INTO jiuyuan(xingming, danwei, dianhua, idnumber, mima)"+
                "values("+"?,?,?,?,?)";
        //ResultSet rs = stmt.executeQuery("SELECT * FROM jiuyuan where name=?");
        PreparedStatement ptmt = this.conn.prepareStatement(sql);
        ptmt.setString(1, g.getXingming());
        ptmt.setInt(2, g.getDanwei());
        ptmt.setString(3, g.getDianhua());
        ptmt.setString(4, g.getIdnumber());
        ptmt.setString(5, g.getMima());

        ptmt.execute();
        ptmt.close();
    }

    public void shanchu_jiuyuan(int id) throws ClassNotFoundException, SQLException {
        String sql = "delete from jiuyuan where gonghao=?";
        PreparedStatement ptmt = this.conn.prepareStatement(sql);
        ptmt.setInt(1, id);
        ptmt.execute();
    }

    public void xiugai_jiuyuan(jiuyuan g) throws  ClassNotFoundException, SQLException {
        String sql = "UPDATE jiuyuan SET xingming = ?,mima = ?,danwei = ?,dianhua = ?,zhuangtai = ?  WHERE gonghao = ?";
        PreparedStatement ptmt = this.conn.prepareStatement(sql);
        ptmt.setString(1, g.getXingming());
        ptmt.setString(2,g.getMima());
        ptmt.setInt(3,g.getDanwei());
        ptmt.setString(4,g.getDianhua());
        ptmt.setBoolean(5, g.getZhuangtai());
        ptmt.setInt(6,g.getGonghao());

        ptmt.execute();
        ptmt.close();
    }

    public void xiugai_guanli(String mima, int gonghao) throws  ClassNotFoundException, SQLException {
        String sql = "UPDATE guanli SET mima=? WHERE gonghao=?";
        PreparedStatement ptmt = this.conn.prepareStatement(sql);
        ptmt.setString(1, mima);
        ptmt.setInt(2, gonghao);

        ptmt.execute();
        ptmt.close();
    }

    public void tianjia_daiban(daiban d) throws  ClassNotFoundException, SQLException {
        String sql = "INSERT INTO TABLE(jiuyuan_gonghao, neirong, zhuti, daiban_id) daiban VALUES(?, ?, ?, ?)";
        PreparedStatement ptmt = this.conn.prepareStatement(sql);
        ptmt.setString(2, d.getNeirong());
        ptmt.setInt(1, d.getJiuyuan_gonghao());
        ptmt.setString(3, d.getZhuti());
        ptmt.setInt(4, d.getDaiban_id());

        ptmt.execute();
        ptmt.close();
    }

    public List<daiban> chazhao_daiban(int gonghao) throws ClassNotFoundException, SQLException {
        String sql = "SELECT * FROM daiban where jiuyuan_gonghao=?";
        PreparedStatement ptmt = this.conn.prepareStatement(sql);
        ptmt.setInt(1, gonghao);
        ResultSet rs = ptmt.executeQuery();
        List<daiban> result = new ArrayList<>();
        while (rs.next()) {
            daiban g = new daiban();
            g.setJiuyuan_gonghao(gonghao);
            g.setNeirong(rs.getString("neirong"));
            g.setZhuti(rs.getString("zhuti"));
            g.setDaiban_id(rs.getInt("daiban_id"));
            result.add(g);
        }
        ptmt.close();
        return result;
    }

    public daiban shanchu_daiban(daiban d) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM daiban where daiban_id=?";
        PreparedStatement ptmt = this.conn.prepareStatement(sql);
        ptmt.setInt(1, d.getDaiban_id());

        ptmt.execute();
        ptmt.close();
        return d;
    }



    public List<renwu> chazhao_renwu(int gonghao) throws  ClassNotFoundException, SQLException {
        String sql = "SELECT * FROM renwu where jiuyuan_gonghao=?";

        PreparedStatement ptmt = this.conn.prepareStatement(sql);
        ptmt.setInt(1, gonghao);
        ResultSet rs = ptmt.executeQuery();
        List<renwu> result = new ArrayList<>();
        while (rs.next()) {
            renwu g = new renwu();
            g.setJiuyuan_gonghao(gonghao);
            g.setX(rs.getInt("x"));
            g.setY(rs.getInt("y"));
            g.setMiaoshu(rs.getString("miaoshu"));
            result.add(g);
        }

        return result;
    }

    public renwu shanchu_renwu(renwu r) throws ClassNotFoundException, SQLException {
        String sql = "DELETE * FROM renwu where jiuyuan_gonghao=?";

        PreparedStatement ptmt = this.conn.prepareStatement(sql);
        ptmt.setInt(1, r.getJiuyuan_gonghao());

        ptmt.execute();

        return r;
    }

    public renwu tianjia_renwu(renwu r) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO renwu(jiuyuan_gonghao, x, y, miaoshu) values (?,?,?,?)";

        PreparedStatement ptmt = this.conn.prepareStatement(sql);
        ptmt.setInt(1, r.getJiuyuan_gonghao());
        ptmt.setDouble(2, r.getX());
        ptmt.setDouble(3, r.getY());
        ptmt.setString(4, r.getMiaoshu());
        ptmt.execute();

        return r;
    }

}
