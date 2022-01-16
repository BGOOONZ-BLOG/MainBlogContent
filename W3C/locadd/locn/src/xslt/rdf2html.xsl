<?xml version="1.0" encoding="utf-8" ?>
<!--
	# (c) 2011-2013 Andrea Perego
	# License: http://www.gnu.org/licenses/gpl
-->
<!-- Unused namespaces:	
    xmlns:xsd     = "http://www.w3.org/2001/XMLSchema"
    xmlns:skos    = "http://www.w3.org/2004/02/skos/core#"
    xmlns:xhv     = "http://www.w3.org/1999/xhtml/vocab#"
    xmlns:adms    = "http://www.w3.org/ns/adms#"
-->
<xsl:transform
    xmlns:rec     = "http://www.w3.org/2001/02pd/rec54#"
    xmlns:xsl     = "http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf     = "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs    = "http://www.w3.org/2000/01/rdf-schema#"
    xmlns:owl     = "http://www.w3.org/2002/07/owl#"
    xmlns:dcterms = "http://purl.org/dc/terms/"
    xmlns:foaf    = "http://xmlns.com/foaf/0.1/"
    xmlns:schema  = "http://schema.org/"
    xmlns:cc      = "http://creativecommons.org/ns#"
    xmlns:dcat    = "http://www.w3.org/ns/dcat#"
    xmlns:wdrs    = "http://www.w3.org/2007/05/powder-s#"
    xmlns:sioc    = "http://rdfs.org/sioc/ns#"
    xmlns:vs      = "http://www.w3.org/2003/06/sw-vocab-status/ns#"
    xmlns:vann    = "http://purl.org/vocab/vann/"
    xmlns:voaf    = "http://purl.org/vocommons/voaf#"
    xmlns:locn    = "http://www.w3.org/ns/locn#"
    xmlns         = "http://www.w3.org/1999/xhtml"
  	version="1.0">

  <xsl:output method="html"
              doctype-system="about:legacy-compact"
			  encoding="UTF-8"
              indent="yes" />

  <xsl:param name="l">
    <xsl:text>en</xsl:text>
  </xsl:param>

  <xsl:template name="substring-after-last">
    <xsl:param name="string" />
    <xsl:param name="delimiter" />
    <xsl:choose>
      <xsl:when test="contains($string, $delimiter)">
        <xsl:call-template name="substring-after-last">
          <xsl:with-param name="string" select="substring-after($string, $delimiter)" />
          <xsl:with-param name="delimiter" select="$delimiter" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$string" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>  

  <xsl:template name="local-name-from-expanded-name">
    <xsl:param name="string" />
    <xsl:choose>
      <xsl:when test="contains($string, '#')">
        <xsl:value-of select="substring-after($string, '#')"/>
      </xsl:when>
      <xsl:when test="contains($string, '/')">
        <xsl:call-template name="substring-after-last">
          <xsl:with-param name="string" select="$string"/>
          <xsl:with-param name="delimiter" select="'/'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$string" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template> 

  <xsl:template name="class_list">
    <xsl:for-each select="rdf:RDF/owl:Class|rdf:RDF/rdfs:Class|rdf:RDF/rdf:Description">
    <xsl:variable name="local_name">
      <xsl:call-template name="local-name-from-expanded-name">
        <xsl:with-param name="string" select="@rdf:about" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="substring($local_name,1,1) = translate(substring($local_name,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')">
<!--    
    <li>
      <a href="#{$local_name}">
        <var>
          <xsl:value-of select="$local_name"/>
        </var>
      </a>
    </li>
-->
    <li>
      <a href="#{dcterms:identifier}">
        <var>
<!--        
          <xsl:value-of select="dcterms:identifier"/>
-->          
          <xsl:value-of select="rdfs:label"/>
        </var>
      </a>
      <xsl:text> (</xsl:text><xsl:value-of select="vs:term_status"/><xsl:text>)</xsl:text>
    </li>
    </xsl:if>    
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="class_definitions">
    <xsl:for-each select="rdf:RDF/owl:Class|rdf:RDF/rdfs:Class|rdf:RDF/rdf:Description">
    <xsl:variable name="local_name">
      <xsl:call-template name="local-name-from-expanded-name">
        <xsl:with-param name="string" select="@rdf:about" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="substring($local_name,1,1) = translate(substring($local_name,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')">
    <h2 id="{dcterms:identifier}">Class <em><xsl:value-of select="rdfs:label"/></em></h2>
<!--    
    <table class="definition" id="{$local_name}">
-->    
<!--    
    <table class="definition" id="{dcterms:identifier}">
-->    
    <table class="definition">
<!--    
      <thead>
        <tr>
          <th colspan="2">Term&#xa0;Name: 
            <var>
              <xsl:value-of select="$local_name"/>
            </var>
          </th>
        </tr>
      </thead>
-->      
      <tbody>
        <tr>
          <th>Type&#xa0;of&#xa0;Term</th>
          <td>Class</td>
        </tr>
        <tr>
          <th>QName</th>
          <td>
            <code><xsl:value-of select="dcterms:identifier"/></code>
          </td>
        </tr>
        <tr>
          <th>URI</th>
          <td>
            <code>
              <xsl:value-of select="@rdf:about"/>
            </code>
          </td>
        </tr>
        <tr>
          <th>Term status</th>
          <td>
            <xsl:choose>
              <xsl:when test="vs:term_status">
                <xsl:value-of select="vs:term_status"/>
              </xsl:when>
              <xsl:otherwise>
                <em>unknown</em>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
<!--        
        <tr>
          <th>Label</th>
          <td>
            <xsl:value-of select="rdfs:label"/>
          </td>
        </tr>
-->        
<!--        
        <tr>
          <th>Label @xx</th>
          <td>Where possible, provide natural language labels for the term in other languages xx</td>
        </tr>
-->        
        
        <xsl:if test="rdfs:subClassOf">
        <tr>
          <th>Subclass&#xa0;of</th>
          <td><code><xsl:value-of select="rdfs:subClassOf/@rdf:resource"/></code></td>
        </tr>
        </xsl:if>
        <tr>
          <th>Definition</th>
          <td>
<!--          
            <xsl:copy-of select="rdfs:comment"/>
-->            
            <xsl:for-each select="rdfs:comment/child::node()|rdfs:comment/child::text()">
              <xsl:copy-of select="."/>
            </xsl:for-each>
          </td>
        </tr>
<!--        
        <tr>
          <th>Definition @xx</th>
          <td>Where possible, provide definitions in additional languages</td>
        </tr>
-->        
        <xsl:if test="vann:usageNote">
          <tr>
            <th><p>Usage&#xa0;Note</p></th>
            <td>
<!--            
              <xsl:value-of select="vann:usageNote"/>
-->              
              <xsl:for-each select="vann:usageNote/child::node()|vann:usageNote/child::text()">
                <xsl:copy-of select="."/>
              </xsl:for-each>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="vann:example">
          <tr>
            <th><p>Example</p></th>
            <td>
<!--            
              <xsl:value-of select="vann:example"/>
-->              
              <xsl:for-each select="vann:example/child::node()|vann:example/child::text()">
                <xsl:copy-of select="."/>
              </xsl:for-each>
            </td>
          </tr>
        </xsl:if>
      </tbody>
    </table>
    </xsl:if>    
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="property_list" >
  <xsl:for-each select="rdf:RDF/rdf:Property|rdf:RDF/rdf:Description">
    <xsl:variable name="local_name">
      <xsl:call-template name="local-name-from-expanded-name">
        <xsl:with-param name="string" select="@rdf:about" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="substring($local_name,1,1) = translate(substring($local_name,1,1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')">
<!--    
    <li>
      <a href="#{$local_name}">
        <var>
          <xsl:value-of select="$local_name"/>
        </var>
      </a>
    </li>
-->
    <li>
      <a href="#{dcterms:identifier}">
        <var>
<!--        
          <xsl:value-of select="dcterms:identifier"/>
-->          
          <xsl:value-of select="rdfs:label"/>
        </var>
      </a>
      <xsl:text> (</xsl:text><xsl:value-of select="vs:term_status"/><xsl:text>)</xsl:text>
    </li>
    </xsl:if>
    </xsl:for-each>    
  </xsl:template>

  <xsl:template name="property_definitions" >
  <xsl:for-each select="rdf:RDF/rdf:Property|rdf:RDF/rdf:Description">
    <xsl:variable name="local_name">
      <xsl:call-template name="local-name-from-expanded-name">
        <xsl:with-param name="string" select="@rdf:about" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="substring($local_name,1,1) = translate(substring($local_name,1,1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')">
    <h2 id="{dcterms:identifier}">Property <em><xsl:value-of select="rdfs:label"/></em></h2>
<!--    
    <table class="definition" id="{$local_name}">
-->
<!--    
    <table class="definition" id="{dcterms:identifier}">
-->
    <table class="definition">
<!--    
      <thead>
        <tr>
          <th colspan="2">Term&#xa0;Name: 
            <var>
              <xsl:value-of select="$local_name"/>
            </var>
          </th>
        </tr>
      </thead>
-->
      <tbody>
        <tr>
          <th>Type&#xa0;of&#xa0;Term</th>
          <td>Property</td>
        </tr>
        <tr>
          <th>QName</th>
          <td>
            <code><xsl:value-of select="dcterms:identifier"/></code>
          </td>
        </tr>
        <tr>
          <th>URI</th>
          <td>
            <code>
              <xsl:value-of select="@rdf:about"/>
            </code>
          </td>
        </tr>
        <tr>
          <th>Term status</th>
          <td>
            <xsl:value-of select="vs:term_status"/>
          </td>
        </tr>
<!--        
        <tr>
          <th>Label</th>
          <td>
            <xsl:value-of select="rdfs:label"/>
          </td>
        </tr>
-->
<!--        
        <tr>
          <th>Label @xx</th>
          <td>Where possible, provide natural language labels for the term in other languages xx</td>
        </tr>
-->        
        <xsl:if test="rdfs:domain">
        <tr>
          <th>Domain</th>
          <td>
            <code><xsl:value-of select="rdfs:domain/@rdf:resource"/></code>
          </td>
        </tr>
        </xsl:if>
        <xsl:if test="rdfs:range">
        <tr>
          <th>Range</th>
          <td>
            <code><xsl:value-of select="rdfs:range/@rdf:resource"/></code>
          </td>
        </tr>
        </xsl:if>
        <xsl:if test="rdfs:subPropertyOf">
        <tr>
          <th>Subproperty&#xa0;of</th>
          <td><code><xsl:value-of select="rdfs:subPropertyOf/@rdf:resource"/></code></td>
        </tr>
        </xsl:if>
        <tr>
          <th>Definition</th>
          <td>
<!--          
            <xsl:value-of select="rdfs:comment"/>
-->            
            <xsl:for-each select="rdfs:comment/child::node()|rdfs:comment/child::text()">
              <xsl:copy-of select="."/>
            </xsl:for-each>
          </td>
        </tr>
<!--        
        <tr>
          <th>Definition @xx</th>
          <td>Where possible, provide definitions in additional languages</td>
        </tr>
-->        
        <xsl:if test="vann:usageNote">
          <tr>
            <th><p>Usage&#xa0;Note</p></th>
            <td>
<!--            
              <xsl:value-of select="vann:usageNote"/>
-->              
              <xsl:for-each select="vann:usageNote/child::node()|vann:usageNote/child::text()">
                <xsl:copy-of select="."/>
              </xsl:for-each>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="vann:example">
          <tr>
            <th><p>Example</p></th>
            <td>
<!--            
              <xsl:value-of select="vann:usageNote"/>
-->              
              <xsl:for-each select="vann:example/child::node()|vann:example/child::text()">
                <xsl:copy-of select="."/>
              </xsl:for-each>
            </td>
          </tr>
        </xsl:if>
      </tbody>
    </table>
    </xsl:if>
    </xsl:for-each>    
  </xsl:template>

  <xsl:template match="/">
    <xsl:param name="title" select="rdf:RDF/owl:Ontology/rdfs:label"/>
    <xsl:param name="version" select="rdf:RDF/owl:Ontology/owl:versionInfo"/>
    <xsl:param name="versionNr">1.01</xsl:param>
    <xsl:param name="issued" select="rdf:RDF/owl:Ontology/dcterms:issued"/>
    <xsl:param name="modified" select="rdf:RDF/owl:Ontology/dcterms:modified"/>
    <xsl:param name="schemaURI" select="rdf:RDF/owl:Ontology/@rdf:about"/>
    <xsl:param name="preferredNamespace" select="rdf:RDF/owl:Ontology/vann:preferredNamespaceUri"/>
    <xsl:param name="preferredPrefix" select="rdf:RDF/owl:Ontology/vann:preferredNamespacePrefix"/>
    <xsl:param name="abstract" select="rdf:RDF/owl:Ontology/dcterms:abstract/child::node()|rdf:RDF/owl:Ontology/dcterms:abstract/child::text()"/>
    <xsl:param name="documentation" select="rdf:RDF/owl:Ontology/wdrs:describedby/rdf:Description/@rdf:about"/>
    <xsl:param name="uml" select="rdf:RDF/owl:Ontology/foaf:depiction/rdf:Description" />
    <xsl:param name="documentationTitle" select="rdf:RDF/owl:Ontology/wdrs:describedby/rdf:Description/dcterms:title"/>
    <xsl:param name="methodology" select="rdf:RDF/owl:Ontology/dcterms:conformsTo/rdf:Description/@rdf:about"/>
    <xsl:param name="methodologyTitle" select="rdf:RDF/owl:Ontology/dcterms:conformsTo/rdf:Description/dcterms:title"/>
    <xsl:param name="forum" select="rdf:RDF/owl:Ontology/dcterms:relation/sioc:Forum/@rdf:about"/>
    <xsl:param name="forumTitle" select="rdf:RDF/owl:Ontology/dcterms:relation/sioc:Forum/dcterms:title"/>
    <xsl:param name="licence" select="rdf:RDF/owl:Ontology/dcterms:license/rdf:Description/@rdf:about"/>
    <xsl:param name="licenceTitle" select="rdf:RDF/owl:Ontology/dcterms:license/rdf:Description/dcterms:title"/>
    <xsl:param name="baseUri" select="translate($preferredNamespace, '#', '')"/>
<!--    
    <xsl:param name="thisDocUri" select="concat(translate($preferredNamespace, '#', '/'),translate($modified, '-', ''),'#')"/>
    <xsl:param name="thisDocUri" select="concat(translate($preferredNamespace, '#', '/'),$versionNr,'#')"/>
-->    
    <xsl:param name="thisDocUri" select="rdf:RDF/owl:Ontology/owl:versionIRI/@rdf:resource"/>
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
      <head>
        <title>
          <xsl:value-of select="$title" />
        </title>
<!-- Include the HTML5 Shim to handle older browsers -->
<!--[if lt IE 9]>
     <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
        <meta name="viewport" content="width=device-width" />
        <meta charset="utf-8" />
<!--        
        <link rel="last" href="{rdf:RDF/owl:Ontology/@rdf:about}" />
-->        
        <xsl:for-each select="rdf:RDF/owl:Ontology/dcterms:hasFormat/rdf:Description">
          <xsl:choose>
            <xsl:when test="dcat:mediaType = 'text/html'">
              <link rel="self" href="{@rdf:about}" type="{dcat:mediaType}" title="{rdfs:label}" />
            </xsl:when>
            <xsl:otherwise>
              <link rel="alternate" href="{@rdf:about}" type="{dcat:mediaType}" title="{rdfs:label}" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
        <link rel="license" href="{$licence}" title="{$licenceTitle}" />
        <link href="http://www.w3.org/StyleSheets/TR/base.css" rel="stylesheet" type="text/css" title="base W3C /TR styles" />
        <style type="text/css">
/*        
          table.term {
            width:100%;
            border-collapse:collapse;
            margin-bottom:2em;
          }
          table.term th, table.term td {
            padding: 0.2em 0.5em;
            text-align:left;
            vertical-align:top;
          }
*/          
/*          
          table.term th {
            text-align:left;
            vertical-align:top;
            padding-left:0;
          }
*/
/*          
          table.term tbody th {
            width:8em;
          }
          table.term thead th {
            color: #005A9C;
          }
          section#generator {
            margin:1em 0;
            border-top: 1px solid #999;
          }

          section#generator p {
            text-align:right;
            font-style:italic;
          }
          ul.summaryList {
            list-style-type:none;
            display:block;
            width: 90%;
            margin: 0 auto;
            border: 1px solid black;
            padding: 1em;
            background-color: #ccc;
          }
          ul.summaryList li {
            display:inline-block; 
            margin: 0 0.3em;
            line-height:1.5em;
          }
          figure {
            display:block;
            text-align:center;
          }
          figcaption {
            display:block;
            font-style: italic;
            font-size: smaller;
            font-weight: bold;
            margin:0.5em 0;
          }
*/
  footer p {text-align:right; font-style:italic}
  table {border-collapse:collapse; caption-side:bottom}
  td, th {border:1px dotted #000000; padding:0.2em}
  table caption {font-style:italic; padding:0.3em 0}
  section#namespaces td {font-family:monospace}
  table.definition {margin-top:1em; width:100%}
  table.definition td.prop {width:10em}
  
  td, th {padding:0.5em}
  table.definition th {text-align:left;width:10em}
        </style>
      </head>
      <body>
        <header id="docHeader">
<!--        
          <a href="http://joinup.ec.europa.eu/">
            <img src="joinup.png" alt="European Commission Joinup" id="branding" width="262" height="78" />
          </a>
-->          
          <hgroup>
            <h1 id="docTitle">
              <xsl:value-of select="$title" />
            </h1>
            <h2 id="versionHeader">  
              <xsl:value-of select="$version" />
              <xsl:text> - </xsl:text>
              <time datetime="{$issued}"><xsl:value-of select="$issued"/></time>
            </h2>
          </hgroup>
          <dl id="versionLinks">
<!--          
            <dt>This version:</dt>
            <dd>
              <a href="{$thisDocUri}"><xsl:value-of select="$thisDocUri"/></a>
            </dd>
            <dt>Latest version:</dt>
            <dd>
              <a href="{$schemaURI}"><xsl:value-of select="$schemaURI"/></a>
            </dd>
            <dt>Previous version:</dt>
            <xsl:choose>
              <xsl:when test="rdf:RDF/owl:Ontology/xhv:prev">
            <dd>
              <a href="{rdf:RDF/owl:Ontology/xhv:prev/@rdf:resource}"><xsl:value-of select="rdf:RDF/owl:Ontology/xhv:prev/@rdf:resource"/></a>
            </dd>
              </xsl:when>
              <xsl:otherwise>
            <dd>None</dd>
              </xsl:otherwise>
            </xsl:choose>
-->            
<!--   
         <dt>Alternative Representations</dt>
         <dd>This document is also available as <a href="">@@@XML@@@</a> and <a href="">@@@RDF@@@</a>.</dd> 
-->
            <dt>Author:</dt> 
            <xsl:for-each select="rdf:RDF/owl:Ontology/foaf:maker">
              <dd>
                <xsl:choose>
                  <xsl:when test="foaf:homepage/@rdf:resource or foaf:page/@rdf:resource">
                    <xsl:variable name="self_url">
                      <xsl:choose>
                        <xsl:when test="foaf:homepage/@rdf:resource">
                          <xsl:value-of select="foaf:homepage/@rdf:resource"/>
                        </xsl:when>
                        <xsl:when test="foaf:page/@rdf:resource">
                          <xsl:value-of select="foaf:page/@rdf:resource"/>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:variable>
                    <a href="{$self_url}" title="{$self_url}"><xsl:value-of select="foaf:name"/></a>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="foaf:name"/>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="schema:affiliation">
                    <xsl:text>, </xsl:text><xsl:value-of select="schema:affiliation/foaf:name"/>
                  </xsl:when>
<!--                  
                  <xsl:otherwise>
                    Independent
                  </xsl:otherwise>
-->
                </xsl:choose>
              </dd>
            </xsl:for-each>
            <dt>Editor(s):</dt> 
            <xsl:for-each select="rdf:RDF/owl:Ontology/rec:editor">
              <dd>
                <xsl:choose>
                  <xsl:when test="foaf:homepage/@rdf:resource">
                    <a href="{foaf:homepage/@rdf:resource}" title="{foaf:homepage/@rdf:resource}"><xsl:value-of select="foaf:name"/></a>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="foaf:name"/>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="schema:affiliation">
                    <xsl:text>, </xsl:text><xsl:value-of select="schema:affiliation/foaf:name"/>
                  </xsl:when>
<!--                  
                  <xsl:otherwise>
                    Independent
                  </xsl:otherwise>
-->                  
                </xsl:choose>
              </dd>
            </xsl:for-each>

          </dl>
<!-- <p>Please refer to the <a href="">@@@errata@@@</a> for this document.</p>-->
          <p>This document is also available in the following formats:
          <xsl:for-each select="rdf:RDF/owl:Ontology/dcterms:hasFormat/rdf:Description">
            <xsl:if test="dcat:mediaType != 'text/html'">
              <a rel="alternate" href="{@rdf:about}" title="{rdfs:label}"><xsl:value-of select="dcat:mediaType"/></a><xsl:text> </xsl:text>
            </xsl:if>
          </xsl:for-each>
          </p>
        </header>
        <section id="copyright">
          <p class="copyright"><xsl:value-of select="rdf:RDF/owl:Ontology/dcterms:rights"/> This vocabulary is published under the <span xmlns:cc="http://creativecommons.org/ns#" about="{rdf:RDF/owl:Ontology/dcterms:license/rdf:Description/cc:attributionURL/@rdf:resource}"> <a rel="cc:attributionURL" property="cc:attributionName" href="{rdf:RDF/owl:Ontology/dcterms:license/rdf:Description/cc:attributionURL/@rdf:resource}"><xsl:value-of select="rdf:RDF/owl:Ontology/dcterms:license/rdf:Description/cc:attributionName"/></a> / <a rel="license" href="{$licence}"><xsl:value-of select="$licenceTitle"/></a></span></p>
        </section>
        <hr title="Separator for top matter" />
        <section id="abstract">
          <header>
            <h1>Abstract</h1>
          </header>
          <p><xsl:copy-of select="$abstract" /></p>
        </section>
<section id="status">
<header>
<h1>Status of this document</h1>
<p><em>This section describes the status of this document at the time of its publication. Other documents may supersede it.</em></p>
</header>
<p>This document was produced by the <a href="{rdf:RDF/owl:Ontology/foaf:maker/foaf:homepage/@rdf:resource}"><xsl:value-of select="rdf:RDF/owl:Ontology/foaf:maker/foaf:name"/></a>, following the <a href="{$methodology}"><xsl:value-of select="$methodologyTitle"/></a>.</p>
<p><xsl:copy-of select="rdf:RDF/owl:Ontology/rdfs:comment/child::node()"/></p>
<!--
<p>This document has been reviewed by representatives of the Member States of the European Union, <abbr title="Public Sector Information">PSI</abbr> publishers, and by other interested parties. Publication of this Final Draft does not imply endorsement by the European Commission or its representatives. This is a draft document and may be updated, replaced or made obsolete by other documents at any time. It is inappropriate to cite this document as other than work in progress. The Working Group will seek further endorsement by the Member State representatives in the ISA Coordination Group or the Trusted Information Exchange Cluster.</p>
<p>Comments on the vocabulary are invited via the <a href="https://joinup.ec.europa.eu/asset/adms/topic/public-comments-adms-specification-v08">forum</a>.</p>
-->
</section>
<section role="main">
          <header id="toc">
            <h1>Table of Contents</h1>
            <nav>
              <ul>
                <li>
                  <a href="#intro">Introduction</a>
                </li>
                <li>
                  <a href="#namespace">Namespace</a>
                </li>
                <li>
                  <a href="#glance">Vocabulary Terms at a Glance</a>
                </li>
                <li>
                  <a href="#classes">Classes</a>
                </li>
                <li>
                  <a href="#properties">Properties</a>
                </li>
                <li>
                  <a href="#conformance">Conformance Statement</a>
                </li>
                <li>
                  <a href="#changes">Change History</a>
                </li>
              </ul>
            </nav>
          </header>
<h1 id="intro">Introduction</h1>
<p>The <xsl:value-of select="$title" /> was developed by the <a href="{rdf:RDF/owl:Ontology/foaf:maker/foaf:page/@rdf:resource}"><xsl:value-of select="rdf:RDF/owl:Ontology/foaf:maker/foaf:name"/></a>. This is the namespace document, generated from the associated RDF schema. Full documentation is provided in the <a href="{$documentation}"><xsl:value-of select="$documentationTitle"/></a> document itself. This includes background information, use cases, the conceptual model and full definitions for all terms used.</p>
<h1 id="namespace">Namespace</h1>
<p>The URI for this vocabulary is</p>
<pre><xsl:value-of select="$preferredNamespace"/></pre>
<p>When abbreviating terms the suggested prefix is <code><xsl:value-of select="$preferredPrefix"/></code></p>
<p>Each class or property in the vocabulary has a URI constructed by appending a term name to the vocabulary URI. For example:</p>
<pre><xsl:value-of select="/rdf:RDF/rdfs:Class/@rdf:about"/></pre>
<xsl:if test="rdf:RDF/owl:Ontology/voaf:reliesOn/@rdf:resource">
<p>The <xsl:value-of select="$title" /> includes terms defined in the following namespaces:</p>
<ul>
<xsl:for-each select="rdf:RDF/owl:Ontology/voaf:reliesOn/@rdf:resource">
<li><code><xsl:value-of select="."/></code></li>
</xsl:for-each>
</ul> 
</xsl:if>
          <section id="glance">
            <header>
              <h1>Vocabulary Terms at a Glance</h1>
            </header>
          <xsl:for-each select="$uml">
            <section id="umlDiagram">
              <figure>
                <img src="{$uml/@rdf:about}" alt="{$uml/rdfs:label}" />
<!--				
                <figcaption><xsl:value-of select="$uml/rdfs:label"/></figcaption>
-->				
              </figure>
            </section>
          </xsl:for-each>
<!--<p>Provide a summary table or tables of the vocabulary terms. Distinguish between concepts and relationships/properties (RDF classes and proedicates).</p>-->
            <dl>
              <dt>Classes (<xsl:value-of select="rdf:RDF/owl:Ontology/voaf:classNumber"/>):</dt>
              <dd>
                <ul class="summaryList">
                <xsl:call-template name="class_list"/>
                </ul>
              </dd>
              <dt>Properties (<xsl:value-of select="rdf:RDF/owl:Ontology/voaf:propertyNumber"/>):</dt>
              <dd>
                <ul class="summaryList">
                <xsl:call-template name="property_list"/>
                </ul>
              </dd>
            </dl>
          </section>
          <h1 id="classes">Classes</h1>
          <p>This section provides the formal definition of each class in the vocabulary.</p>
<!--
          <xsl:apply-templates select="rdf:RDF/owl:Class|rdf:RDF/rdfs:Class|rdf:RDF/rdf:Description"/>
-->
          <xsl:call-template name="class_definitions"/>
          <h1 id="properties">Properties</h1>
          <p>This section provides the formal definition of each property in the vocabulary.</p>
<!--
          <xsl:apply-templates select="rdf:RDF/rdf:Property|rdf:RDF/rdf:Description"/>
-->
          <xsl:call-template name="property_definitions"/>
          <h1 id="conformance">Conformance Statement</h1>
          <p>A conformant implementation of this vocabulary MUST understand all vocabulary terms defined in this document.</p>
          <xsl:if test="rdf:RDF/owl:Ontology/vann:changes">
          <h1 id="changes">Change History</h1>
          <xsl:for-each select="rdf:RDF/owl:Ontology/vann:changes/child::node()">
            <xsl:copy-of select="."/>
          </xsl:for-each>
          </xsl:if>
        </section> <!-- end of main section -->
<!--
        <section id="generator">
        <p>Document generated from the RDF schema using <a href="rdf2html0.8.3.xsl">this XSLT</a></p>
        </section>
-->
        <hr/>
        <footer>
          <p>Last updated: $Date: <xsl:value-of select="$modified"/> $</p>
          <p><a href="{rdf:RDF/owl:Ontology/dcterms:mediator/foaf:homepage/@rdf:resource}"><xsl:value-of select="rdf:RDF/owl:Ontology/dcterms:mediator/foaf:name"/></a>, <a href="{rdf:RDF/owl:Ontology/dcterms:mediator/foaf:mbox/@rdf:resource}"><xsl:value-of select="substring-after(rdf:RDF/owl:Ontology/dcterms:mediator/foaf:mbox/@rdf:resource,'mailto:')"/></a>.</p>
        </footer>
      </body>
    </html>

  </xsl:template>

</xsl:transform>
