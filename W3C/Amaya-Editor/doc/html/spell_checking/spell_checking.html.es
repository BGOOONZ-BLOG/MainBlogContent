<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta name="GENERATOR"
  content="amaya 8.0-pre, see http://www.w3.org/Amaya/" />
  <title>Corrector ortogr�fico</title>
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="es" lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home" /> <img alt="Amaya"
        src="../../images/amaya.gif" /></td>
      <td><p align="right"><a href="../SpellChecking.html.es"
        accesskey="t"><img alt="superior" src="../../images/up.gif" /></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>Corrector ortogr�fico</h1>

<p>Amaya contiene un corrector ortogr�fico para varios idiomas y selecciona
el lenguaje apropiado de acuerdo con el atributo <code>LANG</code>. El
atributo <code>LANG</code> puede asociarse a cualquier lemento en un
documento, incluso a una sola palabra, eligiendo el comando de men�
<strong>Atributos &gt; lang</strong>.</p>

<p>Para corregir un documento, elige el comando de men� <strong>Editar &gt;
Verificar ortograf�a</strong>.</p>

<h2>El diccionario personal</h2>

<p>Al registrar una nueva palabra, el corrector ortogr�fico crea o actualiza
el <b>diccionario personal de usuario</b>. El diccionario personal de usuario
se encuentra en el archivo <code>AmayaHome/dictionary.DCT</code>. En modo de
lectura y escritura, el corrector ortogr�fico utiliza el diccionario de
usuario al revisar cualquier documento, adem�s del diccionario espec�fico.
Cuando haces clic en los botones <strong>Saltar (+dic)</strong> y
<strong>Reemplazar (+dic)</strong> de la caja de di�logo <strong>Corrector
ortogr�fico</strong>, el corrector ortogr�fico crea y actualiza
autom�ticamente el diccionario de usuario.</p>

<h2>La caja de di�logo del corrector ortogr�fico</h2>

<p>El comando de men� <strong>Editar &gt; Verificar ortograf�a</strong> abre
una caja de di�logo que te permite elegir los par�metros e interactuar con el
corrector ortogr�fico. Los par�metros son los siguientes:</p>
<ul>
  <li>El campo <strong>N�mero de propuestas</strong> define el n�mero m�ximo
    de correcciones propuestas: puede tomar cualquier valor entre 1 y 10, el
    valor por omisi�n es 3. Cuando se detecta un error, al modificar este
    valor se actualiza la lista de correcciones.
    
  </li>
  <li>La secci�n <strong>Ignorar</strong> le pide al corrector ortogr�fico
    ignorar ciertas palabras, por ejemplo, las palabras que contienen
    may�sculas, d�gitos, n�mero romanos o caracteres especiales.&#x20ac;
    
  </li>
  <li>El grupo de opciones <strong>Comprobar</strong>, similar al grupo
    <strong>D�nde buscar</strong>del comando <strong>Buscar</strong>, te
    permite especificar la parte del documento que comprobar� el corrector
    ortogr�fico.
    
  </li>
  <li>El campo <strong>Verificando ortograf�a</strong> muestra las palabras
    incorrectas. Las palabras propuestas por el corrector se muestran en el
    campo selector situado justo debajo de la palabra incorrecta. Por
    omisi�n, Amaya selecciona la primera palabra propuesta. Para seleccionar
    otra, haz clic sobre la palabra preferida. Esa palabra se seleccionar�.
    Esta correcci�n puede editarse directamente en este formulario. La
    correcci�n se realiza cuando haces clic en el bot�n <strong>Reemplazar y
    siguiente</strong> o en <strong>Reemplazar (+dic)</strong>.
    
  </li>
  <li>El <strong>idioma</strong> en el que se realiza la correci�n se
    especifica en la esquina superior izquierda de la caja de di�logo. Para
    cambiar el idioma, aplica el atributo Language al texto mediante el men�
    <strong>Atributos</strong> y reinicia el corrector ortogr�fico.</li>
</ul>

<h2>Utilizar el corrector ortogr�fico</h2>

<p>Para iniciar el corrector, haz clic en el bot�n
<strong>Buscar/Saltar</strong> de la caja de di�logo. Si se encuentra un
error, la palabra incorrecta se selecciona y resalta en el documento. Si no
se detecta ning�n error, Amaya muestra el mensaje <b>No encontrado</b>.</p>

<p>Cuando se detecta una palabra incorrecta, pulsa el bot�n correspondiente
para realizar las operaciones siguientes:</p>
<ul>
  <li><strong>Aceptar</strong>: Amaya cierra la caja de di�logo y detiene el
    corrector ortogr�fico. Las correcciones anteriores no se deshacen.
    
  </li>
  <li><strong>Buscar/Saltar</strong>: Amaya considera la palabra incorrecta
    aceptable. No se realiza ning�n cambio ni en el texto ni en los
    diccionarios. El corrector busca el siguiente error.
    
  </li>
  <li><strong>Saltar (+dic)</strong>: Amaya considera la palabra incorrecta
    aceptable y adem�s la a�ade al diccionario, por lo que el corrector
    ignorar� cualquier aparici�n posterior de la palabra.
    
  </li>
  <li><strong>Reemplazar y siguiente</strong>: Amaya sustituye la palabra
    incorrecta por la palabra correcta (que puede haber sido editada por el
    usuario). El corrector busca el siguiente error.
    
  </li>
  <li><strong>Reemplazar (+dic):</strong> Amaya sustituye la palabra
    incorrecta por la palabra correcta (que puede haber sido editada por el
    usuario), pero adem�s la palabra correcta se a�ade al diccionario.</li>
</ul>
</div>
</body>
</html>
