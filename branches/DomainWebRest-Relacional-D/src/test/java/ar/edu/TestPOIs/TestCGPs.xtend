package ar.edu.TestPOIs

import ar.edu.POIs.Cgp
import ar.edu.POIs.Comuna
import ar.edu.POIs.Servicio
import ar.edu.builder.CGPBuilder
import ar.edu.builder.ComunaBuilder
import ar.edu.builder.DireccionBuilder
import ar.edu.builder.HorarioDeAtencionBuilder
import ar.edu.builder.PolygonBuilder
import ar.edu.builder.ServiciosCGPBuilder
import java.util.Arrays
import org.joda.time.DateTime
import org.joda.time.LocalTime
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point

class TestCGPs {

	Comuna comuna2
	Comuna comuna3
	Comuna comuna5
	Comuna comuna6
	Comuna comuna7
	Comuna comuna8
	Comuna comuna9
	Comuna comuna10
	Comuna comuna11
	Comuna comuna12
	
	Cgp sedeComuna2
	Cgp sedeComuna3
	Cgp sedeComuna5
	Cgp sedeComuna6
	Cgp sedeComuna7
	Cgp sedeComuna8
	Cgp sedeComuna9
	Cgp sedeComuna10
	Cgp sedeComuna11
	Cgp sedeComuna12
	
	Point puntoEnLaComuna12
	Point puntoEnOtraComuna12
	
	Servicio rentas
	Servicio servicioSocial
	Servicio direccionGeneralDeLaMujer
	Servicio registroCivil
	Servicio tesoreria
	
	DateTime lunes1050
	DateTime sabado1100
	DateTime jueves1445
	DateTime martes2200

	@Before
	def void init() {
		
		comuna2 = new ComunaBuilder()
		.agregarZonaComuna(new PolygonBuilder().agregarPoligono(#[new Point(-34.569901, -58.399222), new Point(-34.579503, -58.376716), new Point(-34.599284, -58.386868),new Point(-34.597805, -58.415952)]).build)
		.agregarNumeroComuna("2").build	
		
		comuna3 = new ComunaBuilder()
		.agregarZonaComuna(new PolygonBuilder().agregarPoligono(#[new Point(-34.598014, -58.411913), new Point(-34.599623, -58.392947), new Point(-34.627218, -58.391205),new Point(-34.630324, -58.411834)]).build)
		.agregarNumeroComuna("3").build	
		
		comuna5 = new ComunaBuilder()
		.agregarZonaComuna(new PolygonBuilder().agregarPoligono(#[new Point(-34.640172, -58.423435), new Point(-34.638036, -58.411236), new Point(-34.597959, -58.411927),new Point(-34.594439, -58.430157)]).build)
		.agregarNumeroComuna("5").build	
		
		comuna6 = new ComunaBuilder()
		.agregarZonaComuna(new PolygonBuilder().agregarPoligono(#[new Point(-34.607374, -58.462677), new Point(-34.602668, -58.433401), new Point(-34.626943, -58.426822),new Point(-34.630569, -58.451768)]).build)
		.agregarNumeroComuna("6").build	
		
		comuna7 = new ComunaBuilder()
		.agregarZonaComuna(new PolygonBuilder().agregarPoligono(#[new Point(-34.607374, -58.462677), new Point(-34.602668, -58.433401), new Point(-34.626943, -58.426822),new Point(-34.630569, -58.451768)]).build)
		.agregarNumeroComuna("7").build	
		
		comuna8 = new ComunaBuilder()
		.agregarZonaComuna(new PolygonBuilder().agregarPoligono(#[new Point(-34.607374, -58.462677), new Point(-34.602668, -58.433401), new Point(-34.626943, -58.426822),new Point(-34.630569, -58.451768)]).build)
		.agregarNumeroComuna("8").build	
		
		comuna9 = new ComunaBuilder()
		.agregarZonaComuna(new PolygonBuilder().agregarPoligono(#[new Point(-34.607374, -58.462677), new Point(-34.602668, -58.433401), new Point(-34.626943, -58.426822),new Point(-34.630569, -58.451768)]).build)
		.agregarNumeroComuna("9").build	
		
		comuna10 = new ComunaBuilder()
		.agregarZonaComuna(new PolygonBuilder().agregarPoligono(#[new Point(-34.607374, -58.462677), new Point(-34.602668, -58.433401), new Point(-34.626943, -58.426822),new Point(-34.630569, -58.451768)]).build)
		.agregarNumeroComuna("10").build	
		
		comuna11 = new ComunaBuilder()
		.agregarZonaComuna(new PolygonBuilder().agregarPoligono(#[new Point(-34.607374, -58.462677), new Point(-34.602668, -58.433401), new Point(-34.626943, -58.426822),new Point(-34.630569, -58.451768)]).build)
		.agregarNumeroComuna("11").build	
		
		comuna12 = new ComunaBuilder()
		.agregarZonaComuna(new PolygonBuilder().agregarPoligono(#[new Point(-34.634291, -58.366412), new Point(-34.639199, -58.363601), new Point(-34.635068, -58.355576),new Point(-34.631466, -58.359395)]).build)
		.agregarNumeroComuna("12").build	
		
		puntoEnLaComuna12 = new Point(-34.633443, -58.362524)
		puntoEnOtraComuna12 = new Point(-34.600129, -58.415931)
		
		rentas = new ServiciosCGPBuilder()
		.agregarNombreServicio("Rentas")
//		.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[new RangoHorarioBuilder().agregarRangoHorario(new LocalTime(7,30,0), new LocalTime(15,30,0)).build]).build)
		.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("07:30").agregarHoraFin("15:30").build)
		.build
		
		servicioSocial = new ServiciosCGPBuilder()
		.agregarNombreServicio("Servicio Social")
//		.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[new RangoHorarioBuilder().agregarRangoHorario(new LocalTime(8,0,0), new LocalTime(19,0,0)).build]).agregarHorarioDeAtencionPorDia("sabado",(#[new RangoHorarioBuilder().agregarRangoHorario(new LocalTime(8,0,0), new LocalTime(19,0,0)).build])).build)
		.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("08:00").agregarHoraFin("19:00").build)
		.build
		
		direccionGeneralDeLaMujer = new ServiciosCGPBuilder()
		.agregarNombreServicio("Direccion General De La Mujer")
//		.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[new RangoHorarioBuilder().agregarRangoHorario(new LocalTime(9,0,0), new LocalTime(21,0,0)).build]).build)
		.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("09:00").agregarHoraFin("21:00").build)
		.build
		registroCivil = new ServiciosCGPBuilder()
		.agregarNombreServicio("RegistroCivil")
//		.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[new RangoHorarioBuilder().agregarRangoHorario(new LocalTime(8,30,0), new LocalTime(20,30,0)).build]).build)
		.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("08:30").agregarHoraFin("20:30").build)
		.build
		tesoreria = new ServiciosCGPBuilder()
		.agregarNombreServicio("Tesoreria")
//		.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[new RangoHorarioBuilder().agregarRangoHorario(new LocalTime(7,0,0), new LocalTime(13,0,0)).build])	.build)
		.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("07:00").agregarHoraFin("13:00").build)
		.build
		
				
		sedeComuna2 = new CGPBuilder()
		.agregarComuna(new ComunaBuilder().agregarZonaComuna(new PolygonBuilder().agregarPoligono(#[new Point(-34.569901, -58.399222), new Point(-34.579503, -58.376716), new Point(-34.599284, -58.386868),new Point(-34.597805, -58.415952)]).build).agregarNumeroComuna("2").build	)
		.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Pelagio Luna").agregarEntreCalle1("PerezGaldos").agregarEntreCalle2("Industria").agregarNumero(600).agregarCodigoPostal(1650).agregarLocalidad("La Boca").agregarBarrio("CABA").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
		.agregarServicios(Arrays.asList(direccionGeneralDeLaMujer,registroCivil))
		.build

		sedeComuna3 = new CGPBuilder()
		.agregarComuna(comuna3)
		.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Perez Galdos").agregarEntreCalle1("Ministro Brin").agregarEntreCalle2("6 de Julio").agregarNumero(600).agregarCodigoPostal(1650).agregarLocalidad("La Boca").agregarBarrio("CABA").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
		.agregarServicios(Arrays.asList(direccionGeneralDeLaMujer,registroCivil))
		.build
		
		sedeComuna5 = new CGPBuilder()
		.agregarComuna(comuna5)
		.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Gabriela Mistral").agregarEntreCalle1("Libertad").agregarEntreCalle2("6 de Julio").agregarNumero(600).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarLocalidad("La Boca").agregarBarrio("CABA").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
		.agregarServicios(Arrays.asList(tesoreria,rentas))
		.build

		sedeComuna6 = new CGPBuilder()
		.agregarComuna(comuna6)
		.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Julio Cortazar").agregarEntreCalle1("Violeta Parras").agregarEntreCalle2("6 de Julio").agregarNumero(600).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
		.agregarServicios(Arrays.asList(servicioSocial))
		.build
		
		sedeComuna7 = new CGPBuilder()
		.agregarComuna(comuna7)
		.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Julio Cortazar").agregarEntreCalle1("Violeta Parras").agregarEntreCalle2("6 de Julio").agregarNumero(600).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
		.agregarServicios(Arrays.asList(tesoreria))
		.build

		sedeComuna8 = new CGPBuilder()
		.agregarComuna(comuna8)
		.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Pelagio Luna").agregarEntreCalle1("Perez Galdos").agregarEntreCalle2("Industria").agregarNumero(600).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
		.agregarServicios(Arrays.asList(registroCivil))
		.build
		
		sedeComuna9 = new CGPBuilder()
		.agregarComuna(comuna9)
		.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Libertad").agregarEntreCalle1("Gabriela Mistral").agregarEntreCalle2("6 de Julio").agregarNumero(250).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
		.agregarServicios(Arrays.asList(direccionGeneralDeLaMujer))
		.build

		sedeComuna10 = new CGPBuilder()
		.agregarComuna(comuna10)
		.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Ministro Brin").agregarEntreCalle1("Perez Galdos").agregarEntreCalle2("6 de Julio").agregarNumero(250).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
		.agregarServicios(Arrays.asList(servicioSocial))
		.build
		
		sedeComuna11 = new CGPBuilder()
		.agregarComuna(comuna11)
		.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Ministro Brin").agregarEntreCalle1("Perez Galdos").agregarEntreCalle2("6 de Julio").agregarNumero(250).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
		.agregarServicios(Arrays.asList(direccionGeneralDeLaMujer,registroCivil))
		.build
		
		sedeComuna12 = new CGPBuilder()
		.agregarComuna(comuna12)
		.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Rondeau").agregarEntreCalle1("Av Primavera").agregarEntreCalle2("6 de Julio").agregarNumero(250).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
		.agregarServicios(Arrays.asList(rentas,servicioSocial))
		.build
				
	//Para que tengan la fecha actual		
		lunes1050 = new DateTime().withTime(new LocalTime(10,50,33))//new DateTime(2016, 4, 4, 10, 50, 33) // Lunes 4 de Abril 10:50:33
		sabado1100 = new DateTime().withTime(new LocalTime(11,00,30))//new DateTime(2016, 4, 10, 11, 0, 30)//Sábado 10 de Abril 11:00:30
		jueves1445 = new DateTime().withTime(new LocalTime(14,45,10))//new DateTime(2016, 4, 7, 14, 45, 10)//Jueves 7 de Abril 14:45:10
		martes2200 = new DateTime().withTime(new LocalTime(22,00,00))//new DateTime(2016, 4, 12, 22, 0, 0)//Martes 12 de Abril 21:00:00
		
	}

	@Test
	def void cGPEstaCercaDeUnPuntoSiEstaDentroDeLaMismaComuna() {
		Assert.assertTrue(sedeComuna12.estaCerca(puntoEnLaComuna12))
	}
	
	@Test
	def void cGPNoEstaCercaDeUnPuntoSiNoEstaDentroDeLaMismaComuna() {
		Assert.assertFalse(sedeComuna12.estaCerca(puntoEnOtraComuna12))
	}
	
	@Test
	def void dadoUnMomentoHayAlMenosUnServicioDisponible() {
		Assert.assertTrue(sedeComuna10.estaDisponible(lunes1050))
	}
	
	@Test
	def void dadoUnMomentoYElNombreDelServicioSeDeterminaSiEstaDisponible() {
		Assert.assertTrue(sedeComuna12.estaDisponible(jueves1445, "Rentas"))
	}

	@Test
	def void noEstaDisponibleSiElDiaDelMomentoIngresadoNoEstaDentroDelHorarioDeAtencion() {
		Assert.assertFalse(sedeComuna2.estaDisponible(martes2200))
	}

	@Test
	def void matcheoDeCGPDandoSuNumeroDeComunaExacta() {
		Assert.assertTrue(sedeComuna8.matchearPoi("8"))
	}

	@Test
	def void matcheoDeCGPDadoLasPrimerasLetrasOPalabrasDeAlgunoDeSusServicios() {
		Assert.assertTrue(sedeComuna5.matchearPoi("Rent"))
	}
	
	@Test
	def void matcheoDeCGPDadoLasPrimerasPalabrasDeAlgunoDeSusServicios() {
		Assert.assertTrue(sedeComuna6.matchearPoi("Servicio"))
	}
	
	@Test
	def void matcheoDeCGPDadoPalabrasExactaDeAlgunoDeSusServicios() {
		Assert.assertTrue(sedeComuna3.matchearPoi("Direccion General De La Mujer"))
	}
}
