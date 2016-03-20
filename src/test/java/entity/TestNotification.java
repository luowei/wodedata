package entity;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wodedata.domin.User;
import com.wodedata.repository.NotificationRepo;
import com.wodedata.repository.UserRepo;

import org.junit.runner.RunWith;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class TestNotification {

	@Autowired
	private NotificationRepo notificationRepo;
	
	@Autowired
	private UserRepo userRepo;
	
	@Test
	public void test() {
		User user=userRepo.findOneByUsername("zonghua");
		long size=notificationRepo.countByUserAndStatus(user, 0);
		System.out.println(size);
	}

}
