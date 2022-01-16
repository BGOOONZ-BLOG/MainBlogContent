<?xml version="1.0" encoding="utf-8" ?>
<!--
	# (c) 2011-2013 Andrea Perego
	# License: http://www.gnu.org/licenses/gpl
-->
<xsl:transform
    xmlns:rec     = "http://www.w3.org/2001/02pd/rec54#"
    xmlns:xsl     = "http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd     = "http://www.w3.org/2001/XMLSchema"
    xmlns:rdf     = "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs    = "http://www.w3.org/2000/01/rdf-schema#"
    xmlns:owl     = "http://www.w3.org/2002/07/owl#"
    xmlns:dcterms = "http://purl.org/dc/terms/"
    xmlns:foaf    = "http://xmlns.com/foaf/0.1/"
    xmlns:sioc    = "http://rdfs.org/sioc/ns#"
    xmlns:schema  = "http://schema.org/"
    xmlns:cc      = "http://creativecommons.org/ns#"
    xmlns:skos    = "http://www.w3.org/2004/02/skos/core#"
    xmlns:dcat    = "http://www.w3.org/ns/dcat#"
    xmlns:xhv     = "http://www.w3.org/1999/xhtml/vocab#"
    xmlns:wdrs    = "http://www.w3.org/2007/05/powder-s#"
    xmlns:vs      = "http://www.w3.org/2003/06/sw-vocab-status/ns#"
    xmlns:vann    = "http://purl.org/vocab/vann/"
    xmlns:voaf    = "http://labs.mondeca.com/vocab/voaf#"
    xmlns:adms    = "http://www.w3.org/ns/adms#"
    xmlns:locn    = "http://www.w3.org/ns/locn#"
    xmlns         = "http://www.w3.org/1999/xhtml"
  	version="1.0">
<!--
  <xsl:strip-space elements="*"/>
-->  
  <xsl:preserve-space elements="pre"/>
  <xsl:output method="xml"
              media-type="application/rdf+xml"
			  encoding="UTF-8"
              indent="yes" />

<!-- Removing all the no longer needed rdf:parseType="Literal" -->
  <xsl:template match="@rdf:parseType[../@rdf:parseType='Literal']"/>
<!-- Main template -->  
  <xsl:template match="@*|node()">
    <xsl:choose>
      <xsl:when test="self::* and namespace-uri() = 'http://www.w3.org/1999/xhtml'">
        <xsl:choose>
          <xsl:when test="local-name() = 'p' or local-name() = 'pre'">
            <xsl:text>&#xa;</xsl:text><xsl:value-of select="."/><xsl:text>&#xa;</xsl:text>
          </xsl:when>
          <xsl:when test="local-name() = 'ul'">
            <xsl:for-each select="*">
              <xsl:text>&#xa;- </xsl:text>
              <xsl:for-each select="node()">
                <xsl:choose>
                  <xsl:when test="local-name() = 'pre'">
                    <xsl:text>&#xa;</xsl:text><xsl:text>&#xa;</xsl:text><xsl:value-of select="."/>
                  </xsl:when>
                  <xsl:when test="local-name() = 'ul'">
                    <xsl:for-each select="*">
                      <xsl:text>&#xa;  - </xsl:text>
                      <xsl:for-each select="node()">
                        <xsl:choose>
                          <xsl:when test="local-name() = 'pre'">
                            <xsl:text>&#xa;</xsl:text><xsl:text>&#xa;</xsl:text><xsl:value-of select="."/>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="."/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:for-each>
                      <xsl:text>&#xa;</xsl:text>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
              <xsl:text>&#xa;</xsl:text>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="."/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="self::comment() or self::processing-instruction()">
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>  


  <xsl:template match="/">
  
    <xsl:apply-templates select="@*|node()"/>

  </xsl:template>


</xsl:transform>
