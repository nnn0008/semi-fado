package com.kh.springsemi.dao;

import java.util.List;

import com.kh.springsemi.dto.AttachDto;
import com.kh.springsemi.dto.ReviewDto;
import com.kh.springsemi.vo.PaginationVO;

public interface ReviewDao {
	int sequence();
	void insert(ReviewDto reviewDto);
	boolean update(ReviewDto reviewDto);
	boolean delete(int reviewNo);
	
	ReviewDto selectOne(int reviewNo);
	List<ReviewDto> selectList(int reviewNo);
	
	
	 
	
	//리뷰 사진등록
	void connect(int reviewNo, int attachNo);
	AttachDto findReviewPhoto(int reviewNo);

}
