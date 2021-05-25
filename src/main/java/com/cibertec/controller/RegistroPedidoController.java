package com.cibertec.controller;


import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Cliente;
import com.cibertec.entidad.Pedido;
import com.cibertec.entidad.Ubigeo;
import com.cibertec.servicio.ClienteServicio;
import com.cibertec.servicio.PedidoServicio;
import com.cibertec.servicio.UbigeoServicio;




/**
 * @author 
 * 
 */

@Controller
public class RegistroPedidoController {
	
	@Autowired
	private UbigeoServicio servicioUbi1;
	
	@Autowired
	private ClienteServicio clienteServicio ;
	
	@Autowired
	private PedidoServicio pedidoServicio;
	
	@ResponseBody
	@RequestMapping("/listaCliente")
	public List<Cliente> listaCliente(){
		return clienteServicio.listaCliente();
					
	};
	

	

	
	@ResponseBody
	@RequestMapping("/registraPedido")
	public Map<String, Object> registraPedido(Pedido obj){
		Map<String, Object> salida = new HashMap<>();
		
		Date fecha=new Date();
	     Timestamp ts=new Timestamp(fecha.getTime());  
	     obj.setFechaRegistro(ts);
	     obj.setFechaEntrega(ts);
		
		Pedido objSalida = pedidoServicio.registraPedido(obj);
		if (objSalida == null) {
			salida.put("MENSAJE", "Registro erróneo");
		}else {
			salida.put("MENSAJE", "Registro exitoso");
		}
		return salida;
					
	};
	

  
}
