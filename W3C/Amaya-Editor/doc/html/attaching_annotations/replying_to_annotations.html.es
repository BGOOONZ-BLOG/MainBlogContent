<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>Problemas conocidos con las anotaciones y los documentos
  modificados</title>
  <meta name="GENERATOR" content="amaya 8.2, see http://www.w3.org/Amaya/" />
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="es" lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home" /> <img alt="Amaya"
        src="../../images/amaya.gif" /></td>
      <td><p align="right"><a href="moving_annotations.html.es"
        accesskey="p"><img alt="anterior" src="../../images/left.gif" /></a>
        <a href="../Annotations.html.es" accesskey="t"><img alt="superior"
        src="../../images/up.gif" /></a> <a href="configuring_icons.html.es"
        accesskey="n"><img alt="siguiente" src="../../images/right.gif"
        /></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>Contestar anotaciones / Hilos de discusi�n</h1>

<p>Una anotaci�n puede considerarse como un comentario a una p�gina. La
opci�n de men� <strong>Anotaciones &gt; Responder a anotaci�n</strong> mejora
el espacio virtual de colaboraci�n al permitir a los usuarioes contestar a
las anotaciones o a otras respuestas.</p>

<p>La opci�n de men� <strong>Anotaciones &gt; Responder a anotaci�n</strong>
te permite crear una respuesta a una anotaci�n existente o a una respuesta.
Puedes elegir este comando desde una anotaci�n abierta o desde una ventana de
respuesta. Este comando abre una nueva ventana de respuesta. Puedes editar
los campos de una ventana de respuesta como en una ventana de anotaci�n, tal
y como se explica en <a href="creating_an_annotation.html.es">Crear una
anotaci�n</a>.</p>

<p>Cuando la respuesta est� preparada, puedes enviarla a un servidor con la
opci�n de men� <strong>Anotaciones &gt; Enviar al servidor</strong> o
guardarla localmente con la opci�n de men� <strong>Archivo &gt;
Guardar</strong>. Para borrar una respuesta, puedes utilizar la opci�n de
men� <strong>Anotaciones &gt; Borrar</strong>.</p>

<p>Las respuestas tambi�n pueden anotarse, como cualquier otro documento,
como se explica en <a href="creating_an_annotation.html.es">Crear una
anotaci�n</a>.</p>

<h2>El interface de usuario</h2>

<p><img alt="Una anotaci�n con un hilo de discusi�n"
src="../../images/threads.png" /></p>

<p>En el interface de usuario actual, todas las respuestas relacionadas con
una anotaci�n se muestran al pie de la anotaci�n en una secci�n organizada en
hilos. Cada elemento en el hilo muestra la fecha de respuesta, el autor y el
t�tulo de la respuesta. El contenido de cualquiera de estas respuestas puede
consultarse haciendo doble clic en la respuesta. La respuesta seleccionada se
resaltar� y presentar� en una ventana de respuesta. Al seleccionar otra
respuesta, se muestra en la misma ventana.</p>

<h2>Problemas conocidos: hilos incompletos</h2>

<p>No existe por el momento ninguna manera de controlar qu� respuestas deben
enviarse. En principio no deber�a ser posible guardar una respuesta a una
respuesta en servidores diferentes. De la misma manera, al borrar una
respuesta se deber�an borrar todas las respuestas relacionadas. En caso
contrario, existir�an fragmentos de hilos de discusi�n que no podr�an
relacionarse correctamente. Por ejemplo, sea R1 una respuesta a la anotaci�n
A1 y R2 una respuesta a R1. Si env�as R1 y almacenas R2 localmente, al
consultar A1 desacargando �nicamente sus anotaciones locales, s�lo ver�s R2.
Como Amaya no sabe que R1 existe, supone que R2 ha perdido a su padre. Estos
hilos "hu�rfanos" se identifican en Amaya mediante un signo de interrogaci�n
<strong>?</strong> delante de ellos.Si posteriormente Amaya encuentra nuevos
elementos del hilo, por ejemplo, si descargas R1, Amaya reordenar� la vista
de los hilos, insertando los hilos como corresponda. En el ejemplo, R2 se
convertir�a en hijo de R1, como ser�a de esperar.</p>
</div>
</body>
</html>
