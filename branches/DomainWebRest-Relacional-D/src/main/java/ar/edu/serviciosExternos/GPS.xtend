package ar.edu.serviciosExternos

import java.util.List
import org.uqbar.geodds.Point
import java.util.Random

class GPS {

	static GPS instance
	List<Point> listaDePuntos
		
	private new(){
		listaDePuntos = newArrayList(
			new Point(-34.578500, -58.528810), 
			new Point(-34.578510, -58.528880),
			new Point(-34.579100, -58.528108), 
			new Point(-34.580310, -58.525458), 
			new Point(-34.581767, -58.522186),
			new Point(-34.582968, -58.519643)
		)
	}
	
	static def getInstance(){
		if(instance == null){
			instance = new GPS
		} 
		instance
	}
		
	def Point getPosicion() {
		val random = new Random 
		val index = random.nextInt(listaDePuntos.size)
		listaDePuntos.get(index)
		
//		listaDePuntos.get(new Random().nextInt(listaDePuntos.size))
	}
	
	
/** **********************************************/
	def void agregarPunto(Point point){
		listaDePuntos.add(point)
	}
	
	def void eliminarPunto(Point point){
		listaDePuntos.remove(point)
	}

}
