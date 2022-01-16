<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta name="GENERATOR"
  content="amaya 8.0-pre, see http://www.w3.org/Amaya/" />
  <title>Texto alternativo y descripciones largas</title>
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="es" lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home" /> <img alt="Amaya"
        src="../../images/amaya.gif" /></td>
      <td><p align="right"><a href="resizing_image_map_areas.html.es"
        accesskey="p"><img alt="anterior" src="../../images/left.gif" /></a>
        <a href="../ImageMaps.html.es" accesskey="t"><img alt="superior"
        src="../../images/up.gif" /></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>Texto alternativo y descripciones largas</h1>

<p>Sin texto alternativo en las im�genes, muchas p�ginas web resultan
dif�ciles o incluso imposibles de navegar, y los usuario deben "encontrar su
camino en la oscuridad".</p>

<p>Para evitar este problema, debes incluir texto alternativo para elementos
como im�genes y otros objetos multimedia. Un navegador con sistema de salida
por voz o en una pantalla Braille, como los utilizados por los ciegos,
muestra normalmente el texto alternativo en lugar de la imagen Tambi�n puede
ocurrir que personas con conexiones a Internet de baja calidad soliciten la
vista Alternativa, ya que el texto se transmite mucho m�s r�pido que las
im�genes.</p>

<p>El texto alternativo debe poder sustituir tambi�n a la imagen en su
funci�n. Por ejemplo, si la imagen es un icono que enlaza con un lugar,
entonces el t�tulo del destino es una buena elecci�n como texto
alternativo.</p>

<p>En algunos casos las im�genes se utilizan para conseguir simplemente
efectos visuales y no a�aden ninguna informaci�n �til a la p�gina. En estos
casos es conveniente que el texto alternativo est� vac�o, aunque a�n as�
debes definirlo escribiendo dos comillas como texto alternativo (por ejemplo,
<code>alt=""</code>).</p>

<p>Cuando la imagen contiene informaci�n importante que no est� disponible en
forma de texto en el doumento, debes proporcionar una descripci�n de esa
informaci�n. El atributo <code>longdesc</code> (<strong>Atributos &gt;
longdesc</strong>) te permite enlazar una descripci�n con la imagen. Esta
descripci�n puede ser un URI (es decir, un documento aparte) o una parte del
documento actual.</p>

<p>Para ver c�mo se representar�a la p�gina sin im�genes, utiliza la vista
Alternativa (<span class="Link0"><strong>Ver &gt; Alternativo</strong></span>). Si la p�gina es le�da por un sistema de salida
por voz, entonces basta con leer la vista Alternativa.</p>
</div>
</body>
</html>
