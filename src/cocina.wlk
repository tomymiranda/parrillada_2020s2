import comidas.*
import comensales.*

class Cocina {

	var property comidasEnLaParrilla = []

	method agregarComidaAlaParrilla(comida) {
		comidasEnLaParrilla.add(comida)
	}

	method cantidadDeComidasCarnivoras() {
		return comidasEnLaParrilla.count({ i => not i.esAptoVegetariano() })
	}

	method cantidadDeComidadVegetarianas() {
		return comidasEnLaParrilla.count({ i => i.esAptoVegetariano() })
	}

	method tieneBuenaOfertaVegetariana() {
		return (self.cantidadDeComidasCarnivoras() - self.cantidadDeComidadVegetarianas()).abs() <= 2
	}

	method platoFuerteCarnivoro() {
		return self.platosCarnivoros().max({ i => i.valoracion() })
	}

	method platosCarnivoros() {
		return comidasEnLaParrilla.filter({ i => not i.esAptoVegetariano() })
	}

	method comidadQueLeGustan(comensal) {
		return comidasEnLaParrilla.filter({ i => comensal.leAgrada(i) })
	}

	method elegirPlato(comensal){
		const comidaElegida = self.comidadQueLeGustan(comensal).anyOne()
		if(!comidaElegida.equals(null)){
			comensal.comer(comidaElegida)
			comidasEnLaParrilla.remove(comidaElegida)
		}else{
			self.error("no le gusta ninguna comida de la parrilla")
		}
	}
}

