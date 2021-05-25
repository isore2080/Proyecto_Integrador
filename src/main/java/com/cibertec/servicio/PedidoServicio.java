package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import com.cibertec.entidad.Pedido;


public interface PedidoServicio {
	
	public abstract List<Pedido> listaPedido();
	public abstract Pedido registraPedido(Pedido obj);
	public abstract Pedido insertaPedido(Pedido obj);
	public abstract Optional<Pedido> obtienePorId(int idPedido);
	public abstract List<Pedido> listaPedidoPorEstadoLike(String filtro);
}
