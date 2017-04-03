package ar.edu.builder

import ar.edu.POIs.HorarioDeAtencion

class HorarioDeAtencionBuilder {

	HorarioDeAtencion horarioDeAtencion

	new() {
		horarioDeAtencion = new HorarioDeAtencion()
	}

	def HorarioDeAtencion build() {
		horarioDeAtencion
	}

//	def HorarioDeAtencionBuilder agregarHorarioDeAtencionPorDia(String dia, List<RangoHorario> rangos) {
//		horarioDeAtencion.horarioAtencion.put(dia, rangos)
//		this
//	}
//
//	def HorarioDeAtencionBuilder agregarRangoHorarioLunesAViernes(List<RangoHorario> rangos) {
//		horarioDeAtencion.setLunesAViernes(rangos)
//		this
//	}

	def HorarioDeAtencionBuilder agregarHoraInicio(String inicio){
		horarioDeAtencion.inicio = inicio
		this
	}
	
	def HorarioDeAtencionBuilder agregarHoraFin(String fin){
		horarioDeAtencion.fin = fin
		this
	}

}
