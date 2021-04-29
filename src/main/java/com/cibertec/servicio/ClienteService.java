package com.cibertec.servicio;

import com.cibertec.entidad.Cliente;

import java.util.List;

public interface ClienteService {
	
	public Cliente insertaCliente(Cliente obj);
	
	public abstract List<Cliente> listaCliente();

}
 