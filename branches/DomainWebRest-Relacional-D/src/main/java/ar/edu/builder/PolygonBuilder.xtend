package ar.edu.builder

import org.uqbar.geodds.Polygon
import org.uqbar.geodds.Point
import java.util.List

class PolygonBuilder {

	Polygon polygon

	new() {
		polygon = new Polygon
	}

	def Polygon build() {
		polygon
	}

	def PolygonBuilder agregarPoligono(List<Point> puntos) {
		puntos.forEach[punto|polygon.add(punto)]
		this
	}
}
