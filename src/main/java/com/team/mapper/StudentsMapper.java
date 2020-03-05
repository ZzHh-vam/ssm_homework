package com.team.mapper;

import com.team.pojo.Students;
import com.team.pojo.StudentsExample;
import com.team.util.StudentsCondition;

import java.util.List;

public interface StudentsMapper {
    int deleteByPrimaryKey(Integer xh);

    int insert(Students record);

    int insertSelective(Students record);

    List<Students> selectByExample(StudentsExample example);

    Students selectByPrimaryKey(Integer xh);

    int updateByPrimaryKeySelective(Students record);

    int updateByPrimaryKey(Students record);

    //带条件查询所有
    List<Students> selectStudentsCondition(StudentsCondition studentsCondition);

    Students selectStudentsByPrimaryCondition(Integer xh);
}