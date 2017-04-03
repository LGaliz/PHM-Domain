package ar.edu.POIs

import ar.edu.calificaciones.Calificacion
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import java.text.DecimalFormat
import java.util.HashSet
import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.DiscriminatorColumn
import javax.persistence.DiscriminatorType
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Inheritance
import javax.persistence.InheritanceType
import javax.persistence.ManyToOne
import javax.persistence.OneToOne
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.commons.utils.Observable
import org.uqbar.geodds.Point

@Entity
@Observable
@Accessors
@JsonIgnoreProperties(ignoreUnknown = true)
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
//TODO definir delimitador?
@DiscriminatorColumn(name="tipoPoi", discriminatorType=DiscriminatorType.INTEGER)

abstract class Poi{
	
	@Id
	@GeneratedValue
	private Long id
	
	@ManyToOne(cascade=CascadeType.ALL) //TODO
	HorarioDeAtencion horario
	
	@ManyToOne/*/(targetEntity = typeof(Direccion))*/(fetch=FetchType.EAGER,cascade=CascadeType.ALL) //TODO
	Direccion _direccion
	
	//TODO
//	@Column
//    @ElementCollection(targetClass=typeof(String))
//	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	HashSet<String> palabrasClave = newHashSet
	
	@Column(length=50)
	String nombre
	
	@Column(length=150)
	String descripcion = ""
	
	@Column(length=50)
	String distancia = ""
	
	@Column
	Boolean cercania = false   //estaCerca
	// la cambié a cercania porque en js la confunde con la funcion
	
	@Column
	Boolean disponibilidad = false
	
	@OneToOne(/*fetch=FetchType.EAGER, */cascade=CascadeType.ALL) //TODO ?
	Calificacion calificacion = new Calificacion()
	
	@Column(length=50)
	String tipo = setTipoPoi

	def getNombre() { nombre }

	def getDireccion() {
		_direccion.toString()
	}

	def getDistancia(Point gpsPosicion) {
		_direccion.getDistancia(gpsPosicion)
	}

	def boolean estaCerca(Point unPunto) {
		getDistancia(unPunto) < 0.5
	}

	def boolean estaDisponible(DateTime momento) {
		horario.estaDisponible(momento)
	}

	def boolean matchearPoi(String valorBuscado) {
		StringUtilities.valorBuscadoEstaContenidoExactamenteEnPalabraClave(palabrasClave, valorBuscado)
	}

	def boolean matchearNombrePoi(String valorBuscado) {
		val nombrePoi= getNombre()
		StringUtilities.queComienceCon(valorBuscado, nombrePoi)
	}

//	override validateCreate() {
//		Validacion.general(this)
//	}
	
	def void setDisponibilidad(){
		disponibilidad = this.estaDisponible(DateTime.now)
	}
	
	def void setPoiEstaCerca(Point unPunto) { 
		/*estaCerca*/cercania = this.estaCerca(unPunto)
	}
	
	def String setTipoPoi(){
		 this.getClass().getSimpleName().toString//.toLowerCase()
	}
	
	def void setDistancia(Point unPunto){
		val DecimalFormat decimales = new DecimalFormat("0.00")  //distancia con dos decimales como string
		distancia = decimales.format(this.getDistancia(unPunto))
//		distancia = RedondeoDecimales.redondearDecimales(this.getDistancia(unPunto),2) //devuelve double
	}
	
}
