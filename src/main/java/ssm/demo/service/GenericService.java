package ssm.demo.service;

import ssm.demo.util.Pagination;

import java.io.Serializable;
import java.util.List;

public interface GenericService<T extends Serializable,ID extends Number> {
    void add(T t);

    List<T> queryAll();

    T queryById(ID id);

    void modify(T t);

    void remove(ID id);

    void create(String sqlId, Object parameter);

    T queryOne(String sqlId, Object parameter);

    void modify(String sqlId, Object parameter);

    List<T> queryList(String sqlId, Object parameter);
    Pagination<T> queryAll(int currentPage);
    Pagination<T> query(String sqlId, Object parameter, int currentPage);
    Object query(String sqlId, Object parameter);
}
