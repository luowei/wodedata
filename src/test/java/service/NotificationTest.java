package service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wodedata.domin.User;
import com.wodedata.repository.UserRepo;
import com.wodedata.service.NotificationServ;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class NotificationTest {
	
	@Autowired
	private NotificationServ noti;
	@Autowired
	private UserRepo userRepo;
	@Test
	public void test() {
		User user=new User();
		user.setId(new Integer(1));
		int size=noti.getByUser(user, 0, 1).getContent().size();
		System.out.println(size);
	}

}
