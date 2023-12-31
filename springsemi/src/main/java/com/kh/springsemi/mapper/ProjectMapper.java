package com.kh.springsemi.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.springsemi.dto.ProjectDto;
@Component
public class ProjectMapper implements RowMapper<ProjectDto> {
	@Override
	public ProjectDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProjectDto projectDto = new ProjectDto();
		projectDto.setProjectNo(rs.getInt("project_no"));
		projectDto.setProjectTitle(rs.getString("project_Title"));
		projectDto.setProjectGoalPrice(rs.getInt("project_goal_price"));
		projectDto.setProjectTotalPrice(rs.getInt("project_total_price"));
		projectDto.setProjectStartDate(rs.getDate("project_start_date"));
		projectDto.setProjectEndDate(rs.getDate("project_end_date"));
		projectDto.setProjectPeriod(rs.getInt("project_period"));
		projectDto.setProjectRegDate(rs.getDate("project_reg_date"));
//		projectDto.setProjectContent(rs.getString("project_content"));
		projectDto.setProjectOwner(rs.getString("project_owner"));
		projectDto.setProjectReadcount(rs.getLong("project_readcount"));
		projectDto.setMinorCategoryNo(rs.getInt("minor_category_no"));
//		projectDto.setJudgeNo(rs.getInt("judge_no"));
		return projectDto;
	}
}
