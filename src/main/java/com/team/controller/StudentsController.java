package com.team.controller;

import com.github.pagehelper.PageInfo;
import com.team.pojo.Grade;
import com.team.pojo.Students;
import com.team.service.GradeService;
import com.team.service.StudentsService;
import com.team.util.StudentsCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author 张子恒
 * @Classname StudentsController
 * @Description TODO
 * @Date:2020/01/02 16:01
 * @Create by IntelliJ IDEA
 **/

@Controller  //控制器组件
public class StudentsController {
    //调用业务层
    @Autowired(required = false)
    private StudentsService studentsService;  //没有被注入对象

    @Autowired
    private GradeService gradeService;  //没有被注入对象

    //添加学生
    @RequestMapping("/addStudents")
    public String addStudents(Students students){
        //设置在读状态为:0
        students.setState(new Byte("0"));
        //调用业务添加学生
        int temp = studentsService.addStudents(students);
        if (temp > 0){
            return "redirect:searchStudents";
        }else{
            return "addStudents";
        }
    }

    //删除学生
    @RequestMapping("/deleteStudents")
    public String deleteStudents(int xh){
        //调用业务删除学生
        int temp = studentsService.deleteStudents(xh);
        if (temp > 0){
            return "redirect:searchStudents";
        }else{
            return "redirect:searchStudents";
        }
    }

    //修改学生
    @RequestMapping("/updateStudents")
    public String updateStudents(Students students){
        //调用业务修改学生信息
        int temp = studentsService.updateStudents(students);
        if (temp > 0){
            return "redirect:searchStudents";
        }else{
            return "updateStudents";
        }
    }

    //条件分页查询所有学生
    //studentsCondition接收表单数据
    @RequestMapping("/searchStudents")
    public String searchStudents(StudentsCondition studentsCondition, Model model){
        //调用业务
        PageInfo<Students> pageInfo = studentsService.getStudentsByCondition(studentsCondition);
        //传递视图
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("studentsCondition",studentsCondition);
        return "index";
    }

    //查询单个学生信息
    @RequestMapping("/getStudents")
    public String getStudents(int xh, Model model){
        List<Grade> list = gradeService.getAllGrade();
        Students students = studentsService.getStudents(xh);
        model.addAttribute("students",students);
        model.addAttribute("list",list);
        return "updateStudents";
    }
}
