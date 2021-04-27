package com.cibertec.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Cliente;
import com.cibertec.entidad.Reclamo;
import com.cibertec.entidad.TipoReclamo;
import com.cibertec.servicio.ReclamoService;
import com.cibertec.servicio.ClienteService;
import com.cibertec.servicio.TipoReclamoService;
import java.util.List;
import java.util.Map;


@Controller
public class ReclamoController {
	
	@Autowired
	private ReclamoService Reclamoservicio;
	
	@Autowired
	private ClienteService Clienteservicio;
	
	@Autowired
	private TipoReclamoService TipoReclamoservicio;
	
	@ResponseBody
	@RequestMapping("/listaCliente")
	public List<Cliente> listaCliente(){
		return Clienteservicio.listaCliente();
					
	};
	@ResponseBody
	@RequestMapping("/listaTipoReclamo")
	public List<TipoReclamo> listaTipoReclamo(){
		return TipoReclamoservicio.listaTipoReclamo();
					
	};
	
	@ResponseBody
	@RequestMapping("/registraReclamo")
	public Map<String, Object> insertaReclamo(Reclamo obj){
		Map<String, Object> salida = new HashMap<>();
		
		Reclamo objSalida = Reclamoservicio.insertaReclamo(obj);
		if (objSalida == null) {
			salida.put("MENSAJE", "Registro erróneo");
		}else {
			salida.put("MENSAJE", "Registro exitoso");
		}
		return salida;
					
	};
	

}
