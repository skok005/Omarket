package net.Omarket.mypage;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class mypageDTO {
	
	private String u_code;
	private String u_id;
	private String u_pw;
	private String u_nick;
	private String u_email;
	private String u_phone;
	private String u_addr1;
	private String u_addr2;
	private String u_premium;
	private String u_profile;
	private String u_key;
	private String u_status;
	private String u_premium_term;
	private String trade_code;
	private Timestamp trade_date;
	private String u_code_buyer;
	
	private Timestamp jjim_time;
	
	private String eval_code;
	private String u_code_sender;
	private String u_code_receiver;
	private Date eval_date;
	private String eval_content;
	private String eval_p_code;
	private String eval_pos;
	private String eval_pos_con1;
	private String eval_pos_con2;
	private String eval_pos_con3;
	private String eval_pos_con4;
	private String eval_pos_con5;
	private String eval_normal;
	private String eval_normal_con1;
	private String eval_normal_con2;
	private String eval_normal_con3;
	private String eval_normal_con4;
	private String eval_normal_con5;
	private String eval_nega;
	private String eval_nega_con1;
	private String eval_nega_con2;
	private String eval_nega_con3;
	private String eval_nega_con4;
	private String eval_nega_con5;
	
	private String manner_code;
	private int manner_sum;
	private int cnt;
	
	private String p_code;
	private String p_name;
	private Timestamp p_rdate;
	private Timestamp p_edate;
	private String p_status;
	private String p_location;
	private int p_hit;
	private int p_chatcnt;
	private int p_jjimcnt;
	private String p_category;
	private String p_price;
	private String p_content;
	private String p_nego;
	private String u_code_seller;
	
	private String regDate;
	private String trdDate;
	
	private String pic_code;
	private String pic_name;	
	private String pic_oname;	
	private long pic_size;
	
	private String sign;
	private int sellChatCnt;
	private int buyChatCnt;
	
	private String tablinks;
	private String jbsClm;
	private int jbsCnt;
	private int eval_pos_cnt1;
	private int eval_pos_cnt2;
	private int eval_pos_cnt3;
	private int eval_pos_cnt4;
	private int eval_pos_cnt5;
	private int eval_normal_cnt1;
	private int eval_normal_cnt2;
	private int eval_normal_cnt3;
	private int eval_normal_cnt4;
	private int eval_normal_cnt5;
	private int eval_nega_cnt1;
	private int eval_nega_cnt2;
	private int eval_nega_cnt3;
	private int eval_nega_cnt4;
	private int eval_nega_cnt5;
	
	private int eval_cnt;
	
}//class END
