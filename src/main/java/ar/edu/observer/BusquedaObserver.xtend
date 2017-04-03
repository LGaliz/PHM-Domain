package ar.edu.observer

import ar.edu.usuario.Usuario

interface BusquedaObserver {
	def void observarBusqueda(Usuario usuario, String valorBuscado, int cantidadDeResultados, double tiempoEjecucion	)
}
