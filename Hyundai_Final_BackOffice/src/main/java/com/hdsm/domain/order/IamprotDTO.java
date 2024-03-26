package com.hdsm.domain.order;

import com.nimbusds.jose.shaded.json.JSONObject;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class IamprotDTO {
	private String code;
	private String message;
	private JSONObject response = new JSONObject();
}
