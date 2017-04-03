package ar.edu.POIs

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Entity
@Observable
@Accessors
class Rubro {
	@Id
	@GeneratedValue
	private Long id
	@Column
	String nombre //nombreRubro
	@Column
	double cercania

	new(String _nombreRubro, double _cercania) {
		nombre = _nombreRubro
		cercania = _cercania
	}
	
	def estaCerca(Double distancia){
		distancia < cercania;
	}

}
