package com.hdsm.hyundai_final_raffle.DTO;

import lombok.Data;
import oracle.sql.TIMESTAMP;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

@Data
public class RaffleDTO {
    String raffleId;
    String rafflePid;
    Timestamp startDate;
    Timestamp endDate;
    int rstatus;
    Date purchaseStartDate;
    Date purchaseEndDate;
    Date winnerDate;
    int participants;
    String winner;

    // JOIN을 위한 Product 정보
    String pid;
    String bname;
    String pname;
    String pprice;
    String pdetail;
    String ccolorcode;

    //    JOIN을 위한 Color 정보
    String cthumbnail1;
    String cimage1;
    String cimage2;
}
