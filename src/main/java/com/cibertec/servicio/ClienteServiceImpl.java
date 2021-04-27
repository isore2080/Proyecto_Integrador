package com.cibertec.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Cliente;

import com.cibertec.repositorio.ClienteRepositorio;

@Service
public class ClienteServiceImpl implements ClienteService {
	
   @Autowired	
   private ClienteRepositorio repositorio;

	@Override
	public List<Cliente> listaCliente() {
		// TODO Auto-generated method stub
		return repositorio.findAll();
	}

}
