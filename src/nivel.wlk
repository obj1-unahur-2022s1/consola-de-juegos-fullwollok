import wollok.game.*
import juego.*
import individuos.*
import direcciones.*
import musica.*
import bombas.* 
import elementos.*
import consola.*


object pantallaDeInicio{
	var imagen = false
	method iniciarAnimacion(){
		game.onTick(250,"Animacion del menu",{self.cambiar()})
	}
	method terminarAnimacion(){
		game.removeTickEvent("Animacion del menu")
	}
	method cambiar(){
		if(imagen)
			imagen = false
		else
			imagen = true
	}
	method image() {
		if(imagen)
			return "bombermanInicioEnter.png"
		else
			return "bombermanInicio.png"
	}
}

object pantallaDePerder{

	var imagen = true
	method iniciarAnimacion(){
		game.onTick(250,"Animacion del derrota",{self.image()})
	}

	method image(){return "perder.jpg"	}

}
	


object pantallaDeVictoria{
	var imagen = false
	method iniciarAnimacion(){
		game.onTick(250,"Animacion del victoria",{self.cambiar()})
	}
	method terminarAnimacion(){
		game.removeTickEvent("Animacion del victoria")
	}
	method cambiar(){
		if(imagen)
			imagen = false
		else
			imagen = true
	}
	method image(){
		if(imagen)
			return "victoria.png"
		else
			return "victoria2.png"
	}
}


class Nivel{

	method keyboard(){
	keyboard.space().onPressDo {protagonista.tirarBomba()}
	}
	
	method configuracion() {
		game.clear()
		direcciones.movBomberman(protagonista)
		paredesBorde.agregarBloquesDelBorde()
		corazones.agregarCorazones()
		self.individuos()
		self.keyboard()
	}
	
	method individuos(){}
	
}


object nivel1 inherits Nivel {
	var ene1 = new Enemigo(image='enem1.png')
	var ene2 = new Enemigo(image='enem1.png')
	var ene3 = new Enemigo(image='enem1.png')
	var ene4 = new Enemigo(image='enem1.png')
	var ene5 = new Enemigo(image='enem1.png')
	
	override method configuracion() {
		super()
		paredesNivel1.agregarBloquesDelMedio()
		paredesNivel1.agregarLadrillos()
		paredesNivel1.agregarPuertaASiguienteNivel()
		game.whenCollideDo(protagonista,{elemento=>elemento.chocarConIndividuo(protagonista)})
		game.whenCollideDo(ene1,{elemento=>elemento.chocarConIndividuo(ene1)})
		game.whenCollideDo(ene2,{elemento=>elemento.chocarConIndividuo(ene2)})
		game.whenCollideDo(ene3,{elemento=>elemento.chocarConIndividuo(ene3)})
		game.whenCollideDo(ene4,{elemento=>elemento.chocarConIndividuo(ene4)})
		game.whenCollideDo(ene5,{elemento=>elemento.chocarConIndividuo(ene5)})
		game.whenCollideDo(protagonista,{enemigo => protagonista.chocarConIndividuo(enemigo) })
		game.onTick(600,"mover enemigo",{ene1.moverse()})	
		game.onTick(600,"mover enemigo",{ene2.moverse()})	
		game.onTick(600,"mover enemigo",{ene3.moverse()})	
		game.onTick(600,"mover enemigo",{ene4.moverse()})	
		game.onTick(600,"mover enemigo",{ene5.moverse()})	
		}

	override method individuos(){
		protagonista.position(game.at(1,1))
		game.addVisual(protagonista)
		game.addVisual(ene1)
		ene1.position(game.at(6, 3))
		game.addVisual(ene2)
		ene2.position(game.at(9, 5))
		game.addVisual(ene3)
		ene3.position(game.at(10, 7))
		game.addVisual(ene4)
		ene4.position(game.at(2, 9))
		game.addVisual(ene5)
		ene5.position(game.at(16, 9))
	}
}

object nivel2 inherits Nivel {
	var ene1 = new Enemigo(image='enem2.png')
	var ene2 = new Enemigo(image='enem2.png')
	var ene3 = new Enemigo(image='enem2.png')
	var ene4 = new Enemigo(image='enem2.png')
	var ene5 = new Enemigo(image='enem2.png')
	
	override method configuracion() {
		super()
		paredesNivel2.agregarBloquesDelMedio()
		paredesNivel2.agregarLadrillos()
		paredesNivel2.agregarPuertaASiguienteNivel()
		game.whenCollideDo(protagonista,{elemento=>elemento.chocarConIndividuo(protagonista)})
		game.whenCollideDo(ene1,{elemento=>elemento.chocarConIndividuo(ene1)})
		game.whenCollideDo(ene2,{elemento=>elemento.chocarConIndividuo(ene2)})
		game.whenCollideDo(ene3,{elemento=>elemento.chocarConIndividuo(ene3)})
		game.whenCollideDo(ene4,{elemento=>elemento.chocarConIndividuo(ene4)})
		game.whenCollideDo(ene5,{elemento=>elemento.chocarConIndividuo(ene5)})
		game.whenCollideDo(protagonista,{enemigo => protagonista.chocarConIndividuo(enemigo) })
		game.onTick(500,"mover enemigo",{ene1.moverse()})	
		game.onTick(500,"mover enemigo",{ene2.moverse()})	
		game.onTick(500,"mover enemigo",{ene3.moverse()})	
		game.onTick(500,"mover enemigo",{ene4.moverse()})	
		game.onTick(500,"mover enemigo",{ene5.moverse()})	
		}

	override method individuos(){
		protagonista.position(game.at(1,1))
		game.addVisual(protagonista)
		game.addVisual(ene1)
		ene1.position(game.at(6, 3))
		game.addVisual(ene2)
		ene2.position(game.at(9, 5))
		game.addVisual(ene3)
		ene3.position(game.at(10, 7))
		game.addVisual(ene4)
		ene4.position(game.at(2, 9))
		game.addVisual(ene5)
		ene5.position(game.at(16, 9))
	}
}









object nivel3 inherits Nivel {
	var ene1 = new Enemigo(image='enem3.png')
	var ene2 = new Enemigo(image='enem3.png')
	var ene3 = new Enemigo(image='enem3.png')
	var ene4 = new Enemigo(image='enem3.png')
	var ene5 = new Enemigo(image='enem3.png')
	
	override method configuracion() {
		super()
		paredesNivel3.agregarBloquesDelMedio()
		paredesNivel3.agregarLadrillos()
		paredesNivel3.agregarPuertaASiguienteNivel()
		game.whenCollideDo(protagonista,{elemento=>elemento.chocarConIndividuo(protagonista)})
		game.whenCollideDo(ene1,{elemento=>elemento.chocarConIndividuo(ene1)})
		game.whenCollideDo(ene2,{elemento=>elemento.chocarConIndividuo(ene2)})
		game.whenCollideDo(ene3,{elemento=>elemento.chocarConIndividuo(ene3)})
		game.whenCollideDo(ene4,{elemento=>elemento.chocarConIndividuo(ene4)})
		game.whenCollideDo(ene5,{elemento=>elemento.chocarConIndividuo(ene5)})
		game.whenCollideDo(protagonista,{enemigo => protagonista.chocarConIndividuo(enemigo) })
		game.onTick(200,"mover enemigo",{ene1.moverse()})	
		game.onTick(200,"mover enemigo",{ene2.moverse()})	
		game.onTick(200,"mover enemigo",{ene3.moverse()})	
		game.onTick(200,"mover enemigo",{ene4.moverse()})	
		game.onTick(200,"mover enemigo",{ene5.moverse()})	
		}

	override method individuos(){
		protagonista.position(game.at(1,1))
		game.addVisual(protagonista)
		game.addVisual(ene1)
		ene1.position(game.at(6, 3))
		game.addVisual(ene2)
		ene2.position(game.at(9, 5))
		game.addVisual(ene3)
		ene3.position(game.at(10, 7))
		game.addVisual(ene4)
		ene4.position(game.at(2, 9))
		game.addVisual(ene5)
		ene5.position(game.at(16, 9))
	}
}

