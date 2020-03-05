package com.team.util;

/**
 * @author 张子恒
 * @Classname StudentsCondition
 * @Description TODO
 * @Date:2020/01/06 08:29
 * @Create by IntelliJ IDEA
 **/

//学生查询条件
public class StudentsCondition extends PageUtil {
    //一条件一属性
    private String name;
    private Integer startAge;
    private Integer endAge;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getStartAge() {
        return startAge;
    }

    public void setStartAge(Integer startAge) {
        this.startAge = startAge;
    }

    public Integer getEndAge() {
        return endAge;
    }

    public void setEndAge(Integer endAge) {
        this.endAge = endAge;
    }
}
