package ar.edu.testObserver

import ar.edu.POIs.Banco
import ar.edu.POIs.Colectivo
import ar.edu.POIs.LocalComercial
import ar.edu.POIs.RangoHorario
import ar.edu.POIs.Rubro
import ar.edu.builder.BancoBuilder
import ar.edu.builder.ColectivoBuilder
import ar.edu.builder.DireccionBuilder
import ar.edu.builder.HorarioDeAtencionBuilder
import ar.edu.builder.LocalComercialBuilder
import ar.edu.builder.RangoHorarioBuilder
import ar.edu.builder.UsuarioBuilder
import ar.edu.mail.StubMailSender
import ar.edu.observer.GeneradorDeLog
import ar.edu.observer.MetricasDeBusqueda
import ar.edu.observer.NotificacionPorDemora
import ar.edu.singleton.Reporte
import ar.edu.singleton.RepositorioSingleton
import ar.edu.usuario.Usuario
import java.util.Arrays
import org.joda.time.DateTime
import org.joda.time.LocalTime
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestObserver {
	MetricasDeBusqueda metricasDeBusqueda
	GeneradorDeLog generadorDeLog
	NotificacionPorDemora notificacionPorDemora
	Usuario usuario
	
	Colectivo colectivo78
	Colectivo colectivo169
	Banco bancoSantander
	Rubro rubroVerduleria
	RangoHorario rango
	LocalComercial verduleriaManolo
	LocalComercial verduleriaAmanda
	
	RepositorioSingleton repositorio
/*	
	@Before
	def void init() {
		metricasDeBusqueda = new MetricasDeBusqueda
		generadorDeLog = new GeneradorDeLog
		notificacionPorDemora = new NotificacionPorDemora(1)

		usuario = new UsuarioBuilder()
			.agregarMail("usuario@mail.com")
			.agregarObserver(metricasDeBusqueda)
			.agregarObserver(generadorDeLog)
			.agregarObserver(notificacionPorDemora)
			.build
		
		colectivo78 = new ColectivoBuilder()
					.agregarNombre("78")
					.agregarParada(-34.570861, -58.538289)
					.agregarParada(-34.578899, -58.528354)
					.agregarParada(-34.568033, -58.542023)
					.build
					
		colectivo169 = new ColectivoBuilder()
					.agregarNombre("169")
					.agregarParada(-34.603051, -58.396876)
					.agregarParada(-34.622888, -58.412651)
					.build
		
		bancoSantander = new BancoBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Rondeau").agregarEntreCalle1("Av Primavera").agregarEntreCalle2("6 de Julio").agregarNumero(250).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
//					.agregarHorarioBanco(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[new RangoHorarioBuilder().agregarRangoHorario(new LocalTime(10,0,0),new LocalTime(15,0,0)).build]).build)
					.agregarHorarioBanco(new HorarioDeAtencionBuilder().agregarHoraInicio("10:00").agregarHoraFin("15:00").build)
					.agregarNombre("Santander")
					.agregarServicios(#["depósitos", "transferencias", "cobro de cheques"])
					.build
	
		rubroVerduleria = new Rubro("Verduleria", 0.4)
		rango = new RangoHorarioBuilder().agregarRangoHorario(new LocalTime(8,0,0), new LocalTime(13,0,0)).build
		verduleriaManolo = new  LocalComercialBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Quirno").agregarEntreCalle1("Bolivia").agregarEntreCalle2("San Pedrito").agregarCodigoPostal(1650).agregarLocalidad("Flores").agregarBarrio("C.A.B.A").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
//					.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[rango]).build)
					.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("08:00").agregarHoraFin("13:00").build)
					.agregarNombre("Don Manolo")
					.agregarRubro(rubroVerduleria)
					.agregarPalabrasClave(Arrays.asList("Maracuya","Mango","Melon","Cereza"))
					.build
					
		verduleriaAmanda = new  LocalComercialBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Avellandeda").agregarEntreCalle1("Tannat").agregarEntreCalle2("San Pedrito").agregarNumero(100).agregarCodigoPostal(1650).agregarLocalidad("Flores").agregarBarrio("C.A.B.A").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
//					.agregarHorario(new HorarioDeAtencionBuilder().agregarRangoHorarioLunesAViernes(#[rango]).build)
					.agregarHorario(new HorarioDeAtencionBuilder().agregarHoraInicio("08:00").agregarHoraFin("13:00").build)
					.agregarNombre("Las Amandas")
					.agregarRubro(rubroVerduleria)
					.agregarPalabrasClave(Arrays.asList("Mango","Anco Zapallo","Alcaucil","Arandano"))
					.build		
	
		repositorio = RepositorioSingleton.instance
	}
	
	@Test
	def void elUsuarioPuedeAgregarYEliminarObservers() {
		usuario.observers.remove(notificacionPorDemora)
		usuario.observers.remove(generadorDeLog)
		usuario.observers.add(notificacionPorDemora)
		Assert.assertEquals(2, usuario.observers.size)
	}
	/*
	@Test 
	def void searchDePoisEnRepositorio() {
		repositorio.create(bancoSantander)

		Assert.assertEquals(1, repositorio.search("Santander").size)
	}
	
	@Test
	def void searchDePoisATravesDelUsuario() {
		Assert.assertEquals(1, usuario.search("Cereza").size)
	}
	
	@Test
	def void usuarioGuardaLaCantidadDeResultadosDeSusBusquedas() {
		repositorio.create(colectivo78)
		usuario.search("78")
		usuario.search("343")
		Assert.assertEquals(#[1,0], usuario.cantidadDeResultadosPorConsulta)
	}
	
	@Test 
	def void registroDeLaCantidadDeConsultasRealizadaPorFecha() {
		usuario.search("Provincia")
		Assert.assertEquals(1, Reporte.instance.cantidadDeConsultasPorFecha.get(DateTime.now.toLocalDate))
	}
	
	@Test
	def void laBusquedaSUPERAElTiempoMaximoComoParaMandarMail() {
		repositorio.create(verduleriaAmanda)
		repositorio.create(verduleriaManolo)
		repositorio.create(colectivo169)
		repositorio.create(colectivo78)
		notificacionPorDemora.demoraMaxima = 0 
		usuario.search("Mango")
		// tiempo de la busqueda > demara máxima
		Assert.assertEquals(1, StubMailSender.instance.mailsDe(usuario.mail).size)
		StubMailSender.instance.mailsDe(usuario.mail).clear
		repositorio.delete(colectivo78)
	}
	
	@Test
	def void laBusquedaNOsobrepasaElTiempoMaximoComoParaMandarMail() {
		usuario.search("343")
		// tiempo de la busqueda < demora máxima
		Assert.assertEquals(0, StubMailSender.instance.mailsDe(usuario.mail).size)
	}
	*/
}
