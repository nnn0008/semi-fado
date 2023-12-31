package com.kh.springsemi.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.springsemi.dto.ReviewDto;
@Component
public class ReviewMapper implements RowMapper<ReviewDto>{
	@Override
	public ReviewDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReviewDto reviewDto = new ReviewDto();
		reviewDto.setReviewNo(rs.getInt("review_no"));
		reviewDto.setProjectNo(rs.getInt("project_no"));
		reviewDto.setReviewWriter(rs.getString("review_writer"));
		reviewDto.setReviewContent(rs.getString("review_content"));
		reviewDto.setReviewRegDate(rs.getDate("review_reg_date"));
		reviewDto.setImage(rs.getObject("attach_no") != null);
		return reviewDto;
	}
}