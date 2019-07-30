package kr.ac.ju.websockethandler;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.ac.ju.vo.Course;

public class CourseApplicantWebSocketHandler extends TextWebSocketHandler{
	
	// WebSocketSession은 클라이언트와 서버간의 전이중통신을 담당하는 객체다.
	// jdbc의 Connection과 유사하다.
	// 클라이언트의 최초 웹소켓 요청시 생성된다.
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
	public void noticeCourseApplicant(Course course) throws Exception {
		Iterator<WebSocketSession> iterator = sessions.iterator();
		
		while(iterator.hasNext()) {
			WebSocketSession session = iterator.next();
			System.out.println(session);
			try {
				// 클라이언트에게 전송할 메세지를 TextMessage 객체로 만든다.
				TextMessage message = new TextMessage(course.getNo() + ":" + course.getCount());
				// TextMessage를 클라이언트에게 전송한다.
				session.sendMessage(message);
			}catch(IOException e) {
				// 전송중 에러가 발생하는 해당 클라이언트와 통신을 담당하는 WebSocketSession 객체를 삭제한다.
				iterator.remove();
			}
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("브라우저가 보낸 메세지가 도착하였음.");
		System.out.println(message.getPayload());
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 연결요청이 접수되면 해당 클라이언트와 통신을 담당하는 WebSocketSession 객체가 전달된다.
		// WebSocketSession객체를 Set에 담아둔다.
		sessions.add(session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 클라이언트와 연결이 해제되면 통신을 담당하는 객체를 HashSet에서 제거한다.
		sessions.remove(session);
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// 클라이언트와 데이터 송수신중 에러가 발생해도 해당 클라이언트와 통신을 담당하는 객체를 HashSet에서 제거한다.
		sessions.remove(session);
	}
}
