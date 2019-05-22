package ssm.demo.service;

import ssm.demo.model.Collocation;
import ssm.demo.util.Pagination;

import java.util.List;

public interface CollocationService {
    void create(Collocation collocation);

    void remove(Integer id);

    void modify(Collocation collocation);

    List<Collocation> queryAll();

    List<Collocation> queryByUser(Integer id);

    Collocation queryById(Integer id);

    List<Collocation> queryByKeyword(String keyword);

    List<Collocation> queryByType(Integer id);

    List<Collocation> queryByLookData();

    List<Collocation> queryByCreateTime();

    Pagination<Collocation> queryAll(int currentPage);

}