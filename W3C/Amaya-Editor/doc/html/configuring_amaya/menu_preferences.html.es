<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
  <title>Men� Preferencias</title>
  <meta name="GENERATOR" content="amaya 9.52, see http://www.w3.org/Amaya/" />
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="es" lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home" />
         <img alt="Amaya" src="../../images/amaya.gif" />
      </td>
      <td><p align="right"><a
        href="about_configuration_directory_and_file_conventions.html.es"
        accesskey="p"><img alt="anterior" src="../../images/left.gif" />
        </a> <a href="../Configure.html.es" accesskey="t"><img alt="superior"
        src="../../images/up.gif" />
        </a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>Men� Preferencias</h1>

<p>Las cajas de di�logo se encuentran en el men� <strong>Editar &gt;
Preferencias</strong>. Hay diez cajas de di�logos:
<strong>Generales</strong>, <strong>Navegaci�n</strong>,
<strong>Publicaci�n</strong>, <strong>Cach�</strong>, <strong>Proxy</strong>,
<strong>Colores</strong>, <strong>Geometr�a de la ventana</strong>, y
<strong>Anotaciones</strong> y <strong>Cooperaci�n</strong>.</p>

<p>Cada una de estas cajas de di�logo contienen tres botones:</p>

<table>
  <tbody>
    <tr>
      <td><p class="TableHead"><b>Bot�n</b></p>
      </td>
      <td><p class="TableHead"><b>Efecto</b></p>
      </td>
    </tr>
    <tr>
      <td><p class="TableText">Aplicar</p>
      </td>
      <td><p class="TableText">Confirma y almacena las opciones que se
        muestran en la caja.</p>
      </td>
    </tr>
    <tr>
      <td><p class="TableText">Por omisi�n</p>
      </td>
      <td><p class="TableText">Restaura, sin guardar, los valores por
        omisi�n. Para guardar estas opciones, utiliza a continuaci�n el bot�n
        <strong>Aplicar</strong> .</p>
      </td>
    </tr>
    <tr>
      <td><p class="TableText">Aceptar</p>
      </td>
      <td><p class="TableText">Cierra la caja de di�logo.</p>
      </td>
    </tr>
  </tbody>
</table>

<h2>Preferencias generales</h2>

<p>Para abrir la caja de di�logo <strong>Preferencias generales</strong>,
elige el men� <strong>Editar &gt; Preferencias &gt; Generales</strong>.</p>

<h3>Directorios espec�ficos</h3>

<p>La caja de di�logo <strong>Preferencias generales</strong> muestra el
directorio de usuario, el directorio temporal y la p�gina web por omisi�n.
Estas opciones se explican a continuaci�n.</p>

<p><strong>Directorio de usuario de Amaya.</strong> S�lo en Windows.
Especifica el directorio en el que se almacenan las preferencias del
usuario.</p>

<p class="Note"><strong>Nota:</strong> La ubicaci�n de este directorio no se
puede modificar.</p>

<p><strong><br />
Directorio temporal.</strong> S�lo en Windows. Especifica el directorio en el
que Amaya almacena los archivos temporales, por ejemplo, al imprimir un
documento. Si no se especifica, el directorio por omisi�n es
<code>c:\temp</code>.</p>

<p class="Note"><strong>Nota:</strong> Al cambiar el directorio, el
directorio actual no se borra. Debes borrarlo manualmente. Si la
<strong>cach�</strong> se encontraba en el directorio temporal anterior, se
crear� una nueva cach� en el nuevo directorio.</p>

<p><strong><br />
P�gina de inicio.</strong> Especifica el URI que Amaya cargar� al abrir el
programa o cuando el usuario haga clic en el bot�n Inicio. Por ejemplo, la
p�gina de inicio podr�a ser: <code><a
href="http://www.w3.org/">http://www.w3.org</a></code></p>

<p class="Note"><strong>Nota:</strong> Debes escribir la URI completa.</p>

<h3>Casillas de verificaci�n</h3>

<p>Las opciones comentadas a continuaci�n pueden activarse o desactivarse
haciendo clic en la casilla de verificaci�n que se encuentra a la izquierda
de cada opci�n. Una casilla marcada indica que la opci�n est� activada.</p>

<p><strong>Activar pegado l�nea a l�nea</strong>. Esta opci�n afecta al
pegado desde un aplicaci�n externa. Cuando est� activada, Amaya mantiene la
separaci�n en l�neas de la aplicaci�n original. Si est� desactivada, los
caracteres de <code>salto de l�nea</code> se sustituyen por espacios.</p>

<p><strong>Generar copias de seguridad.</strong> Si esta opci�n est� marcada,
Amaya genera una copia de seguridad de cada documento editado, tras un n�mero
determinado de cambios. Esta opci�n se aplica nada m�s marcar la casilla.</p>

<p><strong>Guardar geometr�a al salir.</strong> Controla si, al salir de
Amaya, la posici�n y el tama�o de la ventana se guardan y aplican en la
siguiente sesi�n.</p>

<p><strong>Mostrar barra de botones.</strong> Controla si se muestra la barra
de botones en las vistas principales del documento.</p>

<p><strong>Mostrar direcci�n.</strong> Controla si se muestra la barra de
direcci�n en las vistas principales del documento.</p>

<p><strong>Mostrar destinos.</strong> Controla si se muestran los destinos de
enlaces en las vistas principales del documento.</p>

<p><strong>Atajos de teclado.</strong> Especifica la tecla (<kbd>Alt</kbd> o
<kbd>Control</kbd>) utilizada en las <a
href="..\Browsing.html.es#Access">teclas de acceso</a>, o especifica que se
ignoren las teclas de acceso definidas en el documento</p>

<h2>Opciones exclusivas de Unix</h2>

<p>Hay dos opciones de la caja de di�logo <strong>Preferencias
generales</strong> que s�lo est�n disponibles en Unix: <strong>Tama�o de
fuente en men�s</strong> y <strong>Retardo de doble clic</strong>. Estas
opciones se explican a continuaci�n.</p>

<p><strong>Tama�o de fuente en men�s</strong>. Especifica el tama�o de fuente
en todos los men�s de Amaya. Esta opci�n se tiene en cuenta al iniciar
Amaya.</p>

<p><strong>Retardo de doble clic</strong>. Esta opci�n te permite controlar
el retardo entre dos clics para que se consideren un doble clic. Esta opci�n
se tiene en cuenta al iniciar Amaya.</p>

<h2>Opciones de fuente e idioma</h2>

<p>Esta secci�n de la caja de di�logo <strong>Preferencias generales</strong>
te permite elegir el zoom de fuente y el idioma de di�logo utilizado por
Amaya. Estas opciones se explican a continuaci�n.</p>

<p><strong>Zoom de fuente</strong>. Puedes aumentar o reducir el zoom en las
ventanas. Cada documento se mostrar� ampliado o reducido con respecto a su
tama�o real de acuerdo con el valor de zoom establecido. Esta opci�n te
permite cambiar el zoom por omisi�n de todas las ventanas. Este cambio afecta
�nicamente al tama�o de fuente, pero no al tama�o de las im�genes y se
refleja inmediatamente en todas las ventanas abiertas.</p>

<p><strong>Idioma de di�logo.</strong> Especifica el idioma en todos los
men�s y mensajes de di�logo. El idioma por omisi�n es el ingl�s americano
(valor: <code>en_US</code>). Actualmente, hay varios idiomas m�s disponibles:
franc�s (<code>fr</code>), alem�n (<code>de</code>), italiano
(<code>it</code>), castellano (<code>es</code>), portugu�s (<code>pt</code>),
fin�s (<code>fi</code>) y turco (<code>tr</code>). Al inicar Amaya, se cargan
los archivos de di�logo correspondiente al idioma de di�logo especificado:
<code>en-</code>, <code>fr-</code>, <code>de-</code>, <code>it-</code>,
<code>es-</code>, <code>pt-</code>, <code>fi-</code> o <code>tr-</code>.
Estos archivos de di�logos se encuentran en la carpeta
<strong>Amaya/config</strong>.</p>

<p>En Thot, un documento est� especificado por un esquema. En Amaya, los
mensajes de di�logo que se muestran al analizar un documento o al guardarlos
seg�n un esquema espec�fico se encuentran en el archivo
<strong>Amaya/amaya/HTML.</strong><em><strong>code</strong></em>, en el que
el sufijo <em>code</em> es la abreviatura del idioma (por ejemplo,
<code>en</code> o <code>fr</code>). Este archivo tiene 4 secciones:</p>
<ul>
  <li><strong>extension:</strong> No utilizada por Amaya</li>
  <li><strong>presentation:</strong> No utilizada por Amaya</li>
  <li><strong>export</strong>: Identifica el texto mostrado en cada esquema
    de traducci�n (comando <strong>Guardar como</strong>)</li>
  <li><strong>translation</strong>: Identifica el texto mostrado en cada
    elemento y atributo en la estructura HTML de Thot.</li>
</ul>

<p>Es posible adaptar Amaya a nuevos idiomas ISO-Latin-1 escribiendo los
archivos de di�logo correspondientes. Estos archivos de di�logo deben
ubicarse en la misma carpeta (por ejemplo, Amaya/config) y deben utilizar el
c�digo ISO 639 correspondiente como prefijo (<code>it-</code> para italiano,
<code>de-</code> para alem�n, etc.). Tambi�n debes crear el archivo HTML.code
espec�fico.</p>

<h2>Navegaci�n</h2>

<p>La caja de di�logo <strong>Preferencias de navegaci�n</strong> te
permite...</p>

<h3>Casillas de verificaci�n</h3>

<p>Las opciones siguientes se pueden activar o desactivar haciendo clic en la
casilla de verificaci�n situada a la izquierda de cada opci�n. Una casilla
marcada indica que la opci�n est� activada.</p>

<p><strong>Cargar im�genes.</strong> Controla si las im�genes deben cargarse.
Esta opci�n se aplica inmediatamente.</p>

<p><strong>Cargar objetos.</strong> Controla si los objetos deben cargarse.
Esta opci�n se aplica inmediatamente.</p>

<p><strong>Mostrar im�genes de fondo.</strong> Controla la presentaci�n de
las im�genes de fondo. Esta opci�n se tiene en cuenta al cargar un
documento.</p>

<p><strong>Cargar CSS.</strong> Controla si las hojas de estilo CSS deben
cargarse y aplicarse. Esta opci�n se aplica inmediatamente.</p>

<p><strong>Doble clic activa enlaces.</strong> Desde la primera versi�n de
Amaya, para activar un enlace hay que hacer doble clic en �l. Eso te permite
elegir entre editar o activar un enlace. Puedes deshabilitar este
comportamiento desactivando esta opci�n.</p>

<p><strong>Tipo de pantalla actual.</strong> Define el tipo de pantalla
actual. Esta opci�n tiene efecto cunado una hoja de estilo CSS especifica un
medio determinado. Esta opci�n se aplica inmediatamente.</p>

<p><strong>Negociaci�n de idioma.</strong> Si un documento existe en
distintos idiomas y tu servidor est� configurado para establecer una
negociaci�n de idioma, puedes utilizar esta caja de di�logo para escribir tus
preferencias de idiomas (el primer idioma tiene la m�xima prioridad).
Consulta esta <a
href="http://www.w3.org/1999/05/WCAG-RECPressRelease.html">nota de
prensa</a>, disponible en franc�s, ingl�s y japon�s. Escribiendo los c�digos
ISO de estos idiomas (<strong>fr</strong>, <strong>en</strong>, o
<strong>ja</strong>), puedes consultar de forma transparente cualquiera de
estas versiones.</p>

<h2>Publicaci�n</h2>

<p>La caja de di�logo de <strong>Preferencias de publicaci�n</strong> te
permite establecer las preferencias de ETAGS y precondiciones, tanto para
verificar cada comando PUT con un comando GET, como para definir el nombre
por omisi�n de los URLs que acaban en barra, y permitir redirecciones PUT en
dominios espec�ficos. Estas opciones se explican a continuaci�n.</p>

<p><strong>Juego de caracteres para nuevos documentos.</strong> Establece el
juego de caracteres a utilizar al crear un documento nuevo.</p>

<p><strong>En documentos XHTML usar tipo MIME application/xhtml+xml.</strong>
Esta opci�n, si est� activada, asocia el nuevo tipo MIME oficial XHTML a
todos los documentos XTHML nuevos que se publican en la Web. Esta opci�n est�
deshabilita por omisi�n porque no todos los servidores pueden gestionar este
tipo MIME en el momento de escribir esta p�gina. F�jate en que esta opci�n
requiere un cambio en la configuraci�n del servidor, si no est� almacenando
en alg�n sitio los metadatos asociados con cada documento. Esta opci�n no
modifica el tipo MIME de los documentos ya existentes: el mismo tipo MIME que
se recibe se utiliza al guardar el documento, salvo si <strong>Guardas
como</strong>, evidentemente.</p>

<p><strong>Usar ETAGS y precondiciones.</strong> HTTP/1.1 introduce nuevos
encabezados que resuelven el problema de las <a
href="http://www.w3.org/WinCom/NoMoreLostUpdates.html">actualizaciones
perdidas</a> al publicar. Con esta opci�n, puedes detectar conflicto sentre
dos usuarios que est�n editando el mismo documento.</p>

<p><strong>Verificar cada PUT con un GET.</strong> Si no conf�as en tu
servidor, esta opci�n hace que Amaya descargue cada documento nada m�s ser
publicado y que lo compare con la copia almacenada en tu ordenador. Si hay
diferencias entre ambos documentos, Amayas te avisar�.</p>

<p><strong>Exportar CR/LF</strong> (s�lo en Windows). Esta opci�n, si est�
seleccionada, coloca un retorno de carro delante de cada salto de l�nea.</p>

<p><strong>El nombre por omisi�n de URL termina en '/'.</strong> Los
servidores HTTP suelen asociar los URLs que acaban en '/' con un nombre
determinado, por ejemplo, Overview.html. Esta opci�n te permite especificar
el nombre por omisi�n que Amaya debe utilizar al publicar tal URL. Pregunta
al webmaster cu�l es el nombre por omisi�n en tu servidor.</p>

<p><strong>Permitir redirecciones PUT aut�maticas en estos dominios.</strong>
De acuerdo con la especificaci�n HTTP/1.1 , las operaciones PUT no se deben
redirigir autom�ticamente a menos que pueda ser confirmado por el usuario,
puesto que esto puede cambiar las condiciones bajo las que se hizo la
petici�n. Puedes evitar que Amaya muestre un aviso de redirecci�n PUT
escribiendo el nombre de dominio del servidor en el que est�s publicando.
Puedes especificar uno o m�s dominios, separ�ndolos por un espacio, por
ejemplo, <code>www.w3.org groucho.marx.edu</code>.</p>

<h2>Cach�</h2>

<p>Amaya incluye una cach� mediante libwww. La cach� est� activada por
omisi�n y se almacena en la carpeta AmayaTemp/libwww-cache. Este men� tambi�n
contiene un bot�n <strong>Vaciar cach�</strong> para borrar la carpeta
cach�.</p>

<p><strong>Activar cach�.</strong> Activa o desactiva la cach�.</p>

<p><strong>Documentos protegidosen la Cach�.</strong> Por omisi�n, los
documentos protegidos por contrase�a se almacenan en la cach�. Utiliza esta
opci�n para evitarlo.</p>

<p><strong>Modo desconectado.</strong> Siempre recupera los documentos de la
cach�.</p>

<p><strong>Ignorar Expires: cabecera.</strong> Las entradas de cach� no
expiran.</p>

<p><strong>Directorio Cach�.</strong> Identifica el directorio padre del
directorio libwww-cache. Al cambiar este directorio no se borra el contenido
del directorio anterior. Debes eliminarlo t� mismo.</p>

<p class="Note"><strong>Nota:</strong> Los mecanismos de protecci�n de
archivos impiden el uso de directorios NFS (Network File System) como
directorio cach�, ya que NFS permite el uso compartido por m�ltiples
procesadores o usuarios. Utiliza un directorio local para la cach�.</p>

<p><strong>Tama�o de cach�.</strong> Indica el tama�o, en megabytes, de la
cach�.</p>

<p><strong>Tama�o m�ximo de entrada de cach�.</strong> Indica el tama�o
m�ximo de una entrada de cach�.</p>

<h2>Proxy</h2>

<p>En esta caja de di�logo puedes especificar un proxy y un conjunto de
dominios en el que el proxy debe o no utilizarse.</p>

<p><strong>Proxy HTTP.</strong> Identifica el proxy a utilizar en las
peticiones HTTP. Debes especificar el nombre completo del servidor. Si el
servidor est� funcionando en un puerto distinto al puerto 80, debes a�adir el
car�cter ":" al nombre del proxy, seguido del n�mero de puerto. La tabla
siguiente muestra dos ejemplos.</p>

<table border="1">
  <tbody>
    <tr>
      <th><p class="TableHead">Entrada HTTP Proxy</p>
      </th>
      <th><p class="TableHead">Resultado</p>
      </th>
    </tr>
    <tr>
      <td><p>groucho.marx.edu</p>
      </td>
      <td><p>Declara un proxy llamado groucho.marx.edu que funciona el el
        puerto 80.</p>
      </td>
    </tr>
    <tr>
      <td><p>groucho.marx.edu:1234</p>
      </td>
      <td><p>Declara un proxy llamado groucho.marx.edu que funciona en el
        puerto 1234.</p>
      </td>
    </tr>
  </tbody>
</table>

<p><strong>Lista de dominios proxy.</strong> Lista de dominios separados por
espacios con los que quieres utilizar el proxy. Utiliza los botones radio
para especificar si el proxy debe o no debe utilizarse con esta lista de
dominios.Por ejemplo:</p>
<pre style="margin-left:.5in"><code>harpo.marx.edu zeppo.marx.edu chico.marx.edu</code></pre>
<pre style="margin-left:.5in"><code>���������� �� ^--------------^----&gt; entradas separadas por espacios</code></pre>

<h2>Color</h2>

<p>Esta caja de di�logo te permite definir los colores de texto y fondo de
los documentos. Tambi�n te permite definir los colores utilizados por Amaya
para mostrar la selecci�n actual.</p>
<ul>
  <li><strong>Color del cursor</strong> es el color de fondo de la selecci�n
    cuando �sta se limita al punto de inserci�n.</li>
  <li><strong>Color de selecci�n</strong> es el color de fondo de la
    selecci�n.</li>
</ul>

<p>La versi�n Unix tambi�n proporciona entradas para modificar los colores
del men�. Para cambiar los colores del men� en Windows, debes utilizar el
control est�ndar de configuraci�n de pantalla que se encuentra en el Panel de
Control.</p>

<p>Los siguientes colores pueden seleccionarse por su nombre, c�digo
hexadecimal o RGBt:</p>
<ul>
  <li>Los nombres v�lidos de colores son: Aqua, Black, Blue, Fuchsia, Gray,
    Green, Lime, Maroon, Navy, Olive, Purple, Red, Silver, Teal, Yellow y
    White.</li>
  <li>El formato v�lido de un c�digo hexadecimal es #FF00FF, por ejemplo.
    <p>El formato v�lido de un c�digo RGB es rgb(255, 0, 255), por
    ejemplo.</p>
  </li>
</ul>

<p>Si escribes un color inv�lido, los colores por omisi�n se utilizan en su
lugar. En Windows tambi�n puedes elegir colores con la paleta de color.</p>

<p class="Note"><strong>Nota:</strong> Los cambios de colroes se har�n
efectivos al abrir una nueva ventana de documento o al recargar un
documento.</p>

<p>Los colores de los enlaces, los enlaces visitados y los enlaces activos se
definen en la hoja de estilo Amaya.css.</p>

<h2>Geometr�a de ventana</h2>

<p>La caja de di�logo te permite guardar la posici�n y tama�o actual de las
distintas ventanas de vistas de un documento (formateada, estructura,
alternativa, enlaces y tabla de contenidos) o restaurar los valores por
omisi�n.</p>

<p>Los valores que se guardan son los de la ventana de la vista desde la que
has abierto la caja de di�logo. Estos cambios se aplican al abrir nuevas
ventanas de documentos.</p>
</div>
</body>
</html>
