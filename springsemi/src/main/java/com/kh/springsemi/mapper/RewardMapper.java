package com.kh.springsemi.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.springsemi.dto.RewardDto;
@Component
public class RewardMapper implements RowMapper<RewardDto> {
	@Override
	public RewardDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		RewardDto rewardDto = new RewardDto();
		rewardDto.setRewardNo(rs.getInt("reward_no"));
		rewardDto.setProjectNo(rs.getInt("project_no"));
		rewardDto.setRewardType(rs.getString("reward_type"));
		rewardDto.setRewardPrice(rs.getInt("reward_price"));
		return rewardDto;
	}
}
