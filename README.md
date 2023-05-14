# Lab-4--Robotica

### Integrantes:
- Santiago Andres Gomez Pena <sagomezpe@unal.edu.co>
- Julian Felipe Medina Veira <jmedinave@unal.edu.co>
- Santiago Dleon Sanchez Romero <ssanchezro@unal.edu.co>
### Introducción:
<p><span style="font-size: 16px;">En este Laboratorio, se busca cumplir con los objetivos planteados de la gu&iacute;a de laboratorio No&deg; 4, el cual, se fundamente en la robotica de desarrollo usando ROS y el robot Phantom X (Pincher).

![phantom x](https://github.com/jmedinave/Lab-4--Robotica/assets/49196705/429be8d6-74e6-4678-9220-b16d22270292)                   
![image](https://github.com/jmedinave/Lab-4--Robotica/assets/49196705/db5b3025-32a1-4bb7-918f-5f6461aff75a)


 <p>El objetivo principal es realizar todo el c&oacute;digo necesario y pertinente para que el robot adopte las posturas planteadas en la gu&iacute;a las cuales son:</p>

![posturas](https://github.com/jmedinave/Lab-4--Robotica/assets/49196705/c2d21864-69ab-47b0-ad7c-e501a49cf57d)


<p>Por otro lado, realizar el desarrollo de una interfaz gr&aacute;fica (HMI) que opere las diferentes poses que el robot va a adoptar con los siguientes requerimientos:</p>
  
<ul>
    <li>Nombres, logos y datos de los integrantes del grupo.</li>
    <li>Imagen perspectiva de la posici&oacute;n actual del manipulador con la &uacute;ltima posici&oacute;n enviada.</li>
    <li>Opci&oacute;n para seleccionar 1 de las 5 poses y enviarlas al manipulador.</li>
</ul>
 
 A continuación, se realiza una descripción a detalle de cada uno de los modulos tratados en el laboratorio:
 
 ### Cinematica directa con Peter Corke Robotics ToolBox.
Realizamos el diagrama cinemático para obtener la tabla de parametros 
 
![D cinematico](https://github.com/jmedinave/Lab-4--Robotica/blob/main/diagrama.jpg)
 
Adicionalmente en este apartado, se realiza una descripción del primer paso que se realizó en el desarrollo de la guia, se buscó corroborar la cinematica directa en el ToolBox petercorke en Matlab, para ello, se desarrolla la interfaz HMI desde un inicio en matlab implementando al mismo tiempo la representación grafica del robot en petercorke. Este codigo es adjuntado a este entrega con el nombre Interfaz1.m y obteniendo los siguientes resultados:

![interfaz1](https://github.com/jmedinave/Lab-4--Robotica/assets/49196705/9e17159b-bc06-4343-9dbb-d7f9b25730fb)

 
 
 
 ### Comunicación con ROS:
 
 En la carpeta de catkin se añadio el repositorio incluido en la guia el cual se conoce como dynamixel one motor el cual contiene toda la configuracion necesaria para la comunicacion entre el pc y el robot pincher, considerando que resulto necesario modificar el archivo .yaml debibo a que solo consideraba el motor 1 con el nombre joint 1, de manera que se añadieron los otros cuatro motores al mismo archivo, de manera que al cargar el nodo desde el terminal de ubuntu con el comando roslaunch dynamixel_one_motor one_controller.launch, se generara el nodo de ROS que contiene los valores de los 5 motores y que permite el envio de valores de angulo a cada uno de sus motores.
 
 Desde python se utilizo el atributo de Joint Trayectory para enviar los valores articulares y se inicio el nodo propio desde python para las comunicaciones con el robot, para cada pose se verificaba los nombres y la correcta configuracion en tiempo entre el pc y el robot, con ello se enviaba una rutina en donde se añadia un punto con los valores articulares en radianes, se le indicaba al robot el tiempo de movimiento, se realizaba el desplazamiento mediante el publisher y finalmente se limpiaba el arreglo que contenia los puntos y se dejaba un reposo al robot para evitar problemas.
 
##### Pose 1:
 
##### Pose 2:
 
##### Pose 3:
 
##### Pose 4:
 
##### Pose 5:
 
 ### Interfaz HMI:
 
 Para la interfaz se utilizo la libreria tkinter, se crearon 5 botones los cuales llevaban el robot a una posicion especifica mediante los valores articulares especificos, para facilitar la visualizacion del robot se añadieron imagenes de matlab que correspondian a la pose que el robot debia alcanzar luego de presionar el boton correspondiente, las imagenes estaban precargadas y se añadian a la ventana mediante el metodo canvas, asegurando un dimensionamiento correcto tanto de las imagenes como del canvas para evitar errores de visualizacion
 
 
 
 ### Conclusiones:
 + La coherencia entre los resultados en los modelos virtuales de modelación y las poses que describen el robot depende indispensablemente de la correcta obtención de parametros DHstd asociados al robot fisico.
+ Los movimientos entre una configuracion y otra pueden ser demasiado bruscos si no se modifican los limites de corriente de los motores, es por esto que es importante encontrar unos valores apropiados que permitan realizar el movimiento a una velocidad mas baja o fijar adecuadamente el robot al suelo.
+ La conexion con ROS (y por ende con el robot) sera igual sin importar si se estan enviando mensajes desde python o desde Matlab, sin embargo, python hace el proceso mucho mas sencillo.
+ El uso de ROS para controlar robots nos permite implementar procesos complejos sin un conocimiento profundo del funcionamiento técnico de los equipos utilizados, aprovechando los programas que los fabricantes o la comunidad comparten abiertamente, esto permite a equipos pequeños construir y operar sistemas robóticos complejos. en breve.
+ El brazo robótico Dynamixel Phantom permite a los estudiantes experimentar físicamente con sistemas complejos sin los riesgos de la maquinaria industrial, pero con la complejidad necesaria para generar confianza para explorar y aprender sobre la maquinaria robótica industrial.
 
 
