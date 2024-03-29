package yingjun.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface BaseDaoI<T> {

	public Serializable save(T o);

	public void delete(T o);

	public void update(T o);

	public void saveOrUpdate(T o);

	public T get(String hql);
	
	public T get(Class<T> c,Serializable id);

	public T get(String hql, Map<String, Object> params);

	public List<T> find(String hql);
	
	public List<T> find(String hql, Object param);
	
	public List<T> find(String hql, Map<String, Object> params);

	public List<T> find(String hql, int page, int rows);
	
	public List<T> find(String hql, Object param, int page, int rows);
	
	public List<T> find(String hql, Map<String, Object> params, int page, int rows);

	public Long count(String hql);

	public Long count(String hql, Map<String, Object> params);
	
	public Long count(String hql, Object[] param);

	public Integer executeHql(String hql);
	
	public Integer executeHql(String hql, Object[] param);
	
	public Integer executeHql(String hql, List<Object> param);
	
	public Integer executeHql(String hql, Map<String, Object> params);
}
