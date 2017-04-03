package ar.edu.POIs

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.ManyToOne
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime

@Entity
@Accessors
class Servicio {
	@Id
	@GeneratedValue
	private Long id
	
	@Column
	String nombre //nombreServicio
	
	@ManyToOne()
	HorarioDeAtencion horario

	new(String _nombreServicio, HorarioDeAtencion _horario) {
		nombre = _nombreServicio
		horario = _horario
	}
	
	new() {	}

	def boolean estaDisponible(DateTime momento) {
		horario.estaDisponible(momento)
	}
}
