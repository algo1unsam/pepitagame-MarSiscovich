import extras.*
import wollok.game.*

object pepita {

	var property energia = 150
	var property position = game.origin()

	method image() {
		return if (self.estaEnElNido()){ "pepita-grande.png" 
		}else if (self.esAtrapada() or self.estaCansada()){
		"pepita-gris.png"
		} else "pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method vola(kms) {
		energia -= kms * 9
	}

	method irA(nuevaPosicion) {
		if(not self.estaCansada() and self.rango(nuevaPosicion)){
			self.vola(position.distance(nuevaPosicion))
			position = nuevaPosicion	
		}else if (self.estaCansada()){
			game.stop()
		}
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}

	method rango(nuevaPosicion){
		return nuevaPosicion.x().between(0,9) and nuevaPosicion.y().between(0,9)
	}

	method estaEnElSuelo() {
		return position.y() == 0 

	}

	method esAtrapada() = self.position() == silvestre.position()

}

