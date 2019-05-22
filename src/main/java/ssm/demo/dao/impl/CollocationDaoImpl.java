package ssm.demo.dao.impl;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import ssm.demo.model.Collocation;
import ssm.demo.dao.CollocationDao;

import org.springframework.stereotype.Repository;
import ssm.demo.util.Constants;
import ssm.demo.util.Pagination;

import java.util.List;

@Repository
public class CollocationDaoImpl implements CollocationDao {
    private SqlSession sqlSession;

    @Autowired
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void create(Collocation collocation) {
        sqlSession.insert("collocation.create",collocation);
    }

    @Override
    public void remove(Integer id) {
        sqlSession.delete("collocation.remove",id);
    }

    @Override
    public void modify(Collocation collocation) {
        sqlSession.update("collocation.modify",collocation);
    }

    @Override
    public List<Collocation> queryAll() {
        return sqlSession.selectList("collocation.queryAll");
    }

    @Override
    public Collocation queryById(Integer id) {
        return sqlSession.selectOne("collocation.queryById",id);
    }

    @Override
    public List<Collocation> queryByUser(Integer id) {
        return sqlSession.selectList("collocation.queryByUser",id) ;
    }

    @Override
    public List<Collocation> queryByKeyword(String keyword) {
        return sqlSession.selectList("collocation.queryByKeyword",keyword);
    }

    @Override
    public List<Collocation> queryByType(Integer id) {
        return sqlSession.selectList("collocation.queryByType",id);
    }

    @Override
    public List<Collocation> queryByLookData() {
        return sqlSession.selectList("collocation.queryByLookData");
    }

    @Override
    public List<Collocation> queryByCreateTime() {
        return sqlSession.selectList("collocation.queryByCreateTime");
    }

    @Override
    public Pagination<Collocation> queryAll(int currentPage) {
        return getPagination("queryAll", null, currentPage);
    }

    /**
     * @param sqlId       查询语句 ID
     * @param parameter   查询参数
     * @param currentPage 当前页码，起始于 1
     * @return Pagination 的实例
     * <p>
     * pageSize 每页记录条数
     * totalRows 总记录条数
     * totalPages 总页数
     */
    private Pagination<Collocation> getPagination(String sqlId, Object parameter, int currentPage) {
        int pageSize = Constants.PAGE_SIZE;
        int totalRows = sqlSession.selectList("collocation."+sqlId, parameter).size();
        int totalPages = (int) Math.ceil(totalRows / (double) pageSize);
        RowBounds rowBounds = new RowBounds(pageSize * (currentPage - 1), pageSize);
        List<Collocation> list = sqlSession.selectList("collocation."+sqlId, parameter, rowBounds);
        return new Pagination<>(list, sqlId, pageSize, totalRows, totalPages, currentPage);
    }
}