<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"></jsp:include>
<section id="board" class="write">
    <h3>글쓰기</h3>
    <article>
        <form action="/Farmstory2/board/write.do" method="post">
        	<input type="hidden" name="uid" value="${sessionScope.suser.uid}" />
        	<input type="hidden" name="group" value="${group}" />
        	<input type="hidden" name="cate" value="${cate}" />
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
                <a href="/Farmstory2/board/write.do?group=${group}&cate=${cate}" class="btnCancel">Cancel</a>
                <input type="submit"  class="btnWrite" value="Submit">
            </div>
        </form>
    </article>
</section>
<jsp:include page="../_footer.jsp"></jsp:include>