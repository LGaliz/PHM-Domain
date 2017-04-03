package ar.edu.POIs

import ar.org.excepciones.BussinessException

class Validacion {
	
	def static general(Poi poi) {
		if (poi._direccion.ubicacion.equals(null)) {
			throw new BussinessException("No tiene direccion asignada.")
		}
	}
	
	def static colectivo(Colectivo colectivo){
		if (colectivo.linea.equals(null)){
			throw new BussinessException("No pertenece a una Linea de colectivo.")
		}
	}
	
}