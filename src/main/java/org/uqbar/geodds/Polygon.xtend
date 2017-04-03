package org.uqbar.geodds

import java.util.ArrayList
import java.util.List
import javax.persistence.CascadeType
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.OneToMany
import javax.persistence.Transient
import org.eclipse.xtend.lib.annotations.Accessors

import static extension org.uqbar.geodds.NumberUtils.*

/**
 * Define una zona conformada por vértices (un conjunto de puntos)<br>
 * <br>
 * <b>Importante:</b> cuando se define una zona no hay que definir el vértice final igual al inicial<br>
 * <br>
 * @author DDS
 */
@Entity
@Accessors
class Polygon {

	@Transient
	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	protected List<Point> surface

	/**
	 * Constructor default, obliga luego a agregar los puntos manualmente mediante el mensaje add(Point point). <br><br>
	 * Para trabajar con un polígono inmutable, no debe usarse este constructor ni el add posterior.<br>
	 */
	new() {
		surface = new ArrayList<Point>
	}

	def add(Point point) {
		surface.add(point)
	}

	/**
	 * Constructor que le pasa un conjunto de puntos que definen el polígono
	 */
	new(List<Point> points) {
		surface = points
	}

	/**
	 * Convierte un punto a un polígono conformado inicialmente por este punto. <br>
	 * No compatible con la idea de un polígono inmutable.<br>
	 */
	static def asPolygon(Point point) {
		new Polygon(#[point] as List<Point>)
	}

	/**
	 * Determina si un punto está dentro de un polígono
	 * Para la explicación véase http://erich.realtimerendering.com/ptinpoly/
	 * @Deprecated Usar isInside
	 */
	def isInsideOld(Point point) {
		var counter = 0
		var point1 = surface.get(0)
		val N = surface.size
		for (var i = 1; i <= N; i++) {
			var point2 = surface.get(i % N)
			if (point.intersects(point1, point2)) {
				counter++
			}
			point1 = point2
		}
		counter.even
	}

	/**
	 * Función mejorada para determinar si un punto está en el polígono
	 */
	def isInside(Point point) {
		val N = surface.size
		var j = N - 1
		var oddNodes = false
		var x = point.longitude
		var y = point.latitude

		for (var i = 0; i < N; i++) {
			val verticeIY = surface.get(i).latitude
			val verticeIX = surface.get(i).longitude
			val verticeJY = surface.get(j).latitude
			val verticeJX = surface.get(j).longitude
			if ((verticeIY < y && verticeJY >= y || verticeJY < y && verticeIY >= y) &&
				(verticeIX <= x || verticeJX <= x)) {
				if (verticeIX + (y - verticeIY) / (verticeJY - verticeIY) * (verticeJX - verticeIX) < x) {
					oddNodes = !oddNodes
				}
			}
			j = i
		}
		oddNodes
	}

	/**
	 * Indica si un punto es alguno de los vértices del polígono
	 */
	def pointOnVertex(Point point) {
		surface.contains(point)
	}

}
