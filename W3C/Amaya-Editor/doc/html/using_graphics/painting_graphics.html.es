<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta name="GENERATOR"
  content="amaya 8.0-pre, see http://www.w3.org/Amaya/" />
  <title>Colorear gr�ficos</title>
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="es" lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home" /> <img alt="Amaya"
        src="../../images/amaya.gif" /></td>
      <td><p align="right"><a href="moving_graphics.html.es"
        accesskey="p"><img alt="anterior" src="../../images/left.gif" /></a>
        <a href="../SVG.html.es" accesskey="t"><img alt="superior"
        src="../../images/up.gif" /></a> <a href="resizing_graphics.html.es"
        accesskey="n"><img alt="siguiente" src="../../images/right.gif"
        /></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>Colorear gr�ficos</h1>

<p>Con Amaya puedes dibujar elementos gr�ficos SVG de un s�lo color (con
relleno o sin �l). El color de relleno por omisi�n es el negro y el color del
trazo por omisi�n es transparente, pero puedes cambiar estos valores.</p>

<p>Hay dos maneras de cambiar los colores de trazo y relleno por omisi�n:
editando los atributos SVG mediante el men� <strong>Atributos</strong> o
editando el estilo de atributo SVG mediante propiedades CSS.</p>

<p class="ProcedureCaption">Para editar los atributos SVG:</p>
<ol>
  <li>Selecciona el gr�fico.</li>
  <li>Abre el men� <strong>Atributos</strong>. En �l se encuentran los
    atributos <strong>Fill</strong> y <strong>Stroke.</strong></li>
  <li>Selecciona el atributo que quiers editar.</li>
  <li>En el di�logo, cambia el atributo (por ejemplo, <kbd>fill=" #C8ff95";
    stroke="#000000"</kbd>), haz clic en <strong>Aplicar</strong> y a
    continuaci�n en <strong>Cerrar</strong>.
    
    <p class="Note"><strong>Nota:</strong> Puedes especificar el color
    mediante valores hexadecimales o utilizando nombres de colores como
    black, white, blue, green, red, pink, purple, violet or yellow.</p>
  </li>
</ol>

<p class="ProcedureCaption">Para editar el estilo de atributo SVG mediantes
propiedades SVG:</p>
<ol>
  <li>Selecciona el gr�fico.</li>
  <li>Elige el comando de men� <strong>Estilo &gt; Colores</strong>. Se
    abrir� la paleta de colores.</li>
  <li>Elige el color deseado de la paleta de colores. Al hacer clic con el
    bot�n izquierdo, generas la propiedad <kbd>stroke</kbd> y al hacer clic
    con el bot�n derecho, generas la propiedad <kbd>fill</kbd>.
    
    <p class="Note"><strong>Nota:</strong> El texto SVG se considera un
    gr�fico, por lo que la propiedad <kbd>fill</kbd> colorea el interior del
    car�cter y la propiedad <kbd>stroke</kbd> colorea el borde del car�cter.
    Amaya aplica la propiedad <kbd>fill</kbd> a los caracteres, pero no la
    propiedad <kbd>stroke</kbd>. As� que el hacer clic con el bot�n izquierdo
    no tiene un efecto inmediato, mientras que al hacer clic con el bot�n
    derecho o central se colorea el elemento de texto.</p>
  </li>
</ol>
</div>
</body>
</html>
