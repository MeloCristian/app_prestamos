# App Prestamo equipos

Este proyecto es una pequeñña web que nos permitirá tener un contro y regidtro de los prestamos que se realicen en cuanto a los computadores portatiles en la Universidad de Nariño a los estudiantes de pregrado de la misma.

## Comenzando 🚀

Para iniciar se debe clonar el repositorio, en el cual se encuentran 3 carpetas:
* #### Client
* #### Server
* #### Database


## Instalación 🔧

Acceder mediante la terminal a la carpeta ./client e instalar los paquetes y dependencias:


```
cd client
npm install
```

Repetir el proceso para el servidor en la carpeta ./server:

```
cd server
npm install
```

Una vez instaladas las dependencias, se necesitará cargar el backup de la base de datos en Postgres el cual se encuentra en la carpeta Database llamado y realizado en formato "Plain" con codificación UTF8:

```
Backup.sql
```

O tambien puede usar el backup en formato "Custom" que se encuentra en la misma carpeta llamdo:

```
Custom.sql
```

Una vez hecha la importacion de la base de datos, los ultimos pasos a realizar son ejecutar el cliente y el servidor mediante los siguientes comandos en la tarminal:

### Cliente

```
npm run serve
```

### Servidor
```
npm run dev
```

___
NOTA: Para confirfurar la URL del servidor en el cliente, debe acceder a la carpeta y al archivo:

``` tree -d /proc/self/
/repositorio/client/
|-- src
|   |-- services
|   |   |-- config.js
```
___

---
NOTA 2: El servidor usa por defecto el puerto 3000, para confirgurar las variables de entorno, tanto del puerto, como la base de datos, se encuentra el archivo:

``` tree -d /proc/self/
/repositorio/server/
|-- .env
```
---

## Construido con 🛠️

* [Vue 2](https://vuejs.org/) - Framework web
* [SweetAlert2](https://sweetalert2.github.io/) - Libreria de Alertas
* [Flat icon](https://www.flaticon.com/) - Iconos gratiutos
* [Animate.css](https://animate.style/) - Libreria CSS de animaciones
* [NodeJs](https://nodejs.org/es/) - Lenguaje de servidor
* [Postgres](https://www.postgresql.org/) - Sistema gestor de base de datos relacionales

## Autores ✒️

* **Mario Carreño** - *Diseño y programación* - [MariioC](https://github.com/MariioC)

---
⌨️ con ❤️ por [MariioC](https://github.com/MariioC) 😊