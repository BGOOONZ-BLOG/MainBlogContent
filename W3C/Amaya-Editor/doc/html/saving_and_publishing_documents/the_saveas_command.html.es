<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <meta name="GENERATOR" content="amaya 8.3-, see http://www.w3.org/Amaya/" />
  <title>El comando Guardar como</title>
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="es" lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home" /> <img alt="Amaya"
        src="../../images/amaya.gif" /></td>
      <td><p align="right"><a href="the_save_command.html.es"
        accesskey="p"><img alt="anterior" src="../../images/left.gif" /></a>
        <a href="../Publishing.html.es" accesskey="t"><img alt="superior"
        src="../../images/up.gif" /></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>El comando Guardar como</h1>

<p>Al elegir el comando de men� <strong>Archivo &gt; Guardar como</strong> se
abre la caja de di�logo <strong>Guardar como</strong>, con la que puedes:
guardar el documento como XML, HTML o como archivo de texto en un disco local
o en un URI remoto, guardar las im�genes incrustadas en la misma carpeta que
el documento o en otro lugar y transformar los URIs incrustados.</p>

<h2>La caja de di�logo Guardar como</h2>

<p>Los elementos de esta caja de di�logo se utilizan as�:</p>
<ul>
  <li>El <strong>Formato de documento</strong> permite elegir entre
    <strong>HTML</strong>, <strong>XML</strong> (XHTML) y
    <strong>Texto</strong> para los documentos HTML. Este submen� no se
    muestra cuando guardas SVG, MathML, CSS o cualquier otro tipo de
    documento. Por omisi�n, Amaya mantiene el formato del documento actual.
    Si eliges <strong>Text</strong> se elimina todo el marcado HTML y se
    sutituye por espacios, slatos de l�nea, etc.</li>
  <li>El campo <strong>Ubicaci�n de documento</strong> indica d�nde se
    guardar� el archivo. Puede ser un archivo local (por ejemplo,
    <code>/pub/html/welcome.html</code>) o un URI remoto (por ejemplo,
    <code>http://www.w3.org/pub/WWW/Welcome.html</code>).
    <p class="Note"><strong>Nota:</strong> Escribe el camino completo para el
    URL. As�mismo, debes estar seguro de que tiene derecho a ejecutar un
    m�todo <code>PUT</code> si se trata de un lugar remoto. Consulta la
    p�gina <a href="http://www.w3.org/Amaya/User/Put.html">configurar el
    servidor para aceptar el m�todo PUT</a> o pregunta al administrador de tu
    Web.</p>
  </li>
</ul>
<ul>
  <li>La casilla de verificaci�n <strong>Copiar im�genes</strong> indica si
    las im�genes incrustadas en el documento actual se debn copiar junto con
    el documento a la nueva ubicaci�n. Normalmente es mejor tener esta
    casilla marcada porque si no no estar�as seguro de que las im�genes se
    encontraran al abrir el documento posteriormente. Sin embargo, es �til
    tener esta casilla desmarcada cuando simplemente has cambiado el texto
    del documento y vas a guardar el documento en el mismo servidor. Al
    copiar las im�genes, Amaya actualizar� autom�ticamente todos los
    atributos <strong>SRC</strong> para que apunten a la nueva ubicaci�n de
    las im�genes. Las nuevas ubicaciones se escribir�n como URIs
  relativos.</li>
  <li>La casilla de verificaci�n <strong>Transformar URIs</strong> transforma
    los URIs actuales en URIs relativos siempre que sea posible. Por
    supuesto, si el documento se guarda en un archivo local y los URIs
    apuntan a archivos remotos, los URIs ser�n absolutos. Esto asegura que
    todos los enlaces del documento permanezcan correctos despu�s de la
    copia. Sin embargo, si tienes varios documentos enlazados entre s� con
    URIs relativos y quieres moverlos a una ubicaci�n remota, debes
    desactivar la conversi�n de URIs para evitar las referencias a las
    ubicaciones iniciales.</li>
  <li>El campo <strong>Directorio de im�genes</strong> te permite guardar
    im�genes (si la casilla <strong>Copiar im�genes</strong> est� activada)
    en un lugar distinto al del archivo HTML. Este campo debe contener el
    nombre de una carpeta del sistema de archivos local o la ubicaci�n en el
    servidor remoto.
    <ul>
      <li>Al utilizar caminos relativos, las im�genes se guardan en una
        ubicaci�n relativa a la carpeta del documento. Por ejemplo, si la
        ubicaci�n del documento es <code><a
        href="http://www.w3.org/pub/WWW/Welcome.html">http://www.w3.org/pub/WWW/Welcome.html</a></code>
        y la ubicaci�n de las im�genes es "Images", la imagen "W3C.png"
        contenida en el documento se almacenar�a con el URI <code><a
        href="http://www.w3.org/pub/WWW/Images/W3C.png">http://www.w3.org/pub/WWW/Images/W3C.png</a></code>
        y el archivo HTML se modificar� para que la referencia sea:
        <p><code>&lt;img src="Images/W3C.png"&gt;</code></p>
        <p>Suceder�a lo mismo en caso de que la ubicaci�n del documento fuera
        en el sistema de archivo local.</p>
      </li>
      <li>Al utilizar caminos absolutos, las im�genes se almacenan en la
        ubicaci�n exacta, independientemente de la ubicaci�n del documento.
        En el ejemplo previo, si la ubicaci�n especificada de las im�genes es
        <code>http://pub/WWW/Images</code>, la imagen se almacena en
        <code>http://www.w3.org/pub/WWW/Images/W3C.png</code> y el archivo
        HTML se modificar� para que la referencia sea:
        <p><code>&lt;img src="Images/W3C.png"&gt;</code></p>
      </li>
    </ul>
  </li>
</ul>

<p>En la parte inferior hay cuatro botones:</p>
<ul>
  <li>Al hacer clic en <strong>Confirmar</strong> se pone en marcha la
    transformaci�n del documento. Una caja de di�logo solicita confirmaci�n
    en los siguientes casos:
    <ul>
      <li>El documento debe guardarse en un servidor remoto. Amaya muestra el
        URI completo para que lo compruebes.</li>
      <li>El documento debe guardarse localmente y el archivo ya existe.</li>
    </ul>
  </li>
  <li>Al guardar en una ubicaci�n remota, comprueba que no est� activado el
    http_proxy, o que el servidor proxy y el <a
    href="http://www.w3.org/Amaya/User/Put.html">servidor destino est�n
    configurados para trabajar con el m�todo PUT</a>.</li>
  <li>En estos momentos Amaya no contacta con el servidor remoto (en caso de
    ser <code>http://...</code> destino) para comprobar si este documento ya
    existe.</li>
  <li>Al hacer clic en <strong>Buscar</strong> puedes seleccionar una carpeta
    y un nombre de archivo locales:
    <ul>
      <li>El campo <strong>Directorios de documentos</strong> muestra los
        directorios existentes en el directorio local actual. Debes
        utilizarlo para guardar un archivo en el sistema de archivo
      local.</li>
      <li>El campo <strong>Archivos</strong> muestra los archivos existentes
        en el directorio local actual.</li>
    </ul>
  </li>
  <li>Al hacer clic en <strong>Limpiar</strong> eliminas el contenido actual
    del campo <strong>Ubicaci�n del documento</strong> y del campo
    <strong>Directorio de im�genes</strong>.</li>
  <li>Al hacer clic en <strong>Cambiar Charset</strong> se abre una caja de
    di�logo en la que puedes cambiar el juego de caracteres del documento.
    Esta opci�n s�lo funciona en los documentos que permiten definir su juego
    de caracteres, como HTML, XML. Esta opci�n est� disponible tanto para
    guardar archivos remotos como locales.</li>
  <li>Al hacer clic en <strong>Cambiar Mime Type</strong> se abre una caja de
    di�logo en la que puedes seleccionar de tipo MIME del documento. Si el
    tipo MIME que buscas no est� en la lista, puedes escribirlo t� mismo.
    Este bot�n est� activo �nicamente cuando guardas un documento en un
    servidor (los sistemas de archivo local no almacenan la informaci�n de
    metadatos MIME).</li>
  <li>Al hacer clic en <strong>Cancelar</strong>, anulas el comando.</li>
</ul>

<h2>Ver tambi�n:</h2>
<ul>
  <li><a href="the_save_command.html.es">El comando Guardar</a></li>
</ul>
</div>
</body>
</html>
