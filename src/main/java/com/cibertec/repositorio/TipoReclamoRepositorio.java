package com.cibertec.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cibertec.entidad.Proveedor;
import com.cibertec.entidad.TipoReclamo;

public interface TipoReclamoRepositorio extends JpaRepository<TipoReclamo, Integer>{

	

}
