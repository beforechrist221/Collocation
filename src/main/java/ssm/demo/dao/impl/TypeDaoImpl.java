package ssm.demo.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import ssm.demo.model.Type;
import ssm.demo.dao.TypeDao;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TypeDaoImpl implements TypeDao {

    private SqlSession sqlSession;

    @Autowired
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<Type> queryAll() {
        return sqlSession.selectList("type.queryAll");
    }

}