package net.Omarket.login;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class loginDTO {

	private String u_code;
	private String u_id;
	private String u_pwd;
	private String u_nick;
	private String u_email;
	private String u_phone;
    private String u_phone2;
    private String u_phone3;
    private String u_phone4;
	private String u_addr1;
	private String u_addr2;
    private String u_premium;
    private String u_premium_term;
	private String u_profile;
	private MultipartFile u_profile_upload;
	private String u_key;
	private String u_status;
	private int u_manner;
	private int p_code;
	
}//class END
