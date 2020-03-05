package com.team.service;

import com.team.pojo.Grade;

import java.util.List;

/**
 * @author 张子恒
 * @Classname GradeService
 * @Description TODO
 * @Date:2020/01/03 15:03
 * @Create by IntelliJ IDEA
 **/
public interface GradeService {
    //查询所有的年级信息
    public List<Grade> getAllGrade();
}
