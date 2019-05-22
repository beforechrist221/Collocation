package ssm.demo.dao;

import ssm.demo.model.User;

public interface UserDao{
    void create(User user);

    User queryOne(String statement , String email);

    User queryUserById(String statement , Integer id);

    void update(String statement , User user);

    void updateInfo(User user);

    void resetAvatar (User user);

    void resetPassword (User user);
}
