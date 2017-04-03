package ar.edu.singleton

import ar.edu.POIs.Poi
import ar.edu.usuario.Usuario
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.hibernate.Criteria
import org.hibernate.FetchMode
import org.hibernate.HibernateException
import org.hibernate.criterion.Restrictions

@Accessors
class RepositorioSingleton extends RepoDefault<Poi> /*CollectionBasedRepo<Poi>*/ {

	static RepositorioSingleton instance

	private new() {
	}

	static def getInstance() {
		if (instance == null) {
			instance = new RepositorioSingleton
		}
		instance
	}

	def List<Poi> search(String valorBuscado) {
//		getObjects().filter[o|o.matchearPoi(valorBuscado)].toList
		allInstances().filter[o|o.matchearPoi(valorBuscado)].toList
	}
	
	def List<Poi> buscadorPoisPersonales(Usuario usuario) {
		var pois = this.allInstances()//getObjects()
		pois.forEach [ poi |
			poi.setDisponibilidad()
			poi.setPoiEstaCerca(usuario.ubicacion)
			poi.setDistancia(usuario.ubicacion)
		]
		return pois
	}

	override getEntityType() {
		typeof(Poi)
	}
	
	override addQueryByExample(Criteria criteria, Poi poi) {
		if (poi.nombre != null) {
			criteria.add(Restrictions.eq("nombre", poi.nombre))
		}
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def Poi searchById(Long id) {
		val session = openSession
		try { // TODO
			session.createCriteria(Poi).setFetchMode("pois", FetchMode.JOIN).add(Restrictions.eq("id", id)).
				uniqueResult as Poi
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}
	
	def Poi searchById(int id){
		searchById(Long.valueOf(id))
	}

//	override update(Poi poi) {
//		if (poi.isNew) {
//			throw new BussinessException("El punto de interés no existe")
//		} else {
//			val id = poi.getId
//			val oldObject = searchById(id)
//			getObjects().remove(oldObject)
//			getObjects().add(poi)
//		}
//	}
//	override createExample() {
//	}
//	override protected Predicate<Poi> getCriterio(Poi example) {
//	}
	

}
