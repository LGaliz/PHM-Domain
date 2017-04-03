package ar.edu.builder

import ar.edu.POIs.Direccion
import ar.edu.POIs.HorarioDeAtencion
import ar.edu.POIs.LocalComercial
import ar.edu.POIs.Rubro
import ar.edu.calificaciones.Review
import java.util.List

class LocalComercialBuilder {

	LocalComercial local

	new() {
		local = new LocalComercial()
	}

	def LocalComercial build() {
		local
	}

	def LocalComercialBuilder agregarDireccion(Direccion direccion) {
		local._direccion = direccion
		this
	}

	def LocalComercialBuilder agregarNombre(String nombre) {
		local.nombre = nombre
		this
	}

	def LocalComercialBuilder agregarRubro(Rubro rubro) {
		local.rubro = rubro
		this
	}

	def LocalComercialBuilder agregarHorario(HorarioDeAtencion horario) {
		local.horario = horario
		this
	}

	def LocalComercialBuilder agregarPalabrasClave(List<String> palabrasClave) {
		local.palabrasClave.addAll(palabrasClave)
		this
	}
	
	def LocalComercialBuilder agregarOpinion(Review opinion){
		local.calificacion.agregarReview(opinion)
		this
	}
	
	def LocalComercialBuilder agregarOpiniones(List<Review> opiniones){
		local.calificacion.agregarReviews(opiniones)
		this
	}
}
