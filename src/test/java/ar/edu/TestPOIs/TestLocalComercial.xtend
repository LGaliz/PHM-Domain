package ar.edu.TestPOIs

import ar.edu.POIs.LocalComercial
import ar.edu.POIs.RangoHorario
import ar.edu.POIs.Rubro
import ar.edu.builder.DireccionBuilder
import ar.edu.builder.HorarioDeAtencionBuilder
import ar.edu.builder.LocalComercialBuilder
import ar.edu.builder.RangoHorarioBuilder
import java.util.Arrays
import org.joda.time.DateTime
import org.joda.time.LocalTime
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point

class TestLocalComercial {

	LocalComercial verduleriaManolo
	LocalComercial verduleriaAmanda			
	LocalComercial verduleriaDonBraulio		
	LocalComercial libreriaGarabombo
	LocalComercial libreriaTecnica
	LocalComercial libreriaAntonino
	LocalComercial viveroLasLilas
	LocalComercial viveroPalmeras
	LocalComercial viveroLotoAzul
	LocalComercial viveroPaloAlto
	Rubro rubroVivero 
	Rubro rubroVerduleria
	Rubro rubroLibreria  
	RangoHorario rangoMañana
	RangoHorario rangoTarde
	Point puntoAMenosDeUnaCuadra
	Point puntoADosCuadras
	Point puntoAMasDeCincoCuadras

	DateTime lunes1050 
	DateTime sabado1100
	DateTime jueves1445
	DateTime viernes2200

	@Before
	def void init() {		
	
		rubroVerduleria = new Rubro("Verduleria", 0.4)
		rubroLibreria = new Rubro("Libreria", 0.2)
		rubroVivero = new Rubro("Vivero",0.9)
		
		rangoMañana = new RangoHorarioBuilder().agregarRangoHorario(new LocalTime(8,0,0), new LocalTime(13,0,0)).build
		rangoTarde = new RangoHorarioBuilder().agregarRangoHorario(new LocalTime(16,0,0), new LocalTime(20,0,0)).build
		
		puntoAMenosDeUnaCuadra = new Point(-34.579200, -58.527941)
		puntoADosCuadras = new Point(-34.577521, -58.530017)
		puntoAMasDeCincoCuadras = new Point(-34.575587, -58.532485)
		
		verduleriaManolo = new  LocalComercialBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Quirno").agregarEntreCalle1("Bolivia").agregarEntreCalle2("San Pedrito").agregarCodigoPostal(1650).agregarLocalidad("Flores").agregarBarrio("C.A.B.A").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
//					.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[rangoMañana]).agregarRangoHorarioLunesAViernes(#[rangoTarde]).agregarHorarioDeAtencionPorDia("sabado",#[rangoMañana]) .build)
					.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("09:30").agregarHoraFin("20:00").build)
					.agregarNombre("Don Manolo")
					.agregarRubro(rubroVerduleria)
					.agregarPalabrasClave(Arrays.asList("Maracuya","Mango","Melon","Cereza"))
					.build
		
		verduleriaAmanda = new  LocalComercialBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Avellandeda").agregarEntreCalle1("Tannat").agregarEntreCalle2("San Pedrito").agregarNumero(100).agregarCodigoPostal(1650).agregarLocalidad("Flores").agregarBarrio("C.A.B.A").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
//					.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[rangoMañana]).agregarRangoHorarioLunesAViernes(#[rangoTarde]).agregarHorarioDeAtencionPorDia("sabado",#[rangoMañana]) .build)
					.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("08:00").agregarHoraFin("20:00").build)
					.agregarNombre("Las Amandas")
					.agregarRubro(rubroVerduleria)
					.agregarPalabrasClave(Arrays.asList("Anana","Anco Zapallo","Alcaucil","Arandano"))
					.build
		
		verduleriaDonBraulio = new  LocalComercialBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Casares").agregarEntreCalle1("Bolivia").agregarEntreCalle2("Bonarda").agregarNumero(200).agregarCodigoPostal(1650).agregarLocalidad("Flores").agregarBarrio("C.A.B.A").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
//					.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[rangoMañana]).agregarRangoHorarioLunesAViernes(#[rangoTarde]).agregarHorarioDeAtencionPorDia("sabado",#[rangoMañana]) .build)
					.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("08:00").agregarHoraFin("20:00").build)
					.agregarNombre("Don Braulio")
					.agregarRubro(rubroVerduleria)
					.agregarPalabrasClave(Arrays.asList("Banana","Brocoli","Berenjena","Frutilla"))
					.build
		
		libreriaTecnica = new  LocalComercialBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Cielo Razo").agregarEntreCalle1("Terrada").agregarEntreCalle2("San Pedrito").agregarNumero(300).agregarCodigoPostal(1650).agregarLocalidad("Flores").agregarBarrio("C.A.B.A").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
//					.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[rangoMañana]).agregarRangoHorarioLunesAViernes(#[rangoTarde]).agregarHorarioDeAtencionPorDia("sabado",#[rangoMañana]) .build)
					.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("08:00").agregarHoraFin("21:00").build)
					.agregarNombre("Libreria Tecnica")
					.agregarRubro(rubroLibreria)
					.agregarPalabrasClave(Arrays.asList("Libros","Textos","Textos Universitatios","Libros para Ingenieria"))
					.build
		
		libreriaGarabombo = new  LocalComercialBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Amerello").agregarEntreCalle1("Celeste").agregarEntreCalle2("San Pedrito").agregarNumero(900).agregarCodigoPostal(1650).agregarLocalidad("Flores").agregarBarrio("C.A.B.A").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
//					.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[rangoMañana]).agregarRangoHorarioLunesAViernes(#[rangoTarde]).build)
					.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("09:30").agregarHoraFin("20:30").build)
					.agregarNombre("Libreria Garabombo")
					.agregarRubro(rubroLibreria)
					.agregarPalabrasClave(Arrays.asList("Libros","Textos","Textos Escolares","Libros Antiguos"))
					.build
		
		libreriaAntonino = new  LocalComercialBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Amerello").agregarEntreCalle1("Celeste").agregarEntreCalle2("San Pedrito").agregarNumero(900).agregarCodigoPostal(1650).agregarLocalidad("Flores").agregarBarrio("C.A.B.A").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
//					.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[rangoMañana]).agregarRangoHorarioLunesAViernes(#[rangoTarde]).build)
					.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("10:00").agregarHoraFin("20:00").build)
					.agregarNombre("Libreria Antonino")
					.agregarRubro(rubroLibreria)
					.agregarPalabrasClave(Arrays.asList("Libros","Textos","Decatalogados","Libros Usados"))
					.build
		
		viveroLasLilas = new  LocalComercialBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Amerello").agregarEntreCalle1("Celeste").agregarEntreCalle2("San Pedrito").agregarNumero(900).agregarCodigoPostal(1650).agregarLocalidad("Flores").agregarBarrio("C.A.B.A").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
//					.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[rangoMañana]).agregarRangoHorarioLunesAViernes(#[rangoTarde]).build)
					.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("09:30").agregarHoraFin("21:30").build)
					.agregarNombre("Vivero LasLilas")
					.agregarRubro(rubroVivero)
					.agregarPalabrasClave(Arrays.asList("Margaritas","Potus","Jazmin Japones","Alegria Del Hogar"))
					.build
		
		viveroPalmeras = new  LocalComercialBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Amerello").agregarEntreCalle1("Celeste").agregarEntreCalle2("San Pedrito").agregarNumero(900).agregarCodigoPostal(1650).agregarLocalidad("Flores").agregarBarrio("C.A.B.A").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
//					.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[rangoMañana]).agregarRangoHorarioLunesAViernes(#[rangoTarde]).agregarHorarioDeAtencionPorDia("sabado",#[rangoMañana]) .build)
					.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("09:15").agregarHoraFin("20:45").build)
					.agregarNombre("Vivero Las Palmeras")
					.agregarRubro(rubroVivero)
					.agregarPalabrasClave(Arrays.asList("Palmera","Platano","Pino","Duraznero"))
					.build
		
		viveroLotoAzul = new  LocalComercialBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Amerello").agregarEntreCalle1("Celeste").agregarEntreCalle2("San Pedrito").agregarNumero(900).agregarCodigoPostal(1650).agregarLocalidad("Flores").agregarBarrio("C.A.B.A").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
//					.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[rangoMañana]).agregarRangoHorarioLunesAViernes(#[rangoTarde]).agregarHorarioDeAtencionPorDia("sabado",#[rangoMañana]) .build)
					.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("08:00").agregarHoraFin("16:30").build)
					.agregarNombre("Vivero LotoAzul")
					.agregarRubro(rubroVivero)
					.agregarPalabrasClave(Arrays.asList("Solanacea","Hipomea Violacia","Bromelia","Orquidea"))
					.build
		
		viveroPaloAlto = new  LocalComercialBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Amerello").agregarEntreCalle1("Celeste").agregarEntreCalle2("San Pedrito").agregarNumero(900).agregarCodigoPostal(1650).agregarLocalidad("Flores").agregarBarrio("C.A.B.A").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
//					.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[rangoMañana]).agregarRangoHorarioLunesAViernes(#[rangoTarde]).agregarHorarioDeAtencionPorDia("sabado",#[rangoMañana]) .build)
					.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("08:00").agregarHoraFin("20:00").build)
					.agregarNombre("Vivero PaloAlto")
					.agregarRubro(rubroVivero)
					.agregarPalabrasClave(Arrays.asList("Solanacea","Girasol","Jazmin"))
					.build
		
	//Para que tengan la fecha actual
		lunes1050 = new DateTime().withTime(new LocalTime(10,50,33))//new DateTime(2016, 4, 4, 10, 50, 33) // Lunes 4 de Abril 10:50:33
		sabado1100 = new DateTime().withTime(new LocalTime(11,00,30))//new DateTime(2016, 4, 10, 11, 0, 30)//Sábado 10 de Abril 11:00:30
		jueves1445 = new DateTime().withTime(new LocalTime(14,45,10))//new DateTime(2016, 4, 7, 14, 45, 10)//Jueves 7 de Abril 14:45:10				
		viernes2200 = new DateTime().withTime(new LocalTime(22,00,00))
	}

	@Test
	def void localComercialEstaCercaDeUnPuntoSicoincideOEsMenorAlRadioDeCercaniaDefinidoPorElRubro() {
		Assert.assertTrue(verduleriaManolo.estaCerca(puntoADosCuadras))
	}
	
	def void localComercialNoEstaCercaDeUnPuntoEsMayorAlRadioDeCercaniaDefinidoPorElRubro() {
		Assert.assertFalse(verduleriaManolo.estaCerca(puntoAMasDeCincoCuadras))
	}
	
	@Test
	def void estaDisponibleSiElMomentoIngresadoEstaDentroDelHorarioDeAtencion() {
//		Assert.assertFalse(viveroLasLilas.estaDisponible(lunes1050))
		Assert.assertTrue(viveroLasLilas.estaDisponible(lunes1050))
	}

	@Test 
	def void noEstaDisponibleSiElDiaDelMomentoIngresadoNoEstaDentroDelHorarioDeAtencion() {
		Assert.assertFalse(viveroLasLilas.estaDisponible(viernes2200))
	}
//
//	@Test
//	def void noEstaDisponibleSiElHorarioDelMomentoIngresadoNoEstaDentroDelHorarioDeAtencion() {
//		Assert.assertFalse(viveroLasLilas.estaDisponible(jueves1445))
//	}

	@Test
	def void matcheoDeLocalComercialQueComienceConNombreDelComercio() {
		Assert.assertTrue(verduleriaManolo.matchearPoi("Do"))
	}
	
	@Test
	def void matcheoDeLocalComercialQueComienceConNombreDelComercioSinTenerEncuentaMayusculasOMinusculas() {
		Assert.assertTrue(verduleriaManolo.matchearPoi("don Ma"))
	}

	@Test
	def void matcheoDeLocalComercialConPalabraClaveExacta() {
		Assert.assertTrue(verduleriaAmanda.matchearPoi("Anana"))
		}
	
	@Test
	def void noMatcheoSiLaPalabraClaveExactaNoEsExacta() {			
		Assert.assertFalse(libreriaGarabombo.matchearPoi("Textos Esc"))
	}

	@Test
	def void matcheoDeLocalComercialConRubroExacto() {
		Assert.assertTrue(libreriaGarabombo.matchearPoi("Libreria"))
		}
		
//	@Test
//	def void noHayMatcheoDeLocalComercialSiElRubroNoEsExacto() {
//		Assert.assertFalse(verduleriaAmanda.matchearPoi("ver"))
//	}
		
	@Test
	def void listaDePalabrasClaveContieneLasPalabras(){
		Assert.assertTrue(verduleriaAmanda.palabrasClave.contains("Anana"))
		Assert.assertEquals(4, verduleriaAmanda.palabrasClave.size())
	}
}
																																								