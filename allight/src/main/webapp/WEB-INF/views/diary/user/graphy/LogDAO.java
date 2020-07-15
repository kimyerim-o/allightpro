package com.webjjang.log.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapreduce.MapReduceResults;
import org.springframework.stereotype.Repository;

import com.webjjang.log.dto.LogDTO;
import com.webjjang.log.dto.ModuleCountDTO;

// 자동 생성되도록 하는 어노테이션 : @Controller, @Service, @Repository,
//  @Component, @RestController, @Advice
// 설정 xml 태그 안에 context:component-scan에 base-package 아래로 정의
// 되어 있어야 자동 생성된다.
@Repository
public class LogDAO {

	// 자동으로 DI을 적용하기 위한 어노테이션 : @Inject, @Autowired
	@Inject
	private MongoTemplate mongoTemplate;
	
	// 테스트용 메서드
	public MongoTemplate getTemplate() {
		return mongoTemplate;
	}
	
	public void saveLog(LogDTO dto) {
		System.out.println
		("LogDAO.saveLog().mongoTemplate:" + mongoTemplate);
		System.out.println
		("LogDAO.saveLog().dto:" + dto);
//		mongoTemplate.insert(저장할 데이터의 객체, 몽고디비의컬렉션);
		mongoTemplate.insert(dto, "log");
	}
	
	// 몽고디비에 있는 데이터를 가지고 클릭한 메뉴의 카운트 그래프 그리기 위한 처리 메서드
	public List<ModuleCountDTO> getModuleCount(){
		System.out.println("LogDAO.getModuleCount()");
		
		// 처리된 데이터를 담는 객체 선언
		List<ModuleCountDTO> list = null;
		
		// mapReduce 함수를 쓰기 위한 map 함수 정의
		String map = "function() {emit(this.module, 1)}";
		// mapReduce 함수를 쓰기 위한 reduce 함수 정의
		String reduce = "function(key, values) "
				+ " {return Array.sum(values)}";
		
		// mongodb 에서 데이터 가져오기 실행 -> 결과가 results에 담긴다.
		MapReduceResults<ModuleCountDTO> results = 
		mongoTemplate.mapReduce
		("log", map, reduce, ModuleCountDTO.class);
		
		// 데이터가 있으면 저희가 처리해야할 list에 데이터를 옮겨 담는다.
		if(results != null) {
			list = new ArrayList<>();
			for(ModuleCountDTO dto : results) list.add(dto);
		}
		
		System.out.println
		("LogDAO.getModuleCount().list:"+list);
		return list;
	}
	
}