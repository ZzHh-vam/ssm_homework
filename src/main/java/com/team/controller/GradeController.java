package com.team.controller;

import com.team.pojo.Grade;
import com.team.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author 张子恒
 * @Classname GradeController
 * @Description TODO
 * @Date:2020/01/03 15:19
 * @Create by IntelliJ IDEA
 **/

@Controller
public class GradeController {
    @Autowired
    private GradeService gradeService;  //没有被注入对象

    //查询所有的年级信息
    @RequestMapping("/getAllGrade")
    public String getAllGrade(Model model){
        List<Grade> list = gradeService.getAllGrade();
        model.addAttribute("list",list);
        return "addStudents";
    }
}
