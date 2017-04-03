package ar.edu.builder

import ar.edu.POIs.RangoHorario
import org.joda.time.LocalTime

class RangoHorarioBuilder {

	RangoHorario rango

	new() {
		rango = new RangoHorario()
	}

	def RangoHorario build() {
		rango
	}

	def RangoHorarioBuilder agregarRangoHorario(LocalTime apertura, LocalTime cierre) {
		rango.setApertura(apertura)
		rango.setCierre(cierre)
		this
	}

}
