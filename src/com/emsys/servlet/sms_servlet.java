package com.emsys.servlet;

import com.emsys.toolbean.RecvMoThread;
import com.emsys.toolbean.RecvRptThread;
import com.montnets.mwgate.common.GlobalParams;
import com.montnets.mwgate.common.Message;
import com.montnets.mwgate.smsutil.SmsSendConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import com.montnets.mwgate.smsutil.ConfigManager;

@WebServlet(name = "sms_servlet", urlPatterns = "/sms_servlet")
public class sms_servlet extends HttpServlet {
    public static final String userid = "E10BFP";
    public static final String pwd = "y07Dfp";
    public static final int priority = 1;
    public static final String ipAddress1 = "api01.monyun.cn:7901";
    public static final String ip2 = "api02.monyun.cn:7901";
    public static final String ip3 = null;
    public static final String ip4 = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GlobalParams globalParams = new GlobalParams();
        globalParams.setRequestPath("/sms/v2/std/");
        globalParams.setNeedLog(1);
        int param = ConfigManager.setGlobalParams(globalParams);
        if(param == 0) System.out.println("设置用户账号信息成功！");
        int result = -310007;
        try {
            // 设置用户账号信息
            result = ConfigManager.setAccountInfo(userid, pwd, priority,
                    ipAddress1, ip2, ip3, ip4);
            // 判断返回结果，0设置成功，否则失败
            if (result == 0) {
                System.out.println("设置用户账号信息成功！");
            } else {
                System.out.println("设置用户账号信息失败，错误码：" + result);
            }
        }catch (Exception e) {
            // 异常处理
            e.printStackTrace();
        }

            SmsSendConn sms = new SmsSendConn(true);
            Message message = new Message();
            message.setUserid(userid);

            String content = "测试短信";
            byte[] utf8Bytes = content.getBytes(StandardCharsets.UTF_8);
            //String utf8content = new String(utf8Bytes, "UTF-8");
            String mobile = (String) req.getAttribute("mobile");
            message.setMobile(mobile);
            message.setContent(content);
            StringBuffer returnValue = new StringBuffer();
            int stat_send = sms.singleSend(message, returnValue);
            // 实例化获取上行线程
            SmsSendConn smsSendConnMo = new SmsSendConn(true);
            int retsizeMo = 100;
            RecvMoThread recvMoThread = new RecvMoThread(smsSendConnMo, userid, retsizeMo);
            // 线程获取 启动获取上行的线程
            recvMoThread.start();
            System.out.println("获取上行的线程启动成功！");

            // 实例化短信处理对象
            SmsSendConn smsSendConnRpt = new SmsSendConn(true);
            // 每次请求想要获取的状态报告的最大条数。
            int retsizeRpt = 100;
            // 实例化状态报告线程
            RecvRptThread recvRptThread = new RecvRptThread(smsSendConnRpt, userid, retsizeRpt);
            // 线程获取 启动获取状态报告的线程
            recvRptThread.start();
            System.out.println("获取状态报告的线程启动成功！");

            if (stat_send == 0) {
                req.setAttribute("message", true);
                //req.getRequestDispatcher("guanli_servlet").forward(req, resp);
            } else {
                req.setAttribute("message", false);
                System.out.println("错误2:" + stat_send);
                req.getRequestDispatcher("guanli_servlet").forward(req, resp);
            }
    }
}
