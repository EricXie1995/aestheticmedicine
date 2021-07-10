package com.iiiedu.beauty.forum.websocket;

import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {

    //聲明原子變量類，確保服務端和客户端之間操作的原子性和可見性
    private AtomicInteger atomicInteger=new AtomicInteger();

    @RequestMapping("/chat")
    public String chat(Model model) {
    	//用自動增加數字來命名user名稱，但因為session裡有存登錄者名稱，就不用這個了
        model.addAttribute("username","user" + atomicInteger.getAndIncrement());
    	return "forum/chat";
    }
}
