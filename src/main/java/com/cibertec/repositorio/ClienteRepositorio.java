   package com.cibertec.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cibertec.entidad.Cliente;


public interface ClienteRepositorio extends JpaRepository<Cliente, Integer>{

	@Query("select u from Cliente u group by u.nombres")
	public abstract List<Cliente> listaClientes();

}
