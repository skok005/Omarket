package net.Omarket.main;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class mainDTO {
	
  private String p_code;
  private String p_seller;
	private String p_name;
	private String p_rdate;
	private String p_edate;
	private String p_status;
	private String p_location;
	private int p_hit, start, end;
	private int p_chatcnt;
	private int p_jjimcnt;
	private String p_category;
	private String p_price;
	private String p_content;
	private String p_nego;
	private String u_code_seller;
	
	private String pic_code;
	private String pic_name;	
	private String pic_oname;	
	private String pic_code_cont;
	private long pic_size;
	
	private String u_code;
	private String u_id;
	private String u_pw;
	private String u_nick;
	private String u_email;
	private int u_phone;
	private String u_addr1;
	private String u_addr2;
  private String u_premium;
	private String u_profile;
	private String u_key;
	private String u_status;
	private int u_manner;
	
	private String keyfield;
	private String keyword;
	private int searchCount;
}//class END
