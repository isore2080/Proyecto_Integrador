   package com.cibertec.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cibertec.entidad.Pedido;

public interface PedidoRepositorio extends JpaRepository<Pedido, Integer>{

	@Query("Select a from Pedido a where idCliente = 9 and estado like :fil")
	public abstract List<Pedido> listaPedidoPorEstadoLike(@Param("fil") String filtro);

}
