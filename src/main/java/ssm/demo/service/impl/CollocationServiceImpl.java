package ssm.demo.service.impl;

import ssm.demo.dao.CollocationDao;
import ssm.demo.model.Collocation;
import ssm.demo.service.CollocationService;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import ssm.demo.util.Pagination;

import java.util.List;

@Service
public class CollocationServiceImpl implements CollocationService {

    private CollocationDao collocationDao;

    @Autowired
    public void setCollocationDao(CollocationDao collocationDao) {
        this.collocationDao = collocationDao;
    }

    @Override
    public void create(Collocation collocation) {
        collocationDao.create(collocation);
    }

    @Override
    public void remove(Integer id) {
        collocationDao.remove(id);
    }

    @Override
    public void modify(Collocation collocation) {
        collocationDao.modify(collocation);
    }

    @Override
    public List<Collocation> queryAll() {
        return collocationDao.queryAll();
    }

    @Override
    public Collocation queryById(Integer id) {
        return collocationDao.queryById(id);
    }

    @Override
    public List<Collocation> queryByKeyword(String keyword) {
        return  collocationDao.queryByKeyword(keyword);
    }

    @Override
    public List<Collocation> queryByType(Integer id) {
        return collocationDao.queryByType(id);
    }

    @Override
    public List<Collocation> queryByLookData() {
        return collocationDao.queryByLookData();
    }

    @Override
    public List<Collocation> queryByCreateTime() {
        return collocationDao.queryByCreateTime();
    }

    @Override
    public Pagination<Collocation> queryAll(int currentPage) {
        return collocationDao.queryAll(currentPage);
    }

    @Override
    public List<Collocation> queryByUser(Integer id) {
        return collocationDao.queryByUser(id);
    }
}