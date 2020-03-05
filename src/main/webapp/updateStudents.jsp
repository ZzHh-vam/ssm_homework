<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>添加学生</title>
    <script language="JavaScript" type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="/static/css/bootstrap.css">

    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="/static/css/bootstrap-theme.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static/js/jquery-2.2.4.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static/js/bootstrap.js"></script>
</head>
<body>
<table class="table table-bordered table-striped table-hover text-center">
    <tr class="info">
        <td colspan="2">
            <h1>修改学生信息</h1>
        </td>
    </tr>
    <form action="updateStudents" method="post" name="form1" id="form1" class="form-inline">
        <tr class="bg-info">
            <div class="form-group">
                <td>
                    <label for="xh">学号:</label>
                </td>
                <td>
                    <input type="text" readonly class="form-control" id="xh" name="xh" value="${students.xh}" />
                </td>
            </div>
        </tr>
        <tr class="bg-success">
            <div class="form-group">
                <td>
                    <label for="name">姓名:</label>
                </td>
                <td>
                    <input type="text" class="form-control" id="name" placeholder="姓名" name="name" value="${students.name}" />
                </td>
            </div>
        </tr>
        <tr class="bg-info">
            <div class="form-group">
                <td>
                    <label>性别:</label>
                </td>
                <td>
                    <div class="radio-inline">
                        <label class="radio">
                            <input type="radio" ${students.sex=="男"?"checked":""} name="sex" value="男" />男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" ${students.sex=="女"?"checked":""} name="sex" value="女" />女
                        </label>
                    </div>
                </td>
            </div>
        </tr>
        <tr class="bg-info">
            <div class="form-group">
                <td>
                    <label for="age">年龄:</label>
                </td>
                <td>
                    <input type="text" class="form-control" id="age" placeholder="年龄" name="age" value="${students.age}" />
                </td>
            </div>
        </tr>
        <tr class="bg-success">
            <div class="form-group">
                <td>
                    <label for="birthday">出生日期:</label>
                </td>
                <td>
                    <input type="date" class="form-control" id="birthday" name="birthday" value="<fmt:formatDate value="${students.birthday}" pattern="yyyy-MM-dd" />" />
                </td>
            </div>
        </tr>
        <tr class="bg-success">
            <div class="form-group">
                <td>
                    <label for="tel">电话:</label>
                </td>
                <td>
                    <input type="text" class="form-control" id="tel" placeholder="电话" name="tel" value="${students.tel}" />
                </td>
            </div>
        </tr>
        <tr class="bg-info">
            <div class="form-group">
                <td>
                    <label for="address">地址:</label>
                </td>
                <td>
                    <input type="text" class="form-control" id="address" placeholder="地址" name="address" value="${students.address}" />
                </td>
            </div>
        </tr>
        <tr class="bg-success">
            <div class="form-group">
                <td>
                    <label for="state">在读状态:</label>
                </td>
                <td>
                    <input type="text" class="form-control" id="state" placeholder="在读状态" name="state" value="${students.state}" />
                </td>
            </div>
        </tr>
        <tr class="bg-info">
            <div class="form-group">
                <td>
                    <label for="gid">年级:</label>
                </td>
                <td>
                    <select name="gid" id="gid">
                        <c:forEach items="${list}" var="g">
                            <option ${students.gid==g.gid?"selected":""} value="${g.gid}">${g.gname}</option>
                        </c:forEach>
                    </select>
                </td>
            </div>
        </tr>
        <tr class="bg-success">
            <td colspan="2">
                <button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-search" aria-hidden="true">修改</span></button>
                <button type="reset" class="btn btn-danger"><span class="glyphicon glyphicon-trash" aria-hidden="true">重置</span></button>
            </td>
        </tr>
    </form>
</table>
</body>
</html>