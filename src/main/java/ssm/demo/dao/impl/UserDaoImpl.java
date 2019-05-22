package ssm.demo.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ssm.demo.dao.UserDao;
import ssm.demo.model.User;

@Repository
public class UserDaoImpl implements UserDao {

    private SqlSession sqlSession;

    @Autowired
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void updateInfo(User user) {
        sqlSession.update("user.updateInfo",user);
    }

    @Override
    public void resetAvatar(User user) {
        sqlSession.update("user.resetAvatar",user);
    }

    @Override
    public void resetPassword(User user) {
        sqlSession.update("user.resetPassword", user);
    }

    @Override
    public void create(User user) {
        sqlSession.insert("user.create",user);
    }

    @Override
    public User queryOne(String statement ,String email) {
        return sqlSession.selectOne(statement,email);
    }

    @Override
    public User queryUserById(String statement ,Integer id) {
        return sqlSession.selectOne(statement,id);
    }

    @Override
    public void update(String statement ,User user) {
        sqlSession.update(statement,user);
    }
}
