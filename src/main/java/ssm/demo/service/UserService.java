package ssm.demo.service;

import ssm.demo.model.User;

public interface UserService extends GenericService<User,Integer>{

    boolean reg(User user);

    User login(User user);

    User queryUserByEmail(String email);

    User queryUserById(Integer id);

    Boolean updateInfo(User user);

    void resetAvatar (User user);

    void resetPassword (User user);
}
