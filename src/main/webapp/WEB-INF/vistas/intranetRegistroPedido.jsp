<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Intranet</title>
</head>
<body>
<style>
body {background:url("images/Cliente.jpg")

</style>
<jsp:include page="intranetCabecera.jsp" />
	<div class="container" style="margin-top: 5%">
	
		<h4 > Registra Pedido</h4>
	
	</div>
	<div class="container" style="margin-top: 1%">
		<c:if test="${objMensajePedido != null}">
			<div class="alert alert-success fade in" id="success-alert">
				<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>${objMensajePedido}</strong>
			</div>
		</c:if>
		<c:remove var="objMensajePedido" />
		<form id="id_form" action="registraPedido"
			accept-charset="UTF-8">
			<div class="row">
				
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label" for="lugarEntrega">lugarEntrega </label> <input
							class="form-control" type="text" id="id_lugarEntrega" name="lugarEntrega"
							placeholder="Ingrese el lugarEntrega" maxlength="100"
							>
					</div>
				</div>
			</div>
			
			
				<div class="row">
				</div>
					<div class="form-group col-md-3">
					<label class="control-label" for="id_estado">Estado</label>
					<select id="id_estado" name="estado" class='form-control'>
						<option value=" ">[Seleccione]</option> 
						<option value="1">Activo</option> 
						<option value="0">Inactivo</option>    
					</select>
				</div>
			
			<div class="row"> 
			<div class="col-md-4">
					 <div class="form-group col-md-6">
					<label class="control-label" for="id_Cliente">Cliente</label>
					<select id="id_Cliente" name="cliente.idCliente" class='form-control'>
						<option value=" ">[ SELECCIONE CLIENTE]</option>    
					</select>
			    </div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label" for="id_departamento">Departamento
							: </label> <select id="id_departamento" class="form-control"
							onchange="buscarProvincias();">
							<option value="">[ SELECCIONAR DEPARTAMENTO ]</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label" for="id_provincia">Provincia
							: </label> <select id="id_provincia" class="form-control"
							onchange="buscarDistritos();">
							<option value="">[ SELECCIONAR PROVINCIA ]</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label" for="id_distrito">Distrito :
						</label> <select id="id_distrito" class="form-control"
							name="ubigeo.idUbigeo">
							<option value="">[ SELECCIONAR DISTRITO ]</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<button id="id_registrar" type="submit" class="btn btn-primary">Crea
							Pedido</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		$("#success-alert").fadeTo(1000, 500).slideUp(500, function() {
			$("#success-alert").slideUp(2000);
		});
	</script>

	<script type="text/javascript">
	$.getJSON("listaCliente", {}, function(data){
		$.each(data, function(index,item){
			$("#id_Cliente").append("<option value="+item.idCliente +">"+ item.nombres +"</option>");
		});
	});
	
		$.getJSON("listaDepartamentos", {}, function(data) {
			$.each(data, function(index, item) {
				$("#id_departamento").append(
						"<option value='"  + item.departamento +"'>"
								+ item.departamento + "</option>");
			});
		});

		function buscarProvincias() {
			var departamento = $("#id_departamento option:selected").val();
			$("#id_provincia option").remove();
			$("#id_provincia").append(
					"<option value=''>[ SELECCIONAR PROVINCIA ]</option>");
			$("#id_distrito option").remove();
			$("#id_distrito").append(
					"<option value=''>[ SELECCIONAR DISTRITO ]</option>");
			$.getJSON("listaProvincias", {
				'var_departamento' : departamento
			}, function(data) {
				$.each(data, function(index, item) {
					$("#id_provincia").append(
							"<option value='"+item.provincia +"'>"
									+ item.provincia + "</option>");
				});
			});
		}

		function buscarDistritos() {
			var departamento = $("#id_departamento option:selected").val();
			var provincia = $("#id_provincia option:selected").val();
			$("#id_distrito option").remove();
			$("#id_distrito").append(
					"<option value=''>[ SELECCIONAR DISTRITO ]</option>");
			$.getJSON("listaDistritos", {
				'var_provincia' : provincia,
				'var_departamento' : departamento
			}, function(data) {
				$.each(data, function(index, item) {
					$("#id_distrito").append(
							"<option value='" + item.idUbigeo + "'>"
									+ item.distrito + "</option>");
				});
			});
		}
		
		function limpiar(){
			$("#id_lugarEntrega").val('');
			$("#id_estado").val(' ');
			$("#id_Cliente").val(' ');
			$("#id_departamento").val('');
			$("#id_provincia").val('');
			$("#id_distrito").val('');
			
		}
		
		$("#id_registrar").click(function() {

			var validator = $('#id_form').data('bootstrapValidator');
			validator.validate();
			

			if (validator.isValid()) {
				
	
				$.ajax({
					type : 'POST',
					data : $("#id_form").serialize(),
					url : 'registraPedido',
					success : function(data) {
						mostrarMensaje(data.MENSAJE);
						limpiar();
						validator.resetForm();
					},
					error : function() {
						mostrarMensaje(MSG_ERROR);
					}
				});
			}

		});
	</script>

	<script type="text/javascript">
		function validaNumericos(event) {
			if (event.charCode >= 48 && event.charCode <= 57) {
				return true;
			}
			return false;
		}
	</script>

	<script type="text/javascript">
	$('#id_form')
	.bootstrapValidator(
			{
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					lugarEntrega : {
						selector : '#id_lugarEntrega',
						validators : {
							notEmpty : {
								message : 'El lugar de entrega es un campo obligatorio'
							},
						}
					},
					estado : {
						selector : '#id_estado',
						validators : {
							notEmpty : {
								message : 'El estado es un campo obligatorio'
							},
						}
					},
					cliente : {
						selector : '#id_Cliente',
						validators : {
							notEmpty : {
								message : 'El cliente es obligatorio'
							},
						}
					},
					departamento : {
						selector : '#id_departamento',
						validators : {
							notEmpty : {
								message : 'El departamento es un campo obligatorio'
							}
						}
					},
					provincia : {
						selector : '#id_provincia',
						validators : {
							notEmpty : {
								message : 'La provincia es un campo obligatorio'
							}
						}
					},
					distrito : {
						selector : '#id_distrito',
						validators : {
							notEmpty : {
								message : 'El distrito es un campo obligatorio'
							}
						}
					},
				}
			});
		
	</script>		
</body>
</html>