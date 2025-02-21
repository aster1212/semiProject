<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>게시판</title>
</head>

<body>
	<table width="600" border="1" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>게시판</h2></td>
		</tr>
	</table>

	<s:if test="resultClass == NULL">
		<form action="writeAction.action" method="post"
			enctype="multipart/form-data">
	</s:if>

	<s:else>
		<form action="modifyAction.action" method="post"
			enctype="multipart/form-data">
			<s:hidden name="bo_no" value="%{resultClass.bo_no}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
			<s:hidden name="old_file" value="%{resultClass.bo_savfile}" />
	</s:else>

	<table width="700" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td align="right" colspan="2"><font color="#FF0000">*</font>는 필수
				입력사항입니다.</td>
		</tr>

		<tr><td height="1" colspan="2"></td></tr>
		<tr>
			<td bgcolor="#F4F4F4">카테고리</td>
			<td bgcolor="#FFFFFF"  width="100" >
			<s:select name="bo_genre"   list="#{'액션':'액션','드라마/멜로':'드라마/멜로','코미디':'코미디','아동/가족':'아동/가족','공포/범죄/스릴러':'공포/범죄/스릴러','SF판타지':'SF판타지'}"  headerValue="-장르선택-" headerKey="X"/>   
			</td>
		</tr>
		
		<tr>
			<td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				제목</td>
			<td width="500" bgcolor="#FFFFFF">
					<s:textfield name="bo_subject"
					theme="simple" value="%{resultClass.bo_subject}"
					cssStyle="width:370px" maxlength="50" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4">작성자</td>
			<td bgcolor="#FFFFFF"><s:textfield name="bo_writer" theme="simple"
					value="%{resultClass.bo_writer}" cssStyle="width:100px" maxlength="20" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 내용</td>
			<td bgcolor="#FFFFFF"><s:textarea name="bo_content" theme="simple"
					value="%{resultClass.bo_content}" cols="50" rows="10" /></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4">첨부파일</td>
			<td bgcolor="#FFFFFF"><s:file name="upload" theme="simple" /> 
			<s:if test="resultClass.bo_orgfile != NULL">
		&nbsp; * <s:property value="resultClass.bo_orgfile" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
	</s:if></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td height="10" colspan="2"></td>
		</tr>


		<tr>
			<td align="right" colspan="2"><input name="submit" type="submit"
				value="작성완료" class="inputb"> <input name="list"
				type="button" value="목록" class="inputb"
				onClick="javascript:location.href='listAction.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>

	</table>
	</form>

</body>
</html>
