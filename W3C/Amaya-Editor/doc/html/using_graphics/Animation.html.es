<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type"
  content="application/xhtml+xml; charset=iso-8859-1" />
  <title>Gr�ficos y animaciones SMIL</title>
  <meta name="generator" content="amaya 8.6, see http://www.w3.org/Amaya/" />
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body>

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home" /> <img alt="Amaya"
        src="../../images/amaya.gif" /></td>
      <td><p align="right"><a href="SVGLibrary.html.es" accesskey="p"><img
        alt="anterior" src="../../images/left.gif" /></a> <a
        href="../SVG.html.es" accesskey="t"><img alt="superior" 
        src="../../images/up.gif" /></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>Gr�ficos y animaciones <acronym
title="Synchronized Multimedia Integration Language" xml:lang="en"
lang="en">SMIL</acronym></h1>

<p><acronym title="Scalable Vector Graphics" xml:lang="en"
lang="en">SVG</acronym> representa las animaciones como elementos
entremezclados en la estructura principal que representa la organizaci�n de
los gr�ficos. Los elementos de la animaci�n aparecen como hijos de los
elementos gr�ficos que animan. Para permitir al autor centrarse en una
animaci�n, la vista de l�nea temporal le muestra todos los elementos de
animaci�n y agrupados de acuerdo con los elementos gr�ficos que animan.</p>

<h2>La vista de l�nea temporal</h2>

<p>La vista de l�nea temporal presenta las animaciones asociadas con objetos
gr�ficos. Cada objeto animado del documento se representa all� con una
representaci�n gr�fica de sus elementos de animaci�n.</p>

<p>La siguiente figura muestra los tres objetos animados de un documento.
Cada objeto se representa en el lado izquierdo de la vista por medio de una
etiqueta con un fondo blanco y un cuadro de selecci�n junto a su etiqueta. Al
hacer clic en la etiqueta se destaca el elemento correspondiente en la vista
Formateado, lo que le proporciona al usuario el contexto de ese elemento. Si
el elemento gr�fico tiene un �nico elemento de animaci�n, como el elemento
Rect�ngulo de la figura, ese elemento de animaci�n se presenta como una barra
coloreada. Si hay varios elementos, una �nica barra en gris representa a la
animaci�n completa (El C�rculo en la parte inferior de la figura) y un bot�n
marcado con el signo '+' en la etiqueta permite al usuario obtener una
representaci�n expandida. El elemento MiTexto, es un ejemplo de tal
representaci�n expandida, en la que cada elemento de animaci�n se representa
mediante una barra coloreada. El bot�n se convierte en un signo '-' lo que
permite al usuario obtener de nuevo la representaci�n condensada.</p>

<p>La posici�n en la l�nea temporal depende de cu�ndo comienzan y terminan de
actuar, y el color de cada barra refleja el tipo de animaci�n:</p>
<ul>
  <li>Amarillo para <code>animar</code>,</li>
  <li>rojo para <code>configurar</code>,</li>
  <li>verde para <code>animarMovimiento</code>,</li>
  <li>azul marino para <code>animarColor</code>,</li>
  <li>azul claro para <code>animarTransformaci�n</code>.</li>
</ul>

<p class="figure"><img alt="Vista de animaci�n"
src="//home/vatton/Amaya/doc/images/timeline_view.png" /></p>
</div>

<h2>Editar animaciones</h2>

<p>La vista de l�nea temporal es �til para percibir de un vistazo la
animaci�n de todos los gr�ficos de un documento, pero tambi�n permite a un
autor editar la animaci�n. Los elementos existentes pueden modificarse. La
mayor�a de las manipulaciones se hacen directamente sobre la l�nea temporal,
por ejemplo, al mover una barra o cambiar su extensi�n. Esto queda
inmediatamente reflejado en otras vistas en las que los correspondientes
atributos de los elementos de la animaci�n se actualizan (en este caso los
atributos <code>inicio</code> y <code>duraci�n</code>).</p>

<p>Para animar el movimiento de un elemento gr�fico existente:</p>
<ul>
  <li>El usuario comienza por seleccionar el momento de inicio de la
    animaci�n:
    <p>Haciendo clic en <abbr title="tecla control">Ctrl</abbr> + bot�n
    izquierdo del rat�n sobre la barra de desplazamiento roja y movi�ndola
    hacia la derecha de la posici�n de inicio.</p>
  </li>
  <li>Entonces selecciona el elemento que le interesa en la vista Formateado:
    <p>Si el elemento tiene un ID �ste se usar� como etiqueta.</p>
  </li>
  <li>Entonces hace clic sobre el bot�n superior izquierdo <img
    alt="animar_movimiento" src="../../../amaya/anim_motion_sh_db.png" /> en
    la vista de l�nea temporal:
    <p>Esto crea un nuevo elemento de animaci�n en esa vista.</p>
  </li>
  <li>Entonces el usuario apunta la posici�n de inicio y de culminaci�n del
    movimiento en la vista de formato:
    <p>Hace clic en la tecla <abbr title="control">Ctrl</abbr> + bot�n
    izquierdo del rat�n en el icono <img alt="cross"
    src="../../../amaya/timeline_cross.gif" /> que se presenta en la vista
    Formateado. Haciendo esto, tiene control sobre las posiciones clave del
    elemento animado en el contexto de los otors elementos gr�ficos. De hecho
    el usuario traza el recorrido del movimiento como si estuviera dibujando
    la forma de cualquier curva perteneciente al documento.</p>
  </li>
  <li>Finalmente, volviendo a la vista de l�nea temporal, puede mover y/o
    redimensionar la nueva barra para ajustar el tiempo.</li>
</ul>

<p>Mainpular el tiempo en la vista de l�nea temporal es m�s c�modo, ya que
permite al usuario comprender mejor la sincronizaci�n de un elemento en
particular con los otros elementos animados. El usuario puede tambi�n
modificar las posiciones clave en la vista principal, tan s�lo moviendo los
puntos con el rat�n. Pero las otras vistas siguen estando ah�, y algunos
par�metros pueden ajustarse en la vista de estructura editando los atributos,
as� como tambi�n en la vista del c�digo fuente si fuera necesario.</p>

<p>Para crear un cambio de color de un elemento gr�fico existente, el usuario
comienza seleccionando el elemento que le interesa en la vista principal, y
hace clic en el bot�n superior izquierdo <img alt="animar_color"
src="../../../amaya/anim_color_sh_db.png" />.</p>

<p>El usuario puede manipular una barra que representa una animaci�n, de la
misma manera que manipula un rect�ngulo en un documento. Obviamente hay
algunas limitaciones en la vista de l�nea temporal. Por ejemplo, las barras
coloreadas pueden moverse s�lo horizontalmente a lo largo de el eje de tiempo
y no puede cambiarse su altura individualmente. Estas limitaciones
representan la sem�ntica del lenguaje gr�fico de la l�nea temporal.</p>
</body>
</html>
