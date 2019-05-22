package ssm.demo.dao;

import ssm.demo.util.Pagination;

import java.io.Serializable;
import java.util.List;

/*
Geniric 泛化的 通用的 泛型
泛型的Dao 接口 JDK5
1.类型安全
2.简化代码
声明通用的数据库 CRUD 方法
 */
public interface GenericDao<T extends Serializable,ID extends Number> {
    void add(T t);

    List<T> queryAll();

    T queryById(ID id);

    void modify(T t);

    void remove(ID id);

    void create(String sqlId,Object parameter);

    T queryOne(String sqlId,Object parameter);

    void modify(String sqlId,Object parameter);

    List<T> queryList(String sqlId, Object parameter);
    Pagination<T> queryAll(int currentPage);
    Pagination<T> query(String sqlId, Object parameter, int currentPage);
    Object query(String sqlId, Object parameter);
}
