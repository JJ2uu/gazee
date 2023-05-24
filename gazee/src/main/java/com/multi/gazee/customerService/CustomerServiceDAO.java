package com.multi.gazee.customerService;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class CustomerServiceDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int csRegister(CustomerServiceVO bag) {
		int result = my.insert("cs.register", bag);
		return result;
	}
	
	public void delete(CustomerServiceVO bag) {
		my.delete("cs.del", bag);
	}
	
	public void update(CustomerServiceVO bag) {
		my.delete("cs.up", bag);
	}
	
	public CustomerServiceVO one(int no) {
		CustomerServiceVO bag = my.selectOne("cs.one",no);
		my.update("cs.viewUpdate", no);
		return bag;
	}
	
	public List<CustomerServiceVO> list(PageVO vo){
		List<CustomerServiceVO> list = my.selectList("cs.all", vo);
		return list;
	}
	
	public List<CustomerServiceVO> category(HashMap<String, Object> map){
		List<CustomerServiceVO> category = my.selectList("cs.category", map);
		return category;
	}
	
	
	public List<CustomerServiceVO> search(HashMap<String, Object> map){
		List<CustomerServiceVO> search = my.selectList("cs.searchAll", map);
		System.out.println(search.size());
		return search;
	}
	
	
	public int count() {
		return my.selectOne("cs.count");
	}
	
	public int countCategory(String category1) {
		return my.selectOne("cs.countCategory", category1);
	}  
	
	public int countSearch(String search1) {
		return my.selectOne("cs.countSearch", search1);
	}  
	
	
}
