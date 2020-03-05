<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生信息管理系统</title>
    <script language="JavaScript" type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="/static/css/bootstrap.css">

    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="/static/css/bootstrap-theme.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static/js/jquery-2.2.4.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static/js/bootstrap.js"></script>
    <%--<script language="JavaScript" type="text/javascript">
        $(function () {
           //加载事件
           //alert("你好!");
            //分页导航
            function goPage(page) {
                //设置页码
                $("#setPage").val(page);  //传递页码
                //提交表单
                $("#form1").submit();  //jQuery提交表单传递条件
            }
        });
    </script>--%>
</head>
<body>

<table class="table table-bordered table-striped table-hover text-center">
    <%--<input type="hidden" name="page" id="setPage" value="1" />--%>
    <tr class="info">
        <td colspan="11"><h1>学生信息管理系统</h1></td>
    </tr>
    <tr class="success">
        <td colspan="11">
            <form action="searchStudents" name="form1" method="post" class="form-inline">
                <div class="form-group">
                    <label for="name">姓名:</label>
                    <input type="text" class="form-control" id="name" placeholder="姓名" name="name" value="${studentsCondition.name}">
                </div>
                <div class="form-group">
                    <label for="startAge">年龄:</label>
                    <input type="text" class="form-control" id="startAge" placeholder="开始年龄" name="startAge" value="${studentsCondition.startAge}">
                </div>
                <div class="form-group">
                    <label for="endAge">-</label>
                    <input type="text" class="form-control" id="endAge" placeholder="结束年龄" name="endAge" value="${studentsCondition.endAge}">
                </div>
                <button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-search" aria-hidden="true">查询</span></button>
                <button type="reset" class="btn btn-danger"><span class="glyphicon glyphicon-trash" aria-hidden="true">清空</span></button>

             <%--    姓名:<input type="text" name="name" size="10"  value="${studentsCondition.name}"/>&nbsp;
                 年龄:<input type="text" name="startAge" size="5" value="${studentsCondition.startAge}" />-<input type="text" name="endAge" size="5" value="${studentsCondition.endAge}" />&nbsp;
                 <input type="submit" name="button" value="查询" />
                 <input type="reset" name="button2" value="清空" />--%>
            </form>
        </td>
    </tr>
    <tr class="info">
        <td>学号</td>
        <td>姓名</td>
        <td>性别</td>
        <td>年龄</td>
        <td>生日</td>
        <td>地址</td>
        <td>电话</td>
        <td>在读状态</td>
        <td>年级</td>
        <td>修改</td>
        <td>删除</td>
    </tr>
    <tr class="success">
        <c:forEach items="${pageInfo.list}" var="stu">
            <tr>
                <td>${stu.xh}</td>
                <td>${stu.name}</td>
                <td>${stu.sex}</td>
                <td>${stu.age}</td>
                <%--格式化年月日类型的日期--%>
                <td>${stu.birthday.toLocaleString().substring(0,9)}</td>
                <td>${stu.address}</td>
                <td>${stu.tel}</td>
                <td>${(stu.state)==1?"在读":"休学"}</td>
                <td>${stu.gname}</td>
                <td>
                    <a href="getStudents?xh=${stu.xh}"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-pencil" aria-hidden="true">修改</span></button></a>
                </td>
                <td>
                    <a href="deleteStudents?xh=${stu.xh}"><button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-trash" aria-hidden="true">删除</span></button></a>
                </td>
            </tr>
        </c:forEach>
    </tr>
    <tr class="info">
        <td colspan="11">
            <a href="getAllGrade"><button type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true">添加</span></button></a>
        </td>
    </tr>
        <%--请选择页面数据容量:
        <select id="pageSize" onchange="select()">
            <option ${studentsCondition.pageSize==3?"selected":""} value="3">3</option>
            <option ${studentsCondition.pageSize==5?"selected":""} value="5">5</option>
        </select>--%>
    <tr class="success">
        <td colspan="11">
            <div class="dropdown">
                <button class="btn btn-info dropdown-toggle" type="button" id="pageSize" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    请选择页面数据容量:${studentsCondition.pageSize}
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="pageSize" onchange="select(pageSize)">
                    <li>
                        <a href="javascript:select(3)">
                            3
                        </a>
                    </li>
                    <li>
                        <a href="javascript:select(5)">
                            5
                        </a>
                    </li>
                </ul>
            </div>
        </td>
    </tr>
    <tr class="info">
        <td colspan="11">
            <nav>
                <ul class="pagination">
                    <li>
                        <a href="searchStudents?page=${pageInfo.prePage==0?1:pageInfo.prePage}&pageSize=${studentsCondition.pageSize}" aria-label="Previous">
                            <span aria-hidden="true">
                                &laquo;
                            </span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${pageInfo.pages}" var="p">
                        <li>
                            <a href="javascript:goto(${p})">${p}</a>
                        </li>
                    </c:forEach>
                    <li>
                        <a href="searchStudents?page=${pageInfo.nextPage==0?pageInfo.pages:pageInfo.nextPage}&pageSize=${studentsCondition.pageSize}" aria-label="Next">
                            <span aria-hidden="true">
                                &raquo;
                            </span>
                        </a>
                    </li>
                </ul>
            </nav>
        </td>
    </tr>
        <%-- <a href="searchStudents?page=1&pageSize=${studentsCondition.pageSize}"><input type="button" name="button" value="首页" /></a>
         <a href="searchStudents?page=${pageInfo.prePage==0?1:pageInfo.prePage}&pageSize=${studentsCondition.pageSize}"><input type="button" name="button2" value="上一页" /></a>
         <a href="searchStudents?page=${pageInfo.nextPage==0?pageInfo.pages:pageInfo.nextPage}&pageSize=${studentsCondition.pageSize}"><input type="button" name="button3" value="下一页" /></a>
         <a href="searchStudents?page=${pageInfo.pages}&pageSize=${studentsCondition.pageSize}"><input type="button" name="button4" value="尾页" /></a>&nbsp;
         当前第${pageInfo.pageNum}页&nbsp;/&nbsp;共${pageInfo.pages}页
         <input type="text" name="hrefPage" id="hrefPage" size="2" value="${pageInfo.pageNum}" style="text-align: center;" />
         <button  onclick="go()" name="button6">跳转</button>--%>
</table>
<script>
    function goto(page) {
        //实现分页
        if (page >= ${studentsCondition.pageSize}){
            page = ${studentsCondition.pageSize}
        }else if (page <= 1){
            page = 1;
        }
        location.href="searchStudents?page="+ page + "&pageSize=" + ${studentsCondition.pageSize};
    }
    function select(pageSize) {
        //var pageSize = document.getElementById("pageSize").value;
        location.href = "searchStudents?page=1&pageSize=" + pageSize;
    }
    function go() {
        //实现分页
        var curPage = document.getElementById("hrefPage").value;
        if (curPage >= ${studentsCondition.pageSize}){
            curPage = ${studentsCondition.pageSize}
        }else if (curPage <= 1){
            curPage = 1;
        }
        location.href="searchStudents?page="+ page + "&pageSize=" + ${studentsCondition.pageSize};
    }
</script>
</body>
</html>