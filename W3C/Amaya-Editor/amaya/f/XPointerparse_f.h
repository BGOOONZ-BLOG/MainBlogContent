/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern int LookupSymbol ( XPointerContextPtr ctx,
                          char *s );
extern void XPointer_select ( XPointerContextPtr ctx );
extern void XPointer_free ( XPointerContextPtr ctx );
extern ThotBool XPointer_isRangeTo ( XPointerContextPtr ctx );
extern ThotBool XPointer_isStringRange ( nodeInfo *node );
extern nodeInfo *XPointer_nodeStart ( XPointerContextPtr ctx );
extern nodeInfo *XPointer_nodeEnd ( XPointerContextPtr ctx );
extern Element XPointer_el ( nodeInfo *node );
extern int XPointer_startC ( nodeInfo *node );
extern int XPointer_endC ( nodeInfo *node );
extern XPointerContextPtr XPointer_parse ( Document doc,
                                           char *buffer );

#else /* __STDC__ */

extern int LookupSymbol ( XPointerContextPtr ctx,
                            char *s );
extern void XPointer_select ( XPointerContextPtr ctx );
extern void XPointer_free ( XPointerContextPtr ctx );
extern ThotBool XPointer_isRangeTo ( XPointerContextPtr ctx );
extern ThotBool XPointer_isStringRange ( nodeInfo *node );
extern nodeInfo *XPointer_nodeStart ( XPointerContextPtr ctx );
extern nodeInfo *XPointer_nodeEnd ( XPointerContextPtr ctx );
extern Element XPointer_el ( nodeInfo *node );
extern int XPointer_startC ( nodeInfo *node );
extern int XPointer_endC ( nodeInfo *node );
extern XPointerContextPtr XPointer_parse ( Document doc,
                                             char *buffer );

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */
