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
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 5%"><h4>Registro Proveedor</h4></div>

<div class="container" style="margin-top: 1%">
<!-- Agregar aquí -->
	
</div>

<script type="text/javascript">
$("#id_registrar").click(function (){ 

	var validator = $('#id_form').data('bootstrapValidator');
	validator.validate();

	if (validator.isValid()){
		$.ajax({
			type: 'POST',  
			data: $("#id_form").serialize(),
			url: 'registroProveedor',
			success: function(data){
				mostrarMensaje(data.MENSAJE);
				limpiar();
				validator.resetForm();
			},
			error: function(){
				mostrarMensaje(MSG_ERROR);
			}
		});
	}
	
});

$.getJSON("listaDepartamentos",{}, function(data){
	$.each(data, function(i, item){
		$("#id_departamento").append("<option value='"+ item +"'>"+ item+"</option>");
	});
});

$("#id_departamento").change(function(){
	var var_dep = $("#id_departamento").val();

	$("#id_provincia").empty();
	$("#id_provincia").append("<option value=' '>[Seleccione Provincia]</option>");

	$("#id_distrito").empty();
	$("#id_distrito").append("<option value=' '>[Seleccione Distrito]</option>");
	
	$.getJSON("listaProvincias",{"departamento":var_dep}, function(data){
		$.each(data, function(i, item){
			$("#id_provincia").append("<option value='"+ item +"'>"+ item+"</option>");
		});
	});
});

$("#id_provincia").change(function(){
	var var_dep = $("#id_departamento").val();
	var var_pro = $("#id_provincia").val();

	$("#id_distrito").empty();
	$("#id_distrito").append("<option value=' '>[Seleccione Distrito]</option>");
	
	$.getJSON("listaDistritos",{"departamento":var_dep,"provincia":var_pro}, function(data){
		$.each(data, function(i, item){
			$("#id_distrito").append("<option value='"+ item.idUbigeo +"'>"+ item.distrito+"</option>");
		});
	});
});


</script>   		
</body>
</html>