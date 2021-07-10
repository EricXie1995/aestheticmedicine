package com.iiiedu.beauty.forum.websocket;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

@EnableWebSocket //開啟SpringBoot對WebSocket的支持
@Configuration //聲明該類是一個配置類
public class ChatConfig {

    /**
     * 配置ServerEndpointExporter的bean
     * 該Bean會自動註冊使用了@ServerEndpoint註解聲明的Websocket endpoint
     * @return
     */
    @Bean
    public ServerEndpointExporter serverEndpoint() {
        return new ServerEndpointExporter();
    }
}
