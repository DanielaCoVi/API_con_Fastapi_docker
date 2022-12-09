# *DATA ENGINEERING*

## Proyecto Individual

Rol: *Data Engineer*

![Regla_Empírica](https://dbibyhavas.io/es/wp-content/uploads/sites/5/2018/11/team-2.png)


Consigna: 
 
 La idea de este proyecto es que el alumno logre internalizar los conocimientos requeridos para la elaboración y ejecución de una API.

 ---

## *PUNTO DE PARTIDA*

---
El proyecto consiste en realizar una ingesta de datos desde diversas fuentes, posteriormente aplicar las transformaciones que consideren pertinentes, y luego disponibilizar los datos limpios para su consulta a través de una API. Esta API deberán construirla en un entorno virtual dockerizado.

---

## *NUESTRAS CONSIGNAS*

---

Las consultas a realizar son:

 - Máxima duración según tipo de film (película/serie), por plataforma y por año: El request debe ser: get_max_duration(año, plataforma, [min o season])

 - Cantidad de películas y series (separado) por plataforma El request debe ser: get_count_plataform(plataforma)

 - Cantidad de veces que se repite un género y plataforma con mayor frecuencia del mismo. El request debe ser: get_listedin('genero')
Como ejemplo de género pueden usar 'comedy', el cuál deberia devolverles un cunt de 2099 para la plataforma de amazon.


 --->
 --->
  --->

## *Realizando el EDA y ETL*

 Revisamos por primera vez los datos que nos llegan y vamos viendo ***“¿de qué se trata?”***, vamos encontrando posibles patrones y reconociendo que data nos puede ser útil en nuestra consigna.

 - Hemos utilizado la libreria *pandas* y el visualizador *Visual Studio Code*

 - Leemos cada dataset con la libreria (en este caso .csv y .json) y asi logramos la unificación de datos.
 
 - Al detallar los Dataframes de las 4 plataformas.

    > ## Hallamos:
    
    > La mismma cantidad de columnas con el mismo tipo de data, 
    >detallando la cantidad de datos existentes y asi llegando a
    >la conclusión de anexarlos y obtener un sólo *Dataframe*.
    >
--->
 --->
  --->
    

## *Creando la Database en Mysql*

Es aquí donde realizamos:
 - Las consultas,  para lo cual en este camino aprendimos la creación de procedimientos "*PROCEDURE*"

--->
 --->
  --->


## *Conexión con Python y creación de la API con Fastapi*

Gracias a la implementación que se da con libreria de Fastapi, logramos crear de manera sencilla nuestra API y también se trabaja con un entorno virtual dockerizado.

--->
 --->
  --->

## Para Finalizar ... nuestro "*plus*"
---
> ## ***Mogenius!!!***
> ¿Para que sirve?
>  - <<¡Deployar!>> == <<¡Deploy!>>  proviene del inglés y significa desplegar o lanzar.
>
> - El término deploy se usa para describir el proceso de llevar tu propio sitio web a la internet.
>
> - En nuestro caso nuestra API
>
> - Es importante hacer pruebas para saber que todo está corriendo correctamente y no tengas problemas de rendimiento.

--->
 --->
  --->

  ## *Herramientas implementadas:.*



![Regla_Empírica](https://pngimg.com/uploads/github/github_PNG65.png)![Regla_Empírica](https://tech-cookbook.com/wp-content/uploads/2019/10/python_mysql-750x331.png)![Regla_Empírica](https://upload.wikimedia.org/wikiversity/en/thumb/8/8c/FastAPI_logo.png/800px-FastAPI_logo.png?20211121151501)
![Regla_Empírica](https://smartinfrastructure.ventures/hs-fs/hubfs/Images/Overflow%20(e.g.%20All%20New%20Files)/mogenius.png?width=240&name=mogenius.png,)



 ## *Gracias por tu atención, nos vemos ...*
