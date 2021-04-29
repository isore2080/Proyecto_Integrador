package com.cibertec.controller;

import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Cliente;
import com.cibertec.servicio.ClienteService;

@Controller
public class ClienteController {
	
	@Autowired
	private ClienteService servicio;
	
	@ResponseBody
	@RequestMapping("/registroCliente")
	public HashMap<String, Object> registrar(Cliente obj){
		HashMap<String, Object> salida = new HashMap<>();
		obj.setFechaRegistro(new Date());
		Cliente objSalida =	 servicio.insertaCliente(obj);
		if (objSalida == null) {
			salida.put("MENSAJE", "Registro erróneo");
		}else {
			salida.put("MENSAJE", "Registro exitoso");
		}
		return salida; 
	

	}
}

