package ssm.demo.dao;

import ssm.demo.model.Collocation;
import ssm.demo.util.Pagination;

import java.util.List;

public interface CollocationDao {
    void create(Collocation collocation);

    void remove(Integer id);

    void modify(Collocation collocation);

    List<Collocation> queryAll();

    Collocation queryById(Integer id);

    List<Collocation> queryByUser(Integer id);

    List<Collocation> queryByKeyword(String keyword);

    List<Collocation> queryByType(Integer id);

    List<Collocation> queryByLookData();

    List<Collocation> queryByCreateTime();

    Pagination<Collocation> queryAll(int currentPage);
}