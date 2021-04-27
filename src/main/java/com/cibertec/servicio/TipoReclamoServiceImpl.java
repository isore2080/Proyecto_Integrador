package com.cibertec.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.TipoReclamo;

import com.cibertec.repositorio.TipoReclamoRepositorio;

@Service
public class TipoReclamoServiceImpl implements TipoReclamoService {
	
   @Autowired	
   private TipoReclamoRepositorio repositorio;

	@Override
	public List<TipoReclamo> listaTipoReclamo() {
		// TODO Auto-generated method stub
		return repositorio.findAll();
	}

}
