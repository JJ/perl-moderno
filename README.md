# Un tutorial más de Perl

## Objetivos

1. Dar a conocer el lenguaje a quien no lo haya usado antes.
2. Comprender los principios en los que se basa.
3. Una introducción a su sintaxis.
4. Trabajar con módulos (librerías) de forma fácil.

## Perl moderno


Nuestro primer programa en Perl es el siguiente:

{% highlight perl %}
#!/usr/bin/env perl

use Modern::Perl '2014';
use autodie;

say "Hola k ase";

{% endhighlight %}

Se ve desde el principio que es moderno: pone `Modern::Perl`. Así que vayamos por partes a ver qué hace de este Perl moderno (y de otro antiguo, o viceversa).

## Primero: ¿por qué Perl?

Hay decenas de lenguajes hoy en día.

>Menuda tontería. Siempre los ha habido.

Vale, ahora hay más. Ayer mismo vi uno nuevo del que no había oído
hablar nunca, [Nim](http://nim-lang.org/), un lenguaje estupendo,
compilado, rápido y nuevo. Lo nuevo siempre es mejor y Perl
[nació en el año 1987](http://history.perl.org/PerlTimeline.html), más
o menos cuando todavía se daba esgrima en el instituto y el WhatsApp
se hacía a base de pulsaciones de telégrafo, ¿no?. Mi historia
personal con el Perl empieza en el año 93, más o menos, cuando lo
aprendí... no recuerdo por qué. Porque me gusta aprender cosas. Pero
también porque era un lenguaje *interpretado* que permite hacer cosas
rápidamente. Antes, con el Pascal o el C, era editar el programa,
compilar, vaya, aquí hay un error, compilamos de nuevo, ejecutamos,
vaya, otro error, vamos a depurar y así sucesivamente... Perl es
*interpretado*. Los programas en Perl son *scripts* o guiones que se
pueden ejecutar directamente en cualquier sitio que haya un intérprete
de Perl. El que sea interpretado explica la primera línea del programa
anterior:

	#!/usr/bin/env perl

que es la clásica de los lenguajes interpretados y que carga el primer
intérprete de Perl en el camino de ejecución y, a continuación, usando
ese intérprete, lee el resto del fichero y lo ejecuta usándolo. El
poner esto en vez de directamente el camino a *un* intérprete nos
permite que se pueda ejecutar en cualquier ordenador,
independientemente de dónde se instale Perl y también el uso de
intérpretes gestionados por el usuario.

>Que es, de hecho, la principal razón para usar este tipo de
>invocación al binario de Perl. 
	

Y hay intérpretes de Perl en todos los sistemas operativos y en cosas
que no lo son, como Windows. En la mayoría de las distribuciones de
Linux está ya instalado, porque parte de las herramientas del sistema
están escritas usándolo. El paquete
[`perl-base` de Ubuntu se lista como *essential*](http://packages.ubuntu.com/trusty/perl-base),
así que en estas y distribuciones similares no tienes que preocuparte
por su presencia. Escribe 

	which perl

y te dirá el camino en el que está instalado o

	perl --version

para la versión que tienes, algo así:


	This is perl 5, version 20, subversion 0 (v5.20.0) built for x86_64-linux

	Copyright 1987-2014, Larry Wall

	Perl may be copied only under the terms of either the Artistic License or the
	GNU General Public License, which may be found in the Perl 5 source kit.

	Complete documentation for Perl, including FAQ lists, should be found on
	this system using "man perl" or "perldoc perl".  If you have access to the
	Internet, point your browser at http://www.perl.org/, the Perl Home Page.


El hecho de que esté instalado en todos los Linux (y en el Mac, que por debajo es lo mismo) lo hace útil para llevar a cabo cualquier labor relacionada con el sistema, como procesar un fichero de registro, monitorizar un proceso a ver qué está haciendo o simplemente realizar copias de seguridad periódicas. Casi ningún lenguaje (salvo el *shell*, pero no es un lenguaje) está disponible de esa forma en todos los sistemas operativos.

Pero es que, además, su madurez, su uso por grandes empresas como
Booking o Amazon y la popularidad en ciertos campos como la
Bioinformática lo hace también ideal para crear sistemas basados en
web, incluyendo servicios web, procesamiento de datos masivos usando
*scraping* (o extracción de datos semiestructurados) y, en general,
cualquier cosa, hasta
[algoritmos evolutivos](http://es.tldp.org/Presentaciones/200211hispalinux/merelo/ae-hispalinux2002.html)
o cualquier otro tema de investigación.

>El hecho de que sea interpretado hace que su velocidad *de ejecución*
>no sea óptima. Pero lo compensa con creces con la velocidad de
>creación de nuevas aplicaciones.

## Si Perl no está instalado

O incluso si está instalado, es mejor usar
[Perlbrew](http://perlbrew.pl/) para gestionar diferentes copias de
intérprete desde el propio usuario. Así puedes trabajar con tus
propias librerías (lo que no siempre es posible, si dependen de
librerías del sistema) y cambiar de versión cuando lo desees. Para
instalarlo:

	curl -L http://install.perlbrew.pl | bash

>`curl` debería estar instalado en el sistema, también es una utilidad
>básica. Si no, se puede usar `wget` o descargarse a mano desde el
>navegador y posteriormente ejecutarlo con `bash
>nombre-de-lo-descargado`.

`perlbrew` gestiona diferentes versiones de Perl. Las versiones pares
son versiones estables, mientras que las impares son de
desarrollo. Las versiones pares, tras una época un tanto inestable,
suelen salir todos los meses de mayo; la próxima es la
`5.22`. Mientras tanto, algunas características de esa versión se
prueban en la inmediato anterior, que siendo impar es inestable, la
`5.21`. Podemos instalarnos las que queramos, por ejemplo la última
estable, con

	perlbrew install perl-5.20.2

tras listar las disponibles con


	perlbrew available
	  perl-5.20.2
	i perl-5.18.4
	  perl-5.16.3
	  perl-5.14.4
	  perl-5.12.5
	  perl-5.10.1
	  perl-5.8.9
	  perl-5.6.2
	  perl5.005_04
	  perl5.004_05
	  perl5.003_07


`i` indica la que está instalada en un momento determinado. Tras la
instalación, que tarda un rato porque hay que descargar, compilar y
probarla, se usa con

	perlbrew use perl-5.20.2

La orden anterior no lista las versiones de desarrollo (las
impares). Para verlas hay que usar


	 perlbrew available --all
	  perl-5.6.0
	  perl-5.6.1-TRIAL1
	  perl-5.6.1-TRIAL2
	  perl-5.6.1-TRIAL3
	...
	  perl-5.20.1
	  perl-5.20.2-RC1
	  perl-5.20.2
	  perl-5.21.0
	  perl-5.21.1
	  perl-5.21.2
	  perl-5.21.4
	i perl-5.21.5
	  perl-5.21.6
	  perl-5.21.7


Si se quieren ir probando las nuevas características conviene tener
siempre instalada alguna de las versiones nuevas, como la `5.21.5` que
aparece marcada como instada en mi sistema. También por cuestiones de
velocidad: las versiones nuevas (aunque no las de desarrollo) suelen
ser más rápidas.

Las versiones instaladas, o la elegida, *aparece* en el camino de
ejecución y se ejecuta directamente si los *scripts* llevan la línea
`/usr/bin/env perl` al principio. Pero también podemos, desde
`perlbrew` ejecutar directamente un programa


	perlbrew exec perl -e 'print "Soy el proceso $$\n";'
	perl-5.18.4
	==========
	Soy el proceso 30893


	perl-5.20.0
	==========
	Soy el proceso 30894


	perl-5.21.5
	==========
	Soy el proceso 30895


En las tres versiones que hay instaladas en mi sistema, se ejecuta el
programa mostrando el número de proceso, que se puede ver en Perl
desde la variable `$$`. Es una de las variables *especiales* de Perl,
pero tiene la sintaxis de otras variables: comienza con un `$`. El
ejecutar un programa desde todas las versiones puede servir para
probar su compatibilidad con las mismas o su velocidad.

También se muestra cómo se puede ejecutar algo directamente desde la
línea de órdenes, un *one-liner* de los que han hecho famoso a
Perl. El argumento o *switch* `-e` ejecuta como un programa en Perl lo
que se encuentra justamente detrás. Por las buenas.

Tampoco hacen falta paréntesis: Perl es expresivo y está hecho para el
programador perezoso. Si hay una cadena (delimitada por comillas)
detrás de una orden, pues será el argumento de esa orden. No hay que
darle más vueltas.

> Puede haber cierta ambigüedad. La coma es a la vez un separador de
> cadenas y un
> [operador](http://perldoc.perl.org/perlop.html#Comma-Operator) que
> evalúa su lado izquierdo, tira el valor resultante, evalúa el
> derecho e imprime el resultado. Por lo que

	perl -e "print 2*2,print 3*4;"

> evaluará el lado derecho, lo que tendrá como valor resultante un 4,
> luego evaluará el izquierdo y ejecutará `print` y finalmente
> devolverá el resultado, resultando en, obviamente, 1241. Vale, yo
> tampoco lo entiendo, pero lo anterior te muestra cómo la sintaxis de
> Perl es suficientemente flexible para que hagas lo que quieras
> incluso aunque no sepas lo que haces.

La documentación de Perl está bien estructurada y todo lo anterior
puedes leerlo en diferentes apartados de la misma. Se accede a la
documentación con `perldoc`, que puede, o no, estar instalado en el
sistema. En algunas versiones de Ubuntu y Debian está, pero en otras
no. Así que, ante la duda, se instala

	sudo apt-get install perl-doc

aunque si tienes instalado `perlbrew` por el mismo precio tienes
también `perldoc` y puedes consultar

* `perldoc perlvar` para ver todas las variables que tiene Perl
  definidas, incluyendo `$$`.

* `perldoc perlrun` sobre cómo llamar a Perl, incluyendo la opción
  `-e` que ejecuta un programa sobre la marcha.

* `perldoc -f print` que te consulta una orden determinada, la única
  (o casi) que hemos visto hasta el momento, `print`.

* `perldoc perlop` para saber todos los operadores que hay en Perl,
  incluyendo la coma, que es un operador de pleno derecho.

* `perldoc perl` que, aparte de una introducción general, incluye una
  lista de toda la documentación que se instala y de cómo acceder al
  resto de las opciones.

Cuando todo falle, mira la documentación. Con Perl al menos lo tienes
todo a mano.

## También las bibliotecas o módulos.

Perl no fue el primero en crear un sistema universal de acceso e
instalación de módulos (bibliotecas), porque fue el CTAN de LaTeX,
pero sí el primero en hacerlo en un lenguaje de programación. Todos
los demás lenguajes lo hicieron después y algunos (como Java) todavía
están por
hacerlo. [CPAN, o Comprehensive Perl Archive Network](http://search.cpan.org/)

>Obsérvese el juego de palabras con CTAN, en el que está inspirado.

es el lugar donde se pueden buscar la mayoría de los módulos de Perl y
se pueden descargar, criticar, informar de errores o incluso hacer
reseñas. Sin embargo, la verdadera utilidad de CPAN está en el cliente
`cpan`, un programa que se instala con Perl y que descarga e instala
los módulos junto con sus dependencias. De hecho, es más usado hoy en
dia `cpanminus`, que también actúa como cliente de CPAN, pero que
tiene menos opciones de instalación; de hecho ninguna. Como ya estamos
trabajando con `perlbrew`, lo instalamos con

	 perlbrew install-cpanm

y, para ejecutarlo para instalar la biblioteca que usamos en nuestro
"Hola mundo", `Modern::Perl`, la usamos así:

	cpanm Modern::Perl      
	--> Working on Modern::Perl
	Fetching http://www.cpan.org/authors/id/C/CH/CHROMATIC/Modern-Perl-1.20150127.tar.gz ... OK
	==> Found dependencies: Module::Build
	...

Que, como se ve, instala el módulo `Modern::Perl` y todas las
dependencias (la primera, `Module::Build`, se ve ya en esta
captura). Con esto ya podemos ejecutar nuestro programa:

	perl code/holakase.pl 
	Hola k ase


Pero volvamos a mirarlo:

{% highlight perl %}
use Modern::Perl '2014';
use autodie;

say "Hola k ase";
{% endhighlight %}

El módulo `Modern::Perl` tiene `::` en medio para separar sus dos
partes; este símbolo se usa para crear *espacios de nombres*, es
decir, formas de separar identificadores con el mismo nombre para que
puedan usarse sin ningún problema. `Perl` se usa también en el módulo
[`Acme::Very::Modern::Perl`](http://search.cpan.org/~fwie/Acme-Very-Modern-Perl-0.05/lib/Acme/Very/Modern/Perl.pm)
que, estando en el espacio de nombres `Acme`, sabemos que no tiene que
tomarse muy en serio. También
[`uni::perl`](http://search.cpan.org/~mons/uni-perl-0.92/). Cada uno
usa un espacio de nombres diferente (o muchos); los espacios de
nombres equivalen a subdirectorios en el directorio donde se instalan
todos los módulos de Perl, así que `Modern::Perl` estaría en
`lib/Modern/Perl.pm`, `.pm` es la extensión habitual de los módulos en
Perl.



