package ssm.demo.service.impl;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.demo.dao.GenericDao;
import ssm.demo.dao.UserDao;
import ssm.demo.model.User;
import ssm.demo.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

//注册为bean
//@Component//组件
//@Controller
//@Repository//数据持久层的bean
@Service//注册为bean 并且表示是服务层的bean
public class UserServiceImpl extends GenericServiceImpl<User,Integer> implements UserService {

    private UserDao userDao;
    private HttpServletRequest request;

    //依赖注入进来
    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Autowired
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public User login(User user) {
        String plainPassword = user.getPassword();
        user = userDao.queryOne("queryUserByEmail",user.getEmail());
//        System.out.println("test : "+user);
        if(user != null) {
            String encryptedPassword = user.getPassword();

            StrongPasswordEncryptor strongPasswordEncryptor = new StrongPasswordEncryptor();
            if (strongPasswordEncryptor.checkPassword(plainPassword, encryptedPassword)) {

                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String updateTime = simpleDateFormat.format(new Date());

                request.getSession().setAttribute("user", user);
                return user;
            }
            request.setAttribute("message", "Invalid Email or Password.");
            return null;
        }
        request.setAttribute("message", "YOU ARE NOT STILL REG.");
        return null;
    }

    @Override
    public boolean reg(User user) {
        if(queryUserByEmail(user.getEmail()) != null && user.getEmail() != null) {
            return false;
        }
        StrongPasswordEncryptor strongPasswordEncryptor = new StrongPasswordEncryptor();
        user.setPassword(strongPasswordEncryptor.encryptPassword(user.getPassword()));

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = simpleDateFormat.format(new Date());

        user.setUpdateTime(createTime);

        userDao.create(user);
        return true;
    }

    @Override
    public User queryUserByEmail(String email) {
        return userDao.queryOne("queryUserByEmail", email);
    }

    @Override
    public User queryUserById(Integer id) {
        return userDao.queryUserById("user.queryUserById", id);
    }

    @Override
    public Boolean updateInfo(User user) {
        System.out.println(user);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String updateTime = simpleDateFormat.format(new Date());
        user.setUpdateTime(updateTime);
        userDao.updateInfo(user);
        return true;
    }

    @Override
    public void resetAvatar(User user) {
        userDao.resetAvatar(user);
    }

    @Override
    public void resetPassword(User user) {
        StrongPasswordEncryptor strongPasswordEncryptor = new StrongPasswordEncryptor();
        user.setPassword(strongPasswordEncryptor.encryptPassword(user.getPassword()));
        userDao.resetPassword(user);
    }

}
