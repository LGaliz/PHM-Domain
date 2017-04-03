package org.uqbar.geodds

import java.math.BigDecimal
import javax.persistence.Column
import javax.persistence.Entity
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

import static org.uqbar.geodds.NumberUtils.*

/**
 * Representa un punto dentro de unas coordenadas
 * <br>
 * 
 * @author DDS
 */

@Observable
@Accessors
@Entity
class Point {
//	@Id
//	@GeneratedValue
//	private Long id

	@Column
	BigDecimal x
	@Column
	BigDecimal y
	
	/**
	 * Constructor default para que lo pueda usar algun
	 * framework
	 */
	private new() {}

	/**
	 * Constructor para valores enteros
	 */
	new(int aX, int aY) {
		x = new BigDecimal(aX)
		y = new BigDecimal(aY)
	}

	/**
	 * Constructor para valores double
	 */
	new(double aX, double aY) {
		x = new BigDecimal(aX)
		y = new BigDecimal(aY)
	}

	/**
	 * Builder que permite llamarse como extension method estático, de la forma<br> 
	 * <ul>
	 * <li>2.and(8)<br>
	 * </ul>
	 * y construye de esa manera un punto<br><br>
	 * 
 	 */
	static def and(double aX, double aY) {
		new Point(aX, aY)
	}
	
	/**
	 * Indica la latitud del punto (su abscisa)
	 */
	def latitude() {
		this.getX()
	}

	/**
	 * Indica la longitud del punto (su ordenada)
	 */
	def longitude() {
		this.getY()
	}

	/** 
	 * Distancia en kilómetros con respecto a otro punto
	 *  
	 * @author Internet
	 *  
	 **/
	def distance(Point anotherPoint) {
		val earthRadius = 6371
		val deltaLatitude = toRadian(anotherPoint.latitude - latitude)
		val deltaLongitude = toRadian(anotherPoint.longitude - longitude)
		val a = Math.sin(deltaLatitude / 2) * Math.sin(deltaLatitude / 2) + Math.cos(toRadian(latitude)) *
			Math.cos(toRadian(anotherPoint.latitude)) * Math.sin(deltaLongitude / 2) * Math.sin(deltaLongitude / 2)
		val distanceAngular = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
		earthRadius * distanceAngular
	}

	/**
	 * Conversión de un punto a radianes en base al ángulo que describe
	 */
	def toRadian(double angle) {
		return Math.PI * angle / 180.0
	}

	/**
	 * Conversión de un punto a grados en base al ángulo que describe
	 */
	def toDegree(double angle) {
		angle * (180.0 / Math.PI)
	}

	private def xIntersection(Point p1, Point p2) {
		(this.latitude - p1.latitude) * (p2.longitude - p1.longitude) / (p2.latitude - p1.latitude) + p1.longitude
	}

	/**
	 * Indica si un punto está en el medio de dos puntos 
 	*/
	def intersects(Point point, Point point2) {
		if (point.latitude > min(this.latitude, point2.latitude)) {
			if (point.latitude <= max(this.latitude, point2.latitude)) {
				if (point.longitude <= max(this.longitude, point2.longitude)) {
					if (this.latitude != point2.latitude) {
						val intersection = point.xIntersection(this, point2)
						if (this.longitude == point2.longitude || point.longitude <= intersection)
							return true
					}
				}
			}
		}
		return false
	}

	/**
	 * Representación de un punto como un String
	 */
	override toString() {
		"x: " + x + ", y: " + y
	}
	
	
	/**
	 * Public accessors para que los puedan usar algun
	 * framework
	 */
	 
	def getX() {
		x.doubleValue
	}

	def void setX(double aX) {
		x = new BigDecimal(aX)
	}
	
	def getY() {
		y.doubleValue
	}

	def void setY(double aY) {
		y = new BigDecimal(aY)
	}
}