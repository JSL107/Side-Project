package model.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String mdate;
	private int maxloan;
	
	public MemberDTO(String id, String pw, String name, String mdate, int maxloan) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.mdate = mdate;
		this.maxloan = maxloan;
	}
}
