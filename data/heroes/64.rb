# encoding: UTF-8
def h64
  {
    id:          64,
    name:        'Damm',
    personaje:   'hechicero',
    jugador:     'Alberto',
    ciudad:      'Kellen',
    nivel:       2,
    cuerpo:      4,
    mente:       7,
    mov:         7,
    skills:      [0, 1],
    armadura:    { id: 1, ranuras: 1 },
    armas:       [
      { id: 3 },
      { id: 4, enchants: [51, 51] }
    ],
    protecciones: [{ id: 1, ranuras: 1 }]
  }
end
