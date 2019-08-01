<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Weekop</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
</head>

<body>

<jsp:include page="fragment/navbar.jspf" />

<c:if test="${not empty requestScope.discoveries}">
    <c:forEach var="discovery" items="${requestScope.discoveries}">
        <div class="container">
            <div class="row bs-callout bs-callout-primary">
                <div class="col col-md-1 col-sm-2">
                    <a href="${pageContext.request.contextPath}/vote?discovery_id=${discovery.id}&vote=VOTE_UP" class="btn btn-block btn-primary btn-success">
                        <span class="glyphicon glyphicon-arrow-up"></span>  </a>
                    <div class="well well-sm centered"><c:out value="${discovery.upVote - discovery.downVote}" /></div>
                    <a href="${pageContext.request.contextPath}/vote?discovery_id=${discovery.id}&vote=VOTE_DOWN" class="btn btn-block btn-primary btn-warning">
                        <span class="glyphicon glyphicon-arrow-down"></span>  </a>
                </div>
                <div class="col col-md-11 col-sm-10">
                    <h3 class="centered"><a href="<c:out value="${discovery.url}" />"><c:out value="${discovery.name}" /></a></h3>
                    <h6><small>Dodane przez: <c:out value="${discovery.user.username}" />,
                        Dnia: <fmt:formatDate value="${discovery.timestamp}" pattern="dd/MM/YYYY"/></small></h6>
                    <p><c:out value="${discovery.description}" /></p>
                    <a href="<c:out value="${discovery.url}" />" class="btn btn-default btn-xs">Przejdź do strony</a>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>

<jsp:include page="fragment/footer.jspf" />

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</body>
</html>