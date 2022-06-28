import wollok.game.*
import juego.*
import individuos.*
import direcciones.*
import musica.*
import bombas.* 
import nivel.*
import consola.*

class Elemento{

	method chocarConIndividuo(quien){
		quien.chocarPared()}
	
	method explotar(){}
}

class Ladrillo inherits Elemento{
	var property position
	var property image = 'ladrillo.png'
	var property tienePuertaASiguienteNivel = false
	

	override method explotar(){
		image = "explosion.png"
		game.onTick(500, "Explosion",{self.removerExplosion()})
	}
	
	
	
	method removerExplosion(){
		if(not tienePuertaASiguienteNivel){
			game.removeVisual(self)
			game.removeTickEvent("Explosion")
		}
		else{
			game.removeVisual(self)
			game.removeTickEvent("Explosion")
			self.crearPuerta()
		}
		
	}
	
	method crearPuerta(){
		puerta.position(position)
		game.addVisual(puerta)
	}
	
}


class Bloque inherits Elemento{
	var property position
	var property image = 'piedra.jpg'


}

object puerta inherits Elemento{
	var property position = null
	var property image = 'puerta.png'
	
	override method chocarConIndividuo(quien){
		if(quien==protagonista){quien.pasarDeNivel()}
	}

}



object paredesBorde {
	var property posDeBloquesBordes = []	

	method agregarBloquesDelBorde(){
		(game.width()).times{i=>posDeBloquesBordes.add(new Bloque(
							position=new Position(x=i-1,y=0)))
							game.addVisual(posDeBloquesBordes.last())}
		(game.width()-1).times{i=>posDeBloquesBordes.add(new Bloque(
							position=new Position(x=i,y=game.height()-1)))
							game.addVisual(posDeBloquesBordes.last())}
		(game.height()-1).times{i=>posDeBloquesBordes.add(new Bloque(
							position=new Position(x=0,y=i)))
							game.addVisual(posDeBloquesBordes.last())}
		(game.height()-1).times{i=>posDeBloquesBordes.add(new Bloque(
							position=new Position(x=game.width()-1,y=i)))
							game.addVisual(posDeBloquesBordes.last())}		
		}		
}
		
object corazones{	
	var property position = game.at(0,0)
	var property image = '3_corazones.png'
	
	method cambiarACorazones2(){
		image='2_corazones.png'
	}
	
	method cambiarACorazones1(){
		image='1_corazon.png'
	}
	method agregarCorazones(){
		game.addVisual(self)
	}
	
}



object paredesNivel1 {
	var property posDeBloquesMedio = [game.at(2,2),game.at(2,4),game.at(2,6),game.at(2,8),game.at(2,10),game.at(2,12),
									  game.at(4,2),game.at(4,4),game.at(4,6),game.at(4,8),game.at(4,10),game.at(4,12),
									  game.at(6,2),game.at(6,4),game.at(6,6),game.at(6,8),game.at(6,10),game.at(6,12),
									  game.at(8,2),game.at(8,4),game.at(8,6),game.at(8,8),game.at(8,10),game.at(8,12),
									  game.at(10,2),game.at(10,4),game.at(10,6),game.at(10,8),game.at(10,10),game.at(10,12),
									  game.at(12,2),game.at(12,4),game.at(12,6),game.at(12,8),game.at(12,10),game.at(12,12),
									  game.at(14,2),game.at(14,4),game.at(14,6),game.at(14,8),game.at(14,10),game.at(14,12),
									  game.at(16,2),game.at(16,4),game.at(16,6),game.at(16,8),game.at(16,10),game.at(16,12),
									  game.at(18,2),game.at(18,4),game.at(18,6),game.at(18,8),game.at(18,10),game.at(18,12),
									  game.at(20,2),game.at(20,4),game.at(20,6),game.at(20,8),game.at(20,10),game.at(20,12),
									  game.at(22,2),game.at(22,4),game.at(22,6),game.at(22,8),game.at(22,10),game.at(22,12)]
									  
	var property posLadrillos = [game.at(1,3),game.at(4,1),game.at(5,3), game.at(5,6),game.at(11,9),game.at(5,11),game.at(4,5),
								game.at(4,7),game.at(9,4),game.at(6,1),game.at(13,2),game.at(15,2),	game.at(14,1),game.at(3,2),
							game.at(1,7),game.at(1,9),game.at(2,11),game.at(8,11),game.at(9,10),game.at(6,11),game.at(9,1),
							game.at(7,2),game.at(7,4),game.at(7,5),game.at(3,4),game.at(3,6),game.at(3,10),game.at(7,8),
							game.at(11,11),game.at(12,11),game.at(13,11),game.at(13,8),game.at(13,6),game.at(11,8),game.at(11,4),
								game.at(11,2),game.at(11,1),game.at(19,11),game.at(19,10),game.at(17,11),game.at(16,1),game.at(15,8),
								game.at(15,11),game.at(19,1),game.at(19,2),game.at(19,3),game.at(17,7),game.at(18,7),game.at(19,5)]


	method agregarLadrillos(){
		self.posLadrillos().forEach{p=>game.addVisual(new Ladrillo(position=p,image='ladrillo.png'))}}
		
	method agregarBloquesDelMedio(){
		self.posDeBloquesMedio().forEach{p=>game.addVisual(new Bloque(position=p))}}
	
	method agregarPuertaASiguienteNivel(){
		game.getObjectsIn(posLadrillos.anyOne()).forEach{l => l.tienePuertaASiguienteNivel(true)}
	}
}


object paredesNivel2 {
	var property posDeBloquesMedio = [game.at(2,2),game.at(2,4),game.at(2,6),game.at(2,8),game.at(2,10),game.at(2,12),
									  game.at(4,2),game.at(4,4),game.at(4,6),game.at(4,8),game.at(4,10),game.at(4,12),
								      game.at(6,2),game.at(6,4),game.at(6,6),game.at(6,8),game.at(6,10),game.at(6,12),
									  game.at(8,2),game.at(8,4),game.at(8,6),game.at(8,8),game.at(8,10),game.at(8,12),
									  game.at(10,2),game.at(10,4),game.at(10,6),game.at(10,8),game.at(10,10),game.at(10,12),
									  game.at(12,2),game.at(12,4),game.at(12,6),game.at(12,8),game.at(12,10),game.at(12,12),
									  game.at(14,2),game.at(14,4),game.at(14,6),game.at(14,8),game.at(14,10),game.at(14,12),
									  game.at(16,2),game.at(16,4),game.at(16,6),game.at(16,8),game.at(16,10),game.at(16,12),
									  game.at(18,2),game.at(18,4),game.at(18,6),game.at(18,8),game.at(18,10),game.at(18,12),
									  game.at(20,2),game.at(20,4),game.at(20,6),game.at(20,8),game.at(20,10),game.at(20,12),
									  game.at(22,2),game.at(22,4),game.at(22,6),game.at(22,8),game.at(22,10),game.at(22,12)]
									  
	var property posLadrillos = [game.at(1,3) ,game.at(2,11),game.at(8,11),game.at(9,10),game.at(6,11),game.at(9,1),
							game.at(7,2),game.at(7,4),game.at(7,5),game.at(3,4),game.at(3,6),game.at(3,10),game.at(7,8),
								game.at(11,11),game.at(12,11),game.at(13,11),game.at(13,8),game.at(13,6),game.at(11,8),game.at(11,4),
								game.at(11,2),game.at(11,1),game.at(19,11),game.at(19,10),game.at(17,11),game.at(16,1),game.at(15,8),
								game.at(15,11),game.at(19,1),game.at(19,2),game.at(19,3),game.at(17,7),game.at(18,7),game.at(19,5)]


	method agregarLadrillos(){
		self.posLadrillos().forEach{p=>game.addVisual(new Ladrillo(position=p,image='ladrillo.png'))}}
		
	method agregarBloquesDelMedio(){
		self.posDeBloquesMedio().forEach{p=>game.addVisual(new Bloque(position=p))}}
	
	method agregarPuertaASiguienteNivel(){
		game.getObjectsIn(posLadrillos.anyOne()).forEach{l => l.tienePuertaASiguienteNivel(true)}
	}
}

object paredesNivel3 {
	var property posDeBloquesMedio = [game.at(2,2),game.at(2,4),game.at(2,6),game.at(2,8),game.at(2,10),game.at(2,12),
									  game.at(4,2),game.at(4,4),game.at(4,6),game.at(4,8),game.at(4,10),game.at(4,12),
								      game.at(6,2),game.at(6,4),game.at(6,6),game.at(6,8),game.at(6,10),game.at(6,12),
									  game.at(8,2),game.at(8,4),game.at(8,6),game.at(8,8),game.at(8,10),game.at(8,12),
									  game.at(10,2),game.at(10,4),game.at(10,6),game.at(10,8),game.at(10,10),game.at(10,12),
									  game.at(12,2),game.at(12,4),game.at(12,6),game.at(12,8),game.at(12,10),game.at(12,12),
									  game.at(14,2),game.at(14,4),game.at(14,6),game.at(14,8),game.at(14,10),game.at(14,12),
									  game.at(16,2),game.at(16,4),game.at(16,6),game.at(16,8),game.at(16,10),game.at(16,12),
									  game.at(18,2),game.at(18,4),game.at(18,6),game.at(18,8),game.at(18,10),game.at(18,12),
									  game.at(20,2),game.at(20,4),game.at(20,6),game.at(20,8),game.at(20,10),game.at(20,12),
									  game.at(22,2),game.at(22,4),game.at(22,6),game.at(22,8),game.at(22,10),game.at(22,12)]
									  
	var property posLadrillos = [game.at(1,6), game.at(13,6),game.at(11,8),game.at(11,4),
								game.at(11,2),game.at(11,1),game.at(19,11),game.at(19,10),game.at(17,11),game.at(16,1),game.at(15,8),
								game.at(15,11),game.at(19,1),game.at(19,2),game.at(19,3),game.at(17,7),game.at(18,7),game.at(19,5)]


	method agregarLadrillos(){
		self.posLadrillos().forEach{p=>game.addVisual(new Ladrillo(position=p,image='ladrillo.png'))}}
		
	method agregarBloquesDelMedio(){
		self.posDeBloquesMedio().forEach{p=>game.addVisual(new Bloque(position=p))}}
	
	method agregarPuertaASiguienteNivel(){
		game.getObjectsIn(posLadrillos.anyOne()).forEach{l => l.tienePuertaASiguienteNivel(true)}
	}
}
