package com.cibertec.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Reclamo;
import com.cibertec.repositorio.ReclamoRepositorio;

@Service
public class ReclamoServiceImpl implements ReclamoService {

	 @Autowired	
	   private ReclamoRepositorio repositorio;
	public Reclamo insertaReclamo(Reclamo obj) {
		
		return repositorio.save(obj);
	}
	
	
		
		

}
