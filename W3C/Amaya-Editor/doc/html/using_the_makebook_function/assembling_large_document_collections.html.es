<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type"
  content="application/xhtml+xml; charset=iso-8859-1" />
  <meta name="GENERATOR" content="amaya 8.6, see http://www.w3.org/Amaya/" />
  <title>Unir varios documentos</title>
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="es" lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home" /> <img alt="Amaya"
        src="../../images/amaya.gif" /></td>
      <td><p align="right"><a href="../MakeBook.html.es" accesskey="t"><img
        alt="superior" src="../../images/up.gif" /></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>Unir varios documentos</h1>

<p>Amaya te permite gestionar colecciones de documentos. Una colecci�n puede,
por ejemplo, ser una documentaci�n t�cnica dividida en varias p�ginas web.
Una de las p�ginas web contiene el t�tulo de la documentaci�n completa (un
elemento <code>&lt;h1&gt;</code>), una introducci�n (otros elementos) y una
lista <code>&lt;ol&gt;</code> o <code>&lt;ul&gt;</code> cuyos items
<code>&lt;li&gt;</code> contienen enlaces a cada cap�tulo. Los cap�tulos son
documentos separados que pueden tener una estructura similar.</p>

<p>Esta organizaci�n es adecuada para su navegaci�n, pero resulta inc�moda
cuando quieres imprimir toda la documentaci�n. Amaya resuelve el problema con
el comando Hacer libro (<strong>XHTML&gt;Hacer libro</strong>).</p>

<p>Para enlazar cap�tulos, tipifica los enlaces asoci�ndoles el atributo
<code>rel="chapter"</code> o <code>rel="subdocument"</code> al ancla que
apunta al cap�tulo (para ello, selecciona el elemento <code>a</code> y
utiliza el men� <strong>Atributos</strong>.</p>

<p>Cada cap�tulo o subdocumento enlazado puede ser:</p>
<ul>
  <li>un documento externo</li>
  <li>un subconjunto de un documento externo mayor</li>
</ul>

<p>Para hacer referencia a un subconjunto de un documento, normalmente debe
definir un elemento <code>div</code> para identificar la parte del documento
destino que quieres incluir y enlazar a este elemento.</p>

<p>Al utilizar el comando Hacer libro, los bloques (los elementos
<code>&lt;li&gt;</code> en el ejemplo anterior) que contienen un enlace
tipificado a un cap�tulo se sustituir�n por las p�ginas web correspondientes
(o por los subconjuntos de p�ginas web) y Amaya mostrar� un �nico documento
que contiene toda la colecci�n</p>
<ul>
  <li>Si el enlace apunta a una p�gina web, Amaya incluye todo el contenido
    de <code>body</code> del documento destino.</li>
  <li>Si el enlace apunta a un elemento destino, Amaya incluye el elemento y
    su contenido.</li>
  <li>Si el enlace apunta a un ancla destino, Amaya incluye el contenido del
    ancla, pero no la propia ancla.</li>
</ul>

<p>Antes de cada sustituci�n, el comando Hacer libro genera un nuevo elemento
<code>div</code> con su atributo <code>id</code> para separar claramente cada
porci�n a�adida.</p>

<p>Las porciones a�adidas en el documento generado pueden contener enlaces
normales, anclas destino y elementos destino. Mientras se hace el libro,
Amaya se asegura de que cada atributo <code>name</code> e <code>id</code>
tienen un valor �nico en el nuevo documento. Cuando es necesario, Amaya
cambia esos valores y actualiza los enlaces.</p>

<p>Al mismo tiempo, Amaya actualiza autom�ticamente los enlaces externos a
los documentos o subdocumentos incluidos, cambi�ndolos a enlaces internos al
texto incluido. Por ejemplo, si un enlace apuntaba a un documento externo, el
enlace apuntar� ahora al elemento <code>div</code> creado con el comando
Hacer libro. Esto asegura que el documento que contiene toda la documentaci�n
es coherente.</p>

<p>Este documento puede a continuaci�n numerarse e imprimirse con su tabla de
contenido y la lista de todos los enlaces.</p>
</div>
</body>
</html>
