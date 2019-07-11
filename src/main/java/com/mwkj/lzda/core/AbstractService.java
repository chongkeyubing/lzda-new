package com.mwkj.lzda.core;


import org.apache.ibatis.exceptions.TooManyResultsException;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.entity.Condition;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * 基于通用MyBatis Mapper插件的Service接口的实现
 */
public abstract class AbstractService<T> implements Service<T> {

    @Autowired
    protected Mapper<T> mapper;

    private Class<T> modelClass;    // 当前泛型真实类型的Class

    @SuppressWarnings("unchecked")
    public AbstractService() {
        ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
        modelClass = (Class<T>) pt.getActualTypeArguments()[0];
    }

    public void save(T model) {
        mapper.insertSelective(model);
    } //保存一个实体，null的属性不会保存，会使用数据库默认值

    public void saveAll(List<T> models) {
        mapper.insertList(models);
    } //批量插入，支持批量插入的数据库可以使用，例如MySQL,H2等

    public void delete(T model) {
        mapper.delete(model);
    } //根据实体属性作为条件进行删除，条件是等号

    public void deleteById(Integer id) {
        mapper.deleteByPrimaryKey(id);
    } //根据主键进行删除,条件是等号

    public void deleteByIds(String ids) {
        mapper.deleteByIds(ids);
    } //根据主键批量删除，入参为id字符串“1,2,3,4...”，条件是等号

    public void deleteByCondition(Condition conditon) {
        mapper.deleteByCondition(conditon);
    } //根据条件删除

    public void update(T model) {
        mapper.updateByPrimaryKeySelective(model); //根据主键更新属性不为null的值
    }

    public void updateByCondition(T model, Condition condition) {
        mapper.updateByConditionSelective(model, condition);
    } //根据Condition条件更新实体model包含的不是null的属性值

    public List<T> find(T model) {
        return mapper.select(model);
    } //根据实体字段查询，条件是等号

    public T findById(Integer id) {
        return mapper.selectByPrimaryKey(id);
    } //根据主键字段进行查询,条件是等号

    @Override
    public T findBy(String fieldName, Object value) throws TooManyResultsException {
        try {
            T model = modelClass.newInstance();
            Field field = modelClass.getDeclaredField(fieldName);
            field.setAccessible(true);
            field.set(model, value);
            return mapper.selectOne(model);
        } catch (ReflectiveOperationException e) {
            throw new AppException(e.getMessage());
        }
    } //根据属性查询，返回单条数据

    public T findOne(T model) throws TooManyResultsException{
         return mapper.selectOne(model);
    } //根据实体属性查询查询，返回单条数据

    public List<T> findByIds(String ids) {
        return mapper.selectByIds(ids);
    } //根据主键字符串进行查询,条件是等号，主键字符串为“1,2，3,4...”

    public List<T> findByCondition(Condition condition) {
        return mapper.selectByCondition(condition);
    } //根据条件查询

    public List<T> findAll() {
        return mapper.selectAll();
    } //无条件查询所有

    public int findCount(T model) {
        return mapper.selectCount(model);
    } //根据实体属性查询总数，条件是等号

    public int findCountByCondition(Condition condition) {
        return mapper.selectCountByCondition(condition);
    } //根据条件查询总数

}
