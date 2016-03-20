package service;

import org.junit.Test;

import com.wodedata.service.support.EncryptUtil;

public class TestEncrypt {

	@Test
	public void test() {
		String username="zonghua";
		String password="zonghua";
		String result=EncryptUtil.encryptUsernameAndPassword(username, password);
		System.out.println(result);
	}

}
