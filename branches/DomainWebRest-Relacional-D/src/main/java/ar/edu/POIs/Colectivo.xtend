package ar.edu.POIs

import java.util.ArrayList
import java.util.List
import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.DiscriminatorValue
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.OneToMany
import javax.persistence.Transient
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.commons.utils.Observable
import org.uqbar.geodds.Point

@Entity
@Observable
@Accessors
@DiscriminatorValue("2")
class Colectivo extends Poi {
	@Column(length=20)
	String linea
	
	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	@Transient
	List<Point> recorrido = new ArrayList<Point>

	new(String _linea) {
		linea = _linea
	}

	new() {
	}

//==============================================================3
//	override setNombrePoi(){
//		"linea"
//		
//	}
	override getNombre() {
		"Linea " + linea
	}

	override getDireccion() {
		""
	}

	override getDistancia(Point gpsPosicion) {
		puntoMasCerca(recorrido, gpsPosicion).distance(gpsPosicion)
	}

	def Point puntoMasCerca(List<Point> recorrido, Point unPunto) {
		(recorrido.sortBy[parada|parada.distance(unPunto)]).get(0)

	}

//==============================================================3
	def void addParada(double x, double y) {
		recorrido.add(Point.and(x, y))
		recorrido.get(0)
	}

	override estaCerca(Point unPunto) {
		recorrido.exists[parada|cercaniaParada(unPunto, parada)]
	}

	override estaDisponible(DateTime momento) {
		true
	}

	override matchearPoi(String valorBuscado) {
		StringUtilities.queComienceCon(valorBuscado, linea) || matchearNombrePoi(valorBuscado) // StringUtilities.queComienceCon(valorBuscado,"linea")
	}

	def boolean cercaniaParada(Point unPunto, Point parada) {
		parada.distance(unPunto) < 0.1
	}

//	override validateCreate() {
//		Validacion.colectivo(this)
//	}
}
