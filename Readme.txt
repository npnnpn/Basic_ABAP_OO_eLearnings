Origin Source Course Thomas Jung Basic ABAP OO eLearnings

Apuntes recuperados del curso de Thomas Jung - Basic ABAP 00 eLearning, no es el curso completo, solo anotaciones realizadas.

Introducción
Parte 1 - Conceptos básicos
Parte 2 - Clases, Herencia, Visibilidad, Polimorfismo
Parte 3 - Persistentes Objetos
Parte 4 - Interfaz de usuario
Parte 5 - Poniendo todo junto
Parte Z - Código fuente
Introduction
Attributes and Types
Methods
Events and Aliases
Constructors
Local Classes
Introduction
Static Methods
Instance Methods
Visibility
Functional Methods
Class Based Exceptions
Instances as Internal Table
Inheritance
Polymorphism
Closing
Introduction
Persistent Mapper and Tooling
Peristent Object Architecture
Basic Usage in 7.02
Query Services
Extending Persistent Mapping
Transactional Services
Inheritance
Closing
Introduction
MVC - Overview
BSP - Page Logic
BSP - Model
BSP - Controller
BSP - View
BSP - Data Binding
Web Dynpro ABAP
Classic Dynpro
Select-Options/Ranges
Controller
Events
Introduction
BCS Email Example
Code Completion Intro
Code Completion Templates
Code Completion Class Structure
Closing
Código fuente
Curso Abap Orientado a Objetos
Introducción
Este curso se divide en 5 partes de conceptos básicos programación  ABAP orientada a objetos.
Terminología OO, herramientas de desarrollo, y los patrones de diseño que abarcan una variedad de niveles de liberación de ABAP.
Nueva sintaxis utilizada por SAP.
Primera parte utilizaremos el generador de clase ABAP y la terminología básica.
Segunda parte ampliar los conceptos examinado estática, la visibilidad, clases de excepción, herencia, polimorfismo y clases abstractas.
Tercera parte vamos a ver como un tipo especial de clase, llamada un objeto persistente, se puede utilizar para el acceso orientado a objetos a la base de datos.
Cuarta parte vamos a explorar los conceptos orientados a objetos en tecnologías de interfaz de usuario.
Nos centraremos en el uso de esta parte Model View Controller  y OO clásico dentro de las aplicaciones Dynpro.
Quinta parte vamos a ver en el mundo real, ejemplo complejo que utiliza todas las técnicas y tecnologías de las partes anteriores.
Parte 1 - Conceptos básicos  
-         Conceptos básicos.
-         Creación de clases dentro SE80 y  términos a saber con el fin de empezar a aprender diseño y desarrollo orientado a objetos.  
Parte 2 - Clases, Herencia, Visibilidad, Polimorfismo 
-         Conceptos:
o   Estática
o   Visibilidad
o   Clases de excepción
o   Herencia
o   Polimorfismo y
o   Clases abstractas.
-         Creación de clase básica con métodos estáticos que solamente funciona muy parecido a los módulos de función en grupo / de función.
-         Cambiamos los métodos en los métodos de instancia.
o   Ver cómo una instancia de clase nos permite modelar las estructuras y
o   Relaciones de datos complejos en el código.
o   Ver como las clases de excepción pueden hacer excepciones más significativas y simplificar el código para tratar las excepciones.
o   Utilizamos herencia y polimorfismo de ocultar la complejidad interna de nuestra lógica de negocio.
o   Llamar a todas las aplicaciones al tiempo que garantiza la ejecución uniforme de nuestro código.
Estas técnicas pueden resultar extrañas pero termina por resultar más sencillo de analizar y más seguro de mantener.
Parte 3 - Persistentes Objetos 
-         Tipo especial de clase en ABAP - el objeto persistente.
-         Los objetos son persistentes un enfoque basado en OO a los tipos de acceso a los datos que se pueden realizar normalmente con las sentencias SQL.
-         Con objetos persistentes no codifican sentencia de SQL.
-         En lugar de ello se genera una clase que contiene métodos SET y GET para la lectura de datos y actualización.
-         ABAP objetos persistentes también contienen la funcionalidad de escenarios de actualización más complejos - como actualizaciones asíncronas V2.
Parte 4 - Interfaz de usuario 
-         Nos fijamos en el caso de uso especial de tecnologías y técnicas de diseño orientado a objetos, ya que se aplican a la creación de la interfaz de usuario.
-         Las tecnologías de interfaz de usuario ABAP, se estudia cómo MVC (Model View Controller)
-         Diseños que se pueden aplicar:
o   BSP y
o   Web Dynpro ABAP,
o   ABAP OO y
o   efectos del diseño en general:
§  Características específicas como la interfaz de usuario de la representación de elementos, eventos y rendering completo.
-         Adaptar Dynpro Clásico y su procesamiento PBO / PAI a un flujo MVC más orientado a objetos.
Parte 5 - Poniendo todo junto  
-         Ejemplos de cómo SAP pone las técnicas que hemos aprendido en las 4 sesiones anteriores para trabajar dentro del código estándar que se entregan a los clientes.
-         Empezamos mirando las clases CL_BCS para el envío de correo electrónico. CL_BCS * sirve como un perfecto ejemplo de la utilización de objetos persistentes y polimorfismo.
-         También tenemos en cuenta la funcionalidad detrás de la nueva característica de finalización de código ABAP en el editor ABAP.
-         Este bloque de código utiliza persistentes objetos, herencia / polimorfismo, clases de excepción, y MVC estructurado Dynpro clásico.
Parte Z - Código fuente
-         El código fuente de este tutorial se proporciona en el curso en caso de ser necesario para facilitar el aprendizaje.
Parte 1 - Conceptos básicos  
A lo largo de esta serie vamos a ver en la terminología OO, herramientas de desarrollo, y los patrones de diseño que abarcan una variedad de niveles de liberación de ABAP. 
Vamos a tratar de mantener la nueva sintaxis de vanguardia por lo que todavía es bastante utilizado la sintexis en versiones anteriores.
Para este documento vamos a comenzar utilizando el generador de clase ABAP ( ABAP Class Builder)  y la terminología básica.

Introduction
Transacción SE80 - Object Navigator
	Object Name: ZAFS_OO
	Description: Object Oriented eLearning.
Documentación de Object Navigator
Attributes and Types
	Transacción SE24 - Class Builder: Initial Screen.
	Con esta transacción entramos directamente a crear clases.
Documentación de Class Builder
Transacción SE80 - Object Navigator
	Create - > Class Library - > Class
	Creamos la clase ZCL_OO_TUTORIAL_1
Será de Instancia pública, clase estándar ABAP y final.
	Ver documento Class ZCL_00_TUTORIAL_1
Documentación de Nomenclatura de ABAP OO
Podemos ver que dentro de la SE24 tenemos multitud de pestañas.
Documentación de editor de clases
En la pestaña de propiedades podemos ver como se ha definido la clase.
	Entramos en la pestaña de atributos.
Documentación de atributos de clases
Podemos instanciar los distintos atributos de 3 formas diferentes, como variable, como estático y como constante. 
	Los tipos de datos puedes se similar de tipo, referido o tipo empaquetado.
Podemos ver como queda declarado el atributo.
Accedemos a la sección publica.
	Se puede modificar el código directamente en la sección pública.
	No se puede asignar directamente una variable a una tabla de string.
	Para hacer esto accedemos a la pestaña de tipos.
	Entramos al código de la sección pública y creamos un tipo tabla de string.
	Después asignamos este tipo de tabla a nuestra variable.
Methods
Accedemos a la pestaña de métodos se  instancian métodos como variables o estáticos.
Documentación de métodos de clases
También podemos proporcionar la distinta visibilidad de los métodos.
	Definimos el primer método. 
Vemos el detalle del método creado.
A través del botón de parámetros podemos definirlos.
Documentación de parámetros de clases
Los parámetros de los métodos podemos definir los tipos como importing, exporting, changing y returning.
Los parámetros serán de tipo similar, tipo o referido.
	Se crean varios parámetros.
Podemos ver el detalle de cada parámetro.
	Pulsando el icono de código. 
	Escribimos el código ABAP que necesitamos.
Events and Aliases
Analizamos pestaña de eventos.
Documentación de eventos de clases
Analizamos pestaña de Alias
Constructors
Pulsamos el botón constructor.
Los parámetros el el método constructor son Import
	En el constructor se puede escribir el código necesario.
Local Classes
	SE38 - ABAP Editor
	Creamos un programa que ejecute la clase que hemos definido.
	Ver documento Report ZOO_TUTORIAL_PROG_1
Se puede definir la clase directamente en el Editor ABAP
	Debemos crear una implementación a esa clase.
Parte 2 - Clases, Herencia, Visibilidad, Polimorfismo
Introduction
Creamos la Clase ZCL_OO_TUTORIAL_2
	En la pestaña de métodos añadimos 2 métodos estáticos.
	-	GET_FLIGHT_DETAIL
	-	CALCULATE_FLIGHT_PRICE
	Ver documento Report ZOO_TUTORIAL_2
	Accedemos a los parámetros del método GET_FLIGHT_DETAILS, se crean 3 parametros de tipo importing y un parametro de tipo expoting.
	Después accedemos al código fuente del método CALCULATE_FLIGHT_PRICE.
	En este método se selecciona la tabla SFLIGHT.
Después teniendo en cuenta el tipo de vuelo que ha sido seleccionado, determina el precio de dicho vuelo.
	Ejecutando el programa ZOO_TUTORIAL_2, vemos como resultado los distintos precios en función del vuelo seleccionado. 
	Ver documento Report ZOO_TUTORIAL_2
Static Methods
Instance Methods
	Ver documento Class ZCL_00_TUTORIAL_3
	Ver documento Report ZOO_TUTORIAL_3
Visibility
	Ver documento Report ZOO_TUTORIAL_3A
	Ver documento Class ZCL_00_TUTORIAL_4
	Ver documento Report ZOO_TUTORIAL_4
Functional Methods
	Ver documento Class ZCL_00_TUTORIAL_4
Class Based Exceptions
	Ver documento Class ZCX_00_TUTORIAL_5
	Ver documento Class ZCL_00_TUTORIAL_5
	Ver documento Report ZOO_TUTORIAL_5
Instances as Internal Table
	Ver documento Report ZOO_TUTORIAL_5A
Inheritance
	Ver documento Class ZCL_00_TUTORIAL_6_BASE
	Ver documento Interface ZIF_OO_TUTORIAL_6
	Ver documento Class ZCL_00_TUTORIAL_6_A310
Polymorphism
	Ver documento Report ZOO_TUTORIAL_6A
	Ver documento Class ZCL_00_TUTORIAL_6_747
Closing
Parte 3 - Persistentes Objetos
Introduction
	Ver documento Class ZCL_00_TUT_PERS_SFLIGHT
Persistent Mapper and Tooling
	Ver documento Class ZCL_00_TUT_PERS_DEMO
	Ver documento Class ZCB_00_PERS_DEMO
	Ver documento Class ZCA_00_TUT_PERS_DEMO
Peristent Object Architecture
	Ver documento Report ZOO_TUT_PERSIST_PROG1
	Ver documento Class ZCA_00_TUT_PERS_SFLIGHT
	Ver documento Report ZOO_TUT_PERSIST_PROG1
Basic Usage in 7.02
	Ver documento Report ZOO_TUT_PERSIST_PROG1_702 
Query Services
	Ver documento Report ZOO_TUT_PERSIST_PROG2
Extending Persistent Mapping
	Ver documento Class ZCL_00_TUT_PERS_SFLIGHT
	Ver documento Report ZOO_TUT_PERSIST_PROG3
Transactional Services
Inheritance
	Ver documento Class ZCL_00_TUT_PERS_SFLIGHT_A310
	Ver documento Class ZCA_00_TUT_PERS_SFLIGHT_A310
	Ver documento Class ZCL_00_TUT_PERS_747
	Ver documento Report ZOO_TUT_PERSIST_PROG5 
Closing
Parte 4 - Interfaz de usuario
Introduction
Doble click
MVC - Overview
BSP - Page Logic
	Ver documento BSP_DEFAULT.BSP
BSP - Model 
	Ver documento BSP_ZBSP_OO_MVC
	Ver documento Class ZCL_BSP_MODEL_OO_MVC
BSP - Controller
	Ver documento Class Controller ZCL_BSP_CTRL_OO_MVC_DEFAULT
BSP - View
BSP - Data Binding
Web Dynpro ABAP
	Ver documento Web_Dynpro ZAFS_OO_WDA 
	Ver documento Class ZCL_WD_ASSIST_AFS_OO
Parámetros
Classic Dynpro
	Ver documento Report ZAFS_OO_UI
Select-Options/Ranges
Controller
	Ver documento Class Controller_ZCL_DYNP_CTRL_AFS_00
Events
Doble click
Parte 5 - Poniendo todo junto  
Introduction
	Ver documento Report ZOO_BCS_EMAIL
BCS Email Example
Code Completion Intro
Ejecutando ZOO_BSC_EMAIL
Code Completion Templates
Code Completion Class Structure
Closing
Parte Z - Código fuente
Código fuente

