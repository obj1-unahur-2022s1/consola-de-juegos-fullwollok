import wollok.game.*
import individuos.*
import direcciones.*
import musica.*
import bombas.* 
import elementos.*
import nivel.*
import consola.*


class Juego{
	var property position = null
	var property color = 'Violeta'

	method iniciar(){
		game.addVisual(object{method position()= game.center() method text() = "Juego "+color + " - <q> para salir"})
	}
	
	method terminar(){}
	method image() = "juego" + color + ".png"
}
object juegoBomberman inherits Juego{

	override method iniciar(){
		game.title("Bomberman")
		game.height(13)
		game.width(21)		
		game.ground('pasto.jpg')
		game.addVisualIn(pantallaDeInicio,game.at(0,0))
		pantallaDeInicio.iniciarAnimacion()
		keyboard.enter().onPressDo({nivel1.configuracion()})  
		keyboard.p().onPressDo({pantallaDeInicio.volverAConsola()}) 
		keyboard.p().onPressDo({pantallaDePerder.volverAConsola()}) 
		keyboard.p().onPressDo({pantallaDeVictoria.volverAConsola()})
		
		

	}
}
