package ar.edu.singleton

import java.util.Set
import ar.edu.observer.BusquedaObserver


class SetDeObservers {
	
	static SetDeObservers instance
	
	Set<BusquedaObserver> acciones = newHashSet
		
	private new() {

	}
	
	static def getInstance() {
		if (instance == null) {
			instance = new SetDeObservers
		}
		instance
	}
	def void agregarAcciones(BusquedaObserver accion) {
		acciones.add(accion)
	}
	def Set<BusquedaObserver> getObservers(){
		acciones
	}
	
}