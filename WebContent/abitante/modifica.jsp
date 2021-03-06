<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>

function validateForm() {
	form = document.forms["modificaAbitanteForm"];
	nome = form[nomeInputId];
	cognome = form[cognomeInputId];
	eta = form[etaInputId];
	codiceInput = form[codiceInput];
	
	  for(i = 1; i < document.forms["modificaAbitanteForm"].length -1; i++){
		  campo = document.forms["modificaAbitanteForm"][i].value;
		  if(campo == ""){
			  alert("errore form javascript: un campo e' vuoto");
			  return false;
		  }
	  }
	}

//onload event

function checkform(){
	//controlla tutti i campi
	validInput = true;
	
	for(i = 1; i < document.forms["modificaAbitanteForm"].length -1; i++){
		  var campo = document.forms["modificaAbitanteForm"][i];
		  //if(campo.value == ""){
			if(isBlank(campo.value)){
			  campo.style.borderColor="#FF0000";
			  campo.innerHTML ="prova";
			  
			  modificaButton = document.getElementById('aggiornaButtonId');
			  modificaButton.disabled = true;
			  
			  validInput = false;
			  
		  }
		  else{
			  campo.style.borderColor="#ced4da";
		  }
	  }
	//abilita il bottone se tutti i campi non sono vuoti
	if(validInput){
	document.getElementById('aggiornaButtonId').disabled = false;
	}
}

function isBlank(str){
	return str.match(/^\s*$/);
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ABITANTE</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/jqueryUI/jquery-ui.min.css" />
<style>
.ui-autocomplete-loading {
	background: white url("../img/anim_16x16.gif") right center no-repeat;
}
</style>
</head>
<body>

	<div class="container">

		<%@ include file="../header.jsp"%>

		<div class="page-header">
			<h3>AGGIORNA ABITANTE:</h3>
		</div>

		<div
			class="alert alert-danger ${not empty abitanteErrors?'':'d-none' }"
			role="alert">
			<c:forEach var="errorItem" items="${abitanteErrors }">
				<ul>
					<li>${errorItem }</li>
				</ul>
			</c:forEach>
		</div>
		<div
			class="alert alert-danger ${not empty municipioErrors?'':'d-none' }"
			role="alert">
			<c:forEach var="errorItem" items="${municipioErrors}">
				<ul>
					<li>${errorItem }</li>
				</ul>
			</c:forEach>
		</div>

		<form name="modificaAbitanteForm" class="form-horizontal"
			onsubmit="return validateForm()"
			action="ExecuteModificaAbitanteServlet" method="post">
			<input class="form-control" type="hidden" id="idAbitanteId"
				name="idAbitante" value="<c:out value="${abitanteAttr.id}"/>">
			<div class="form-group">
				<label class="control-label col-sm-2" for="nomeInputId">Nome:</label>
				<div class="col-sm-4">
					<input class="form-control" type="text" id="nomeInputId"
						name="nomeInput" onkeyup="return checkform()"
						value="<c:out value="${abitanteAttr.nome}"/>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="cognomeInputId">Cognome:</label>
				<div class="col-sm-4">
					<input onKeyup="return checkform()" class="form-control"
						type="text" id="cognomeInputId" name="cognomeInput"
						value="<c:out value="${abitanteAttr.cognome}"/>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="etaInputId">Et�:</label>
				<div class="col-sm-4">
					<input onKeyup="return checkform()" class="form-control"
						type="text" id="etaInputId" name="etaInput"
						value="<c:out value="${abitanteAttr.eta}"/>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="residenzaInputId">Residenza:</label>
				<div class="col-sm-4">
					<input onKeyup="return checkform()" class="form-control"
						type="text" id="residenzaInputId" name="residenzaInput"
						value="${abitanteAttr.residenza}">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="idMunicipioId">Codice
					Municipio:</label>
				<div class="col-sm-4">
					<input onKeyup="return checkform()" class="form-control"
						list="municipi" name="codiceInput"
						value="${abitanteAttr.municipio.codice}">
					<datalist id="municipi"> <c:forEach var="municipio"
						items="${listaMunicipiAttr}">
						<c:if test="${municipio.id == abitanteAttr.municipio.id }">
							<option class="form-control" value="${municipio.codice}">${municipio.descrizione}
								(municipio attuale)</option>
						</c:if>
						<c:if test="${municipio.id != abitanteAttr.municipio.id }">
							<option class="form-control" value="${municipio.codice}">${municipio.descrizione}
								(municipio registrato)</option>
						</c:if>
					</c:forEach> </datalist>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button id="aggiornaButtonId" type="submit"
						class="btn btn-primary btn-md">Aggiorna</button>

					<span onclick="window.history.back()" class="btn btn-info">Torna
						Indietro</span>
				</div>
			</div>
		</form>

	</div>
	<!-- /.container -->

</body>
</html>