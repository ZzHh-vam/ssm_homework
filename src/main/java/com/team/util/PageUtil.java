package com.team.util;

/**
 * @author 张子恒
 * @Classname PageUtil
 * @Description TODO
 * @Date:2020/01/05 18:34
 * @Create by IntelliJ IDEA
 **/
public class PageUtil {
    private Integer page = 1;
    private Integer pageSize = 3;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
