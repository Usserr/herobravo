# encoding: UTF-8

# Tirada de dados, Sigmar
def dado_sigmar
  # Returns a random dice-face string
  %w(hammer comet plus blank eagle eagle)[rand(6)]
end

# Tirada de dados, 2d6 del tesoro, individual
def dado_tesoro
  # Returns a value from 1 to 6 (normal dice)
  rand(6) + 1
end

# Main method 2d6 + Sigmar dice
def tesoro(sigmar, dado1, dado2)
  # 12 values (2d6) ordered
  valores = %w(pifia vacia maldición trampa monstruo oro
               perg pot comida alijo cofre)
  # Requests (send) a method, named equals to the values. 
  send(valores[dado1 + dado2 - 2], sigmar, dado1, dado2)
end

# Resultados dependiendo de Sigmar
# --------------------------------

def pifia(sigmar, _dado1, _dado2) # 2
  # Returns a string with the pifia type
  if sigmar == 'eagle' # This is the epic result
    'Tropiezas y pierdes 1PC. A pesar de tu torpeza,
     te levantas disimuladamente...'
  else
    "Tropiezas y pierdes 1PC forma patética."
  end
end

def vacia(sigmar, _dado1, _dado2) # 3
  if sigmar == 'hammer' # You can keep searching.
    "La sala está vacía pero aún se pueden buscar tesoros"
  else
    "La sala está vacía y no se podrá rebuscar más."
  end
end

def maldición(sigmar, dado1, dado2) # 4
  doble = dado1 == dado2 # special condition
  case sigmar
  when 'eagle'  then
    "Maldición: #{doble ? 'Legañas: Tu siguiente tirada de ataque causará daños      a la miniatura más cercana' : 'Hirsutismo: -1 Reputación salvo enanos'} "
  when 'plus'   then
    "Maldición: #{doble ? 'Indispuesto: Tu siguiente hechizo o tirada de
     defensa fallará' : 'Alopecia: -1 Reputación si eres enano o mujer.'} "
  when 'blank'  then
    "Maldición: #{doble ? 'Patán: Tu siguiente tirada de tesoros tirará un dado
     menos' : 'Yuyu: En un momento dado, el MB puede hacer repetir 1d6.'} "
  when 'hammer' then
    "Maldición: #{doble ? 'Masoquismo: Golpéate sin armas con cada 1 que saques
    hasta el final del reto' : 'Alopecia: -1 Reputación si eres enano o
    mujer.'} "
  when 'comet'  then
    "Maldición: #{doble ? 'Mirado por un tuerto: El oro que obtengas en
     adelante, es falso.' : 'Infortunio: El MB podrá hacer repetir una tirada
     cualquiera.'} "
  end
end

def trampa(sigmar, _dado1, _dado2) # 5
  case sigmar
  when 'eagle'  then 'trampa de flecha'
  when 'plus'   then 'trampa de foso'
  when 'blank'  then 'trampa de veneno'
  when 'hammer' then 'trampa de roca'
  when 'comet'  then 'trampa de hacha'
  end
end

def monstruo(sigmar, _dado1, _dado2) # 6
  case sigmar
  when 'eagle'  then 'monstruo errante lento'
  when 'plus'   then 'monstruo errante rápido'
  else 'monstruo errante'
  end
end

def oro(sigmar, _dado1, _dado2) # 7
  s = %w(eagle plus blank hammer comet)
  r = %w(50    35   10    25     60)
  r[s.index(sigmar)] + ' piezas de oro' # Gold coins
end

def perg(sigmar, _dado1, _dado2) # 8
  case sigmar
  when 'eagle'  then 'pergamino: doble'
  when 'plus'   then 'pergamino: documentos'
  when 'blank'  then 'pergamino: blanco'
  when 'hammer' then 'pergamino: básico'
  when 'comet'  then 'pergamino: arcano'
  end
end

def pot(sigmar, _dado1, _dado2) # 9
  s = %w(eagle    plus        blank  hammer    comet)
  r = %w(curación resistencia fuerza velocidad héroes)
  "poción de #{r[s.index(sigmar)]}"
end

def comida(sigmar, _dado1, _dado2) # 10
  s = %w(eagle plus     blank   hammer comet)
  r = %w(asado manzanas podrida agua   sidra)
  "comida: #{r[s.index(sigmar)]}"
end

def alijo(sigmar, _dado1, _dado2) # 11
  case sigmar
  when 'eagle'  then 'gema: ' + gema(rand(1..47)).name
  when 'plus'   then 'runa: ' + runa(rand(1..11)).name
  when 'blank'  then 'gema: estropeada'
  when 'hammer' then 'gema: ' + gema(rand(1..47)).name
  when 'comet'  then 'joya: ' + joya(rand(1..11)).name
  end
end

def cofre(sigmar, _dado1, _dado2) # 12
  case sigmar
  when 'eagle'  then gema(rand(0..47)).name + ' + ' + gema(rand(1..47)).name
  when 'plus'   then joya(rand(0..11)).name + ' + ' + joya(rand(1..11)).name
  when 'blank'  then runa(rand(0..11)).name + ' + ' + runa(rand(1..11)).name
  when 'hammer' then 'objeto'
  when 'comet'  then 'artefacto'
  end
end
