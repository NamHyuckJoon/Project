package vo;

import java.io.Writer;
import java.util.Date;
import java.util.Map;

public class Board_VO {
	
	// 게시물 작성자 
	public class Writer {
		String id;
		String name;

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public Writer(String id, String name) {
			super();
			this.id = id;
			this.name = name;
		}
	}

	// 게시물 정보
	public class Article {
		Integer number;
		Writer writer;
		String title;
		Date regDate;
		Date modifiedDate;
		int readCount;

		public Article(Integer number, Writer writer, String title, Date regDate, Date modifiedDate, int readCount) {
			super();
			this.number = number;
			this.writer = writer;
			this.title = title;
			this.regDate = regDate;
			this.modifiedDate = modifiedDate;
			this.readCount = readCount;
		}

		public Integer getNumber() {
			return number;
		}

		public void setNumber(Integer number) {
			this.number = number;
		}

		public Writer getWriter() {
			return writer;
		}

		public void setWriter(Writer writer) {
			this.writer = writer;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public Date getRegDate() {
			return regDate;
		}

		public void setRegDate(Date regDate) {
			this.regDate = regDate;
		}

		public Date getModifiedDate() {
			return modifiedDate;
		}

		public void setModifiedDate(Date modifiedDate) {
			this.modifiedDate = modifiedDate;
		}

		public int getReadCount() {
			return readCount;
		}

		public void setReadCount(int readCount) {
			this.readCount = readCount;
		}
	}

	// 게시물 번호, 내용
	public class ArticleContent {

		Integer number;
		String content;

		public ArticleContent(Integer number, String content) {
			super();
			this.number = number;
			this.content = content;
		}

		public Integer getNumber() {
			return number;
		}

		public void setNumber(Integer number) {
			this.number = number;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}
	}
	
	public class WriteRequest {
		Writer writer;
		String title;
		String content;
		public WriteRequest(Writer writer, String title, String content) {
			super();
			this.writer = writer;
			this.title = title;
			this.content = content;
		}
		public Writer getWriter() {
			return writer;
		}
		public void setWriter(Writer writer) {
			this.writer = writer;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		
		// 데이터 유효성 검사
		public void validate(Map<String, Boolean>errors) {
			
			// 잘못된 데이터 존재 시, error 맵 객체에 관련 코드 추가
			if(title == null || title.trim().isEmpty()) {
				errors.put("title", Boolean.TRUE);
			}			
		}						
	}
}