import comidas.*

class Comensal {

	var property comidas = []
	var property peso = 0

	method leAgrada(unaComida)

	method satisfecho() {
		return comidas.sum({i=>i.peso()}) >= self.peso() * 0.01
	}

	method comer(comida) {
		comidas.add(comida)
	}

	method comidadQueComio() {
		return self.comidas()
	}

}

class ComensalVegetariano inherits Comensal{
	override method leAgrada(unaComida){
		return unaComida.esAptoVegetariano() && unaComida.valoracion() > 85
	}

	override method satisfecho(){
		return super() && self.ningunaComidaEsAbundante()
	}
	
	method ningunaComidaEsAbundante(){
		return comidas.all({i=> not i.esAbundante()})
	}
}
class ComensalPopular inherits Comensal{
	override method leAgrada(unaComida){
		return unaComida.esAbundante()
	}
}
class ComensalPaladarFino  inherits Comensal{
	override method leAgrada(unaComida){
		return unaComida.peso().between(150,300) && unaComida.valoracion() > 100
	}
}
