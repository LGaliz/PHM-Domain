package ar.edu.calificaciones

import ar.edu.usuario.Usuario
import java.util.List
import javax.persistence.CascadeType
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToMany
import javax.persistence.Table
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Entity
//@Table(name = "CALIFICACION")
@Observable
@Accessors
class Calificacion {

	@Id
	@GeneratedValue
	private Long id

	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	List<Review> listaReview = newArrayList

	def void agregarReview(Review review) {
		listaReview.add(review)
	}

	def void agregarReviews(List<Review> reviews) {
		reviews.forEach[r|agregarReview(r)]
	// listaReview.addAll(reviews)
	}

	def void eliminarReview(Review review) {
		listaReview.remove(review)

	}

	def void asignarReview(Usuario usuario, String comentario, Integer calificacion) {
		validarComentario(comentario)
		if (usuarioYaCalifico(usuario)) {
			actualizarReview(usuario, comentario, calificacion)
		} else {
			agregarReview(new Review(usuario, comentario, calificacion))
		}
	}

	def validarComentario(String comentario) {
		if (comentario.isEmpty) {
			throw new UserException("Debe ingresar un comentario")
		}
	}

	def actualizarReview(Usuario usuario, String comentario, Integer calificacion) {
		val usuarioSeleccionado = listaReview.findFirst[r|r.nombreDeUsuario.equals(usuario.cuenta)]
		listaReview.remove(usuarioSeleccionado)
		agregarReview(new Review(usuario, comentario, calificacion))
	}

	def getPromedioCalificacion() {
//		val DecimalFormat decimales = new DecimalFormat("0.0")  //muestra la calificación con un decimal
		if (this.hayReview()) {
//			decimales.format((this.sumaDeCalificaciones() as double / this.cantidadDeReview()) as double)
			this.sumaDeCalificaciones() / this.cantidadDeReview() // número entero
		} else {
			0
		}
	}

	def int sumaDeCalificaciones() {
		var int suma = 0
		var int i
		for (i = 0; i < this.cantidadDeReview(); i++) {
			suma = suma + listaReview.get(i).puntuacion
		}
		suma
	}

	def int cantidadDeReview() {
		listaReview.size
	}

	def boolean hayReview() {
		this.cantidadDeReview() > 0
	}

	def boolean usuarioYaCalifico(Usuario usuarioAVerificar) {
		listaReview.exists[r|r.usuario.equals(usuarioAVerificar)]
	}
}
