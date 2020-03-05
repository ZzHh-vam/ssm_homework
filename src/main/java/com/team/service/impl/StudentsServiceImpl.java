package com.team.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.mapper.StudentsMapper;
import com.team.pojo.Students;
import com.team.pojo.StudentsExample;
import com.team.service.StudentsService;
import com.team.util.PageUtil;
import com.team.util.StudentsCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 张子恒
 * @Classname StudentsServiceImpl
 * @Description TODO
 * @Date:2020/01/02 15:41
 * @Create by IntelliJ IDEA
 **/

@Service
public class StudentsServiceImpl implements StudentsService {
    //定义DAO层属性(面向接口)
    @Autowired
    private StudentsMapper studentsMapper;

    //添加学生
    public int addStudents(Students students) {
        //调用DAO层
        int temp = studentsMapper.insert(students);
        if (temp > 0){
            return temp;
        }else{
            return -1;
        }
    }

    //删除学生
    public int deleteStudents(int xh) {
        //调用DAO层
        int temp = studentsMapper.deleteByPrimaryKey(xh);
        if (temp > 0){
            return temp;
        }else{
            return -1;
        }
    }

    //修改学生
    public int updateStudents(Students students) {
        //调用DAO层
        int temp = studentsMapper.updateByPrimaryKeySelective(students);
        if (temp > 0){
            return temp;
        }else{
            return -1;
        }
    }

    //分页查询所有学生
    public PageInfo<Students> getAllStudentsByPage(PageUtil pageUtil) {
        //分页查询
        //使用PageHelper步骤
        //1.开启分页支持
        PageHelper.startPage(pageUtil.getPage(),pageUtil.getPageSize());
        //2.查询所有学生信息
        List<Students> list = studentsMapper.selectByExample(new StudentsExample());
        //3.获取分页相关信息
        PageInfo<Students> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    //条件查询分页
    public PageInfo<Students> getStudentsByCondition(StudentsCondition studentsCondition) {
        //支持分页
        PageHelper.startPage(studentsCondition.getPage(), studentsCondition.getPageSize());
        //带条件查询所有学生
        StudentsExample studentsExample = new StudentsExample();
        //追加条件
        StudentsExample.Criteria criteria = studentsExample.createCriteria();
        if (studentsCondition.getName() != null){
            criteria.andNameLike("%" + studentsCondition.getName() + "%");
        }
        if (studentsCondition.getStartAge() != null){
            criteria.andAgeGreaterThanOrEqualTo(Byte.parseByte(studentsCondition.getStartAge().toString()));
        }
        if (studentsCondition.getEndAge() != null){
            criteria.andAgeLessThanOrEqualTo(Byte.parseByte(studentsCondition.getEndAge().toString()));
        }
        List<Students> list = studentsMapper.selectStudentsCondition(studentsCondition);
        PageInfo<Students> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    //查询单个学生信息
    public Students getStudents(int xh) {
        //调用DAO层
        return studentsMapper.selectStudentsByPrimaryCondition(xh);
    }
}
