<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="include/head.jsp"%>
<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">
    <%@ include file="include/main_header.jsp"%>
    <%@ include file="include/left_column.jsp"%>
    <div class="content-wrapper">
      <div class="container-fluid">
        <section class="content-header">
        <h1>List<small>code</small>
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i>Level</a></li>
          <li class="active">Here</li>
        </ol>
        </section>
        <div class="col-lg-12 col-sm-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">내 코드 저장소</h3>
            </div>
            <div class="box-body">
              <table class="table table-hover">
                <tr>
                  <th width="30%">제목</th>
                  <th width="10%">언어</th>             
                  <th width="20%">날짜</th>
                  <th width="30%">관리</th>
                </tr>
                <c:forEach var="item" items="${List}">
                  <tr>
                    <td><a href="/mvc2/codeSelect?codeno=${item.codeno}&regid=${sessionScope.sessionId}">${item.title}</a></td>
                    <td>${item.language}</td>
                    <td><fmt:parseDate value="${item.regdate}" pattern="yyyy-MM-dd HH:mm" var="myDate"/><fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}"/></td>
                    <td>
                      <a href="/mvc2/codeRemove?codeno=${item.codeno}&regid=${sessionScope.sessionId}" class="btn-box-tool replyDelBtn" id="remove"><i class="fa fa-times">삭제</i></a>
                    </td>
                  </tr>
                </c:forEach>              
              </table>
            </div>
            <div class="box-footer">
              <div class="text-center">
                <ul class="pagination">
                  <c:if test="${Page.pageNo ne '1'}">
                    <li><a href="/mvc2/codeIndivList?pageNo=${Page.prevPageNo}&regid=${sessionScope.sessionId}">이전</a></li>
                  </c:if>
                  <c:forEach var="i" begin="${(Page.startPageNo*5)+1}" end="${Page.endPageNo}">
                    <li><a href="/mvc2/codeIndivList?pageNo=${i}&regid=${sessionScope.sessionId}">${i}</a></li>
                  </c:forEach>
                  <c:if test="${Page.pageNo ne Page.finalPageNo}">
                    <li><a href="/mvc2/codeIndivList?pageNo=${Page.nextPageNo}&regid=${sessionScope.sessionId}">다음</a></li>
                  </c:if>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <%@ include file="include/plugin.jsp"%>

</body>

</html>