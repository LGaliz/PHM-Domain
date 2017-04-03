package ar.edu.POIs

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.Arrays
import java.util.HashSet

@Accessors
class StringUtilities {

	def static queComienceCon(String valorBuscado, String nombre) {
		aMinuscula(nombre).startsWith(aMinuscula(valorBuscado))
	}

	def static aMinuscula(String string) {
		string.toLowerCase()
	}

	def static match(String string1, String string2) { 
		aMinuscula(string1).matches(aMinuscula(string2))
	}

	def static valorBuscadoEstaContenidoExactamenteEnPalabraClave(HashSet<String>palabrasClave, String valorBuscado){
	palabrasClave.exists[p| match(p,valorBuscado)]
	}
	
	def static alMenosUnServicioComienzaCon(String valorBuscado, List <Servicio> servicios) {
		servicios.exists[s|StringUtilities.queComienceCon(valorBuscado, s.getNombre)]
	}
	
	def static separarCadenaPorEspacios(String cadenaASeparar){
		Arrays.asList(cadenaASeparar.split("\\s"))
	}
	
	def static separarCadenaActualizacion(String cadenaASeparar){
		var List<String> palabras=Arrays.asList(cadenaASeparar.split(";"))
		palabras=StringUtilities.separarCadenaPorEspacios(palabras.get(1))
		palabras
	}
	
	def static String obtenerPrimerElementoCadenaActualizacion(String cadenaASeparar){
		Arrays.asList(cadenaASeparar.split(";")).get(0)
	}
}
