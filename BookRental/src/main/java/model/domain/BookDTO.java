package model.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BookDTO {
	private String id;
	private int isbn;
	private String bname;
	private String author;
	private String publisher;
	private String bdate;
	private int bcnt;
}
