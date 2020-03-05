package com.team.service;

import com.github.pagehelper.PageInfo;
import com.team.pojo.Students;
import com.team.util.PageUtil;
import com.team.util.StudentsCondition;

/**
 * @author 张子恒
 * @Classname StudentsService
 * @Description TODO
 * @Date:2020/01/02 15:41
 * @Create by IntelliJ IDEA
 **/
public interface StudentsService {
    //添加学生
    public int addStudents(Students students);

    //删除学生
    public int deleteStudents(int xh);

    //修改学生
    public int updateStudents(Students students);

    //分页查询所有学生
    public PageInfo<Students> getAllStudentsByPage(PageUtil pageUtil);

    //条件查询分页
    public PageInfo<Students> getStudentsByCondition(StudentsCondition studentsCondition);

    //查询单个学生信息
    public Students getStudents(int xh);
}
