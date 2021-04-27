package com.cibertec.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Proveedor;
import com.cibertec.servicio.ProveedorService;

@Controller
public class ProveedorController {
	
	@Autowired
	private ProveedorService servicio;
	
	
	@ResponseBody
	@RequestMapping("/registroProveedor")
		public HashMap<String, Object> registrar(Proveedor obj){
		HashMap<String, Object> salida = new HashMap<>();
		Proveedor objSalida= servicio.insertaProveedor(obj);
		if (objSalida == null) {
			salida.put("MENSAJE", "Registro erróneo");
		}else {
			salida.put("MENSAJE", "Registro exitoso");
		}
		return salida;
	}

}
