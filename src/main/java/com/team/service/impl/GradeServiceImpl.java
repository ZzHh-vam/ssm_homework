package com.team.service.impl;

import com.team.mapper.GradeMapper;
import com.team.pojo.Grade;
import com.team.pojo.GradeExample;
import com.team.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 张子恒
 * @Classname GradeServiceImpl
 * @Description TODO
 * @Date:2020/01/03 15:04
 * @Create by IntelliJ IDEA
 **/

@Service
public class GradeServiceImpl implements GradeService {
    //定义DAO层属性(面向接口)
    @Autowired
    private GradeMapper gradeMapper;

    //查询所有年级信息
    public List<Grade> getAllGrade() {
        //调用DAO层
        return gradeMapper.selectByExample(new GradeExample());
    }
}
