package com.cibertec.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cibertec.entidad.Pedido;
import com.cibertec.servicio.PedidoServicio;



@Controller
public class ConsultaPedidoController {

	@Autowired
	private PedidoServicio PedidoServicio;
	
	@ResponseBody
	@RequestMapping("/consultaCrudPedido")
	public List<Pedido> listaPedido(String filtro){
		return PedidoServicio.listaPedidoPorEstadoLike("%" + filtro + "%");
	}
	

}
