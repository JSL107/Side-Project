package model.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RentDTO {
	private int rentno;
	private String bid;
	private String mid;
	private String rdate;
}
