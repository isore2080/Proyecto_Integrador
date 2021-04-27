package com.cibertec.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cibertec.entidad.Proveedor;
import com.cibertec.entidad.Reclamo;

public interface ReclamoRepositorio extends JpaRepository<Reclamo, Integer>{

	

}
