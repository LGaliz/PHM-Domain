package ar.edu.singleton

import java.util.LinkedHashMap
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.joda.time.LocalDate

@Accessors
class Reporte {
	static Reporte instance
	Map<LocalDate, Integer> cantidadDeConsultasPorFecha 
	
	private new() {
		cantidadDeConsultasPorFecha = new LinkedHashMap<LocalDate, Integer>
	}
	
	static def getInstance() {
		if (instance == null) {
			instance = new Reporte
		}
		instance
	}
	
	def void totalizarPorFecha(){
		var LocalDate now = DateTime.now.toLocalDate
		var consultas = cantidadDeConsultasPorFecha.get(now)

		if (consultas == null) {
			cantidadDeConsultasPorFecha.put(now, 1)
		} else {
			cantidadDeConsultasPorFecha.put(now, consultas+1)
		}
	}
}
