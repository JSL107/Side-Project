package model.domain;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
public class ManagerDTO extends MemberDTO{
	private int empno;
	
	@Builder
	public ManagerDTO(String id, String pw, String name, String mdate, int maxloan, int empno) {
		super(id, pw, name, mdate, maxloan);
		this.empno = empno;
	}
}
