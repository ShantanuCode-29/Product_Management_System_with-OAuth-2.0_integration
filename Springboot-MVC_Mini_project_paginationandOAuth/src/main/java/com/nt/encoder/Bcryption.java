package com.nt.encoder;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Bcryption
{
public static void main(String []args)
{
	BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
	String encode1 = encoder.encode("shan");
	String encode2 = encoder.encode("bhole");
	String encode3=encoder.encode("arti");
	String encode4=encoder.encode("sagar");
	
	
	System.out.println(encode3+"   "+encode4);
}
}
