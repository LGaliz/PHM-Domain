package ar.edu.testCalificacion

import ar.edu.calificaciones.Calificacion
import ar.edu.calificaciones.Review
import ar.edu.usuario.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestCalificacion {

	Calificacion calificacion
	Review opinion1
	Review opinion2
	Review opinion3
	Review opinion4
	Review opinion5
	Usuario user1
	Usuario user2
	Usuario user3
	Usuario user4
	Usuario user5
	Usuario userNoCalifica

	@Before
	def void init() {
		calificacion = new Calificacion()
		user1 = new Usuario("ArmandoEsteban", "Quito")
		user2 = new Usuario("Guillermo", "Nigote")
		user3 = new Usuario("Jaime", "Talero")
		user4 = new Usuario("Juanchi", "Cato")
		user5 = new Usuario("Susy", "Lueta")
		opinion1 = new Review(user1, "Que buen Poi pero le pongo 1", 1)
		opinion2 = new Review(user2, "No me gusto el lugar", 2)
		opinion3 = new Review(user3, "Vamos con un 3", 3)
		opinion4 = new Review(user4, "Tengo sueño", 4)
		opinion5 = new Review(user5, "POI recomendado", 5)

		userNoCalifica = new Usuario("Lueta", "Rado")

		calificacion.listaReview = newArrayList(opinion1, opinion2, opinion3, opinion4, opinion5)

	}

	@Test
	def void suma() {
		Assert.assertEquals(15, calificacion.sumaDeCalificaciones)
	}

	@Test
	def void cantidadElementos() {
		Assert.assertEquals(5, calificacion.listaReview.size)
	}

	@Test
	def void promedioCalificaciones() {
		Assert.assertEquals(3, calificacion.promedioCalificacion)   //número entero
//		Assert.assertEquals((3,5),calificacion.promedioCalificacion)  //número decimal
	}

	@Test
	def void usuarioYaCalifico() {
		Assert.assertTrue(calificacion.usuarioYaCalifico(user3))
	}

	@Test
	def void usuarioNoCalifico() {
		Assert.assertFalse(calificacion.usuarioYaCalifico(userNoCalifica))
	}
}
