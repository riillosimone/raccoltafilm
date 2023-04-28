<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="it" class="h-100">
<head>

<!-- Common imports in pages -->
<jsp:include page="../header.jsp" />

<title>Visualizza Elemento</title>

</head>
<body class="d-flex flex-column h-100">

	<!-- Fixed navbar -->
	<jsp:include page="../navbar.jsp"></jsp:include>


	<!-- Begin page content -->
	<main class="flex-shrink-0">
		<div class="container">

			<div
				class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none':'' }"
				role="alert">
				${errorMessage}
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<div class="alert alert-danger alert-dismissible fade show d-none"
				role="alert">
				Esempio di operazione fallita!
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<div class="alert alert-info alert-dismissible fade show d-none"
				role="alert">
				Aggiungere d-none nelle class per non far apparire
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>

			<div class='card'>
				<div class='card-header'>
					<h5>Visualizza dettaglio</h5>
				</div>


				<div class='card-body'>
					<dl class="row">
						<dt class="col-sm-3 text-right">Id:</dt>
						<dd class="col-sm-9">${delete_regista_attr.id}</dd>
					</dl>

					<dl class="row">
						<dt class="col-sm-3 text-right">Nome:</dt>
						<dd class="col-sm-9">${delete_regista_attr.nome}</dd>
					</dl>

					<dl class="row">
						<dt class="col-sm-3 text-right">Cognome:</dt>
						<dd class="col-sm-9">${delete_regista_attr.cognome}</dd>
					</dl>

					<dl class="row">
						<dt class="col-sm-3 text-right">Nickname:</dt>
						<dd class="col-sm-9">${delete_regista_attr.nickName}</dd>
					</dl>
					<dl class="row">
						<dt class="col-sm-3 text-right">Sesso:</dt>
						<dd class="col-sm-9">${delete_regista_attr.sesso}</dd>
					</dl>
					<dl class="row">
						<dt class="col-sm-3 text-right">Data Nascita:</dt>
						<dd class="col-sm-9">
							<fmt:parseDate value="${delete_regista_attr.dataDiNascita}"
								pattern="yyyy-MM-dd" var="localDateToBeParsed" type="date" />
							<fmt:formatDate pattern="dd/MM/yyyy"
								value="${localDateToBeParsed}" />
						</dd>
					</dl>



					<!-- info Films -->
					<p>
						<a class="btn btn-primary btn-sm" data-bs-toggle="collapse"
							href="#collapseExample" role="button" aria-expanded="false"
							aria-controls="collapseExample"> Film Diretti </a>
					</p>
					<div class="collapse" id="collapseExample">
						<div class="card card-body">
							<c:forEach items="${delete_regista_attr.films}" var="filmItem">
								<dl class="row">
									<dt class="col-sm-3 text-right">Titolo:</dt>
									<dd class="col-sm-9">${filmItem.titolo}</dd>
								</dl>
								<dl class="row">
									<dt class="col-sm-3 text-right">Genere:</dt>
									<dd class="col-sm-9">${filmItem.genere}</dd>
								</dl>
								<dl class="row">
									<dt class="col-sm-3 text-right">Data Pubblicazione:</dt>
									<dd class="col-sm-9">
										<fmt:parseDate value="${filmItem.dataPubblicazione}"
											pattern="yyyy-MM-dd" var="localDateToBeParsed" type="date" />
										<fmt:formatDate pattern="dd/MM/yyyy"
											value="${localDateToBeParsed}" />
									</dd>
								</dl>
								<dl class="row">
									<dt class="col-sm-3 text-right">Durata (min.):</dt>
									<dd class="col-sm-9">${filmItem.minutiDurata}</dd>
								</dl>
							</c:forEach>
						</div>
						<!-- end info Regista -->
					</div>

					<!-- end card body -->
				</div>

				<div class='card-footer'>
					<form
						action="${pageContext.request.contextPath}/admin/ExecuteDeleteRegistaServlet"
						method="post">
						<input type="hidden" name="idRegista"
							value="${delete_regista_attr.id}">
						<button type="submit" name="submit" id="submit"
							class="btn btn-danger">Conferma</button>
						<a
							href="${pageContext.request.contextPath}/ExecuteListRegistaServlet"
							class='btn btn-outline-secondary' style='width: 80px'> <i
							class='fa fa-chevron-left'></i> Back
						</a>
					</form>
				</div>
				<!-- end card -->
			</div>


			<!-- end container -->
		</div>

	</main>

	<!-- Footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>