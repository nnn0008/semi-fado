package com.kh.springsemi.dao;

import java.util.List;

import com.kh.springsemi.dto.MinorCategoryDto;

public interface MinorCategoryDao {
	//등록
	int sequence();
	void insert(MinorCategoryDto minorCategoryDto);
	
	//삭제
	boolean delete(int minorCategoryNo);
	
	//수정
	boolean update(MinorCategoryDto minorCategoryDto);
	
	//보기(한 개, 목록)
	List<MinorCategoryDto> selectList();
	MinorCategoryDto selectOne(int minorCategoryNo);
	MinorCategoryDto selectOne(String minorCategoryType);
	
	//minorCategoryNo만을 저장
	List<MinorCategoryDto> selectClassifyByNo(int majorCategoryNo);
	
}
