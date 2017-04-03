package ar.edu.POIs

import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToOne
import javax.persistence.Transient
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.geodds.Point

@Observable
@Accessors
@Entity
class Direccion {
	
	@Id
	@GeneratedValue
	private Long id

	@Transient
	@OneToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	Point ubicacion
	@Column
	String calle // calle principal
	String entreCalle1
	String entreCalle2
	@Column
	int numero
// datos especificos:
// int piso
// int departamento
// String unidad
	int codigoPostal
	String localidad
	@Column
	String barrio
	String provincia
	String pais

	new(Point _ubicacion, String _calle, String _entreCalle1, String _entreCalle2, int _numero, int _codigoPostal,
		String _localidad, String _barrio, String _provincia, String _pais) {

		ubicacion = _ubicacion
		calle = _calle
		entreCalle1 = _entreCalle1
		entreCalle2 = _entreCalle2
		numero = _numero
		codigoPostal = _codigoPostal
		localidad = _localidad
		barrio = _barrio
		provincia = _provincia
		pais = _pais
	}
	
	new(Point _ubicacion, String _calle, int _numero, String _barrio) {
		ubicacion = _ubicacion
		calle = _calle
		numero = _numero
		barrio = _barrio
	}

	new() {	}

	override String toString() {
		calle + " " + numero + ", " + barrio; 
	}

	def getDistancia(Point unPunto) {
		ubicacion.distance(unPunto);
	}
}
