package ssm.demo.service.impl;

import ssm.demo.dao.TypeDao;
import ssm.demo.model.Type;
import ssm.demo.service.TypeService;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {

    private TypeDao typeDao;

    @Autowired
    public void setTypeDao(TypeDao typeDao) {
        this.typeDao = typeDao;
    }

    @Override
    public List<Type> queryAll() {
        return typeDao.queryAll();
    }
}