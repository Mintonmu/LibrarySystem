<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>《 ${detail.name}》</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.comment.js"></script>
    <%--    request.getSession().setAttribute("readercard", readerCard);--%>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        })
    </script>

</head>
<body background="img/lizhi.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header"></div>
<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 3%">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">《 ${detail.name}》</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tr>
                    <th width="15%">书名</th>
                    <td>${detail.name}</td>
                </tr>
                <tr>
                    <th>作者</th>
                    <td>${detail.author}</td>
                </tr>
                <tr>
                    <th>出版社</th>
                    <td>${detail.publish}</td>
                </tr>
                <tr>
                    <th>ISBN</th>
                    <td>${detail.isbn}</td>
                </tr>
                <tr>
                    <th>简介</th>
                    <td>${detail.introduction}</td>
                </tr>
                <tr>
                    <th>语言</th>
                    <td>${detail.language}</td>
                </tr>
                <tr>
                    <th>价格</th>
                    <td>${detail.price}</td>
                </tr>
                <tr>
                    <th>出版日期</th>
                    <td>${detail.pubdate}</td>
                </tr>
                <tr>
                    <th>分类号</th>
                    <td>${detail.classId}</td>
                </tr>
                <tr>
                    <th>状态</th>
                    <c:if test="${detail.number>=1}">
                        <td>在馆</td>
                    </c:if>
                    <c:if test="${detail.number==0}">
                        <td>借出</td>
                    </c:if>

                </tr>
                </tbody>
            </table>
        </div>
    </div>


    <div class="panel panel-primary comment-list ">
        <c:if test="${readercard!=null}">
        <textarea class="form-control" id="deblock_udid" name="deblock_udid" rows="5"
                  style="min-width: 90%"></textarea>

            <button type="submit" onclick="commentSubmit()">提交</button>
        </c:if>

        <c:if test="${readercard==null}">
            <p>登录方可评价</p>
        </c:if>

    </div>

    <div class="panel panel-primary comment-list ">

        <div class="list-group">

            <c:forEach items="${comments}" var="item">
                <div class="list-group-item list-group-item-action active">
                    <p class="mb-1">评论：${item.comment}</p>
                    <small>学号：${item.reader_id}</small>
                    <hr>
                 </div>
            </c:forEach>
        </div>

    </div>

</div>

</body>
<script type="text/javascript">

    // Ajax提交数据
    function commentSubmit() {
        let reader_id = ${readercard.readerId};
        if (reader_id === "") {
            alert("未登录");
            return;
        }
        let book_id = ${detail.bookId};
        let comment = $("#deblock_udid").val();
        if (comment === "") {
            alert("内容不能为空");
            return;
        }
        $.ajax({
            url: "/library_war/comment_add_do",    // 提交到controller的url路径
            type: "post",    // 提交方式
            data: {"reader_id": reader_id, "book_id": book_id, "comment": comment},  // data为String类型，必须为 Key/Value 格式。
            success: function (data) {    // 请求成功后的回调函数，其中的参数data为controller返回的map,也就是说,@ResponseBody将返回的map转化为JSON格式的数据，然后通过data这个参数取JSON数据中的值
                if (data === "success") {
                    alert("发布成功");
                } else {
                }
            },
        });
    }
</script>

</html>
