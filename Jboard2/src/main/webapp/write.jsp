<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Post</title>
    <link rel="stylesheet" href="./css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="write">
            <h3>Post</h3>
            <article>
                <form action="/Jboard2/write.do" method="POST" enctype="multipart/form-data">
                	<input type="hidden" name="uid" value="${suser.uid}" />
                    <table>
                        <tr>
                            <td>Title</td>
                            <td><input type="text" name="title" placeholder="Enter the title"/></td>
                        </tr>
                        <tr>
                            <td>Content</td>
                            <td>
                                <textarea name="content"></textarea>                                
                            </td>
                        </tr>
                        <tr>
                            <td>Attach</td>
                            <td><input type="file" name="file"/></td>
                        </tr>
                    </table>
                    <div>
                        <a href="/Jboard2/list.do" class="btnCancel">Cancel</a>
                        <input type="submit"  class="btnWrite" value="Submit">
                    </div>
                </form>
            </article>
        </section>
    </div>
</body>
</html>