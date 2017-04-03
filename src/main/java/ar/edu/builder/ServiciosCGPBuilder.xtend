package ar.edu.builder

import ar.edu.POIs.Servicio
import ar.edu.POIs.HorarioDeAtencion

class ServiciosCGPBuilder {

	Servicio servicio

	new() {
		servicio = new Servicio()
	}

	def Servicio build() {
		servicio
	}

	def ServiciosCGPBuilder agregarHorario(HorarioDeAtencion horario) {
		servicio.horario = horario
		this
	}

	def ServiciosCGPBuilder agregarNombreServicio(String nombreServicio) {
		servicio.nombre = nombreServicio
		this
	}
}
