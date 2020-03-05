package com.team.mapper;

import com.team.pojo.Grade;
import com.team.pojo.GradeExample;
import java.util.List;

public interface GradeMapper {
    int deleteByPrimaryKey(Byte gid);

    int insert(Grade record);

    int insertSelective(Grade record);

    List<Grade> selectByExample(GradeExample example);

    Grade selectByPrimaryKey(Byte gid);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);
}