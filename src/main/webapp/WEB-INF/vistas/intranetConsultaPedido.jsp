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
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 5%"><h4>Crud Pedido</h4></div>

<div class="container" style="margin-top: 1%">
 <div class="container">	
		 <div class="col-md-23" >  

				   <div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_txt_filtro"  name="filtro" placeholder="Ingrese el Estado" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="button" class="btn btn-primary" id="id_btn_filtrar" style="width: 150px">FILTRA</button>
						</div>
						
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						<h4> 1(ACTIVO) Y 0(INACTIVO)</h4>
									<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th style="width: 5%" >ID</th>
												<th style="width: 15%">Fecha de Registro</th>
												
												<th style="width: 25%">Fecha de Entrega</th>
												<th style="width: 15%">Lugar de Entrega</th>
												<th style="width: 10%">Estado</th>
												<th style="width: 10%">Cliente</th>
												<th style="width: 10%">Ubigeo</th>
												
											</tr>
										</thead>
											<tbody>
											</tbody>
										</table>
								</div>	
						</div>
					</div>
		  </div>
  

<script type="text/javascript">
$.getJSON("listaCliente", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_cliente").append("<option value="+item.idCliente +">"+ item.nombres +"</option>");
		$("#id_act_cliente").append("<option value="+item.idCliente +">"+ item.nombres +"</option>");
	});
});

$.getJSON("listaTipoPedido", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_tipoPedido").append("<option value="+item.idTipoPedido +">"+ item.descripcion +"</option>");
		$("#id_act_tipoPedido").append("<option value="+item.idTipoPedido +">"+ item.descripcion +"</option>");
	});
});


$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val();
	$.getJSON("consultaCrudPedido",{"filtro":fil}, function (lista){
		agregarGrilla(lista);
	});
});

function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			searching: false,
			ordering: true,
			processing: true,
			pageLength: 5,
			lengthChange: false,
			columns:[
				{data: "idPedido"},
				{data: "fechaRegistro"},

				{data: "fechaEntrega"},
				{data: "lugarEntrega"},
				{data: "estado"},
				{data: "cliente.nombres"},
				{data: "ubigeo.idUbigeo"}											
			]                                     
	    });
}

function eliminar(id){	
	mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminar,null,id);
}

function accionEliminar(id){	
    $.ajax({
          type: "POST",
          url: "eliminaCrudPedido", 
          data: {"id":id},
          success: function(data){
        	  agregarGrilla(data.lista);
        	  mostrarMensaje(data.mensaje);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
     });
}

function editar(id,descripcion,estado, idCliente,idTipoPedido){	
	$('#id_ID').val(id);
	$('#id_act_descripcion').val(descripcion);
	
	$('#id_act_estado').val(estado);
	$('#id_act_cliente').val(idCliente);
	$('#id_act_tipoPedido').val(idTipoPedido);
	$('#id_div_modal_actualiza').modal("show");
}

function limpiarFormulario(){	
	$('#id_reg_descripcion').val('');

	$('#id_reg_estado').val('');
	$('#id_reg_cliente').val(' ');
	$('#id_reg_tipoPedido').val(' ');
}

$("#id_btn_registra").click(function(){
	var validator = $('#id_form_registra').data('bootstrapValidator');
    validator.validate();
	
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "registraCrudPedido", 
          data: $('#id_form_registra').serialize(),
          success: function(data){
        	  agregarGrilla(data.lista);
        	  $('#id_div_modal_registra').modal("hide");
        	  mostrarMensaje(data.mensaje);
        	  limpiarFormulario();
        	  validator.resetForm();
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
        });
        
    }
});

$("#id_btn_actualiza").click(function(){
	var validator = $('#id_form_actualiza').data('bootstrapValidator');
    validator.validate();
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "actualizaCrudPedido", 
          data: $('#id_form_actualiza').serialize(),
          success: function(data){
        	  agregarGrilla(data.lista);
        	  $('#id_div_modal_actualiza').modal("hide");
        	  mostrarMensaje(data.mensaje);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
        });
    }
});



</script>

<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"descripcion": {
        		selector : '#id_reg_descripcion',
                validators: {
                    notEmpty: {
                        message: 'El descripcion es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El descripcion es de 5 a 30 caracteres',
                    	min : 5,
                    	max : 30
                    }
                }
            },
            "serie": {
        		selector : '#id_reg_serie',
                validators: {
                    notEmpty: {
                        message: 'El c�digo de serie es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El c�digo debe contener 10 caracteres',              	
                    	min : 10
                    }
                }
            },
            "fechaRegistro": {
        		selector : '#id_reg_fechaRegistro',
                validators: {
                	notEmpty: {
                        message: 'El fechaRegistro es un campo obligatorio'
                	},
                    lessThan: {
		                value: 99999,
		                inclusive: true,
		                message: 'Ingresar solo n�meros m�ximo 5 cifras'
		                	  }         
                       }          
                  },
            "estado": {
        		selector : '#id_reg_estado',
                validators: {
                	notEmpty: {
                        message: 'El estado es un campo obligatorio'
                    },
                    lessThan: {
		                value: 9999,
		                inclusive: true,
		                message: 'Ingresar solo n�meros m�ximo 4 cifras'
		                	  }         
                       }          
                  },
            "cliente.idcliente": {
        		selector : '#id_reg_cliente',
                validators: {
                	notEmpty: {
                        message: 'La cliente es un campo obligatorio'
                    },
                }
            },
            "tipoPedido.idtipoPedido": {
        		selector : '#id_reg_tipoPedido',
                validators: {
                	notEmpty: {
                        message: 'El pa�s es un campo obligatorio'
                    },
                }
            },     	
        }   
    });
</script>

<script type="text/javascript">
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"descripcion": {
        		selector : '#id_act_descripcion',
                validators: {
                    notEmpty: {
                        message: 'El descripcion es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El descripcion es de 5 a 30 caracteres',
                    	min : 5,
                    	max : 30
                    }
                }
            },
            "serie": {
        		selector : '#id_act_serie',
                validators: {
                    notEmpty: {
                        message: 'El c�digo de serie es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El c�digo debe contener 10 caracteres',              	
                    	min : 10
                    }
                }
            },
            "fechaRegistro": {
        		selector : '#id_act_fechaRegistro',
                validators: {
                	notEmpty: {
                        message: 'El fechaRegistro es un campo obligatorio'
                    },
                    lessThan: {
		                value: 99999,
		                inclusive: true,
		                message: 'Ingresar solo n�meros m�ximo 5 cifras'
		                	  }         
                       }          
                  },
            "estado": {
        		selector : '#id_act_estado',
                validators: {
                	notEmpty: {
                        message: 'El estado es un campo obligatorio'
                    },
                    lessThan: {
		                value: 9999,
		                inclusive: true,
		                message: 'Ingresar solo n�meros m�ximo 4 cifras'
		                	  }         
                       }          
                  },
            "cliente.idcliente": {
        		selector : '#id_act_cliente',
                validators: {
                	notEmpty: {
                        message: 'La cliente es un campo obligatorio'
                    },
                }
            },
            "tipoPedido.idtipoPedido": {
        		selector : '#id_act_tipoPedido',
                validators: {
                	notEmpty: {
                        message: 'El pa�s es un campo obligatorio'
                    },
                }
            },
        }   
    });
</script>		
</body>
</html>