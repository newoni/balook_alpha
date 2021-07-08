package com.example.demo.configuraion;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.*;

//@Profile("!stomp")
@Configuration
@RequiredArgsConstructor
@EnableWebSocket
public class webSocketConfig implements WebSocketConfigurer {
    private final WebSocketHandler webSocketHandelr;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(webSocketHandelr, "/ws/chat").setAllowedOrigins("*");
    }
}
