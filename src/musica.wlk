import wollok.game.*
import juego.*
import individuos.*
import direcciones.*
import bombas.* 
import elementos.*
import nivel.*
import consola.*

object musicaNivel{     
	var property ost = game.sound("StageTheme.mp3")      
	
	method initialize() {
		ost.play()
	}          
	method play(){         
		ost.shouldLoop(true)         
		game.schedule(500, { ost.volume(1)} )
	}    
	 method stop(){         
	 	ost.volume(0)
	 }
}
object musicaFinal{
	var property ost = game.sound("victheme.mp3")

	method play(){
		ost.shouldLoop(true)
		game.schedule(500, { ost.play()} )
	}
	method stop(){
		ost.stop()
	}
}


object musicaPerder{
	var property ost = game.sound("loseTheme.mp3")

	method play(){
		ost.shouldLoop(true)
		game.schedule(500, { ost.play()} )
	}
	method stop(){
		ost.stop()
	}
}