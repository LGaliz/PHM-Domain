package ar.edu.usuario

import ar.edu.POIs.Poi
import ar.edu.observer.BusquedaObserver
import ar.edu.serviciosExternos.GPS
import ar.edu.singleton.RepositorioSingleton
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import java.util.List
import java.util.Set
import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.ElementCollection
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToOne
import javax.persistence.Transient
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point

@Entity
@Accessors
@JsonIgnoreProperties(ignoreUnknown=true)
class Usuario {
//	Set<BusquedaObserver> observers = newHashSet
//	List<Integer> cantidadDeResultadosPorConsulta = newArrayList

	@Id
	@GeneratedValue
	private Long id
//	Integer id

	@Column(length=50)
	String mail
	@Column(length=50)
	String cuenta
	@Column(length=50)
	String password

	// TODO
	@Column
    @ElementCollection(targetClass=typeof(String))
	List<String> listaFavoritos = newArrayList

//	@Column //TODO
	@Transient
	@OneToOne(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	Point ubicacion

	new() {
	}

	new( /*Integer*/ Long _id) {
		id = _id
	}

	new(String _cuenta, String _password) {
		this.cuenta = _cuenta
		this.password = _password
		getPosicionActual()
	}

	/** para web **/
	new(String _cuenta, String _password, Integer _id) {
		this.cuenta = _cuenta
		this.password = _password
		this.id = id
		getPosicionActual()
	}

	def void actualizarListaFavoritos( /*int*/ Long poiID) {
		val id = poiID.toString()
		if (listaFavoritos.contains(id)) {
			eliminarPoiFavorito(id)
		} else {
			agregarPoiFavorito(id)
		}
	}

	def eliminarPoiFavorito(String id) {
		listaFavoritos.remove(id)
	}

	def agregarPoiFavorito(String id) {
		listaFavoritos.add(id)
	}

	/**Login */
	def boolean verificarCuenta(String cuenta, String password) {
		this.cuenta == cuenta && this.password == password
	}

	def Poi searchPoiFavoritoById( /*int*/ Long id) {
		RepositorioSingleton.instance.searchById(id)
	}

	def Point getPosicionActual() {
		ubicacion = GPS.instance.getPosicion()
	}

	/** fin de para web. **/
	/* Cosas que no usamos en web */
	/** Command */
//	def search(String valorBuscado) {
//		val double start = System.nanoTime()
//		val busqueda = RepositorioSingleton.instance.search(valorBuscado)
//		val double tiempoEjecucion = (System.nanoTime() - start) * (Math.pow(10, -9))
//		observers.forEach[o|o.observarBusqueda(this, valorBuscado, busqueda.size, tiempoEjecucion)]
//		busqueda
//	}

}
