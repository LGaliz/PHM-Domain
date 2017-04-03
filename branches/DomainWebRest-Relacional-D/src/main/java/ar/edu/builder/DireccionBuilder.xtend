package ar.edu.builder

import ar.edu.POIs.Direccion
import org.uqbar.geodds.Point

class DireccionBuilder {

	Direccion direccion

	new() {
		direccion = new Direccion()
	}

	def Direccion build() {
		direccion
	}

	def DireccionBuilder agregarPunto(double x, double y) {
		direccion.setUbicacion(new Point(x, y))
		this
	}

	def DireccionBuilder agregarCalle(String calle) {
		direccion.setCalle(calle)
		this
	}

	def DireccionBuilder agregarEntreCalle1(String calle) {
		direccion.setEntreCalle1(calle)
		this
	}

	def DireccionBuilder agregarEntreCalle2(String calle) {
		direccion.setEntreCalle2(calle)
		this
	}
	
	def DireccionBuilder agregarNumero(int numero){
		direccion.setNumero(numero)
		this
	}

	def DireccionBuilder agregarCodigoPostal(int codigoPostal) {
		direccion.setCodigoPostal(codigoPostal)
		this
	}

	def DireccionBuilder agregarLocalidad(String localidad) {
		direccion.setLocalidad(localidad)
		this
	}

	def DireccionBuilder agregarBarrio(String barrio) {
		direccion.setBarrio(barrio)
		this
	}

	def DireccionBuilder agregarProvincia(String provincia) {
		direccion.setProvincia(provincia)
		this
	}

	def DireccionBuilder agregarPais(String pais) {
		direccion.setPais(pais)
		this
	}
}
