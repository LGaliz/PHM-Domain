package ar.edu.POIs

//import java.util.ArrayList
//import java.util.List

import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.DiscriminatorValue
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.ManyToOne
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.geodds.Point

@Entity
@Observable
@Accessors
@DiscriminatorValue("4")
class LocalComercial extends Poi {
	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL) //TODO
	Rubro rubro
	
	@Column(length=50)
	String nombre
//	List<String> palabrasClave = new ArrayList<String>

	new(Direccion _miDireccion, String _nombre, HorarioDeAtencion _horario, Rubro _rubro) {
		_direccion = _miDireccion
		rubro = _rubro
		nombre = _nombre
		horario = _horario
	}
	
	new() {	}
	
	override getNombre(){
		rubro.nombre + " " + nombre
	}

	override estaCerca(Point unPunto) {
//		_direccion.miUbicacion.distance(unPunto) < miRubro.getCercania()
		getDistancia(unPunto) < rubro.getCercania()		//para evitar repetición de código
	}

	override matchearPoi(String valorBuscado) {
		StringUtilities.queComienceCon(valorBuscado, nombre) ||
		super.matchearPoi(valorBuscado)||
//		StringUtilities.valorBuscadoEstaContenidoExactamenteEnPalabraClave(palabrasClave, valorBuscado) ||
		StringUtilities.match(rubro.getNombre, valorBuscado)|| matchearNombrePoi(valorBuscado)
		}

}
