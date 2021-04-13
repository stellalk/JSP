<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"></jsp:include>
<section id="user" class="terms">
	
    <table>
        <caption>Terms</caption>
        <tr>
            <td>
                <textarea readonly>${vo.terms}</textarea>
                <p>
                    <label><input type="checkbox" name="chk1"/> I agree.</label>
                </p>
            </td>
        </tr>
    </table>
    <table>
        <caption>Privacy Policy</caption>
        <tr>
            <td>
                <textarea readonly>${vo.privacy}</textarea>
                <p>
                    <label><input type="checkbox" name="chk2"/> I agree.</label>
                </p>
            </td>
        </tr>
    </table>
    <div>
        <a href="/Farmstory2/user/login.do">Cancel</a>
        <a href="/Farmstory2/user/register.do">Next</a>
    </div>
</section>
<jsp:include page="../_footer.jsp"></jsp:include>