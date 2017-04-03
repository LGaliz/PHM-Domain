package ar.edu.singleton

import ar.edu.POIs.Banco
import ar.edu.POIs.Cgp
import ar.edu.POIs.Colectivo
import ar.edu.POIs.Comuna
import ar.edu.POIs.Direccion
import ar.edu.POIs.HorarioDeAtencion
import ar.edu.POIs.LocalComercial
import ar.edu.POIs.Poi
import ar.edu.POIs.Rubro
import ar.edu.POIs.Servicio
import ar.edu.calificaciones.Calificacion
import ar.edu.calificaciones.Review
import ar.edu.usuario.Usuario
import java.util.List
import org.hibernate.Criteria
import org.hibernate.HibernateException
import org.hibernate.SessionFactory
import org.hibernate.cfg.Configuration
import org.uqbar.geodds.Point
import org.uqbar.geodds.Polygon

abstract class RepoDefault<T> {

	/** SessionFactory es un objeto que nos permite crear sesiones de usuario, que vamos a utilizar, 
	 por ejemplo, para recuperar los datos*/
	private static final SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Poi).
		addAnnotatedClass(Direccion).addAnnotatedClass(Banco).addAnnotatedClass(Colectivo).addAnnotatedClass(Cgp).
		addAnnotatedClass(LocalComercial).addAnnotatedClass(Comuna).addAnnotatedClass(HorarioDeAtencion).
		addAnnotatedClass(Rubro).addAnnotatedClass(Servicio).addAnnotatedClass(Usuario).addAnnotatedClass(Calificacion).
		addAnnotatedClass(Review).addAnnotatedClass(Point).addAnnotatedClass(Polygon).buildSessionFactory()

	def openSession() {
		sessionFactory.openSession
	}

//	def List<T> allInstances() {
//		val session = sessionFactory.openSession
//		try {
//			return session.createCriteria(getEntityType).list()
//		} finally {
//			session.close
//		}
//	}
	def List<T> allInstances() {
		val session = sessionFactory.openSession
		try {
			val result = session.createCriteria(entityType).list()
			return result
		} finally {
			session.close
		}
	}

	def List<T> searchByExample(T t) {
		val session = sessionFactory.openSession
		try {
			val criteria = session.createCriteria(getEntityType)
			this.addQueryByExample(criteria, t)
			return criteria.list()
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}

	def void createOrUpdate(T t) {
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.save(t)
//			session.saveOrUpdate(t)
			session.getTransaction.commit
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}

	def abstract Class<T> getEntityType()

	def abstract void addQueryByExample(Criteria criteria, T t)

}
