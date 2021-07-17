package com.iiiedu.beauty.forum.websocket;

import java.io.IOException;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

/**
 * @ServerEndpoint註釋中指定WebSocket協議的地址
 * @OnOpen、@OnMessage、@OnClose、@OnError註釋與WebSocket中監聽事件對應
 */
//@Slf4j //生成一些日誌代碼
@Component
@ServerEndpoint("/websocket/{username}")
public class ChatServerEndpoint {

    /**
     * 連接建立時觸發
     */
    @OnOpen
    public void onOpen(@PathParam("username") String username, Session session) {
//        log.info("用户{}登录",username);
        String message= "用戶[" + username + "]已進入聊天室！";

        //將該用戶登錄的消息發送給其他人
        ChatUtils.sendMessageAll(message);

        //將自己的信息添加到map集合中
        ChatUtils.CLIENTS.put(username,session);

        //獲取當前的在線人數，發給自己查看
        String onlineInfo=ChatUtils.getOnlineInfo();
        ChatUtils.sendMessage(session,onlineInfo);
    }

    /**
     * 客户端接收服務端發来的數據時觸發
     */
    @OnMessage
    public void onMessage(@PathParam("username") String username,String message) {
//        log.info("发送消息：{}, {}",username,message);
        //廣播，把消息同步给其他客戶端
        ChatUtils.sendMessageAll("[" + username + "]: " + message);
    }

    /**
     * 連接關閉時觸發
     */
    @OnClose
    public void onClose(@PathParam("username") String username,Session session) {
        //從當前的map集合中移除該用戶
        ChatUtils.CLIENTS.remove(username);

        //將該用戶離線的消息通知给其他人
        ChatUtils.sendMessageAll("[" + username + "]已離線！");

        try {
        	//關閉WebSocket下的該Session會話
            session.close();
//            log.info("{} 已离线......",username);
        } catch (IOException e) {
            e.printStackTrace();
//            log.error("onClose error",e);
        }
    }

    /**
     * 聊天通信發生錯誤時觸發
     */
    @OnError
    public void onerror(Session session,Throwable throwable) {
        try {
            //關閉WebSocket下的該Session會話
            session.close();
        } catch (IOException e) {
            e.printStackTrace();
//            log.error("onError Exception",e);
        }
//        log.info("Throwable msg " + throwable.getMessage());
    }
}