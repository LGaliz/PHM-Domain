package ar.edu.observer

import ar.edu.usuario.Usuario
import org.apache.log4j.Logger
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class GeneradorDeLog implements BusquedaObserver {

	override observarBusqueda(Usuario usuario, String valorBuscado, int cantidadDeResultados, double tiempoEjecucion) {
		val Logger log = Logger.getLogger("Log de busqueda Observer")
		log.info("La palabra buscada fue: " + valorBuscado)
		log.info("Tiempo de ejecucion: " + tiempoEjecucion)
		log.info("Cantidad de resultados obtenidos: " + cantidadDeResultados)
	}

}
