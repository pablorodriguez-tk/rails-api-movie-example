# README

Requisitos de modelo planteados

### Usuario:

- Nombre
- documento (si es internacional la persona tenemos el pasporte o DNI o cedula)
- Tipo documento
- Fecha de nacimiento
- Validen el formato de la cedula (si el tipo de documento es cedula)
- Usuarios tiene que tener mas de 18 años
- Opcional: Hacer diferentes tipos de usuarios (STI)

### Peliculas:

- Titulo
- Genero
- Fecha de release
- Calificacion
- Reparto -> Relacion con los usuarios
- Director -> Relacion con usuarios (Las peliculas tienen un solo director)
- Relacion -> Source
- Quiero poder filtrar por genero (Movie.action)

### Source:

- Formato
- Ubicacion
- Duracion
- Relacion con pelicula (1-1)

Ademas
Modificar las peliculas para que genero sea un array de genero donde cada genero puede ser uno de [action, drama, comedia, ciencia ficcion, historico, terror, suspenso, fantasia]
Que los generos sean simbolos
