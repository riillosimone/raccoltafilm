<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!doctype html>
<html lang="it" class="h-100">
<head>

<!-- Common imports in pages -->
<jsp:include page="../header.jsp" />




<title>Inserisci Nuovo Elemento</title>
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
					<h5>Inserisci nuovo elemento</h5>
				</div>
				<div class='card-body'>

					<h6 class="card-title">
						I campi con <span class="text-danger">*</span> sono obbligatori
					</h6>


					<form method="post"
						action="${pageContext.request.contextPath}/admin/ExecuteInsertUtenteServlet"
						class="row g-3" novalidate="novalidate">


						<div class="col-md-6">
							<label for="nome" class="form-label">Nome <span
								class="text-danger">*</span></label> <input type="text" name="nome"
								id="nome" class="form-control" placeholder="Inserire il nome"
								value="${insert_utente_attr.nome }" required>
							<div class="invalid-feedback">Campo obbligatorio</div>
						</div>

						<div class="col-md-6">
							<label for="cognome" class="form-label">Cognome <span
								class="text-danger">*</span></label> <input type="text" name="cognome"
								id="cognome" class="form-control"
								placeholder="Inserire il cognome"
								value="${insert_utente_attr.cognome }" required>
							<div class="invalid-feedback">Campo obbligatorio</div>
						</div>

						<div class="col-md-6">
							<label for="username" class="form-label">Username <span
								class="text-danger">*</span></label> <input type="text"
								class="form-control" name="username" id="username"
								placeholder="Inserire username"
								value="${insert_utente_attr.username }" required>
							<div class="invalid-feedback">Campo obbligatorio</div>
						</div>

						<div class="col-md-6">
							<label for="password" class="form-label">Password <span
								class="text-danger">*</span></label> <input type="password"
								class="form-control" name="password" id="password"
								placeholder="Inserire password" value="" required>
							<div class="invalid-feedback">Campo obbligatorio</div>
						</div>

						<div class="col-md-6">
							<label for="conferma_password" class="form-label">Password
								<span class="text-danger">*</span>
							</label> <input type="password" class="form-control"
								name="conferma_password" id="conferma_password"
								placeholder="Conferma Password" value="" required>
							<div class="invalid-feedback">Campo obbligatorio</div>
						</div>

						<div class="col-md-6">
							<label for="ruoli" class="form-label">Ruoli</label>
							<c:forEach items="${ruoli_list_attr}" var="ruolo">
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										value="${ruolo.id}" name="ruolo" id="ruolo"
										<c:forEach items="${insert_utente_attr.ruoli }" var="rolesItem">
											<c:if test="${rolesItem != null and rolesItem.id == ruolo.id}">
													      checked
											</c:if> 
								       </c:forEach>>
									<label class="form-check-label" for="flexCheckDefault">${ruolo.descrizione}</label>
								</div>
							</c:forEach>
						</div>





						<div class="col-12">
							<button type="submit" name="insertSubmit" value="insertSubmit"
								id="insertSubmit" class="btn btn-primary">Conferma</button>
						</div>

					</form>



					<!-- end card-body -->
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