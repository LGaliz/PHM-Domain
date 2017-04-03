package ar.edu.TestPOIs

import org.joda.time.DateTime
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point
import ar.edu.POIs.Colectivo
import ar.edu.builder.ColectivoBuilder

class TestColectivos {

	Colectivo linea78
	Colectivo linea169
	Colectivo linea343
	Colectivo linea57
	Colectivo linea328
	Colectivo linea100
	Colectivo linea101
	Colectivo linea102
	Colectivo linea103
	Colectivo linea104

	Point punto1
	Point puntoAMenosDeUnaCuadraDe0
	Point puntoADosCuadrasDe0
	Point puntoAMasDeCincoCuadrasDe0
	DateTime unaFecha

	@Before
	def void init() {
	
		linea78 = new ColectivoBuilder()
					.agregarNombre("78")
					.agregarParada(-34.570861, -58.538289)
					.agregarParada(-34.578899, -58.528354)
					.agregarParada(-34.568033, -58.542023)
					.build
		
		linea169 = new ColectivoBuilder()
					.agregarNombre("169")
					.agregarParada(-34.603051, -58.396876)
					.agregarParada(-34.622888, -58.412651)
					.build
					
		linea343 = new ColectivoBuilder()
					.agregarNombre("343")
					.agregarParada(-34.632088, -58.483417)
					.agregarParada(-34.622888, -58.412651)
					.agregarParada(-34.568733, -58.482778)
					.build
		
		linea57 = new ColectivoBuilder()
					.agregarNombre("57")
					.agregarParada(-34.600129, -58.415931)
					.agregarParada(-34.633443, -58.362524)
					.build
		
		linea328 = new ColectivoBuilder()
					.agregarNombre("328")
					.agregarParada(-34.598897, -58.588353)
					.agregarParada(-34.523033, -58.543423)
					.build
		
		linea100 = new ColectivoBuilder()
					.agregarNombre("100")
					.agregarParada(-34.579200, -58.527941)
					.agregarParada(-34.589202, -58.627041)
					.agregarParada(-34.679000, -58.518941)
					.build
		
		linea101 = new ColectivoBuilder()
					.agregarNombre("101")
					.agregarParada(-34.578793, -58.528590)
					.agregarParada(-34.577521, -58.530017)
					.build
		
		linea102 = new ColectivoBuilder()
					.agregarNombre("102")
					.agregarParada(-34.578793, -58.528590)
					.agregarParada(-34.600129, -58.415931)
					.build
		
		
		linea103 = new ColectivoBuilder()
					.agregarNombre("103")
					.agregarParada(-34.568733, -58.482778)
					.agregarParada(-34.608341, -58.515987)
					.build
		
		linea104 = new ColectivoBuilder()
					.agregarNombre("104")
					.agregarParada(-34.578793, -58.528590)
					.agregarParada(-34.577521, -58.530017)
					.agregarParada(-34.575587, -58.532485)
					.build			
		
//		linea169 = new Colectivo("169")=>[
//			addParada(-34.603051, -58.396876)
//			addParada(-34.622888, -58.412651)
//			]
		
//		linea343 = new Colectivo("343")=>[
//			addParada(-34.632088, -58.483417)
//			addParada(-34.622888, -58.412651)
//			addParada(-34.568733, -58.482778)
//			]
		
//		linea57 = new Colectivo("57")=>[
//			addParada(-34.600129, -58.415931)
//			addParada(-34.633443, -58.362524)
//		]
		
//		linea328 = new Colectivo("328")=>[
//			addParada(-34.598897, -58.588353)
//			addParada(-34.523033, -58.543423)
//		]
		
//		linea100 = new Colectivo("100")=>[
//			addParada(-34.579200, -58.527941)
//			addParada(-34.589202, -58.627041)
//			addParada(-34.679000, -58.518941)
//		]
		
//		linea101 = new Colectivo("101")=>[
//			addParada(-34.578793, -58.528590)
//			addParada(-34.577521, -58.530017)
//		]
		
//		linea102 = new Colectivo("102")=>[
//			addParada(-34.578793, -58.528590)
//			addParada(-34.600129, -58.415931)
//		]
//		
//		linea103 = new Colectivo("103")=>[
//			addParada(-34.568733, -58.482778)
//			addParada(-34.608341, -58.515987)
//		]
//		
//		linea104 = new Colectivo("104")=>[
//			addParada(-34.578793, -58.528590)
//			addParada(-34.577521, -58.530017)
//			addParada(-34.575587, -58.532485)			
//		]
		
		
		punto1 = new Point(-34.598897, -58.588353)
		puntoAMenosDeUnaCuadraDe0 = new Point(-34.579200, -58.527941)
		puntoADosCuadrasDe0 = new Point(-34.577521, -58.530017)
		puntoAMasDeCincoCuadrasDe0 = new Point(-34.575587, -58.532485)

		unaFecha = new DateTime(2016, 4, 2, 10, 50, 33)
	}

//	@Test
//	def void colectivoEstaAUnaDistanciaDe() {
//	Assert.assertTrue((linea78.distanciaPoi(puntoAMenosDeUnaCuadraDe0))==4.0)}
//	//-34.570861, -58.538289
	@Test
	def void colectivoEstaCercaDeUnPuntoSilaDistanciaEsMenosA0_1Km() { 
		Assert.assertTrue(linea78.estaCerca(puntoAMenosDeUnaCuadraDe0))
	}

	@Test
	def void colectivoNoEstaCercaDeUnPuntoSilaDistanciaEsMasDe0_1Km() {
		Assert.assertFalse(linea78.estaCerca(puntoADosCuadrasDe0))
	}

	@Test
	def void colectivoEstaCercaDeUnPuntoSiElPuntoEsElmismoQueLaParada() { 
		Assert.assertTrue(linea328.estaCerca(punto1))
	}

	@Test
	def void losColectivosSiempreEstanDisponibles() {
		Assert.assertTrue(linea169.estaDisponible(unaFecha))
	}

	@Test
	def void macheoDeLineaDeColectivoPorNumeroDeLineaExacta() {
		Assert.assertTrue(linea57.matchearPoi("57"))
	}

	@Test
	def void noHayMacheoDeLineaDeColectivoSiElNumeroDeLineaNoEsExacto() {
		Assert.assertFalse(linea78.matchearPoi("66"))
	}
}
