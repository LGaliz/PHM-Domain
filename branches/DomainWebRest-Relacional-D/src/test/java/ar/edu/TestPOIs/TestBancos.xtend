package ar.edu.TestPOIs

import ar.edu.POIs.Banco
import ar.edu.POIs.HorarioDeAtencion
import ar.edu.builder.BancoBuilder
import ar.edu.builder.DireccionBuilder
import ar.edu.builder.HorarioDeAtencionBuilder
import org.joda.time.DateTime
import org.joda.time.LocalTime
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point

class TestBancos {

	Banco provincia 
	Banco nacion
	Banco ciudad
	Banco piano
	Banco rioDelPlata
	Banco bitcoin
	Banco patagonia
	Banco credicop
	Banco jPMorgan
	Banco citi
	
	HorarioDeAtencion horarioBanco
	
	Point punto0Provincia
	Point puntoAMenosDeUnaCuadraDePunto0Provincia
	Point puntoADosCuadrasDePunto0Provincia
	Point puntoAMasDeCincoCuadrasDePunto0Provincia
	
	DateTime viernes1100
	DateTime sabado1230
	DateTime martes1545

	@Before
	def void init() {
		
		horarioBanco = new HorarioDeAtencionBuilder()
//						.agregarRangoHorarioLunesAViernes(#[new RangoHorarioBuilder().agregarRangoHorario(new LocalTime(10,0,0),new LocalTime(15,0,0)).build])
						.agregarHoraInicio("10:00").agregarHoraFin("15:00")
						.build

		punto0Provincia = new Point(-34.578793, -58.528590)
		puntoAMenosDeUnaCuadraDePunto0Provincia = new Point(-34.579200, -58.527941)
		puntoADosCuadrasDePunto0Provincia = new Point(-34.577521, -58.530017)
		puntoAMasDeCincoCuadrasDePunto0Provincia = new Point(-34.575587, -58.532485)
		

		provincia = new BancoBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Rondeau").agregarEntreCalle1("Av Primavera").agregarEntreCalle2("6 de Julio").agregarNumero(250).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
					.agregarHorarioBanco(horarioBanco)
					.agregarNombre("Provincia")
					.agregarServicios(#["depósitos", "transferencias", "cobro de cheques"])
					.build

		nacion = new BancoBuilder()
				.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Av Darko").agregarEntreCalle1("Los Conejos").agregarEntreCalle2("Las Alicias").agregarNumero(820).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
				.agregarHorarioBanco(horarioBanco)
				.agregarNombre("Nacion")
				.agregarServicios(#["depósitos", "transferencias", "cobro de cheques"])
				.build

		ciudad = new BancoBuilder()
				.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578792, -58.528590).agregarCalle("Av Los Talares").agregarEntreCalle1("Ebano").agregarEntreCalle2("Pino").agregarNumero(1320).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
				.agregarHorarioBanco(horarioBanco)
				.agregarNombre("Ciudad")
				.agregarServicios(#["depósitos", "transferencias", "cobro de cheques"])
				.build

		piano = new BancoBuilder()
				.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578791, -58.528590).agregarCalle("Av Cipres").agregarEntreCalle1("Los Conejos").agregarEntreCalle2("Algarrobo").agregarNumero(2560).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
				.agregarHorarioBanco(horarioBanco)
				.agregarNombre("Piano")
				.agregarServicios(#["depósitos", "transferencias", "cobro de cheques"])
				.build
		
		rioDelPlata = new BancoBuilder()
				.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578790, -58.528590).agregarCalle("Av Naranjo").agregarEntreCalle1("Los Tomates").agregarEntreCalle2("Las Alicias").agregarNumero(2320).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
				.agregarHorarioBanco(horarioBanco)
				.agregarNombre("Rio Del Plata")
				.agregarServicios(#["depósitos", "transferencias", "cobro de cheques"])
				.build
		
		bitcoin = new BancoBuilder()
				.agregarDireccion(new DireccionBuilder().agregarPunto(-34.604663, -58.490160).agregarCalle("Marcos Sastre").agregarEntreCalle1("Helguera").agregarEntreCalle2("Argerich").agregarNumero(3100).agregarCodigoPostal(1417).agregarLocalidad("Villa Del Parque").agregarBarrio("Villa Del Parque").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
				.agregarHorarioBanco(horarioBanco)
				.agregarNombre("Bitcoin")
				.agregarServicios(#["depósitos", "transferencias", "cobro de cheques"])
				.build
				
		patagonia = new BancoBuilder()
				.agregarDireccion(new DireccionBuilder().agregarPunto(-34.567070, -58.532941).agregarCalle("Rivadavia").agregarEntreCalle1("Junin").agregarEntreCalle2("Almafuerte").agregarNumero(2660).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
				.agregarHorarioBanco(horarioBanco)
				.agregarNombre("Patagonia")
				.agregarServicios(#["depósitos", "transferencias", "cobro de cheques"])
				.build
		
		credicop = new BancoBuilder()
				.agregarDireccion(new DireccionBuilder().agregarPunto(-34.611917, -58.449937).agregarCalle("Pujol").agregarEntreCalle1("Franklin").agregarEntreCalle2("Planes").agregarNumero(990).agregarCodigoPostal(1650).agregarLocalidad("Caballito").agregarBarrio("Caballito").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
				.agregarHorarioBanco(horarioBanco)
				.agregarNombre("Credicop")
				.agregarServicios(#["depósitos", "transferencias", "cobro de cheques"])
				.build
		
		jPMorgan = new BancoBuilder()
				.agregarDireccion(new DireccionBuilder().agregarPunto(-34.570777, -58.527877).agregarCalle("Almafuerte").agregarEntreCalle1("Maipu").agregarEntreCalle2("Echeverria").agregarNumero(1850).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
				.agregarHorarioBanco(horarioBanco)
				.agregarNombre("JPMorgan")
				.agregarServicios(#["depósitos", "transferencias", "cobro de cheques"])
				.build
		
		citi = new BancoBuilder()
				.agregarDireccion(new DireccionBuilder().agregarPunto(-34.606398, -58.519090).agregarCalle("Allende").agregarEntreCalle1("Asuncion").agregarEntreCalle2("Pedro Moran").agregarNumero(3820).agregarCodigoPostal(1615).agregarLocalidad("Villa Devoto").agregarBarrio("Villa Devoto").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
				.agregarHorarioBanco(horarioBanco)
				.agregarNombre("Citi")
				.agregarServicios(#["depósitos", "transferencias", "cobro de cheques"])
				.build
		

		viernes1100 = new DateTime().withTime(new LocalTime(11,00,00))//new DateTime(2016, 4, 8, 11, 0, 0) // Viernes 11:00
		sabado1230 = new DateTime().withTime(new LocalTime(12,30,00))//new DateTime(2016, 4, 9, 12, 30, 0) // Sábado 12:30
		martes1545 = new DateTime().withTime(new LocalTime(15,45,00))//new DateTime(2016, 4, 5, 15, 45, 0) // Martes 15:45
	}

	@Test
	def void bancoEstaAUnaDistanciaDe0km() {
		Assert.assertTrue((provincia.getDistancia(punto0Provincia)) == 0.0)
			}
		
	//-34.570861, -58.538289
//	@Test
//	def void bancoEstaAUnaDistanciaDe() {
//		Assert.assertEquals(provincia.distanciaPoi(puntoAMenosDeUnaCuadraDePunto0Provincia),0.3)
//	//	Assert.assertEquals(provincia.distanciaPoi(puntoAMenosDeUnaCuadraDePunto0Provincia),0.0)
//	}
	@Test
	def void estaCercaDeUnPuntoSilaDistanciaEsMenorDeMedioKm() {
		Assert.assertTrue(provincia.estaCerca(puntoAMenosDeUnaCuadraDePunto0Provincia))
	}

	@Test
	def void noEstaCercaDeUnPuntoSilaDistanciaEsMayorDeMedioKm() {
		Assert.assertFalse(provincia.estaCerca(puntoAMasDeCincoCuadrasDePunto0Provincia))
	}

	@Test
	def void estaCercaDeUnPuntoSilaDistanciaEsIgualAlPuntoDelBanco() {
		Assert.assertTrue(provincia.estaCerca(punto0Provincia))
	}

	@Test
	def void estaDisponibleSiElMomentoIngresadoEstaDentroDelHorarioDeAtencion() {
		Assert.assertTrue(provincia.estaDisponible(viernes1100))
	}

//	@Test
//	def void noEstaDisponibleSiElDiaDelMomentoIngresadoNoEstaDentroDelHorarioDeAtencion() {
//		Assert.assertFalse(provincia.estaDisponible(sabado1230))
//	}

	@Test
	def void noEstaDisponibleSiElHorarioDelMomentoIngresadoNoEstaDentroDelHorarioDeAtencion() {
		Assert.assertFalse(piano.estaDisponible(martes1545))
	}

	@Test
	def void matcheoDeSucursalDeBancoConLasPrimerasLetrasDelNombreDelBancoAlQuePertence() {
		Assert.assertTrue(rioDelPlata.matchearPoi("Ri"))
	}

	@Test
	def void matcheoDeSucursalDeBancoConLasPrimerasPalabrasDelNombreDelBancoAlQuePertence() {
		Assert.assertTrue(rioDelPlata.matchearPoi("Rio Del"))
	}

	@Test
	def void matcheoDeSucursalDeBancoConElNombreExactoDelBancoAlQuePertence() {
		Assert.assertTrue(rioDelPlata.matchearPoi("Rio Del Plata"))
	}

	@Test
	def void matcheoDeSucursalDeBancoConLasPrimerasLetrasOPalabrasDelNombreDelBancoAlQuePertenceSinImportarMayusculasOMinusculas() {
		Assert.assertTrue(rioDelPlata.matchearPoi("RiO dEl Plata"))
	}

	@Test
	def void noHayMatcheoDeSucursalDeBancoSiSeIngresaParteDeLasLetrasDelNombreDelBanco() {
		Assert.assertFalse(rioDelPlata.matchearPoi("io Del Plata"))
	}

	@Test
	def void matcheoDeSucursalDeBancoConNombreDelBancoYBarrioExacto() {
		Assert.assertTrue(piano.matchearPoi("Piano San Martin"))
	}

	@Test
	def void noHayMatcheoDeSucursalDeBancoSiElNombreDelBancoYElBarrioNoSonExactos() {
		Assert.assertFalse(ciudad.matchearPoi("Ciudad San Mar"))
	}

}
	