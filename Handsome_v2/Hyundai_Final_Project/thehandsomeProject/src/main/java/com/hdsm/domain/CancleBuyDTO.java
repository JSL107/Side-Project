package com.hdsm.domain;

import com.nimbusds.jose.shaded.json.JSONObject;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class CancleBuyDTO {
    private String code;
    private String messege;
    private JSONObject response=new JSONObject();
}