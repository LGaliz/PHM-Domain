package ar.edu.POIs

import java.util.ArrayList
import java.util.List
import javax.persistence.CascadeType
import javax.persistence.DiscriminatorValue
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.ManyToMany
import javax.persistence.OneToOne
import javax.persistence.Transient
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.commons.utils.Observable
import org.uqbar.geodds.Point

@Entity
@Observable
@Accessors
@DiscriminatorValue("3")
class Cgp extends Poi {
	
	@OneToOne(cascade=CascadeType.ALL)//fetch=FetchType.LAZY)
	Comuna comuna
	
	@ManyToMany(/*targetEntity=typeof(Servicio),*/ cascade=CascadeType.ALL, fetch = FetchType.LAZY)/* , mappedBy="servicio"*/
	List<Servicio> servicios = new ArrayList<Servicio>

	new(Comuna _comuna, Direccion _miDireccion) {
		comuna = _comuna
		_direccion = _miDireccion
	}
	
	new() {}
	
	override getNombre(){
		comuna.numeroComuna
	}

	override estaCerca(Point unPunto) {
		comuna.getZonaComuna.isInside(unPunto) || super.estaCerca(unPunto)
	}

	override estaDisponible(DateTime momento) {
		servicios.exists[s|s.estaDisponible(momento)]
	}

	def boolean estaDisponible(DateTime momento, String valorBuscado) {
		servicios.exists[s|StringUtilities.match(s.nombre, valorBuscado) && s.estaDisponible(momento)]
	}

	override matchearPoi(String valorBuscado) {
		super.matchearPoi(valorBuscado)/*StringUtilities.match(comuna.getNumeroComuna, valorBuscado)*/ || StringUtilities.alMenosUnServicioComienzaCon(valorBuscado, servicios)|| matchearNombrePoi(valorBuscado)
	}

}
