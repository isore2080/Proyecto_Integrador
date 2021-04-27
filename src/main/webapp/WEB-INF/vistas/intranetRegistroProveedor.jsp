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

<form id="id_form"> 

			<div class="form-group">
				<label class="control-label" for="id_razonsocial">Razon Social</label>
				<input class="form-control" type="text" id="id_razonsocial" name="razonsocial" placeholder="Ingrese la razon social" maxlength="40">    
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_ruc">ruc</label>
				<input class="form-control" type="text" id="id_ruc" name="ruc" placeholder="Ingrese el ruc" maxlength="">    
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_direccion">direccion</label>
				<input class="form-control" type="text" id="id_direccion" name="direccion" placeholder="Ingrese el direccion" maxlength="100">    
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_telefono">telefono</label>
				<input class="form-control" type="text" id="id_telefono" name="telefono" placeholder="Ingrese el telefono" maxlength="100">    
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_celular">celular</label>
				<input class="form-control" type="text" id="id_celular" name="celular" placeholder="Ingrese el celular" maxlength="100">    
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_contacto">contacto</label>
				<input class="form-control" type="text" id="id_contacto" name="contacto" placeholder="Ingrese el contacto" maxlength="100">    
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_departamento">Departamento</label>
				<select id="id_departamento" name="" class='form-control'>
					<option value=" ">[Seleccione Departamento]</option>    
				</select>
		    </div>
		    
		   	<div class="form-group">
				<label class="control-label" for="id_provincia">Provincia</label>
				<select id="id_provincia" name="" class='form-control'>
					<option value=" ">[Seleccione Provincia]</option>    
				</select>
		    </div>
		    
		   <div class="form-group">
				<label class="control-label" for="id_distrito">Distrito</label>
				<select id="id_distrito" name="" class='form-control'>
					<option value=" ">[Seleccione Distrito]</option>    
				</select>
		    </div>
			
			<div class="form-group">
				<button id="id_registrar" type="button" class="btn btn-primary" >REGISTRAR</button>
			</div>
	</form>
	
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