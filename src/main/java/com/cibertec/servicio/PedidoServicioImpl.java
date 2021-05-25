package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Pedido;
import com.cibertec.repositorio.PedidoRepositorio;

@Service
public class PedidoServicioImpl implements PedidoServicio {
	
	@Autowired
	private PedidoRepositorio repositorio;
	
	@Override
	public List<Pedido> listaPedido() {
		return repositorio.findAll();
	}

	@Override
	public Pedido registraPedido(Pedido obj) {
		
		return repositorio.save(obj);
	}

	@Override
	public Pedido insertaPedido(Pedido obj) {
		return repositorio.save(obj);
	}

	@Override
	public List<Pedido> listaPedidoPorEstadoLike(String filtro) {
		return repositorio.listaPedidoPorEstadoLike(filtro);
	}
	@Override
	public Optional<Pedido> obtienePorId(int idPedido) {
		return repositorio.findById(idPedido);
	}
}
