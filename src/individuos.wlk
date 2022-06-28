import wollok.game.*
import juego.*
import direcciones.*
import musica.*
import bombas.* 
import elementos.*
import nivel.*
import consola.*

class Individuos{

	method morir(){
		game.removeVisual(self)
	}
	
	method perderVida()

	method chocarPared(){}
	
	method explotar()
	
}


object protagonista inherits Individuos{
	var property image = "bombermanDerecha.png"
	var property position = game.at(1,1)
	var property vidas=3
	var property direccion = null
	var property nivel = 1
	
	method volverAlInicio(){
		position = game.at(1, 1)
		game.addVisual(self)
	}

	
	method tirarBomba(){
		const bomba = new Bomba(position=self.position().clone(),image = 'bomba.png')
		if(position!=game.at(1,1)){
			game.addVisual(bomba)
			bomba.spawn()}
		}

	method chocarConEnemigo(enemigo){
		self.perderVida()		
	}
	
	override method chocarPared(){
		direcciones.chocar(self, direccion)
	}

	override method explotar(){
		self.perderVida()
	}
	
	method decirCantVidas(){
		game.say(self,vidas.toString())
	}
	
	override method perderVida(){
		vidas = vidas - 1
		game.removeVisual(self)
		game.schedule(510,{ => self.volverAlInicio() })
		if(vidas == 2){
			corazones.cambiarACorazones2()
		}
		else if(vidas == 1){
			corazones.cambiarACorazones1()
		}
		else{
			game.clear()
			musicaNivel.stop()
			musicaPerder.play()
			game.addVisualIn(pantallaDePerder,game.at(0,0))	}
			pantallaDePerder.iniciarAnimacion()
			
	}
	
	method chocarConIndividuo(enemigo){
		self.perderVida()
	}
	
	method pasarDeNivel(){
		if(nivel==1){
			nivel=2
			nivel2.configuracion()}
		else if(nivel==2){
			nivel=3
			nivel3.configuracion()}
		else if(nivel==3){
			musicaNivel.stop()
			musicaFinal.play()
			game.clear()
			game.addVisualIn(pantallaDeVictoria,game.at(0,0))
			pantallaDeVictoria.iniciarAnimacion()
		}
	}
	

}



class Enemigo inherits Individuos{
	var property position = null
	var property image
	var property direccion = izquierda
	const sentidos = [ izquierda, derecha, arriba, abajo ]

	method cambiarDireccion() {
		direccion = sentidos.get(0.randomUpTo(3))
	}
	
	method direcciones(num) {
		return sentidos.get(num)
	}
	
	override method chocarPared(){
		direcciones.chocar(self, direccion)
		direccion = direccion.alChocar()
	}
	
	method moverse() {
		direcciones.move(direccion, self)
	}
	
	method chocarConIndividuo(prota){}
	
	override method explotar(){
		self.perderVida()
	}
	
	override method perderVida(){
		self.morir()
	}
}
	


