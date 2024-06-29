object puenteDeBrooklyng{
	
	method puedePasar(mensajero){
		return mensajero.peso() <= 1000
	}
	
}

object matrix{
	
	method puedePasar(mensajero){
		return mensajero.puedeLlamar()
	}
	
}

//VEHICULOS
object bicicleta{
	
	method peso() { return 5 }
}

object camion{
	
	method peso() { return 500 }
}

//MENSAJEROS
object roberto{
	
	var estaViajandoEn = bicicleta
	
	method peso() { return 90 + estaViajandoEn.peso() }
	method puedeLlamar() { return false }
	method cambiarVehiculo() { estaViajandoEn = if (estaViajandoEn.equals(bicicleta)) camion else bicicleta }
	method puedeEntregar(paquete, destino) { return paquete.estaPago() and destino.puedePasar(self) }
}

object chuckNorris{
	
	method peso() { return 80 }
	method puedeLlamar() { return true }
	method puedeEntregar(paquete, destino) { return paquete.estaPago() and destino.puedePasar(self) }
	
}

object neo{
	
	var tieneCredito = true
	
	method peso() { return 0 }
	method puedeLlamar() { return tieneCredito }
	method cambiarEstadoDeCredito() { tieneCredito = !tieneCredito }
	method puedeEntregar(paquete, destino) { return paquete.estaPago() and destino.puedePasar(self) }
	
}

//EMPRESA DE MENSAJERIA
object empresaDeMensajeria{
	
	const mensajeros = [roberto, chuckNorris, neo]
	
	method contratar(mensajero) { mensajeros.add(mensajero) }
	method despedir(mensajero) { mensajeros.remove(mensajero) }
	method despedirATodos() { mensajeros.clear() }
	method esGrande() { return mensajeros.size() > 2 }
	method elPrimerMensajeroPuedeEntregar(paquete, destino) { return mensajeros.frist().puedeEntregar(paquete, destino) }
	method pesoDelUltimoMensajero() { return mensajeros.last().peso() }
	
}

object paquete{
	
	var estaPago = true
	
	method estaPago() { return estaPago }
	method cambiarEstadoDePago() { estaPago = !estaPago }
	method loPuedeLlevar(mensajero) { return true }
	
}

object paquetito{
	
	method estaPago() { return true }
	method loPuedeLlevar(mensajero) { return true }
}

object paquetonViajero{
	
	var estaPago = true
	
	method estaPago() { return estaPago }
	method cambiarEstadoDePago() { estaPago = !estaPago }
	method loPuedeLlevar(mensajero) { return mensajero.puedeEntregar(self, puenteDeBrooklyng) and mensajero.puedeEntregar(self, matrix) }
	
}





