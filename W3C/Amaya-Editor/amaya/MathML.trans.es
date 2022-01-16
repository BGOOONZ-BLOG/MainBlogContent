! fichero MathML.trans.es: transformaci�n de estructuras para MathML
! ver HTML.trans.es para la descripci�n del lenguaje Trans
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! NOTA: las transformaciones no funcionan con elementos multiscript
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 
!!! Transformaciones de par�ntesis

! Incluir un elemento entre par�ntesis
Entre par�ntesis:*;
        {
        * > mrow:mo."(";
        * > mrow:*;
        * > mrow:mo.")";
        }

! Incluir una secuencia de elementos entre par�ntesis
!grupo: first:*,?*+, last:* ;
!        {
!        first > mrow:mo."(";
!        first > mrow:*;
!        * > mrow:*;
!        last > mrow:*;
!        last > mrow:mo.")";
!        }

! Eliminar par�ntesis
Eliminar par�ntesis: mrow{mf,?*+,mf};
	{
	mf /;
	* > :*;
	}

!!! transformaciones mrow

! Incluir un elemento en mrow
Incluir en mrow: *;
        {
        * > mrow:*;
        }

! Incluir una secuencia de elementos en mrow
Incluir en mrow: *,*+;
        {
        * > mrow:*;
        }

! Eliminar un nivel de mrow
Eliminar mrow: mrow{*+};
        {
        * > :*;
        }

!!! Transformaciones mstyle

! Incluir un elemento en mstyle
Incluir en mstyle: *;
        {
        * > mstyle:*;
        }

! Incluir una secuencia de elementos en mstyle
Incluir en mstyle: *,*+;
        {
        * > mstyle:*;
        }

! Eliminar un nivel de mstyle
Eliminar mstyle: mstyle{*+};
        {
        * > :*;
        }

!!! Transformaciones de ra�z (root)

! Incluir un elemento en ra�z
Incluir en ra�s : *;
	{
	* > mroot:*;
	* > mroot:none % ;
	}

! Incluir una secuencia de elementos en ra�z (root)
Incluir en ra�z: *+,last:*;
        {
        * > mroot.mrow:*;
	last > mroot.mrow:*;
	last > mroot:none % ;
        }

! Eliminar ra�z
Eliminar ra�z: mroot{base:*,? index:*};
        {
        base > :*;
	index / ;
        }


!!! Transformaciones de ra�z cuadrada

! Incluir un elemento en ra�z cuadrada
Incluir en ra�z cuadrada: *;
        {
        * > msqrt:*;
        }


! Incluir una secuencia de elementos en ra�z cuadrada
Incluir en ra�z cuadrada: *,*+;
        {
        * > msqrt.mrow:*;
        }

! Eliminar ra�z cuadrada
Eliminar ra�z cuadrada: msqrt{*};
        {
        * > :*;
        }

! Transformar una ra�z cuadrada en ra�z 
ra�z con �ndice: msqrt{*};
	{
	* > mroot:*;
	* > mroot:none %;
	}

! Transformar una ra�z cuadrada en menclose
menclose: msqrt{*};
	{
	* > menclose:*;
	}

!!! Tranformaciones de menclose

! Incluir un elemento en menclose
Incluir en menclose: *;
        {
        * > menclose:*;
        }


! Incluir una secuencia de elementos en menclose
Incluir en menclose: *,*+;
        {
        * > menclose:*;
        }

! Eliminar menclose
Eliminar menclose: menclose{*};
        {
        * > :*;
        }

! Transformar menclose en ra�z cuadrada
Ra�z cuadrada: menclose{*};
	{
	* > msqrt:*;
	}

!!! Transformaciones de fracci�n

! Transformar 2 elementos en una fracci�n
Fracci�n: (num:*,den:*) | mrow{num:*,den:*};
        {
        num > mfrac:*;
        den > mfrac:*;
        }

! Transformar un elemento en numerador
Numerador: *;
        {
        * > mfrac:*;
        * > mfrac:none %;
        }

! Transformar una secuencia de elementos en numerador
Numerador: ?*+,last:*;
        {
        * > mfrac.mrow:*;
	last > mfrac.mrow:*;
        last > mfrac:none %;
        }

! Transformar un elemento en denominador
Denominador: *;
        {
        * > mfrac:none %;
        * > mfrac:*;
        }

! Transformar una secuencia de elementos en denominador
Denominador: first:*,?*+;
        {
        first > mfrac:none %;
	first > mfrac.mrow:*;
        * > mfrac.mrow:*;
        }

! Eliminar una fracci�n
Eliminar fracci�n: mfrac{?(num:*),?(den:*)};
        {
        num > :*;
        den > :*;
        }


!!! Trasnformaciones de Sub y Sup

! Incluir elemento en subsup
Incluir en subsup:*;
	{
	* > msubsup:*;
	* > msubsup:none%;
	* > msubsup:none;
	}

! Eliminar subsup
Eliminar subsup: msubsup{base:*,?sub:*,?sup:*};
	{
	base > :*;
	sub /;
	sup /;
	}

! Eliminar superscript
Eliminar superscript: msubsup{base:*,?sub:*,?sup:*};
	{
	msubsup > msub;
	sup /;
	}

! Eliminar subscript
Eliminar subscript: msubsup{base:*,?sub:*,?sup:*};
	{
	msubsup > msup;
	sub /;
	}

! Incluir elemento en sub
Incluir en subscript:*;
	{
	* > msub:*;
	* > msub:none %;
	}

! Eliminar subscript
Eliminar subscript: msub{base:*,?sub:*};
	{
	base > :*;
	sub /;
	}

! Incluir elemento en sup
Incluir en superscript:*;
	{
	* > msup:*;
	* > msup:none %;
	}

! Eliminar superscript
Eliminar superscript: msup{base:*,?sup:*};
	{
	base > :*;
	sup /;
	}

! Transformar msub en msup
superscript:msub;
	{
	msub > msup;
	}

! Transformar msup en msub
subscript:msup;
	{
	msup > msub;
	}

! Transformar msub o msup en msubsup
subsup:msub{base:*,sub:*} | msup{base:*,sup:*};
	{
	base > msubsup:*;
	sup > msubsup:none %;
	sup > msubsup:*;
	sub > msubsup:*;
	sub > msubsup:none;
	}

! Transformar msubsup en munderover
munderover: msubsup{base:*,sub:*,sup:*};
  {
  base > munderover:*;
  sub > munderover:*;
  sup > munderover:*;
  }

!!! Transformaciones Under y Over

! Incluir un elemento en underover
Incluir en underover:*;
	{
	* > munderover:*;
	* > munderover:none %;
	* > munderover:none;
	}

! Eliminar underover
Eliminar underover:munderover{base:*,?under:*,?over:*};
	{
	base > :*;
	under /;
	over /;
	}
 
! Incluir un elemento en over
Incluir en over:*;
	{
	* > mover:*;
	* > mover:none %;
	}

! Eliminar over
Eliminar over:mover{base:*,?over:*};
	{
	base > :*;
	over /;
	}
 
! Incluir un elemento en under
Incluir en under:*;
	{
	* > munder:*;
	* > munder:none;
	}

! Eliminar under
Eliminar under:munder{base:*,?under:*};
	{
	base > :*;
	under /;
	}

! Transformar munderover en msubsup
msubsup: munderover{base:*,under:*,over:*};
  {
  base > msubsup:*;
  under > msubsup:*;
  over > msubsup:*;
  }

