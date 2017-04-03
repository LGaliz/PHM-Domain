package ar.edu.observer

import ar.edu.singleton.Reporte
import ar.edu.usuario.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class MetricasDeBusqueda implements BusquedaObserver{
	
	override observarBusqueda(Usuario usuario, String valorBuscado, int cantidadDeResultados, double tiempoEjecucion) {
		Reporte.instance.totalizarPorFecha
//		usuario.cantidadDeResultadosPorConsulta.add(cantidadDeResultados)
	}

}
