package com.hdsm.hyundai_final_raffle.mapper;

import com.hdsm.hyundai_final_raffle.DTO.MemberDTO;
import com.hdsm.hyundai_final_raffle.DTO.RaffleDTO;
import com.hdsm.hyundai_final_raffle.DTO.RaffleDetailDTO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface RaffleMapper {
    @Select("SELECT \n" +
            "    r.raffle_pid,\n" +
            "    r.raffle_id,\n" +
            "    start_date,\n" +
            "    end_date,\n" +
            "    rstatus,\n" +
            "    purchase_start_date,\n" +
            "    purchase_end_date,\n" +
            "    participants,\n" +
            "    pname,\n" +
            "    bname,\n" +
            "    pprice,\n" +
            "    winner,\n" +
            "    max(ccolorcode) as ccolorcode,\n" +
            "    max(c_thumbnail1) as c_thumbnail1\n" +
            "FROM\n" +
            "    raffle r\n" +
            "    JOIN product p ON r.raffle_pid = p.pid\n" +
            "    JOIN color   c ON c.product_pid = p.pid\n" +
            "    group by     r.raffle_pid,\n" +
            "    r.raffle_id,\n" +
            "    start_date,\n" +
            "    end_date,\n" +
            "    rstatus,\n" +
            "    purchase_start_date,\n" +
            "    purchase_end_date,\n" +
            "    participants,\n" +
            "    pname,\n" +
            "    bname,\n" +
            "    pprice, \n" +
            "    winner\n ")
    public List<RaffleDTO> getRaffle();

    @Select("select * from raffle_details")
    public List<RaffleDetailDTO> getRaffleDetails();

    @Select("select * from member where mid=#{mid}")
    public MemberDTO getMemberInfo(String mid);

    @Insert("insert into raffle_details (raffle_detail_id, raffle_mid, raffle_id) values(concat(#{raffle_detail_id},#{id}), #{raffle_mid}, #{raffle_id})")
    @SelectKey(statement = "select SEQ_RAFFLE.nextval FROM DUAL", keyProperty = "id", before = true, resultType = int.class)
    public void insertRaffleDetails(String raffle_detail_id, String raffle_mid, String raffle_id);

    @Select("select count(raffle_id) from raffle_details where raffle_mid = #{raffle_mid} and raffle_id=#{raffle_id}")
    public int getDetails(String raffle_mid, String raffle_id);

    @Update("update raffle set participants = participants+1 where raffle_id = #{raffle_id} ")
    public void updateParticipants(String raffle_id);



}
