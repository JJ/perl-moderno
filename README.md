# Un tutorial más de Perl

## Objetivos

1. Dar a conocer el lenguaje a quien no lo haya usado antes.
2. Comprender los principios en los que se basa.
3. Una introducción a su sintaxis.
4. Trabajar con módulos (librerías) de forma fácil.

## Perl moderno


Nuestro primer programa en Perl es el siguiente:

{% highlight ruby %}
#!/usr/bin/env perl

use Modern::Perl '2014';
use autodie;

say "Hola k ase";

{% endhighlight %}
