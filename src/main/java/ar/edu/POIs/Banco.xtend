package ar.edu.POIs

import java.util.List
import javax.persistence.Column
import javax.persistence.DiscriminatorValue
import javax.persistence.ElementCollection
import javax.persistence.Entity
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Entity
@Observable
@Accessors
@DiscriminatorValue("1")
class Banco extends Poi {

	@Column(length=50)
	String nombreBanco
	
	//TODO
	//@Column
    //@ElementCollection(targetClass=typeof(String))
    transient
	List<String> servicios = newArrayList

	override getNombre() {
		"Banco " + nombreBanco
	}

	new(Direccion _miDireccion, HorarioDeAtencion _horario, String _nombreBanco) {
		_direccion = _miDireccion
		horario = _horario
		nombreBanco = _nombreBanco
	}

	new() {
	}

	override matchearPoi(String valorBuscado) {
		StringUtilities.queComienceCon(valorBuscado, nombreBanco) || super.matchearPoi(valorBuscado) ||
			matchearNombrePoi(valorBuscado) // StringUtilities.match(nombreBancoMasBarrio(), valorBuscado)
	}

	def String nombreBancoMasBarrio() {
		val nombreMasBarrio = nombreBanco + " " + _direccion.getBarrio
		nombreMasBarrio
	}

	def String serviciosToString() {
		String.join("\n", servicios)
	}

}
