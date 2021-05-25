package com.cibertec.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class EnlaceController {

	@RequestMapping("/")
	public String verLogin() {	return "intranetLogin";  }

	@RequestMapping("/verRegistroCliente")
	public String verRegistraCliente() {	return "intranetRegistroCliente";	}
	
	@RequestMapping("/verRegistroMarca")
	public String verRegistraMarca() {	return "intranetRegistroMarca";	}
	
	@RequestMapping("/verRegistroPedido")
	public String verRegistroPedido() {	return "intranetRegistroPedido";	}
	
	@RequestMapping("/verRegistroProducto")
	public String verRegistraProducto() {	return "intranetRegistroProducto";	}

	@RequestMapping("/verRegistroReclamo")
	public String verRegistraReclamo() {	return "intranetRegistroReclamo";	}
	
	@RequestMapping("/verRegistroSede")
	public String verRegistroSede() {	return "intranetRegistroSede";	}
	
	@RequestMapping("/verRegistroUsuario")
	public String verRegistroUsuario() {	return "intranetRegistroUsuario";	}
	
	@RequestMapping("/verRegistroTipoReclamo")
	public String verRegistroTipoReclamo() {	return "intranetRegistroTipoReclamo";	}
	
	
	@RequestMapping("/verRegistraMascota")
	public String verRegistra() {       return "registraMascota";
	}
	@RequestMapping("/verCrudPedido")
	public String listaPedido() {       return "intranetConsultaPedido";
	}
	
}
