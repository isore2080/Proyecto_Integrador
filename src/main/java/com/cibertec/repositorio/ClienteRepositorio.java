   package com.cibertec.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cibertec.entidad.Cliente;

public interface ClienteRepositorio extends JpaRepository<Cliente, Integer>{

	

}
