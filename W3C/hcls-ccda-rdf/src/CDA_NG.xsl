<?xml version="1.0" encoding="UTF-8"?>
<!--
  xsltproc - -stringparam now `date +%Y-%02m-%02dT%02H:%02M:%02S%:z` CDA_NG.xsl IJ.xml > IJ.ttl && sparql -d IJ.ttl

  cp CDA_NG.xsl CDA_NG-text.xsl && perl -pi -e "s{<xsl:param name=\"output\" select=\"'html'\"/>}{<xsl:param name=\"output\" select=\"'text'\"/>};s{xsl:output method=\"html\"}{xsl:output method=\"text\"}" CDA_NG-text.xsl && xsltproc -stringparam now `date +%Y-%02m-%02dT%02H:%02M:%02S%:z` CDA_NG-text.xsl IJ.xml > IJ.ttl && LD_LIBRARY_PATH=/usr/local/instantclient_11_2/:/home/eric/checkouts/libbooost.inst/lib/:/home/eric/checkouts/SWObjects/boost-log-1.46/stage/lib /home/eric/checkouts/SWObjects/bin/sparql -d IJ.ttl

  Title: CDA XSL StyleSheet
  Original Filename: cda.xsl 
  Version: 3.0
  Revision History: 08/12/08 Jingdong Li updated
  Revision History: 12/11/09 KH updated 
  Revision History:  03/30/10 Jingdong Li updated.
  Revision History:  08/25/10 Jingdong Li updated
  Revision History:  09/17/10 Jingdong Li updated
  Revision History:  01/05/11 Jingdong Li updated
  Specification: ANSI/HL7 CDAR2  
  The current version and documentation are available at http://www.lantanagroup.com/resources/tools/. 
  We welcome feedback and contributions to tools@lantanagroup.com
  The stylesheet is the cumulative work of several developers; the most significant prior milestones were the foundation work from HL7 
  Germany and Finland (Tyylitiedosto) and HL7 US (Calvin Beebe), and the presentation approach from Tony Schaller, medshare GmbH provided at IHIC 2009. 
-->
<!-- LICENSE INFORMATION
  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
  You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0 
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n1="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <!-- xsl:output method="xml" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" / -->
  <xsl:param name="now" select="''"/>
  <xsl:param name="output" select="'text'"/>
  <xsl:param name="newline">
    <xsl:choose>
      <xsl:when test="$output='text'"><xsl:value-of select="'&#x0a;'"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="'&#x0d;&#x0a;'"/></xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:output method="text" indent="yes" version="4.01" encoding="UTF-8" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.01//EN"/>
  <!-- global variable title -->
  <xsl:variable name="title">
    <xsl:choose>
      <xsl:when test="string-length(/n1:ClinicalDocument/n1:title)  &gt;= 1">
	<xsl:value-of select="/n1:ClinicalDocument/n1:title"/>
      </xsl:when>
      <xsl:when test="/n1:ClinicalDocument/n1:code/@displayName">
	<xsl:value-of select="/n1:ClinicalDocument/n1:code/@displayName"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>Clinical Document</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <!-- Main -->
  <xsl:template match="/">
    <xsl:apply-templates select="n1:ClinicalDocument"/>
  </xsl:template>
  <!-- produce browser rendered, human readable clinical document -->
  <xsl:template match="n1:ClinicalDocument">
    <xsl:choose>
      <xsl:when test="$output!='text'">
	<html>
	  <head>
	    <xsl:comment> Do NOT edit this HTML directly: it was generated via an XSLT transformation from a CDA Release 2 XML document. </xsl:comment>
	    <title>
	      <xsl:value-of select="$title"/>
	    </title>
	    <xsl:call-template name="addCSS"/>
	  </head>
	  <body>
	    <h1 class="h1center">
	      <xsl:value-of select="$title"/>
	    </h1>
	    <xsl:call-template name="body"/>
	    <br/>
	    <br/>
	  </body>
	</html>
      </xsl:when>
      <xsl:otherwise>
	<xsl:call-template name="body"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="body">
    <xsl:param name="doc" select="'ClinicalDoc'"/>
    <xsl:call-template name="addPrefixes"/>
    <xsl:call-template name="documentGeneral"><xsl:with-param name="doc" select="$doc"/></xsl:call-template>
    <div class="machine"><pre><xsl:call-template name="Act">
      <xsl:with-param name="recurse" select="false()"/>
      <xsl:with-param name="node" select="$doc"/><xsl:with-param name="finalType" select="'rim:Act'"/>
      <xsl:with-param name="classCode" select="'DOCCLIN'"/><xsl:with-param name="classCodeSystem" select="'2.16.840.1.113883.5.6'"/>
      <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
      <!-- @@x_ActRelationshipEntryRelationship 2.16.840.1.113883.5.1002 -->
    </xsl:call-template>.</pre></div>
    <!-- START display top portion of clinical document -->
    <xsl:call-template name="recordTarget"/>
    <div class="machine"><pre><xsl:apply-templates select="n1:recordTarget" mode="participation">
      <xsl:with-param name="actLabel" select="$doc"/>
    </xsl:apply-templates>
</pre></div>
    <xsl:call-template name="documentationOf"><xsl:with-param name="doc" select="$doc"/></xsl:call-template>
    <div class="machine"><pre><xsl:apply-templates select="n1:documentationOf" mode="actRelationship">
      <xsl:with-param name="source" select="$doc"/>
    </xsl:apply-templates>
</pre></div>
    <xsl:call-template name="author"><xsl:with-param name="doc" select="$doc"/></xsl:call-template>
    <div class="machine"><pre><xsl:apply-templates select="n1:author" mode="participation">
      <xsl:with-param name="actLabel" select="$doc"/>
    </xsl:apply-templates>
</pre></div>
    <xsl:call-template name="componentof"><xsl:with-param name="doc" select="$doc"/></xsl:call-template>
    <xsl:call-template name="participant"><xsl:with-param name="doc" select="$doc"/></xsl:call-template>
    <xsl:call-template name="dataEnterer"><xsl:with-param name="doc" select="$doc"/></xsl:call-template>
    <xsl:call-template name="authenticator"><xsl:with-param name="doc" select="$doc"/></xsl:call-template>
    <div class="machine"><pre><xsl:apply-templates select="n1:authenticator" mode="participation">
      <xsl:with-param name="actLabel" select="$doc"/>
    </xsl:apply-templates>
</pre></div>
    <xsl:call-template name="informant"><xsl:with-param name="doc" select="$doc"/></xsl:call-template>
    <div class="machine"><pre><xsl:apply-templates select="n1:author" mode="participation">
      <xsl:with-param name="actLabel" select="$doc"/>
    </xsl:apply-templates>
</pre></div>
    <xsl:call-template name="informationRecipient"><xsl:with-param name="doc" select="$doc"/></xsl:call-template>
    <xsl:call-template name="legalAuthenticator"><xsl:with-param name="doc" select="$doc"/></xsl:call-template>
    <div class="machine"><pre><xsl:apply-templates select="n1:legalAuthenticator" mode="participation">
      <xsl:with-param name="actLabel" select="$doc"/>
    </xsl:apply-templates>
</pre></div>
    <xsl:call-template name="custodian"><xsl:with-param name="doc" select="$doc"/></xsl:call-template>
    <div class="machine"><pre><xsl:apply-templates select="n1:custodian" mode="participation">
      <xsl:with-param name="actLabel" select="$doc"/>
    </xsl:apply-templates>
</pre></div>
    <!-- END display top portion of clinical document -->
    <!-- produce table of contents -->
    <xsl:if test="$output!='text'">
      <xsl:if test="not(//n1:nonXMLBody)">
	<xsl:if test="count(/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component[n1:section]) &gt; 1">
	  <xsl:call-template name="make-tableofcontents"/>
	</xsl:if>
      </xsl:if>
    </xsl:if>
    <hr align="left" color="teal" size="2" width="80%"/>
    <!-- produce human readable document content -->
    <xsl:apply-templates select="n1:component/n1:structuredBody|n1:component/n1:nonXMLBody">
      <xsl:with-param name="source" select="$doc"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template name="typedParticipation" match="*" mode="typedParticipation">
    <xsl:param name="parttnLabel" select="'@@@parttnLabel'"/>
    <xsl:param name="roleTag"     select="'@@@roleTag'"/>
    <xsl:param name="typeCode"    select="'@@@typeCode'"/>
    <xsl:param name="roleCode"    select="'@@@roleCode'"/>
    <xsl:param name="player1Tag"  select="'@@@player1Tag'"/>
    <xsl:param name="player1Type" select="'@@@player1Type'"/>
    <xsl:param name="player2Tag"  select="'@@@player2Tag'"/>
    <xsl:param name="player2Type" select="'@@@player2Type'"/>
    <xsl:param name="scoperTag"   select="'@@@scoperTag'"/>

    <xsl:param name="name" select="name(.)"/>
    <xsl:param name="label" select="concat($parttnLabel, '_', name(.), count(preceding-sibling::*[name()=$name]))"/>

    <xsl:call-template name="Participation">
      <xsl:with-param name="actLabel" select="$parttnLabel"/>
      <xsl:with-param name="roleLabel" select="$label"/>
      <xsl:with-param name="typeCode" select="$typeCode"/>
    </xsl:call-template>
    <xsl:value-of select="$newline"/>

    <xsl:apply-templates select="*[name()=$roleTag]" mode="typedRole">
      <xsl:with-param name="label"       select="$label"/>
      <xsl:with-param name="roleCode"    select="$roleCode"/>
      <xsl:with-param name="player1Tag"  select="$player1Tag"/>
      <xsl:with-param name="player1Type" select="$player1Type"/>
      <xsl:with-param name="player2Tag"  select="$player2Tag"/>
      <xsl:with-param name="player2Type" select="$player2Type"/>
      <xsl:with-param name="scoperTag"   select="$scoperTag"/>
    </xsl:apply-templates>
  </xsl:template>


  <xsl:template name="typedRole" match="*" mode="typedRole">
    <xsl:param name="label"       select="'@@@label'"/>
    <xsl:param name="roleCode"    select="'@@@roleCode'"/>
    <xsl:param name="player1Tag"  select="'@@@player1Tag'"/>
    <xsl:param name="player1Type" select="'@@@player1Type'"/>
    <xsl:param name="player2Tag"  select="'@@@player2Tag'"/>
    <xsl:param name="player2Type" select="'@@@player2Type'"/>
    <xsl:param name="scoperTag"   select="'@@@scoperTag'"/>

    <xsl:param name="parentName"  select="name(..)"/>
    <xsl:param name="roleLabel"   select="$label"/>

    <xsl:call-template name="Role">
      <xsl:with-param name="roleLabel"   select="$roleLabel"/>
      <xsl:with-param name="classCode"   select="$roleCode"/>
      <xsl:with-param name="player1Tag"  select="$player1Tag"/>
      <xsl:with-param name="player1Type" select="$player1Type"/>
      <xsl:with-param name="player2Tag"  select="$player2Tag"/>
      <xsl:with-param name="player2Type" select="$player2Type"/>
      <xsl:with-param name="scoperTag"   select="$scoperTag"/>
      <xsl:with-param name="scoperType"  select="'rim:Organization'"/>
    </xsl:call-template><xsl:value-of select="$newline"/>
  </xsl:template>


	<!-- generate table of contents -->
	<xsl:template name="make-tableofcontents">
		<h2>
			<a name="toc">Table of Contents</a>
		</h2>
		<ul>
			<xsl:for-each select="n1:component/n1:structuredBody/n1:component/n1:section/n1:title">
				<li>
					<a href="#{generate-id(.)}">
						<xsl:value-of select="."/>
					</a>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<!-- header elements -->
  <xsl:template name="documentGeneral">
    <table class="header_table">
      <tbody>
	<tr>
	  <td width="20%" bgcolor="#3399ff">
	    <span class="td_label">
	      <xsl:if test="$output='text'"># </xsl:if>
	      <xsl:text>Document Id</xsl:text>
	    </span>
	  </td>
	  <td width="80%">
	    <xsl:call-template name="show-id">
	      <xsl:with-param name="id" select="n1:id"/>
	    </xsl:call-template>
	  </td>
	</tr>
	<tr>
	  <td width="20%" bgcolor="#3399ff">
	    <span class="td_label">
	      <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
	      <xsl:text>Document Created:</xsl:text>
	    </span>
	  </td>
	  <td width="80%">
	    <xsl:call-template name="show-time">
	      <xsl:with-param name="datetime" select="n1:effectiveTime"/>
	    </xsl:call-template>
	  </td>
	</tr>
      </tbody>
    </table>
    <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
  </xsl:template>
  <!-- confidentiality -->
  <xsl:template name="confidentiality">
    <table class="header_table">
      <tbody>
	<tr>
	  <td width="20%" bgcolor="#3399ff">
	    <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
	    <xsl:text>Confidentiality</xsl:text>
	  </td>
	  <td width="80%">
	    <xsl:choose>
	      <xsl:when test="n1:confidentialityCode/@code  = &apos;N&apos;">
		<xsl:text>Normal</xsl:text>
	      </xsl:when>
	      <xsl:when test="n1:confidentialityCode/@code  = &apos;R&apos;">
		<xsl:text>Restricted</xsl:text>
	      </xsl:when>
	      <xsl:when test="n1:confidentialityCode/@code  = &apos;V&apos;">
		<xsl:text>Very restricted</xsl:text>
	      </xsl:when>
	    </xsl:choose>
	    <xsl:if test="n1:confidentialityCode/n1:originalText">
	      <xsl:text> </xsl:text>
	      <xsl:value-of select="n1:confidentialityCode/n1:originalText"/>
	    </xsl:if>
	  </td>
	</tr>
      </tbody>
    </table>
    <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
  </xsl:template>
  <!-- author -->
  <xsl:template name="author">
    <xsl:if test="n1:author">
      <table class="header_table">
	<tbody>
	  <xsl:for-each select="n1:author/n1:assignedAuthor">
	    <tr>
	      <td width="20%" bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		  <xsl:text>Author</xsl:text>
		</span>
	      </td>
	      <td width="80%">
		<xsl:choose>
		  <xsl:when test="n1:assignedPerson/n1:name">
		    <xsl:call-template name="show-name">
		      <xsl:with-param name="name" select="n1:assignedPerson/n1:name"/>
		    </xsl:call-template>
		    <xsl:if test="n1:representedOrganization">
		      <xsl:text>, </xsl:text>
		      <xsl:call-template name="show-name">
			<xsl:with-param name="name" select="n1:representedOrganization/n1:name"/>
		      </xsl:call-template>
		    </xsl:if>
		  </xsl:when>
		  <xsl:when test="n1:assignedAuthoringDevice/n1:softwareName">
		    <xsl:value-of select="n1:assignedAuthoringDevice/n1:softwareName"/>
		  </xsl:when>
		  <xsl:when test="n1:representedOrganization">
		    <xsl:call-template name="show-name">
		      <xsl:with-param name="name" select="n1:representedOrganization/n1:name"/>
		    </xsl:call-template>
		  </xsl:when>
		  <xsl:otherwise>
		    <xsl:for-each select="n1:id">
		      <xsl:call-template name="show-id"/>
		      <br/>
		    </xsl:for-each>
		  </xsl:otherwise>
		</xsl:choose>
	      </td>
	    </tr>
	    <xsl:if test="n1:addr | n1:telecom">
	      <tr>
		<td bgcolor="#3399ff">
		  <span class="td_label">
		    <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		    <xsl:text>Contact info</xsl:text>
		  </span>
		</td>
		<td>
		  <xsl:call-template name="show-contactInfo">
		    <xsl:with-param name="contact" select="."/>
		  </xsl:call-template>
		</td>
	      </tr>
	    </xsl:if>
	  </xsl:for-each>
	</tbody>
      </table>
    </xsl:if>
    <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
  </xsl:template>
  <!--  authenticator -->
  <xsl:template name="authenticator">
    <xsl:if test="n1:authenticator">
      <table class="header_table">
	<tbody>
	  <xsl:for-each select="n1:authenticator">
	    <tr>
	      <td width="20%" bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		  <xsl:text>Signed </xsl:text>
		</span>
	      </td>
	      <td width="80%">
		<xsl:call-template name="show-name">
		  <xsl:with-param name="name" select="n1:assignedEntity/n1:assignedPerson/n1:name"/>
		</xsl:call-template>
		<xsl:text> at </xsl:text>
		<xsl:call-template name="show-time">
		  <xsl:with-param name="date" select="n1:time"/>
		</xsl:call-template>
	      </td>
	    </tr>
	    <xsl:if test="n1:assignedEntity/n1:addr | n1:assignedEntity/n1:telecom">
	      <tr>
		<td bgcolor="#3399ff">
		  <span class="td_label">
		    <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		    <xsl:text>Contact info</xsl:text>
		  </span>
		</td>
		<td width="80%">
		  <xsl:call-template name="show-contactInfo">
		    <xsl:with-param name="contact" select="n1:assignedEntity"/>
		  </xsl:call-template>
		</td>
	      </tr>
	    </xsl:if>
	  </xsl:for-each>
	</tbody>
      </table>
      <!-- xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if -->
    </xsl:if>
  </xsl:template>
  <!-- legalAuthenticator -->
  <xsl:template name="legalAuthenticator">
    <xsl:if test="n1:legalAuthenticator">
      <table class="header_table">
	<tbody>
	  <tr>
	    <td width="20%" bgcolor="#3399ff">
	      <span class="td_label">
		<xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		<xsl:text>Legal authenticator</xsl:text>
	      </span>
	    </td>
	    <td width="80%">
	      <xsl:call-template name="show-assignedEntity">
		<xsl:with-param name="asgnEntity" select="n1:legalAuthenticator/n1:assignedEntity"/>
	      </xsl:call-template>
	      <xsl:text> </xsl:text>
	      <xsl:call-template name="show-sig">
		<xsl:with-param name="sig" select="n1:legalAuthenticator/n1:signatureCode"/>
	      </xsl:call-template>
	      <xsl:if test="n1:legalAuthenticator/n1:time/@value">
		<xsl:text> at </xsl:text>
		<xsl:call-template name="show-time">
		  <xsl:with-param name="datetime" select="n1:legalAuthenticator/n1:time"/>
		</xsl:call-template>
	      </xsl:if>
	    </td>
	  </tr>
	  <xsl:if test="n1:legalAuthenticator/n1:assignedEntity/n1:addr | n1:legalAuthenticator/n1:assignedEntity/n1:telecom">
	    <tr>
	      <td bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		  <xsl:text>Contact info</xsl:text>
		</span>
	      </td>
	      <td>
		<xsl:call-template name="show-contactInfo">
		  <xsl:with-param name="contact" select="n1:legalAuthenticator/n1:assignedEntity"/>
		</xsl:call-template>
	      </td>
	    </tr>
	  </xsl:if>
	</tbody>
      </table>
      <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
    </xsl:if>
  </xsl:template>
  <!-- dataEnterer -->
  <xsl:template name="dataEnterer">
    <xsl:if test="n1:dataEnterer">
      <table class="header_table">
	<tbody>
	  <tr>
	    <td width="20%" bgcolor="#3399ff">
	      <span class="td_label">
		<xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		<xsl:text>Entered by</xsl:text>
	      </span>
	    </td>
	    <td width="80%">
	      <xsl:call-template name="show-assignedEntity">
		<xsl:with-param name="asgnEntity" select="n1:dataEnterer/n1:assignedEntity"/>
	      </xsl:call-template>
	    </td>
	  </tr>
	  <xsl:if test="n1:dataEnterer/n1:assignedEntity/n1:addr | n1:dataEnterer/n1:assignedEntity/n1:telecom">
	    <tr>
	      <td bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		  <xsl:text>Contact info</xsl:text>
		</span>
	      </td>
	      <td>
		<xsl:call-template name="show-contactInfo">
		  <xsl:with-param name="contact" select="n1:dataEnterer/n1:assignedEntity"/>
		</xsl:call-template>
	      </td>
	    </tr>
	  </xsl:if>
	</tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- componentOf -->
  <xsl:template name="componentof">
    <xsl:if test="n1:componentOf">
      <table class="header_table">
	<tbody>
	  <xsl:for-each select="n1:componentOf/n1:encompassingEncounter">
	    <xsl:if test="n1:id">
	      <tr>
		<xsl:choose>
		  <xsl:when test="n1:code">
		    <td width="20%" bgcolor="#3399ff">
		      <span class="td_label">
			<xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
			<xsl:text>Encounter Id</xsl:text>
		      </span>
		    </td>
		    <td width="30%">
		      <xsl:call-template name="show-id">
			<xsl:with-param name="id" select="n1:id"/>
		      </xsl:call-template>
		    </td>
		    <td width="15%" bgcolor="#3399ff">
		      <span class="td_label">
			<xsl:text>Encounter Type</xsl:text>
		      </span>
		    </td>
		    <td>
		      <xsl:call-template name="show-code">
			<xsl:with-param name="code" select="n1:code"/>
		      </xsl:call-template>
		    </td>
		  </xsl:when>
		  <xsl:otherwise>
		    <td width="20%" bgcolor="#3399ff">
		      <span class="td_label">
			<xsl:text>Encounter Id</xsl:text>
		      </span>
		    </td>
		    <td>
		      <xsl:call-template name="show-id">
			<xsl:with-param name="id" select="n1:id"/>
		      </xsl:call-template>
		    </td>
		  </xsl:otherwise>
		</xsl:choose>
	      </tr>
	    </xsl:if>
	    <tr>
	      <td width="20%" bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		  <xsl:text>Encounter Date</xsl:text>
		</span>
	      </td>
	      <td colspan="3">
		<xsl:if test="n1:effectiveTime">
		  <xsl:choose>
		    <xsl:when test="n1:effectiveTime/@value">
		      <xsl:text>&#160;at&#160;</xsl:text>
		      <xsl:call-template name="show-time">
			<xsl:with-param name="datetime" select="n1:effectiveTime"/>
		      </xsl:call-template>
		    </xsl:when>
		    <xsl:when test="n1:effectiveTime/n1:low">
		      <xsl:text>&#160;From&#160;</xsl:text>
		      <xsl:call-template name="show-time">
			<xsl:with-param name="datetime" select="n1:effectiveTime/n1:low"/>
		      </xsl:call-template>
		      <xsl:if test="n1:effectiveTime/n1:high">
			<xsl:text> to </xsl:text>
			<xsl:call-template name="show-time">
			  <xsl:with-param name="datetime" select="n1:effectiveTime/n1:high"/>
			</xsl:call-template>
		      </xsl:if>
		    </xsl:when>
		  </xsl:choose>
		</xsl:if>
	      </td>
	    </tr>
	    <xsl:if test="n1:location/n1:healthCareFacility">
	      <tr>
		<td width="20%" bgcolor="#3399ff">
		  <span class="td_label">
		    <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		    <xsl:text>Encounter Location</xsl:text>
		  </span>
		</td>
		<td colspan="3">
		  <xsl:choose>
		    <xsl:when test="n1:location/n1:healthCareFacility/n1:location/n1:name">
		      <xsl:call-template name="show-name">
			<xsl:with-param name="name" select="n1:location/n1:healthCareFacility/n1:location/n1:name"/>
		      </xsl:call-template>
		      <xsl:for-each select="n1:location/n1:healthCareFacility/n1:serviceProviderOrganization/n1:name">
			<xsl:text> of </xsl:text>
			<xsl:call-template name="show-name">
			  <xsl:with-param name="name" select="n1:location/n1:healthCareFacility/n1:serviceProviderOrganization/n1:name"/>
			</xsl:call-template>
			<xsl:if test="n1:location/n1:healthCareFacility/n1:serviceProviderOrganization/n1:addr | n1:location/n1:healthCareFacility/n1:serviceProviderOrganization/n1:telecom">
			  <xsl:call-template name="show-contactInfo">
			    <xsl:with-param name="contact" select="n1:location/n1:healthCareFacility/n1:serviceProviderOrganization"/>
			  </xsl:call-template>
			</xsl:if>
		      </xsl:for-each>
		    </xsl:when>
		    <xsl:when test="n1:location/n1:healthCareFacility/n1:code">
		      <xsl:call-template name="show-code">
			<xsl:with-param name="code" select="n1:location/n1:healthCareFacility/n1:code"/>
		      </xsl:call-template>
		    </xsl:when>
		    <xsl:otherwise>
		      <xsl:if test="n1:location/n1:healthCareFacility/n1:id">
			<xsl:text>id: </xsl:text>
			<xsl:for-each select="n1:location/n1:healthCareFacility/n1:id">
			  <xsl:call-template name="show-id">
			    <xsl:with-param name="id" select="."/>
			  </xsl:call-template>
			</xsl:for-each>
		      </xsl:if>
		    </xsl:otherwise>
		  </xsl:choose>
		</td>
	      </tr>
	    </xsl:if>
	    <xsl:if test="n1:responsibleParty">
	      <tr>
		<td width="20%" bgcolor="#3399ff">
		  <span class="td_label">
		    <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		    <xsl:text>Responsible party</xsl:text>
		  </span>
		</td>
		<td colspan="3">
		  <xsl:call-template name="show-assignedEntity">
		    <xsl:with-param name="asgnEntity" select="n1:responsibleParty/n1:assignedEntity"/>
		  </xsl:call-template>
		</td>
	      </tr>
	    </xsl:if>
	    <xsl:if test="n1:responsibleParty/n1:assignedEntity/n1:addr | n1:responsibleParty/n1:assignedEntity/n1:telecom">
	      <tr>
		<td width="20%" bgcolor="#3399ff">
		  <span class="td_label">
		    <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		    <xsl:text>Contact info</xsl:text>
		  </span>
		</td>
		<td colspan="3">
		  <xsl:call-template name="show-contactInfo">
		    <xsl:with-param name="contact" select="n1:responsibleParty/n1:assignedEntity"/>
		  </xsl:call-template>
		</td>
	      </tr>
	    </xsl:if>
	  </xsl:for-each>
	</tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- custodian -->
  <xsl:template name="custodian">
    <xsl:if test="n1:custodian">
      <table class="header_table">
	<tbody>
	  <tr>
	    <td width="20%" bgcolor="#3399ff">
	      <span class="td_label">
		<xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		<xsl:text>Document maintained by</xsl:text>
	      </span>
	    </td>
	    <td width="80%">
	      <xsl:choose>
		<xsl:when test="n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:name">
		  <xsl:call-template name="show-name">
		    <xsl:with-param name="name" select="n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:name"/>
		  </xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:for-each select="n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:id">
		    <xsl:call-template name="show-id"/>
		    <xsl:if test="position()!=last()">
		      <br/>
		    </xsl:if>
		  </xsl:for-each>
		</xsl:otherwise>
	      </xsl:choose>
	    </td>
	  </tr>
	  <xsl:if test="n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:addr |             n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:telecom">
	    <tr>
	      <td bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		  <xsl:text>Contact info</xsl:text>
		</span>
	      </td>
	      <td width="80%">
		<xsl:call-template name="show-contactInfo">
		  <xsl:with-param name="contact" select="n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization"/>
		</xsl:call-template>
	      </td>
	    </tr>
	  </xsl:if>
	</tbody>
      </table>
      <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
    </xsl:if>
  </xsl:template>
  <!-- documentationOf -->
  <xsl:template name="documentationOf">
    <xsl:if test="n1:documentationOf">
      <table class="header_table">
	<tbody>
	  <xsl:for-each select="n1:documentationOf">
	    <xsl:if test="n1:serviceEvent/@classCode and n1:serviceEvent/n1:code">
	      <xsl:variable name="displayName">
		<xsl:call-template name="show-actClassCode">
		  <xsl:with-param name="clsCode" select="n1:serviceEvent/@classCode"/>
		</xsl:call-template>
	      </xsl:variable>
	      <xsl:if test="$displayName">
		<tr>
		  <td width="20%" bgcolor="#3399ff">
		    <span class="td_label">
		      <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		      <xsl:call-template name="firstCharCaseUp">
			<xsl:with-param name="data" select="$displayName"/>
		      </xsl:call-template>
		    </span>
		  </td>
		  <td width="80%" colspan="3">
		    <xsl:call-template name="show-code">
		      <xsl:with-param name="code" select="n1:serviceEvent/n1:code"/>
		    </xsl:call-template>
		    <xsl:if test="n1:serviceEvent/n1:effectiveTime">
		      <xsl:choose>
			<xsl:when test="n1:serviceEvent/n1:effectiveTime/@value">
			  <xsl:text>&#160;at&#160;</xsl:text>
			  <xsl:call-template name="show-time">
			    <xsl:with-param name="datetime" select="n1:serviceEvent/n1:effectiveTime"/>
			  </xsl:call-template>
			</xsl:when>
			<xsl:when test="n1:serviceEvent/n1:effectiveTime/n1:low">
			  <xsl:text>&#160;from&#160;</xsl:text>
			  <xsl:call-template name="show-time">
			    <xsl:with-param name="datetime" select="n1:serviceEvent/n1:effectiveTime/n1:low"/>
			  </xsl:call-template>
			  <xsl:if test="n1:serviceEvent/n1:effectiveTime/n1:high">
			    <xsl:text> to </xsl:text>
			    <xsl:call-template name="show-time">
			      <xsl:with-param name="datetime" select="n1:serviceEvent/n1:effectiveTime/n1:high"/>
			    </xsl:call-template>
			  </xsl:if>
			</xsl:when>
		      </xsl:choose>
		    </xsl:if>
		  </td>
		</tr>
	      </xsl:if>
	    </xsl:if>
	    <xsl:for-each select="n1:serviceEvent/n1:performer">
	      <xsl:variable name="displayName">
		<xsl:call-template name="show-participationType">
		  <xsl:with-param name="ptype" select="@typeCode"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:if test="n1:functionCode/@code">
		  <xsl:call-template name="show-participationFunction">
		    <xsl:with-param name="pFunction" select="n1:functionCode/@code"/>
		  </xsl:call-template>
		</xsl:if>
	      </xsl:variable>
	      <tr>
		<td width="20%" bgcolor="#3399ff">
		  <span class="td_label">
		    <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		    <xsl:call-template name="firstCharCaseUp">
		      <xsl:with-param name="data" select="$displayName"/>
		    </xsl:call-template>
		  </span>
		</td>
		<td width="80%" colspan="3">
		  <xsl:call-template name="show-assignedEntity">
		    <xsl:with-param name="asgnEntity" select="n1:assignedEntity"/>
		  </xsl:call-template>
		  <xsl:if test="n1:assignedEntity/n1:addr">
		    <xsl:text>&#160;,&#160;</xsl:text>
		    <xsl:call-template name="show-address">
		      <xsl:with-param name="address" select="n1:assignedEntity/n1:addr"/>
		    </xsl:call-template>		
		  </xsl:if>							
		</td>
	      </tr>
	    </xsl:for-each>
	  </xsl:for-each>
	</tbody>
      </table>
    </xsl:if>
    <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
  </xsl:template>
  <!-- inFulfillmentOf -->
  <xsl:template name="inFulfillmentOf">
    <xsl:if test="n1:infulfillmentOf">
      <table class="header_table">
	<tbody>
	  <xsl:for-each select="n1:inFulfillmentOf">
	    <tr>
	      <td width="20%" bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		  <xsl:text>In fulfillment of</xsl:text>
		</span>
	      </td>
	      <td width="80%">
		<xsl:for-each select="n1:order">
		  <xsl:for-each select="n1:id">
		    <xsl:call-template name="show-id"/>
		  </xsl:for-each>
		  <xsl:for-each select="n1:code">
		    <xsl:text>&#160;</xsl:text>
		    <xsl:call-template name="show-code">
		      <xsl:with-param name="code" select="."/>
		    </xsl:call-template>
		  </xsl:for-each>
		  <xsl:for-each select="n1:priorityCode">
		    <xsl:text>&#160;</xsl:text>
		    <xsl:call-template name="show-code">
		      <xsl:with-param name="code" select="."/>
		    </xsl:call-template>
		  </xsl:for-each>
		</xsl:for-each>
	      </td>
	    </tr>
	  </xsl:for-each>
	</tbody>
      </table>
      <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
    </xsl:if>
  </xsl:template>
  <!-- informant -->
  <xsl:template name="informant">
    <xsl:if test="n1:informant">
      <table class="header_table">
	<tbody>
	  <xsl:for-each select="n1:informant">
	    <tr>
	      <td width="20%" bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		  <xsl:text>Informant</xsl:text>
		</span>
	      </td>
	      <td width="80%">
		<xsl:if test="n1:assignedEntity">
		  <xsl:call-template name="show-assignedEntity">
		    <xsl:with-param name="asgnEntity" select="n1:assignedEntity"/>
		  </xsl:call-template>
		</xsl:if>
		<xsl:if test="n1:relatedEntity">
		  <xsl:call-template name="show-relatedEntity">
		    <xsl:with-param name="relatedEntity" select="n1:relatedEntity"/>
		  </xsl:call-template>
		</xsl:if>
	      </td>
	    </tr>
	    <xsl:choose>
	      <xsl:when test="n1:assignedEntity/n1:addr | n1:assignedEntity/n1:telecom">
		<tr>
		  <td bgcolor="#3399ff">
		    <span class="td_label">
		      <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		      <xsl:text>Contact info</xsl:text>
		    </span>
		  </td>
		  <td>
		    <xsl:if test="n1:assignedEntity">
		      <xsl:call-template name="show-contactInfo">
			<xsl:with-param name="contact" select="n1:assignedEntity"/>
		      </xsl:call-template>
		    </xsl:if>
		  </td>
		</tr>
	      </xsl:when>
	      <xsl:when test="n1:relatedEntity/n1:addr | n1:relatedEntity/n1:telecom">
		<tr>
		  <td bgcolor="#3399ff">
		    <span class="td_label">
		      <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		      <xsl:text>Contact info</xsl:text>
		    </span>
		  </td>
		  <td>
		    <xsl:if test="n1:relatedEntity">
		      <xsl:call-template name="show-contactInfo">
			<xsl:with-param name="contact" select="n1:relatedEntity"/>
		      </xsl:call-template>
		    </xsl:if>
		  </td>
		</tr>
	      </xsl:when>
	    </xsl:choose>
	  </xsl:for-each>
	</tbody>
      </table>
      <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
    </xsl:if>
  </xsl:template>
  <!-- informantionRecipient -->
  <xsl:template name="informationRecipient">
    <xsl:if test="n1:informationRecipient">
      <table class="header_table">
	<tbody>
	  <xsl:for-each select="n1:informationRecipient">
	    <tr>
	      <td width="20%" bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		  <xsl:text>Information recipient:</xsl:text>
		</span>
	      </td>
	      <td width="80%">
		<xsl:choose>
		  <xsl:when test="n1:intendedRecipient/n1:informationRecipient/n1:name">
		    <xsl:for-each select="n1:intendedRecipient/n1:informationRecipient">
		      <xsl:call-template name="show-name">
			<xsl:with-param name="name" select="n1:name"/>
		      </xsl:call-template>
		      <xsl:if test="position() != last()">
			<br/>
		      </xsl:if>
		    </xsl:for-each>
		  </xsl:when>
		  <xsl:otherwise>
		    <xsl:for-each select="n1:intendedRecipient">
		      <xsl:for-each select="n1:id">
			<xsl:call-template name="show-id"/>
		      </xsl:for-each>
		      <xsl:if test="position() != last()">
			<br/>
		      </xsl:if>
		      <br/>
		    </xsl:for-each>
		  </xsl:otherwise>
		</xsl:choose>
	      </td>
	    </tr>
	    <xsl:if test="n1:intendedRecipient/n1:addr | n1:intendedRecipient/n1:telecom">
	      <tr>
		<td bgcolor="#3399ff">
		  <span class="td_label">
		    <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		    <xsl:text>Contact info</xsl:text>
		  </span>
		</td>
		<td>
		  <xsl:call-template name="show-contactInfo">
		    <xsl:with-param name="contact" select="n1:intendedRecipient"/>
		  </xsl:call-template>
		</td>
	      </tr>
	    </xsl:if>
	  </xsl:for-each>
	</tbody>
      </table>
      <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
    </xsl:if>
  </xsl:template>
  <!-- participant -->
  <xsl:template name="participant">
    <xsl:if test="n1:participant">
      <table class="header_table">
	<tbody>
	  <xsl:for-each select="n1:participant">
	    <tr>
	      <td width="20%" bgcolor="#3399ff">
		<xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		<xsl:variable name="participtRole">
		  <xsl:call-template name="translateRoleAssoCode">
		    <xsl:with-param name="classCode" select="n1:associatedEntity/@classCode"/>
		    <xsl:with-param name="code" select="n1:associatedEntity/n1:code"/>
		  </xsl:call-template>
		</xsl:variable>
		<xsl:choose>
		  <xsl:when test="$participtRole">
		    <span class="td_label">
		      <xsl:call-template name="firstCharCaseUp">
			<xsl:with-param name="data" select="$participtRole"/>
		      </xsl:call-template>
		    </span>
		  </xsl:when>
		  <xsl:otherwise>
		    <span class="td_label">
		      <xsl:text>Participant</xsl:text>
		    </span>
		  </xsl:otherwise>
		</xsl:choose>
	      </td>
	      <td width="80%">
		<xsl:if test="n1:functionCode">
		  <xsl:call-template name="show-code">
		    <xsl:with-param name="code" select="n1:functionCode"/>
		  </xsl:call-template>
		</xsl:if>
		<xsl:call-template name="show-associatedEntity">
		  <xsl:with-param name="assoEntity" select="n1:associatedEntity"/>
		</xsl:call-template>
		<xsl:if test="n1:time">
		  <xsl:if test="n1:time/n1:low">
		    <xsl:text> from </xsl:text>
		    <xsl:call-template name="show-time">
		      <xsl:with-param name="datetime" select="n1:time/n1:low"/>
		    </xsl:call-template>
		  </xsl:if>
		  <xsl:if test="n1:time/n1:high">
		    <xsl:text> to </xsl:text>
		    <xsl:call-template name="show-time">
		      <xsl:with-param name="datetime" select="n1:time/n1:high"/>
		    </xsl:call-template>
		  </xsl:if>
		</xsl:if>
		<xsl:if test="position() != last()">
		  <br/>
		</xsl:if>
	      </td>
	    </tr>
	    <xsl:if test="n1:associatedEntity/n1:addr | n1:associatedEntity/n1:telecom">
	      <tr>
		<td bgcolor="#3399ff">
		  <span class="td_label">
		    <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		    <xsl:text>Contact info</xsl:text>
		  </span>
		</td>
		<td>
		  <xsl:call-template name="show-contactInfo">
		    <xsl:with-param name="contact" select="n1:associatedEntity"/>
		  </xsl:call-template>
		</td>
	      </tr>
	    </xsl:if>
	  </xsl:for-each>
	</tbody>
      </table>
      <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
    </xsl:if>
  </xsl:template>

  <!-- recordTarget -->
  <xsl:template name="recordTarget">
    <table class="header_table">
      <tbody>
	<xsl:for-each select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole">
	  <xsl:if test="not(n1:id/@nullFlavor)">
	    <tr>	  
	      
	      <td width="20%" bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:if test="$output='text'">
		    <xsl:value-of select="concat('&#x0a;', $newline, '# ')"/>
		  </xsl:if>
		  <xsl:text>Patient</xsl:text>
		</span>
	      </td>
	      <td width="30%">
		<xsl:call-template name="show-name">
		  <xsl:with-param name="name" select="n1:patient/n1:name"/>
		</xsl:call-template>
	      </td>
	      <td width="20%" bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:text>Language</xsl:text>
		</span>
	      </td>
	      <td>
		<xsl:for-each select="n1:patient/n1:languageCommunication/n1:languageCode">
		  <xsl:call-template name="show-language">
		  </xsl:call-template>
		</xsl:for-each>
	      </td>
	    </tr>
	    <tr>
	      <td width="20%" bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if><xsl:text>Date of birth</xsl:text>
		</span>
	      </td>
	      <td width="30%">
		<xsl:call-template name="show-time">
		  <xsl:with-param name="datetime" select="n1:patient/n1:birthTime"/>
		</xsl:call-template>
	      </td>
	      <td width="15%" bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:text>Sex</xsl:text>
		</span>
	      </td>
	      <td>
		<xsl:for-each select="n1:patient/n1:administrativeGenderCode">
		  <xsl:call-template name="show-gender"/>
		</xsl:for-each>
	      </td>
	    </tr>
	    <xsl:if test="n1:patient/n1:raceCode | (n1:patient/n1:ethnicGroupCode)">
	      <tr>
		<td width="20%" bgcolor="#3399ff">
		  <span class="td_label">
		    <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if><xsl:text>Race</xsl:text>
		  </span>
		</td>
		<td width="30%">
		  <xsl:choose>
		    <xsl:when test="n1:patient/n1:raceCode">
		      <xsl:for-each select="n1:patient/n1:raceCode">
			<xsl:call-template name="show-race-ethnicity"/>
		      </xsl:for-each>
		    </xsl:when>
		    <xsl:otherwise>
		      <xsl:text>Information not available</xsl:text>
		    </xsl:otherwise>
		  </xsl:choose>
		</td>
		<td width="15%" bgcolor="#3399ff">
		  <span class="td_label">
		    <xsl:text>Ethnicity</xsl:text>
		  </span>
		</td>
		<td>
		  <xsl:choose>
		    <xsl:when test="n1:patient/n1:ethnicGroupCode">
		      <xsl:for-each select="n1:patient/n1:ethnicGroupCode">
			<xsl:call-template name="show-race-ethnicity"/>
		      </xsl:for-each>
		    </xsl:when>
		    <xsl:otherwise>
		      <xsl:text>Information not available</xsl:text>
		    </xsl:otherwise>
		  </xsl:choose>
		</td>
	      </tr>
	    </xsl:if>
	    <tr>
	      <td bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if><xsl:text>Contact info</xsl:text>
		</span>
	      </td>
	      <td>
		<xsl:call-template name="show-contactInfo">
		  <xsl:with-param name="contact" select="."/>
		</xsl:call-template>
	      </td>
	      <td bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:text>Patient IDs</xsl:text>
		</span>
	      </td>
	      <td>
		<xsl:for-each select="n1:id">
		  <xsl:call-template name="show-id"/>
		  <br/>
		</xsl:for-each>
	      </td>
	    </tr>
	  </xsl:if>
	</xsl:for-each>
      </tbody>
    </table>
    <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
  </xsl:template>
  <!-- relatedDocument -->
  <xsl:template name="relatedDocument">
    <xsl:if test="n1:relatedDocument">
      <table class="header_table">
	<tbody>
	  <xsl:for-each select="n1:relatedDocument">
	    <tr>
	      <td width="20%" bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		  <xsl:text>Related document</xsl:text>
		</span>
	      </td>
	      <td width="80%">
		<xsl:for-each select="n1:parentDocument">
		  <xsl:for-each select="n1:id">
		    <xsl:call-template name="show-id"/>
		    <br/>
		  </xsl:for-each>
		</xsl:for-each>
	      </td>
	    </tr>
	  </xsl:for-each>
	</tbody>
      </table>
      <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
    </xsl:if>
  </xsl:template>
  <!-- authorization (consent) -->
  <xsl:template name="authorization">
    <xsl:if test="n1:authorization">
      <table class="header_table">
	<tbody>
	  <xsl:for-each select="n1:authorization">
	    <tr>
	      <td width="20%" bgcolor="#3399ff">
		<span class="td_label">
		  <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
		  <xsl:text>Consent</xsl:text>
		</span>
	      </td>
	      <td width="80%">
		<xsl:choose>
		  <xsl:when test="n1:consent/n1:code">
		    <xsl:call-template name="show-code">
		      <xsl:with-param name="code" select="n1:consent/n1:code"/>
		    </xsl:call-template>
		  </xsl:when>
		  <xsl:otherwise>
		    <xsl:call-template name="show-code">
		      <xsl:with-param name="code" select="n1:consent/n1:statusCode"/>
		    </xsl:call-template>
		  </xsl:otherwise>
		</xsl:choose>
		<br/>
	      </td>
	    </tr>
	  </xsl:for-each>
	</tbody>
      </table>
      <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
    </xsl:if>
  </xsl:template>
  <!-- setAndVersion -->
  <xsl:template name="setAndVersion">
    <xsl:if test="n1:setId and n1:versionNumber">
      <table class="header_table">
	<tbody>
	  <tr>
	    <td width="20%">
	      <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
	      <xsl:text>SetId and Version</xsl:text>
	    </td>
	    <td colspan="3">
	      <xsl:text>SetId: </xsl:text>
	      <xsl:call-template name="show-id">
		<xsl:with-param name="id" select="n1:setId"/>
	      </xsl:call-template>
	      <xsl:text>  Version: </xsl:text>
	      <xsl:value-of select="n1:versionNumber/@value"/>
	    </td>
	  </tr>
	</tbody>
      </table>
      <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
    </xsl:if>
  </xsl:template>

  <!-- show StructuredBody  -->
  <xsl:template match="n1:component/n1:structuredBody">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="target" select="'structuredBody'"/>
    <div class="machine"><pre><xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="'COMP'"/>
    </xsl:call-template><xsl:value-of select="$newline"/>
    <xsl:call-template name="Act">
      <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Act'"/>
      <xsl:with-param name="classCode" select="'ACT'"/><xsl:with-param name="classCodeSystem" select="'2.16.840.1.113883.5.6'"/>
      <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
      <!-- @@x_ActRelationshipEntryRelationship 2.16.840.1.113883.5.1002 -->
      </xsl:call-template></pre></div><xsl:value-of select="$newline"/>
    <xsl:apply-templates select="n1:component/n1:section">
      <xsl:with-param name="source" select="$target"/>
    </xsl:apply-templates>
  </xsl:template>
  <xsl:template match="n1:component/n1:structuredBody/n1:component/n1:section">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="target" select="concat('section', count(../preceding-sibling::n1:component))"/>
    <div class="machine"><pre><xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="'COMP'"/>
    </xsl:call-template><xsl:value-of select="$newline"/>
    <xsl:call-template name="Act">
      <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Act'"/>
      <xsl:with-param name="classCode" select="'ACT'"/><xsl:with-param name="classCodeSystem" select="'2.16.840.1.113883.5.6'"/>
      <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
      <!-- @@x_ActRelationshipEntryRelationship 2.16.840.1.113883.5.1002 -->
      </xsl:call-template></pre></div><xsl:value-of select="$newline"/>
      <xsl:call-template name="section">
	<xsl:with-param name="source" select="$target"/>
      </xsl:call-template>
  </xsl:template>


	<!-- show nonXMLBody -->
	<xsl:template match="n1:component/n1:nonXMLBody">
		<xsl:choose>
			<!-- if there is a reference, use that in an IFRAME -->
			<xsl:when test="n1:text/n1:reference">
				<IFRAME name="nonXMLBody" id="nonXMLBody" WIDTH="80%" HEIGHT="600" src="{n1:text/n1:reference/@value}"/>
			</xsl:when>
			<xsl:when test='n1:text/@mediaType="text/plain"'>
				<pre>
					<xsl:value-of select="n1:text/text()"/>
				</pre>
			</xsl:when>
			<xsl:otherwise>
				<CENTER>Cannot display the text</CENTER>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- top level component/section: display title and text,
     and process any nested component/sections
   -->
	<xsl:template name="section">
	  <xsl:param name="source" select="'@@@source'"/>
	  <!-- xsl:param name="target" select="concat($source, '_section', count(preceding-sibling::n1:section))"/ -->
		<xsl:call-template name="old-section-title">
		  <xsl:with-param name="title" select="n1:title"/>
		</xsl:call-template>
		<xsl:call-template name="section-author"/>
		<xsl:if test="$output!='text'"><xsl:call-template name="old-section-text"/></xsl:if>
		<div class="machine">
		  <xsl:apply-templates mode="section">
		    <xsl:with-param name="source" select="$source"/>
		  </xsl:apply-templates>
		</div>
		<xsl:for-each select="n1:component/n1:section">
			<xsl:call-template name="nestedSection">
				<xsl:with-param name="margin" select="2"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>

  <xsl:template name="section-templateId" match="n1:templateId" mode="section"/>
  <xsl:template name="section-id" match="n1:id" mode="section"/>
  <xsl:template name="section-code" match="n1:code" mode="section"/>
  <xsl:template name="section-title" match="n1:title" mode="section"/>
  <xsl:template name="section-text" match="n1:text" mode="section"/>
  <xsl:template name="section-entry" match="n1:entry" mode="section">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:apply-templates mode="section-entry">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="index" select="count(preceding-sibling::n1:entry)"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template name="section-error" match="*" mode="section">
    <pre class="error"><xsl:if test="$output='text'"># </xsl:if><xsl:apply-templates select="." mode="copy" /></pre>
  </xsl:template>


  <xsl:template name="section-entry-E_Allergy_Problem_Act" match="n1:act[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.30']" mode="section-entry">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="index" select="'@@@index'"/>
    <xsl:param name="target" select="concat($source, '_allergyProblemAct', $index)"/>
    # <a href="#E_Allergy_Problem_Act">Allergy Problem Act</a><xsl:value-of select="$newline"/>

    <pre><xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="../@typeCode"/>
    </xsl:call-template><xsl:value-of select="$newline"/>

<xsl:call-template name="Observation">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Observation'"/>
  <xsl:with-param name="classCode" select="@classCode"/><xsl:with-param name="classCodeSystem" select="'???'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
    </xsl:call-template>
</pre>
  </xsl:template>


  <xsl:template name="section-entry-E_Problem_Concern_Act_Condition" match="n1:act[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.3']" mode="section-entry">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="index" select="'@@@index'"/>
    <xsl:param name="target" select="concat($source, '_problemConcernAct', $index)"/>
    # <a href="#E_Problem_Concern_Act_Condition">Problem Concern Act (Condition)</a><xsl:value-of select="$newline"/>

    <pre><xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="../@typeCode"/>
    </xsl:call-template><xsl:value-of select="$newline"/>

<xsl:call-template name="Observation">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Observation'"/>
  <xsl:with-param name="classCode" select="@classCode"/><xsl:with-param name="classCodeSystem" select="'???'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
    </xsl:call-template>
</pre>
  </xsl:template>


  <xsl:template name="section-entry-act" match="n1:act[n1:templateId/@root='']" mode="section-entry">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="index" select="'@@@index'"/>
    <xsl:param name="target" select="concat($source, '____payers', $index)"/>
    # <a class="error" href="#">!Payers</a>
  </xsl:template>


  <xsl:template name="section-entry-E_Plan_of_Care_Activity_Act" match="n1:act[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.39']" mode="section-entry">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="index" select="'@@@index'"/>
    <xsl:param name="target" select="concat($source, '_PlanOfCareActivityAct', $index)"/>
    # <a href="#E_Plan_of_Care_Activity_Act">Plan of Care Activity Act</a><xsl:value-of select="$newline"/>

    <pre><xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="../@typeCode"/>
    </xsl:call-template><xsl:value-of select="$newline"/>

<xsl:call-template name="Act">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Act'"/>
  <xsl:with-param name="classCode" select="@classCode"/><xsl:with-param name="classCodeSystem" select="'???'"/>
  <xsl:with-param name="moodCode"  select="@moodCode"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
    </xsl:call-template>
</pre>
  </xsl:template>


  <xsl:template name="section-entry-E_Instructions" match="n1:act[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.20']" mode="section-entry">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="index" select="'@@@index'"/>
    <xsl:param name="target" select="concat($source, '_instructions', $index)"/>
    # <a href="#E_Instructions">Instructions</a><xsl:value-of select="$newline"/>

    <pre><xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="../@typeCode"/>
    </xsl:call-template><xsl:value-of select="$newline"/>

<xsl:call-template name="Act">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Act'"/>
  <xsl:with-param name="classCode" select="@classCode"/><xsl:with-param name="classCodeSystem" select="'???'"/>
  <xsl:with-param name="moodCode"  select="@moodCode"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
    </xsl:call-template>
</pre>
  </xsl:template>


  <xsl:template name="section-entry-E_Medication_Activity" match="n1:substanceAdministration[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.16']" mode="section-entry">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="index" select="'@@@index'"/>
    <xsl:param name="target" select="concat($source, '_medicationActivity', $index)"/>
    # <a href="#E_Medication_Activity">Medication Activity</a><xsl:value-of select="$newline"/>

    <pre><xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="../@typeCode"/><!-- '@@x_ActRelationshipEntry' -->
    </xsl:call-template><xsl:value-of select="$newline"/>

<xsl:call-template name="SubstanceAdministration">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:SubstanceAdministration'"/>
  <xsl:with-param name="classCode" select="'SBADM'"/><xsl:with-param name="classCodeSystem" select="'???'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
  <!-- xsl:with-param name="code"  select="'???'"/><xsl:with-param name="codeSystem"  select="'???'"/ -->
  <!-- @@x_ActRelationshipEntryRelationship 2.16.840.1.113883.5.1002 -->
    </xsl:call-template>
</pre>
  </xsl:template>


  <xsl:template name="section-entry-E_Immunization_Activity" match="n1:substanceAdministration[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.52']" mode="section-entry">
    <xsl:param name="source" select="'@@@source'"/><!-- count(../preceding-sibling[name()=name(..)]) -->
    <xsl:param name="index" select="'@@@index'"/>
    <xsl:param name="target" select="concat($source, '_immunizationActivity', $index)"/>
    # <a href="#E_Immunization_Activity">Immunization Activity</a><xsl:value-of select="$newline"/>

    <pre><xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="../@typeCode"/><!-- '@@x_ActRelationshipEntry' -->
    </xsl:call-template><xsl:value-of select="$newline"/>

<!-- <xsl:value-of select="$target"/> a rim:Act ; -->
<xsl:call-template name="SubstanceAdministration">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Act'"/>
  <xsl:with-param name="classCode" select="'SBADM'"/><xsl:with-param name="classCodeSystem" select="'???'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
  <!-- xsl:with-param name="code"  select="'???'"/><xsl:with-param name="codeSystem"  select="'???'"/ -->
  <!-- @@x_ActRelationshipEntryRelationship 2.16.840.1.113883.5.1002 -->
    </xsl:call-template>
</pre>
  </xsl:template>


  <xsl:template name="participation_all">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
<xsl:apply-templates select="n1:consumable" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:product" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:specimen" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:performer" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:authenticator" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:legalAuthenticator" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:informationRecipient" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:dataEnterer" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:participant" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:informant" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:author" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:custodian" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:recordTarget" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:responsibleParty" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:encounterParticipant" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:location" mode="participation">
      <xsl:with-param name="actLabel" select="$actLabel"/>
    </xsl:apply-templates>
  </xsl:template>


  <xsl:template name="participation-performer" match="n1:performer" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
    <xsl:param name="label" select="concat($actLabel, '_performer', count(preceding-sibling::n1:performer))"/>
    <xsl:param name="participation" select="concat($label, '_participation')"/>
    <xsl:param name="role"          select="concat($label, '_role')"/># Performer Participation
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'PRF'"/>
      <xsl:with-param name="roleTag"     select="'assignedEntity'"/>
      <xsl:with-param name="roleCode"    select="'ASSIGNED'"/>
      <xsl:with-param name="player1Tag"  select="'assignedPerson'"/>
      <xsl:with-param name="player1Type" select="'rim:Person'"/>
      <xsl:with-param name="scoper1Tag"  select="'representedOrganization'"/>
      <xsl:with-param name="scoper1Type" select="'rim:Organization'"/>
    </xsl:apply-templates>
</xsl:template>

  <xsl:template name="participation-authenticator" match="n1:authenticator" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
    <xsl:param name="label" select="concat($actLabel, '_authenticator', count(preceding-sibling::n1:authenticator))"/>
    <xsl:param name="participation" select="concat($label, '_participation')"/>
    <xsl:param name="role"          select="concat($label, '_role')"/>
# Authenticator Participation
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'AUTHEN'"/>
      <xsl:with-param name="roleTag"     select="'assignedEntity'"/>
      <xsl:with-param name="roleCode"    select="'ASSIGNED'"/>
      <xsl:with-param name="player1Tag"  select="'assignedPerson'"/>
      <xsl:with-param name="player1Type" select="'rim:Person'"/>
      <xsl:with-param name="scoper1Tag"  select="'representedOrganization'"/>
      <xsl:with-param name="scoper1Type" select="'rim:Organization'"/>
    </xsl:apply-templates>
</xsl:template>

  <xsl:template name="participation-legalAuthenticator" match="n1:legalAuthenticator" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
    <xsl:param name="label" select="concat($actLabel, '_legalAuthenticator', count(preceding-sibling::n1:legalAuthenticator))"/>
    <xsl:param name="participation" select="concat($label, '_participation')"/>
    <xsl:param name="role"          select="concat($label, '_role')"/># LegalAuthenticator Participation
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'LA'"/>
      <xsl:with-param name="roleTag"     select="'assignedEntity'"/>
      <xsl:with-param name="roleCode"    select="'ASSIGNED'"/>
      <xsl:with-param name="player1Tag"  select="'assignedPerson'"/>
      <xsl:with-param name="player1Type" select="'rim:Person'"/>
      <xsl:with-param name="scoper1Tag"  select="'representedOrganization'"/>
      <xsl:with-param name="scoper1Type" select="'rim:Organization'"/>
    </xsl:apply-templates>
</xsl:template>

  <xsl:template name="participation-dataEnterer" match="n1:dataEnterer" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
    <xsl:param name="label" select="concat($actLabel, '_dataEnterer', count(preceding-sibling::n1:dataEnterer))"/>
    <xsl:param name="participation" select="concat($label, '_participation')"/>
    <xsl:param name="role"          select="concat($label, '_role')"/># DataEnterer Participation
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'ENT'"/>
      <xsl:with-param name="roleTag"     select="'assignedEntity'"/>
      <xsl:with-param name="roleCode"    select="'ASSIGNED'"/>
      <xsl:with-param name="player1Tag"  select="'assignedPerson'"/>
      <xsl:with-param name="player1Type" select="'rim:Person'"/>
      <xsl:with-param name="scoper1Tag"  select="'representedOrganization'"/>
      <xsl:with-param name="scoper1Type" select="'rim:Organization'"/>
    </xsl:apply-templates>
</xsl:template>

  <xsl:template name="participation-consumable" match="n1:consumable" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
# Consumable ManufacturedMaterial
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'CSM'"/>
      <xsl:with-param name="roleTag"     select="'manufacturedProduct'"/>
      <xsl:with-param name="roleCode"    select="'MANU'"/>
      <xsl:with-param name="player1Tag"  select="'manufacturedMaterial'"/>
      <xsl:with-param name="player1Type" select="'rim:ManufacturedMaterial'"/>
      <xsl:with-param name="player2Tag"  select="'labeledDrug'"/> <!-- !! total guess at tag name -->
      <xsl:with-param name="player2Type" select="'rim:ManufacturedMaterial'"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template name="participation-product" match="n1:product" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
# Product
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'PRD'"/>
      <xsl:with-param name="roleTag"     select="'manufacturedProduct'"/>
      <xsl:with-param name="roleCode"    select="'MANU'"/>
      <xsl:with-param name="player1Tag"  select="'manufacturedMaterial'"/>
      <xsl:with-param name="player1Type" select="'rim:ManufacturedMaterial'"/>
      <xsl:with-param name="player2Tag"  select="'labeledDrug'"/> <!-- !! total guess at tag name -->
      <xsl:with-param name="player2Type" select="'rim:ManufacturedMaterial'"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template name="participation-specimen" match="n1:specimen" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
# Specimen
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'SPC'"/>
      <xsl:with-param name="roleTag"     select="'specimenRole'"/>
      <xsl:with-param name="roleCode"    select="'SPEC'"/>
      <xsl:with-param name="player1Tag"  select="'specimenPlayingEntity'"/>
      <xsl:with-param name="player1Type" select="'rim:Entity'"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template name="participation-informationRecipient" match="n1:informationRecipient" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
    <xsl:param name="label" select="concat($actLabel, '_informationRecipient', count(preceding-sibling::n1:informationRecipient))"/>
    <xsl:param name="participation" select="concat($label, '_participation')"/>
    <xsl:param name="role"          select="concat($label, '_role')"/># InformationRecipient
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'???'"/>
      <xsl:with-param name="roleTag"     select="'intendedRecipient'"/>
      <xsl:with-param name="roleCode"    select="'???'"/>
      <xsl:with-param name="player1Tag"  select="'informationRecipient'"/>
      <xsl:with-param name="player1Type" select="'rim:Person'"/>
      <xsl:with-param name="scoperTag"   select="'recievedOrganization'"/>
      <xsl:with-param name="scoperType"  select="'rim:Entity'"/>
    </xsl:apply-templates>
</xsl:template>

  <xsl:template name="participation-participant" match="n1:participant" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
    <xsl:param name="label" select="concat($actLabel, '_participant', count(preceding-sibling::n1:participant))"/>
    <xsl:param name="participation" select="concat($label, '_participation')"/>
    <xsl:param name="role"          select="concat($label, '_role')"/># Participant
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="@typeCode"/>
      <xsl:with-param name="roleTag"     select="'participantRole'"/>
      <xsl:with-param name="roleCode"    select="'ROL'"/>
      <xsl:with-param name="player1Tag"  select="'playingEntity'"/>
      <xsl:with-param name="player1Type" select="'rim:Person'"/><!-- !!! down-cast Entity -->
      <xsl:with-param name="player2Tag"  select="'playingDevice'"/>
      <xsl:with-param name="player2Type" select="'rim:Device'"/>
      <xsl:with-param name="scoperTag"   select="'scopingEntity'"/>
      <xsl:with-param name="scoperType"  select="'rim:Entity'"/>
    </xsl:apply-templates>
</xsl:template>

  <xsl:template name="participation-informant-assignedEntity" match="n1:informant[n1:assignedEntity]" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
# Assigned Informant
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'INF'"/>
      <xsl:with-param name="roleTag"     select="'assignedEntity'"/>
      <xsl:with-param name="roleCode"    select="'ASSIGNED'"/>
      <xsl:with-param name="player1Tag"  select="'assignedPerson'"/>
      <xsl:with-param name="player1Type" select="'rim:Person'"/>
      <xsl:with-param name="scoperTag"   select="'representedOrganization'"/>
      <xsl:with-param name="scoperType"  select="'rim:Organization'"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template name="participation-informant-relatedEntity" match="n1:informant[n1:relatedEntity]" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
# Related Informant
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'INF'"/>
      <xsl:with-param name="roleTag"     select="'relatedEntity'"/>
      <xsl:with-param name="roleCode"    select="'???'"/>
      <xsl:with-param name="player1Tag"  select="'relatedPerson'"/>
      <xsl:with-param name="player1Type" select="'rim:Person'"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template name="participation-author" match="n1:author" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
    <xsl:param name="label" select="concat($actLabel, '_author', count(preceding-sibling::n1:author))"/>
    <xsl:param name="participation" select="concat($label, '_participation')"/>
    <xsl:param name="role"          select="concat($label, '_role')"/># Author
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'AUT'"/>
      <xsl:with-param name="roleTag"     select="'assignedAuthor'"/>
      <xsl:with-param name="roleCode"    select="'ASSIGNED'"/>
      <xsl:with-param name="player1Tag"  select="'assignedPerson'"/>
      <xsl:with-param name="player1Type" select="'rim:Person'"/>
      <xsl:with-param name="player2Tag"  select="'assignedDevice'"/>
      <xsl:with-param name="player2Type" select="'rim:Device'"/>
      <xsl:with-param name="scoperTag"   select="'representedOrganization'"/>
      <xsl:with-param name="scoperType"  select="'rim:Organization'"/>
    </xsl:apply-templates>
</xsl:template>

  <xsl:template name="participation-custodian" match="n1:custodian" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
    <xsl:param name="label" select="concat($actLabel, '_custodian', count(preceding-sibling::n1:custodian))"/>
    <xsl:param name="participation" select="concat($label, '_participation')"/>
    <xsl:param name="role"          select="concat($label, '_role')"/># Custodian
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'CST'"/>
      <xsl:with-param name="roleTag"     select="'assignedCustodian'"/>
      <xsl:with-param name="roleCode"    select="'ASSIGNED'"/>
      <xsl:with-param name="player1Tag"  select="'@@notag@@'"/>
      <xsl:with-param name="player1Type" select="'rim:Person'"/>
      <xsl:with-param name="scoperTag"   select="'representedCustodianOrganization'"/>
      <xsl:with-param name="scoperType"  select="'rim:Organization'"/>
    </xsl:apply-templates>
</xsl:template>

  <xsl:template name="participation-recordTarget" match="n1:recordTarget" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
    <xsl:param name="label" select="concat($actLabel, '_recordTarget', count(preceding-sibling::n1:recordTarget))"/>
    <xsl:param name="participation" select="concat($label, '_participation')"/>
    <xsl:param name="role"          select="concat($label, '_role')"/># RecordTarget
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'RCT'"/>
      <xsl:with-param name="roleTag"     select="'patientRole'"/>
      <xsl:with-param name="roleCode"    select="'PAT'"/>
      <xsl:with-param name="player1Tag"  select="'patient'"/>
      <xsl:with-param name="player1Type" select="'rim:Person'"/>
      <xsl:with-param name="scoperTag"   select="'providerOrganization'"/>
      <xsl:with-param name="scoperType"  select="'rim:Organization'"/>
    </xsl:apply-templates>
</xsl:template>

  <xsl:template name="participation-responsibleParty" match="n1:responsibleParty" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
    <xsl:param name="label" select="concat($actLabel, '_responsibleParty', count(preceding-sibling::n1:responsibleParty))"/>
    <xsl:param name="participation" select="concat($label, '_participation')"/>
    <xsl:param name="role"          select="concat($label, '_role')"/># ResponsibleParty Participation
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'RESP'"/>
      <xsl:with-param name="roleTag"     select="'assignedEntity'"/>
      <xsl:with-param name="roleCode"    select="'ASSIGNED'"/>
      <xsl:with-param name="player1Tag"  select="'assignedPerson'"/>
      <xsl:with-param name="player1Type" select="'rim:Person'"/>
      <xsl:with-param name="scoper1Tag"   select="'representedOrganization'"/>
      <xsl:with-param name="scoper1Type"  select="'rim:Organization'"/>
    </xsl:apply-templates>
</xsl:template>

  <xsl:template name="participation-encounterParticipant" match="n1:encounterParticipant" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
    <xsl:param name="label" select="concat($actLabel, '_encounterParticipant', count(preceding-sibling::n1:encounterParticipant))"/>
    <xsl:param name="participation" select="concat($label, '_participation')"/>
    <xsl:param name="role"          select="concat($label, '_role')"/># ResponsibleParty Participation
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'???'"/>
      <xsl:with-param name="roleTag"     select="'assignedEntity'"/>
      <xsl:with-param name="roleCode"    select="'ASSIGNED'"/>
      <xsl:with-param name="player1Tag"  select="'assignedPerson'"/>
      <xsl:with-param name="player1Type" select="'rim:Person'"/>
      <xsl:with-param name="scoper1Tag"   select="'representedOrganization'"/>
      <xsl:with-param name="scoper1Type"  select="'rim:Organization'"/>
    </xsl:apply-templates>
</xsl:template>

  <xsl:template name="participation-location" match="n1:location" mode="participation">
    <xsl:param name="actLabel" select="'@@@actLabel'"/>
    <xsl:param name="label" select="concat($actLabel, '_location', count(preceding-sibling::n1:location))"/>
    <xsl:param name="participation" select="concat($label, '_participation')"/>
    <xsl:param name="role"          select="concat($label, '_role')"/># ResponsibleParty Participation
<xsl:apply-templates select="." mode="typedParticipation">
      <xsl:with-param name="parttnLabel" select="$actLabel"/>
      <xsl:with-param name="typeCode"    select="'LOC'"/>
      <xsl:with-param name="roleTag"     select="'healthCareFacility'"/>
      <xsl:with-param name="roleCode"    select="'SDLOC'"/>
      <xsl:with-param name="player1Tag"  select="'location'"/>
      <xsl:with-param name="player1Type" select="'rim:Place'"/>
      <xsl:with-param name="scoper1Tag"  select="'serviceProviderOrganization'"/>
      <xsl:with-param name="scoper1Type" select="'rim:Organization'"/>
    </xsl:apply-templates>
</xsl:template>


  <xsl:template name="Entity" match="*" mode="Entity">
    <xsl:param name="entity" select="'@@@entity'"/>
<span class="Entity"><xsl:call-template name="anchor"><xsl:with-param name="anchor" select="$entity"/></xsl:call-template> a rim:Entity ;
    rim:Entity.classCode [ hl7:coding [ dt:CDCoding.code "ENT" ; dt:CDCoding.codeSystem "???" ] ] ;
    <span class="error"># rim:Entity.determinerCode [ hl7:coding [ dt:CDCoding.code "INSTANCE" ; dt:CDCoding.codeSystem "???" ] ] ;<xsl:value-of select="$newline"/></span>
<xsl:apply-templates select="n1:code" mode="predicate_CD">
  <xsl:with-param name="indent" select="'    '"/>
  <xsl:with-param name="predicate" select="'rim:Entity.code'"/>
</xsl:apply-templates> .
</span></xsl:template>


  <xsl:template name="Device" match="*" mode="Device">
    <xsl:param name="entity" select="'@@@entity'"/>
<span class="Entity"><xsl:call-template name="anchor"><xsl:with-param name="anchor" select="$entity"/></xsl:call-template> a rim:Entity ;
    rim:Entity.classCode [ hl7:coding [ dt:CDCoding.code "DEV" ; dt:CDCoding.codeSystem "???" ] ] ;
    <span class="error"># rim:Entity.determinerCode [ hl7:coding [ dt:CDCoding.code "INSTANCE" ; dt:CDCoding.codeSystem "???" ] ] ;<xsl:value-of select="$newline"/></span>
<xsl:apply-templates select="n1:code" mode="predicate_CD">
  <xsl:with-param name="indent" select="'    '"/>
  <xsl:with-param name="predicate" select="'rim:Entity.code'"/>
</xsl:apply-templates> .
</span></xsl:template>


  <xsl:template name="Place" match="*" mode="Place">
    <xsl:param name="entity" select="'@@@entity'"/>
<span class="Entity"><xsl:call-template name="anchor"><xsl:with-param name="anchor" select="$entity"/></xsl:call-template> a rim:Entity ;
    rim:Entity.classCode [ hl7:coding [ dt:CDCoding.code "PLC" ; dt:CDCoding.codeSystem "???" ] ] ;
    <span class="error"># rim:Entity.determinerCode [ hl7:coding [ dt:CDCoding.code "INSTANCE" ; dt:CDCoding.codeSystem "???" ] ] ;<xsl:value-of select="$newline"/></span>
<xsl:apply-templates select="n1:code" mode="predicate_CD">
  <xsl:with-param name="indent" select="'    '"/>
  <xsl:with-param name="predicate" select="'rim:Entity.code'"/>
</xsl:apply-templates> .
</span></xsl:template>


  <xsl:template name="ManufacturedMaterial" match="*" mode="ManufacturedMaterial">
    <xsl:param name="entity" select="'@@@entity'"/>
<span class="Entity"><xsl:call-template name="anchor"><xsl:with-param name="anchor" select="$entity"/></xsl:call-template> a rim:ManufacturedMaterial ;
    rim:Entity.classCode [ hl7:coding [ dt:CDCoding.code "MMAT" ; dt:CDCoding.codeSystem "???" ] ] ;
    <span class="error"># rim:Entity.determinerCode [ hl7:coding [ dt:CDCoding.code "???" ; dt:CDCoding.codeSystem "???" ] ] ;<xsl:value-of select="$newline"/></span>
<xsl:apply-templates select="n1:code" mode="predicate_CD">
  <xsl:with-param name="indent" select="'    '"/>
  <xsl:with-param name="predicate" select="'rim:Entity.code'"/>
</xsl:apply-templates>;
    <xsl:if test="n1:lotNumberText">rim:ManufacturedMaterial.lotNumberText [ dt:ED.value "<xsl:value-of select="n1:lotNumberText"/>" ] ;
    </xsl:if>
    <xsl:if test="n1:name">rim:Entity.name [ a dt:COLL_EN ; dt:COLL.item [ <span class="error">err:name</span> "<xsl:value-of select="n1:name"/>" ] ] ;
    </xsl:if>
    <span class="error"># rim:ManufacturedMaterial.manufacturerOrganization "<xsl:value-of select="../n1:manufacturerOrganization/n1:name"/>"</span>
</span></xsl:template>


  <xsl:template name="assignedEntity" match="*[name()='assignedEntity' or name()='assignedAuthor']" mode="assignedEntity">
    <xsl:param name="role"   select="'@@@role'"/>
    <xsl:param name="entity" select="concat($role, '_player')"/>
    <xsl:call-template name="Role">
      <xsl:with-param name="roleLabel" select="$role"/>
      <xsl:with-param name="classCode" select="'ASSIGNED'"/>
      <xsl:with-param name="player1Tag" select="$entity"/>
      <xsl:with-param name="player1Type" select="'rim:Person'"/>
    </xsl:call-template><xsl:value-of select="$newline"/>

    <xsl:apply-templates select="n1:assignedPerson" mode="Person">
      <xsl:with-param name="entity" select="$entity"/>
    </xsl:apply-templates><xsl:value-of select="$newline"/>
  </xsl:template>

  <!-- @@ produces excess ';'s.
       final '.' from caller, e.g. <xsl:for-each select="*[name(.)=$player1Tag]">...</xsl:for-each> -->
  <xsl:template name="Person" match="*" mode="Person">
    <xsl:param name="entity" select="'@@@entity'"/>
<span class="Entity"><xsl:call-template name="anchor"><xsl:with-param name="anchor" select="$entity"/></xsl:call-template> a rim:Person ;
    rim:Entity.classCode [ hl7:coding [ dt:CDCoding.code "PSN" ; dt:CDCoding.codeSystem "???" ] ] ;
    rim:Entity.determinerCode [ hl7:coding [ dt:CDCoding.code "INSTANCE" ; dt:CDCoding.codeSystem "???" ] ] ;
    rim:Entity.name [ a dt:COLL_EN ;
<xsl:apply-templates select="n1:name/*" mode="person-name"/>    ];
<xsl:apply-templates select="n1:languageCommunication" mode="language-communication"/>
<xsl:apply-templates select="n1:administrativeGenderCode" mode="predicate_CD">
  <xsl:with-param name="indent" select="'    '"/>
  <xsl:with-param name="predicate" select="'rim:LivingSubject.administrativeGenderCode'"/>
</xsl:apply-templates> ;
<xsl:apply-templates select="n1:birthTime" mode="predicate_time">
    <xsl:with-param name="predicate" select="'rim:LivingSubject.birthTime'"/>
    </xsl:apply-templates><xsl:value-of select="$newline"/>
<xsl:apply-templates select="." mode="predicate_CD_LIST">
      <xsl:with-param name="elements" select="n1:raceCode"/>
      <xsl:with-param name="indent" select="'    '"/>
      <xsl:with-param name="setPredicate" select="'rim:Person.raceCode'"/>
      <xsl:with-param name="setType" select="'dt:DSET_CD'"/>
      <xsl:with-param name="predicate" select="'dt:COLL.item'"/>
    </xsl:apply-templates> ;<xsl:value-of select="$newline"/>
<xsl:apply-templates select="." mode="predicate_CD_LIST">
      <xsl:with-param name="elements" select="n1:ethnicGroupCode"/>
      <xsl:with-param name="indent" select="'    '"/>
      <xsl:with-param name="setPredicate" select="'rim:Person.ethnicGroupCode'"/>
      <xsl:with-param name="setType" select="'dt:DSET_CD'"/>
      <xsl:with-param name="predicate" select="'dt:COLL.item'"/>
    </xsl:apply-templates></span>
</xsl:template>


  <xsl:template name="telecom-root" match="n1:telecom[@value]" mode="telecom">
    <xsl:param name="indent" select="''"/>
    <xsl:param name="predicate" select="'@@@predicate'"/><xsl:value-of select="$indent"/><xsl:value-of select="$predicate"/> [ a dt:COLL_TEL ; dt:COLL.item [ a dt:TEL ; dt:URL.address "<xsl:value-of select="@value"/>"<xsl:choose><xsl:when test="@use"> ; dt:TEL.use "<xsl:value-of select="@use"/>" ; </xsl:when></xsl:choose> ] ];
</xsl:template>
  <xsl:template name="telecom-null" match="n1:telecom[@nullFlavor]" mode="telecom">
    <xsl:param name="indent" select="''"/>
    <xsl:param name="predicate" select="'@@@predicate'"/><xsl:value-of select="$indent"/><xsl:value-of select="$predicate"/> [ a dt:COLL_TEL ; hl7:coding [ dt:CDCoding.code "<xsl:value-of select="@nullFlavor"/>" ; dt:CDCoding.codeSystem "@@HL7 UNK code system" ] ] ;
</xsl:template>


  <xsl:template name="language-communication" match="n1:languageCommunication" mode="language-communication">
    <xsl:text>    rim:Entity.languageCommunication [</xsl:text>
        rim:InfrastructureRoot.templateId [ dt:II.root "<xsl:value-of select="n1:templateId/@root"/>" ] ;
        rim:LanguageCommunication.languageCode [
            dt:CD.coding [ dt:CDCoding.code "<xsl:value-of select="n1:languageCode/@code"/>" ; dt:CDCoding.codeSystem "2.16.840.1.113883.6.84" ]
        ] ;
        rim:LanguageCommunication.preferenceInd "<xsl:value-of select="n1:preferenceInd/@value"/>"
    ] ;<xsl:value-of select="$newline"/>
  </xsl:template>

  <xsl:template name="person-name-family" match="n1:family" mode="person-name">
    <xsl:text>        </xsl:text><span class="error">dt:COLL.item [ err:person-name-family "<xsl:value-of select="text()"/>" ] ;</span><xsl:value-of select="$newline"/>
  </xsl:template>

  <xsl:template name="person-name-given" match="n1:given" mode="person-name">
    <xsl:text>        </xsl:text><span class="error">dt:COLL.item [ err:person-name-given "<xsl:value-of select="text()"/>" ] ;</span><xsl:value-of select="$newline"/>
  </xsl:template>

  <xsl:template name="addr" match="n1:addr" mode="addr">
    <xsl:param name="predicate" select="'@@@predicate'"/>
    <xsl:param name="indent" select="'        '"/>
    <xsl:value-of select="$indent"/><xsl:value-of select="$predicate"/> [ a dt:COLL_AD ;
<xsl:apply-templates mode="addr-all">
      <xsl:with-param name="indent" select="concat($indent, '    ')"/>
    </xsl:apply-templates>
    ] ;<xsl:value-of select="$newline"/>
  </xsl:template>
  <xsl:template name="addr-text" match="text()" mode="addr-all"/>
  <xsl:template name="addr-streetAddressLine" match="n1:streetAddressLine" mode="addr-all">
    <xsl:param name="indent" select="'            '"/>
    <xsl:value-of select="$indent"/>
    <span class="error">err:streetAddressLine "<xsl:value-of select="text()"/>" ;</span>
    <xsl:value-of select="$newline"/>
  </xsl:template>
  <xsl:template name="addr-city" match="n1:city" mode="addr-all">
    <xsl:param name="indent" select="'            '"/>
    <xsl:value-of select="$indent"/>
    <span class="error">err:city "<xsl:value-of select="text()"/>" ;</span>
    <xsl:value-of select="$newline"/>
  </xsl:template>
  <xsl:template name="addr-state" match="n1:state" mode="addr-all">
    <xsl:param name="indent" select="'            '"/>
    <xsl:value-of select="$indent"/>
    <span class="error">err:state "<xsl:value-of select="text()"/>" ;</span>
    <xsl:value-of select="$newline"/>
  </xsl:template>
  <xsl:template name="addr-postalCode" match="n1:postalCode" mode="addr-all">
    <xsl:param name="indent" select="'            '"/>
    <xsl:value-of select="$indent"/>
    <span class="error">err:postalCode "<xsl:value-of select="text()"/>" ;</span>
    <xsl:value-of select="$newline"/>
  </xsl:template>
  <xsl:template name="addr-country" match="n1:country" mode="addr-all">
    <xsl:param name="indent" select="'            '"/>
    <xsl:value-of select="$indent"/><span class="error">err:country "<xsl:value-of select="text()"/>" ;</span>
  </xsl:template>

  <xsl:template name="Participation">
    <xsl:param name="actLabel" select="'@@@act'"/>
    <xsl:param name="roleLabel" select="'@@@role'"/>
    <xsl:param name="typeCode" select="'@@@typeCode'"/><span class="Participation">[ a rim:Participation ;
    rim:Participation.typeCode [ hl7:coding [ dt:CDCoding.code "<xsl:value-of select="$typeCode"/>" ; dt:CDCoding.codeSystem "???" ] ] ;
    rim:Participation.act <xsl:call-template name="href"><xsl:with-param name="anchor" select="$actLabel"/></xsl:call-template> ;
    rim:Participation.role <xsl:call-template name="href"><xsl:with-param name="anchor" select="$roleLabel"/></xsl:call-template>
] .</span>
  </xsl:template>


  <xsl:template name="Role">
    <xsl:param name="roleLabel"   select="'@@@roleLabel'"/>
    <xsl:param name="classCode"   select="'@@@classCode'"/>
    <xsl:param name="player1Tag"  select="'@@@player1Tag'"/>
    <xsl:param name="player1Type" select="'@@@player1Type'"/>
    <xsl:param name="player2Tag"  select="'@@@player2Tag'"/>
    <xsl:param name="player2Type" select="'@@@player2Type'"/>
    <xsl:param name="scoperTag"   select="'@@@scoperTag'"/>
    <xsl:param name="scoperType"  select="'@@@scoperType'"/>
    
    <xsl:param name="playerName"  select="concat($roleLabel, '_player')"/>
    <xsl:param name="scoperName"  select="concat($roleLabel, '_scoper')"/>
    <span class="Role">
      <xsl:call-template name="anchor"><xsl:with-param name="anchor" select="$roleLabel"/></xsl:call-template> a rim:Role ;
<xsl:apply-templates select="." mode="predicate_II_LIST">
	<xsl:with-param name="elements" select="n1:id"/>
	<xsl:with-param name="indent" select="'    '"/>
	<xsl:with-param name="setPredicate" select="'rim:Role.id'"/>
	<xsl:with-param name="setType" select="'dt:DSET_II'"/>
	<xsl:with-param name="predicate" select="'dt:COLL.item'"/>
      </xsl:apply-templates>
    rim:Role.player <xsl:call-template name="href"><xsl:with-param name="anchor" select="$playerName"/></xsl:call-template> ;<xsl:if test="$scoperTag != '@@@scoperTag'"><xsl:value-of select="$newline"/>    rim:Role.scoper <xsl:call-template name="href"><xsl:with-param name="anchor" select="$scoperName"/></xsl:call-template> ;</xsl:if>
    rim:Role.classCode [ hl7:coding [ dt:CDCoding.code "<xsl:value-of select="$classCode"/>" ; dt:CDCoding.codeSystem "???" ] ] ;
<xsl:apply-templates select="n1:telecom" mode="telecom">
      <xsl:with-param name="predicate" select="'rim:Role.telecom'"/>
      <xsl:with-param name="indent" select="'    '"/>
</xsl:apply-templates><xsl:apply-templates select="n1:addr" mode="addr">
        <xsl:with-param name="predicate" select="'rim:Role.addr'"/>
        <xsl:with-param name="indent" select="'    '"/>
      </xsl:apply-templates>.</span>
    <xsl:value-of select="$newline"/>

    <xsl:for-each select="*[name(.)=$player1Tag]">
      <xsl:call-template name="generic_entity">
	<xsl:with-param name="entityLabel" select="$playerName"/>
	<xsl:with-param name="entityType" select="$player1Type"/>
      </xsl:call-template>.<xsl:value-of select="$newline"/>
    </xsl:for-each>
    <xsl:for-each select="*[name(.)=$player2Tag]">
      <xsl:call-template name="generic_entity">
	<xsl:with-param name="entityLabel" select="$playerName"/>
	<xsl:with-param name="entityType" select="$player2Type"/>
      </xsl:call-template>.<xsl:value-of select="$newline"/>
    </xsl:for-each>

    <xsl:for-each select="*[name(.)=$scoperTag]">
      <xsl:call-template name="generic_entity">
	<xsl:with-param name="entityLabel" select="$scoperName"/>
	<xsl:with-param name="entityType" select="$scoperType"/>
      </xsl:call-template>.
    </xsl:for-each>
</xsl:template>


  <xsl:template name="generic_entity">
    <xsl:param name="entityLabel" select="'@@@entityLabel'"/>
    <xsl:param name="entityType" select="'@@@entitytype'"/>
    <xsl:choose>
      <xsl:when test="$entityType='rim:Person'">
	<xsl:apply-templates select="." mode="Person">
	  <xsl:with-param name="entity" select="$entityLabel"/>
	</xsl:apply-templates>
	<xsl:value-of select="$newline"/>
	<xsl:value-of select="$newline"/>
      </xsl:when>
      <xsl:when test="$entityType='rim:Organization'">
	<xsl:apply-templates select="." mode="Organization">
	  <xsl:with-param name="entity" select="$entityLabel"/>
	</xsl:apply-templates>
	<xsl:value-of select="$newline"/>
	<xsl:value-of select="$newline"/>
      </xsl:when>
      <xsl:when test="$entityType='rim:ManufacturedMaterial'">
	<xsl:apply-templates select="." mode="ManufacturedMaterial">
	  <xsl:with-param name="entity" select="$entityLabel"/>
	</xsl:apply-templates>
	<xsl:value-of select="$newline"/>
	<xsl:value-of select="$newline"/>
      </xsl:when>
      <xsl:when test="$entityType='rim:Entity'">
	<xsl:apply-templates select="." mode="Entity">
	  <xsl:with-param name="entity" select="$entityLabel"/>
	</xsl:apply-templates>
	<xsl:value-of select="$newline"/>
	<xsl:value-of select="$newline"/>
      </xsl:when>
      <xsl:when test="$entityType='rim:Place'">
	<xsl:apply-templates select="." mode="Place">
	  <xsl:with-param name="entity" select="$entityLabel"/>
	</xsl:apply-templates>
	<xsl:value-of select="$newline"/>
	<xsl:value-of select="$newline"/>
      </xsl:when>
      <xsl:when test="$entityType='rim:Device'"> <!-- doesn't exist — used to set code="DEV" -->
	<xsl:apply-templates select="." mode="Device">
	  <xsl:with-param name="entity" select="$entityLabel"/>
	</xsl:apply-templates>
	<xsl:value-of select="$newline"/>
	<xsl:value-of select="$newline"/>
      </xsl:when>
      <xsl:otherwise>
	<span class="error"><xsl:value-of select="concat(&quot;# what's a &quot;, $entityType, '?', $newline)"/></span>
      </xsl:otherwise>
    </xsl:choose>
</xsl:template>

  <xsl:template name="Organization" match="*" mode="Organization">
    <xsl:param name="entity" select="'@@@entity'"/>
<span class="Entity"><xsl:call-template name="anchor"><xsl:with-param name="anchor" select="$entity"/></xsl:call-template> a rim:Organization ;
<xsl:apply-templates select="." mode="predicate_II_LIST">
      <xsl:with-param name="elements" select="n1:id"/>
      <xsl:with-param name="indent" select="'    '"/>
      <xsl:with-param name="setPredicate" select="'rim:Entity.id'"/>
      <xsl:with-param name="setType" select="'dt:DSET_II'"/>
      <xsl:with-param name="predicate" select="'dt:COLL.item'"/>
    </xsl:apply-templates>
    rim:Entity.name [ a dt:COLL_EN ; ] ; <span class="error">dt:COLL.item [ err:name "<xsl:value-of select="n1:name"/>" ] ;</span><xsl:value-of select="$newline"/>
    <xsl:apply-templates select="n1:telecom" mode="telecom">
      <xsl:with-param name="predicate" select="'rim:Entity.telecom'"/>
      <xsl:with-param name="indent" select="'    '"/>
    </xsl:apply-templates>
    <xsl:apply-templates select="n1:addr" mode="addr">
      <xsl:with-param name="predicate" select="'rim:Role.addr'"/>
      <xsl:with-param name="indent" select="'    '"/>
    </xsl:apply-templates></span></xsl:template>

  <xsl:template name="section-entry-E_Procedure_Activity_Procedure" match="n1:procedure[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.14']" mode="section-entry">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="index" select="'@@@index'"/>
    <xsl:param name="target" select="concat($source, '_procedureActivityProcedure', $index)"/>
    # <a href="#E_Procedure_Activity_Procedure">Procedure Activity</a><xsl:value-of select="$newline"/>

    <pre><xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="../@typeCode"/><!-- '@@x_ActRelationshipEntry' -->
    </xsl:call-template><xsl:value-of select="$newline"/>

<xsl:call-template name="Procedure">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Act'"/>
  <xsl:with-param name="classCode" select="@classCode"/><xsl:with-param name="classCodeSystem" select="'???'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
    </xsl:call-template>
</pre>
  </xsl:template>


  <xsl:template name="section-entry-E_Result_Organizer" match="n1:organizer[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.1']" mode="section-entry">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="target" select="concat($source, '_resultOrganizer', count(preceding-sibling::n1:observation))"/>
    # <a class="error" href="#E_Result_Organizer">Result Organizer</a><xsl:value-of select="$newline"/>

    <pre><xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="../@typeCode"/>
    </xsl:call-template><xsl:value-of select="$newline"/>

<xsl:call-template name="Act">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Act'"/>
  <xsl:with-param name="classCode" select="@classCode"/><xsl:with-param name="classCodeSystem" select="'???'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
    </xsl:call-template>

# organizer contents: {<xsl:apply-templates select="n1:component/*" mode="section-entry-component">
      <xsl:with-param name="source" select="$target"/>
    </xsl:apply-templates>
# }</pre>
  </xsl:template>

  <xsl:template name="section-entry-E_Result_Observation" match="n1:observation[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.2']" mode="section-entry-component">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="target" select="concat($source, '_component', count(../preceding-sibling::n1:component))"/>
# <a href="#E_Result_Observation">Result Observation</a><xsl:value-of select="$newline"/>

<xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="'COMP'"/>
    </xsl:call-template><xsl:value-of select="$newline"/>
<xsl:call-template name="Observation">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Observation'"/>
  <xsl:with-param name="classCode" select="'OBS'"/><xsl:with-param name="classCodeSystem" select="'2.16.840.1.113883.5.6'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
  <!-- @@x_ActMoodDocumentObservation -->
    </xsl:call-template>

<xsl:call-template name="actRelationship_all">
      <xsl:with-param name="source" select="$target"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="ActRelationship">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="target" select="'@@@target'"/>
    <xsl:param name="code" select="'@@@code'"/><span class="ActRelationship">[ a rim:ActRelationship ;
    rim:ActRelationship.typeCode [ hl7:coding [ dt:CDCoding.code "<xsl:value-of select="$code"/>" ; dt:CDCoding.codeSystem "???" ] ] ;
    rim:ActRelationship.source <xsl:call-template name="href"><xsl:with-param name="anchor" select="$source"/></xsl:call-template> ;
    rim:ActRelationship.target <xsl:call-template name="href"><xsl:with-param name="anchor" select="$target"/></xsl:call-template>
] .</span></xsl:template>

<!-- Act template -->
  <xsl:template name="Act">
    <xsl:param name="recurse" select="true()"/>
    <xsl:param name="node" select="'@@@node'"/><xsl:param name="finalType" select="'@@@finalType'"/>
    <xsl:param name="classCode" select="'@@@classCode'"/><xsl:param name="classCodeSystem" select="'@@@classCodeSystem'"/>
    <xsl:param name="moodCode" select="'@@@moodCode'"/><xsl:param name="moodCodeSystem" select="'@@@moodCodeSystem'"/>
    <span class="Act"><xsl:call-template name="anchor"><xsl:with-param name="anchor" select="$node"/></xsl:call-template> a <xsl:value-of select="$finalType"/> ;
<xsl:apply-templates select="." mode="predicate_II_LIST">
      <xsl:with-param name="elements" select="n1:id"/>
      <xsl:with-param name="indent" select="'    '"/>
      <xsl:with-param name="setPredicate" select="'rim:Act.id'"/>
      <xsl:with-param name="setType" select="'dt:DSET_II'"/>
      <xsl:with-param name="predicate" select="'dt:COLL.item'"/>
    </xsl:apply-templates>
    rim:Act.classCode [ hl7:coding [ dt:CDCoding.code "<xsl:value-of select="$classCode"/>" ; dt:CDCoding.codeSystem "<xsl:value-of select="$classCodeSystem"/>" ] ] ;
    rim:Act.moodCode [ hl7:coding [ dt:CDCoding.code "<xsl:value-of select="$moodCode"/>" ; dt:CDCoding.codeSystem "<xsl:value-of select="$moodCodeSystem"/>" ] ] ;<xsl:apply-templates select="n1:effectiveTime" mode="predicate_time">
    <xsl:with-param name="predicate" select="'rim:Act.effectiveTime'"/>
    </xsl:apply-templates><xsl:apply-templates select="n1:statusCode" mode="Act.statusCode"/><xsl:value-of select="$newline"/>
    <xsl:apply-templates select="n1:code" mode="predicate_CD">
      <xsl:with-param name="indent" select="'    '"/>
      <xsl:with-param name="predicate" select="'rim:Act.code'"/>
    </xsl:apply-templates></span>
<xsl:if test="$recurse">.
<xsl:call-template name="participation_all">
      <xsl:with-param name="actLabel" select="$node"/>
    </xsl:call-template>
<xsl:call-template name="actRelationship_all">
      <xsl:with-param name="source" select="$node"/>
    </xsl:call-template>
</xsl:if>
</xsl:template>


  <xsl:template name="predicate_CD_LIST" match="*" mode="predicate_CD_LIST">
    <xsl:param name="elements" select="."/>
    <xsl:param name="predicate" select="'@@@predicate'"/>
    <xsl:param name="setPredicate" select="'@@@setPredicate'"/>
    <xsl:param name="setType" select="'@@@setType'"/>
    <xsl:param name="indent" select="''"/>
    <xsl:if test="$elements">
      <xsl:value-of select="$indent"/><xsl:value-of select="$setPredicate"/> [ a <xsl:value-of select="$setType"/> ;
<xsl:apply-templates select="$elements" mode="predicate_CD">
      <xsl:with-param name="indent" select="concat('    ', $indent)"/>
      <xsl:with-param name="predicate" select="'dt:COLL.item'"/>
    </xsl:apply-templates>    
    ] ;</xsl:if></xsl:template>

  <xsl:template name="predicate_CD" match="*" mode="predicate_CD">
    <xsl:param name="predicate" select="'@@@predicate'"/>
    <xsl:param name="indent" select="''"/>
    <xsl:value-of select="$indent"/><xsl:value-of select="$predicate"/> [<xsl:apply-templates select="." mode="dt_CD"><xsl:with-param name="indent" select="concat('    ', $indent)"/></xsl:apply-templates><xsl:value-of select="$indent"/>]<xsl:if test="name(following-sibling::*[1])=name()">;<xsl:value-of select="$newline"/></xsl:if></xsl:template>

  <xsl:template name="dt_CD-code" match="*[@code]" mode="dt_CD">
    <xsl:param name="indent" select="''"/><xsl:value-of select="$newline"/>
    <xsl:value-of select="$indent"/>hl7:coding [ dt:CDCoding.code "<xsl:value-of select="@code"/>" ; dt:CDCoding.codeSystem "<xsl:value-of select="@codeSystem"/>" ;
<xsl:value-of select="concat($indent, '             ')"/><xsl:if test="@displayName">dt:CDCoding.displayName "<xsl:value-of select="@displayName"/>" ; </xsl:if>dt:CDCoding.codeSystemName "<xsl:value-of select="@codeSystemName"/>" ]
</xsl:template>

  <xsl:template name="dt_CD-null" match="*[@nullFlavor]" mode="dt_CD">
    <xsl:param name="indent" select="''"/><xsl:value-of select="$newline"/>
    <xsl:value-of select="$indent"/>hl7:coding [ dt:CDCoding.code "<xsl:value-of select="@nullFlavor"/>" ; dt:CDCoding.codeSystem "@@HL7 UNK code system" ;
<xsl:value-of select="concat($indent, '             ')"/>dt:CDCoding.displayName "@@beats me" ; dt:CDCoding.codeSystemName "@@HL7" ]
</xsl:template>

  <xsl:template name="dt_CD-error" match="*" mode="dt_CD"> 
    <xsl:param name="indent" select="''"/>
    <xsl:if test="$output!='text'">
     <span class="error"># unknown code</span><xsl:value-of select="$newline"/>
    </xsl:if>
  </xsl:template>


  <xsl:template name="predicate_II_LIST" match="*" mode="predicate_II_LIST">
    <xsl:param name="elements" select="."/>
    <xsl:param name="predicate" select="'@@@predicate'"/>
    <xsl:param name="setPredicate" select="'@@@setPredicate'"/>
    <xsl:param name="setType" select="'@@@setType'"/>
    <xsl:param name="indent" select="''"/>
    <xsl:if test="$elements">
      <xsl:value-of select="$indent"/><xsl:value-of select="$setPredicate"/> [ a <xsl:value-of select="$setType"/> ;
<xsl:apply-templates select="$elements" mode="predicate_II">
      <xsl:with-param name="indent" select="concat('    ', $indent)"/>
      <xsl:with-param name="predicate" select="'dt:COLL.item'"/>
    </xsl:apply-templates>
    ] ;</xsl:if></xsl:template>

  <xsl:template name="predicate_II" match="*" mode="predicate_II">
    <xsl:param name="predicate" select="'@@@predicate'"/>
    <xsl:param name="indent" select="''"/>
    <xsl:value-of select="$indent"/><xsl:value-of select="$predicate"/> [<xsl:apply-templates select="." mode="dt_II"/> ]<xsl:if test="name(following-sibling::*[1])=name()">;<xsl:value-of select="$newline"/></xsl:if></xsl:template>

  <xsl:template name="dt_II-root" match="*[@root]" mode="dt_II"> dt:II.root "<xsl:value-of select="@root"/>"<xsl:if test="@extension"> ; dt:II.extension "<xsl:value-of select="@extension"/>"</xsl:if>
</xsl:template>


  <!-- Observation template -->
  <xsl:template name="Observation">
    <xsl:param name="node" select="'@@@node'"/><xsl:param name="finalType" select="'@@@finalType'"/>
    <xsl:param name="classCode" select="'@@@classCode'"/><xsl:param name="classCodeSystem" select="'@@@classCodeSystem'"/>
    <xsl:param name="moodCode" select="'@@@moodCode'"/><xsl:param name="moodCodeSystem" select="'@@@moodCodeSystem'"/>

<xsl:call-template name="Act">
  <xsl:with-param name="recurse" select="false()"/>
  <xsl:with-param name="node" select="$node"/><xsl:with-param name="finalType" select="$finalType"/>
  <xsl:with-param name="classCode" select="$classCode"/><xsl:with-param name="classCodeSystem" select="$classCodeSystem"/>
  <xsl:with-param name="moodCode"  select="$moodCode"/><xsl:with-param name="moodCodeSystem"  select="$moodCodeSystem"/>
    </xsl:call-template><span class="Act">;
    rim:Observation.value [ <xsl:apply-templates select="n1:value" mode="value-any">
    <xsl:with-param name="indent" select="'        '"/>
  </xsl:apply-templates>
    ] .</span>
<xsl:call-template name="participation_all">
      <xsl:with-param name="actLabel" select="$node"/>
    </xsl:call-template>
<xsl:call-template name="actRelationship_all">
      <xsl:with-param name="source" select="$node"/>
    </xsl:call-template>
</xsl:template>


<!-- Procedure template -->
  <xsl:template name="Procedure">
    <xsl:param name="node" select="'@@@node'"/><xsl:param name="finalType" select="'@@@finalType'"/>
    <xsl:param name="classCode" select="'@@@classCode'"/><xsl:param name="classCodeSystem" select="'@@@classCodeSystem'"/>
    <xsl:param name="moodCode" select="'@@@moodCode'"/><xsl:param name="moodCodeSystem" select="'@@@moodCodeSystem'"/>

<xsl:call-template name="Act">
  <xsl:with-param name="recurse" select="false()"/>
  <xsl:with-param name="node" select="$node"/><xsl:with-param name="finalType" select="$finalType"/>
  <xsl:with-param name="classCode" select="$classCode"/><xsl:with-param name="classCodeSystem" select="$classCodeSystem"/>
  <xsl:with-param name="moodCode"  select="$moodCode"/><xsl:with-param name="moodCodeSystem"  select="$moodCodeSystem"/>
    </xsl:call-template><span class="Act">.</span>
<xsl:call-template name="participation_all">
      <xsl:with-param name="actLabel" select="$node"/>
    </xsl:call-template>
<xsl:call-template name="actRelationship_all">
      <xsl:with-param name="source" select="$node"/>
    </xsl:call-template>
</xsl:template>


<!-- SubstanceAdministration template -->
  <xsl:template name="SubstanceAdministration">
    <xsl:param name="node" select="'@@@node'"/><xsl:param name="finalType" select="'@@@finalType'"/>
    <xsl:param name="classCode" select="'@@@classCode'"/><xsl:param name="classCodeSystem" select="'@@@classCodeSystem'"/>
    <xsl:param name="moodCode" select="'@@@moodCode'"/><xsl:param name="moodCodeSystem" select="'@@@moodCodeSystem'"/>

<xsl:call-template name="Act">
  <xsl:with-param name="recurse" select="false()"/>
  <xsl:with-param name="node" select="$node"/><xsl:with-param name="finalType" select="$finalType"/>
  <xsl:with-param name="classCode" select="$classCode"/><xsl:with-param name="classCodeSystem" select="$classCodeSystem"/>
  <xsl:with-param name="moodCode"  select="$moodCode"/><xsl:with-param name="moodCodeSystem"  select="$moodCodeSystem"/>
    </xsl:call-template><span class="Act">;
    rim:SubstanceAdministration.doseQuantity [ <xsl:apply-templates select="n1:doseQuantity" mode="value-any">
    <xsl:with-param name="indent" select="'    '"/>
  </xsl:apply-templates>
    ] .</span>
<xsl:call-template name="participation_all">
      <xsl:with-param name="actLabel" select="$node"/>
    </xsl:call-template>
<xsl:call-template name="actRelationship_all">
      <xsl:with-param name="source" select="$node"/>
    </xsl:call-template>
</xsl:template>


  <xsl:template name="value-value" match="*[@value]" mode="value-any">
    <xsl:param name="indent" select="''"/>a dt:PQ ;<xsl:apply-templates select="." mode="units"/><xsl:value-of select="$indent"/>dt:PQ.value [ a dt:REAL ; dt:value "<xsl:value-of select="@value"/>" ] </xsl:template>
  <xsl:template name="value-nullFlavor" match="*[@nullFlavor]" mode="value-any"><xsl:param name="indent" select="''"/>a dt:PQ ;<xsl:apply-templates select="." mode="units"/><xsl:value-of select="$indent"/>    dt:PQ.value [
<xsl:value-of select="$indent"/>        hl7:coding [ dt:CDCoding.code "<xsl:value-of select="@nullFlavor"/>" ; dt:CDCoding.codeSystem "@@HL7 UNK code system" ;
<xsl:value-of select="$indent"/>                     dt:CDCoding.displayName "@@beats me" ; dt:CDCoding.codeSystemName "@@HL7" ]
<xsl:value-of select="$indent"/>    ] </xsl:template>

  <xsl:template name="value-code" match="n1:value[@code]" mode="value-any">
    <xsl:param name="indent" select="''"/>a dt:PQ ;
<xsl:value-of select="$indent"/>dt:CD.code [ a dt:CD ;
<xsl:value-of select="$indent"/>    hl7:coding [ rim:CDCoding.code "<xsl:value-of select="@code"/>" ; rim:CDCoding.codeSystem "<xsl:value-of select="@codeSystem"/>" ;
<xsl:value-of select="$indent"/>                 rim:CDCoding.displayName "<xsl:value-of select="@displayName"/>" ; rim:CDCoding.codeSystemName "<xsl:value-of select="@codeSystemName"/>" ]
<xsl:value-of select="$indent"/>]</xsl:template>
  <!-- xsl:template name="value-code" match="n1:value[@code]" mode="value-any">a dt:REAL ; dt:code "<xsl:value-of select="@code"/>"</xsl:template -->


  <!-- organizer -->
  <xsl:template name="section-entry-E_Vital_Signs_Organizer" match="n1:organizer[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.26']" mode="section-entry">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="target" select="concat($source, '_vitalSignsOrganizer', count(preceding-sibling::n1:organizer))"/>
    # <a href="#E_Vital_Signs_Organizer">Vital Signs Organizer</a><xsl:value-of select="$newline"/>

    <pre><xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="../@typeCode"/><!-- '@@x_ActRelationshipEntry' -->
    </xsl:call-template><xsl:value-of select="$newline"/>

<!-- <xsl:value-of select="$target"/> a rim:Act ; -->
<xsl:call-template name="Act">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Act'"/>
  <xsl:with-param name="classCode" select="@classCode"/><!-- '@@x_ActClassDocumentEntryAct' --><xsl:with-param name="classCodeSystem" select="'???'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
  <!-- xsl:with-param name="code"  select="'???'"/><xsl:with-param name="codeSystem"  select="'???'"/ -->
  <!-- @@x_ActRelationshipEntryRelationship 2.16.840.1.113883.5.1002 -->
    </xsl:call-template>

# organizer contents: {<xsl:apply-templates select="n1:component/*" mode="section-entry-component">
      <xsl:with-param name="source" select="$target"/>
    </xsl:apply-templates>
# }</pre>
  </xsl:template>

  <xsl:template name="anchor">
    <xsl:param name="anchor" select="'@@@anchor'"/>
    <a class="anchor"><xsl:attribute name="id"><xsl:value-of select="$anchor"/></xsl:attribute>_:<xsl:value-of select="$anchor"/></a>
  </xsl:template>

  <xsl:template name="href">
    <xsl:param name="anchor" select="'@@@anchor'"/>
    <a><xsl:attribute name="href"><xsl:value-of select="concat('#', $anchor)"/></xsl:attribute>_:<xsl:value-of select="$anchor"/></a>
  </xsl:template>


  <xsl:template name="Act.effectiveTime-value" match="*[@value]" mode="predicate_time999">
    <xsl:param name="predicate" select="'@@@predicate'"/>
    <xsl:value-of select="concat($newline, '    ')"/>
    <xsl:value-of select="$predicate"/> "<xsl:value-of select="concat(substring(@value, 1, 4), '-', substring(@value, 5, 2), '-', substring(@value, 7, 2))"/>"^^xsd:date ;  </xsl:template>

  <xsl:template name="Act.effectiveTime" match="*" mode="predicate_time">
    <xsl:param name="predicate" select="'@@@predicate'"/>
    <xsl:choose>
      <xsl:when test="@value">
	<xsl:value-of select="concat($newline, '    ')"/>
	<xsl:value-of select="$predicate"/> "<xsl:value-of select="concat(substring(@value, 1, 4), '-', substring(@value, 5, 2), '-', substring(@value, 7, 2))"/>"^^xsd:date ;</xsl:when>
      <xsl:when test="n1:low/@value or n1:low/@value">
	<xsl:for-each select="n1:low[@value]">
	  <xsl:value-of select="concat($newline, '    ')"/>
	  <span class="error"><xsl:value-of select="$predicate"/>-low "<xsl:value-of select="concat(substring(@value, 1, 4), '-', substring(@value, 5, 2), '-', substring(@value, 7, 2))"/>"^^xsd:date ;</span></xsl:for-each>
	<xsl:for-each select="n1:high[@value]">
	  <xsl:value-of select="concat($newline, '    ')"/>
	  <span class="error"><xsl:value-of select="$predicate"/>-high "<xsl:value-of select="concat(substring(@value, 1, 4), '-', substring(@value, 5, 2), '-', substring(@value, 7, 2))"/>"^^xsd:date ;</span></xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="concat($newline, '    ')"/>
	<span class="error"><xsl:value-of select="$predicate"/>-error """<xsl:apply-templates select="." mode="copy" />""" ;</span></xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template match="n1:statusCode" mode="Act.statusCode">
    rim:Act.statusCode "<xsl:value-of select="@code"/>" ;
  </xsl:template>

  <xsl:template name="section-entry-E_Vital_Sign_Observation" match="n1:observation[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.27' and n1:code/@codeSystem='2.16.840.1.113883.6.1']" mode="section-entry-component">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="target" select="concat($source, '_component', count(../preceding-sibling::n1:component))"/>
# <a href="#E_Vital_Signs_Organizer">Vital Sign Observation</a><xsl:value-of select="$newline"/>

<xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="'COMP'"/>
    </xsl:call-template><xsl:value-of select="$newline"/>
<xsl:call-template name="Observation">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Observation'"/>
  <xsl:with-param name="classCode" select="'OBS'"/><xsl:with-param name="classCodeSystem" select="'2.16.840.1.113883.5.6'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
  <!-- @@x_ActMoodDocumentObservation -->
    </xsl:call-template>

<xsl:call-template name="actRelationship_all">
      <xsl:with-param name="source" select="$target"/>
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="actRelationship_all">
    <xsl:param name="source" select="'@@@source'"/>
<xsl:apply-templates select="n1:entryRelationship" mode="actRelationship">
      <xsl:with-param name="source" select="$source"/>
    </xsl:apply-templates>
<xsl:apply-templates select="n1:documentationOf" mode="actRelationship">
      <xsl:with-param name="source" select="$source"/>
    </xsl:apply-templates>
  </xsl:template>


<!-- REFR and SUBJ-->
  <xsl:template name="actRelationship_entryRelationship" match="n1:entryRelationship[@typeCode]" mode="actRelationship">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="target" select="concat($source, '_entryRelationship', count(preceding-sibling::n1:entryRelationship))"/># <a href="#E_Vital_Signs_Organizer"><xsl:value-of select="@typeCode"/></a><xsl:value-of select="$newline"/>
<xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="'REFR'"/>
    </xsl:call-template><xsl:value-of select="$newline"/>
<xsl:for-each select="n1:act">
<xsl:call-template name="Act">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Act'"/>
  <xsl:with-param name="classCode" select="'ACT'"/><xsl:with-param name="classCodeSystem" select="'2.16.840.1.113883.5.6'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
  <!-- @@x_ActRelationshipEntryRelationship 2.16.840.1.113883.5.1002 -->
    </xsl:call-template></xsl:for-each>
<xsl:for-each select="n1:observation">
<xsl:call-template name="Observation">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Observation'"/>
  <xsl:with-param name="classCode" select="'OBS'"/><xsl:with-param name="classCodeSystem" select="'2.16.840.1.113883.5.6'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
  <!-- @@x_ActRelationshipEntryRelationship 2.16.840.1.113883.5.1002 -->
    </xsl:call-template></xsl:for-each>
<xsl:for-each select="n1:encounter">
<xsl:call-template name="Act"> <!-- @@ unused -->
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Act'"/>
  <xsl:with-param name="classCode" select="'ENC'"/><xsl:with-param name="classCodeSystem" select="'2.16.840.1.113883.5.6'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
  <!-- @@x_ActRelationshipEntryRelationship 2.16.840.1.113883.5.1002 -->
    </xsl:call-template></xsl:for-each>
</xsl:template>


  <xsl:template name="entryRelationship_documentationOf" match="n1:documentationOf[@typeCode]" mode="actRelationship">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="target" select="concat($source, '_entryRelationship', count(preceding-sibling::n1:entryRelationship))"/># <a href="#E_Vital_Signs_Organizer"><xsl:value-of select="@typeCode"/></a><xsl:value-of select="$newline"/>
<xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="'DOC'"/>
    </xsl:call-template><xsl:value-of select="$newline"/>
<xsl:for-each select="n1:serviceEvent">
<xsl:call-template name="Act">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Act'"/>
  <xsl:with-param name="classCode" select="'ACT'"/><xsl:with-param name="classCodeSystem" select="'2.16.840.1.113883.5.6'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
  <!-- @@x_ActRelationshipEntryRelationship 2.16.840.1.113883.5.1002 -->
    </xsl:call-template>
<!-- xsl:call-template name="participation_all">
      <xsl:with-param name="actLabel" select="$target"/>
    </xsl:call-template -->
</xsl:for-each>
</xsl:template>


  <xsl:template name="units" match="*[@unit]" mode="units"> <!-- ='[in_us] -->
    <xsl:param name="indent" select="'        '"/>
<xsl:value-of select="concat($newline, $indent)"/>dt:PQ.unit [ a dt:CS ;
<xsl:value-of select="$indent"/>    hl7:coding [ dt:CDCoding.code "<xsl:value-of select="@unit"/>" ; dt:CDCoding.codeSystem "2.16.840.1.113883.6.8" ;
<xsl:value-of select="$indent"/>                 dt:codeSystemName "UCUM" ; dt:CDCoding.valueSet "2.16.840.1.113883.1.11.12839" ]
<xsl:value-of select="$indent"/>] ;
</xsl:template>
  <xsl:template name="units-error" match="*" mode="units">
    <xsl:text> </xsl:text><span class="error"># unknown units <xsl:value-of select="@unit"/></span><xsl:value-of select="$newline"/>
  </xsl:template>

  <xsl:template name="section-entry-observation" match="n1:observation" mode="section-entry-component">
    # <span class="error">unexpected section/entry/observation</span>
    <span class="error"><xsl:apply-templates select="." mode="copy" /></span>
  </xsl:template>


  <xsl:template name="section-entry-E_Encounter_Activities" match="n1:encounter[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.49']" mode="section-entry">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="index" select="'@@@index'"/>
    <xsl:param name="target" select="concat($source, '_encounterActivities', $index)"/>
    # <a href="#E_Encounter_Activities">Encounter Activities</a><xsl:value-of select="$newline"/>

    <pre><xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="../@typeCode"/><!-- '@@x_ActRelationshipEntry' -->
    </xsl:call-template><xsl:value-of select="$newline"/>

<xsl:call-template name="Procedure">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Act'"/>
  <xsl:with-param name="classCode" select="@classCode"/><xsl:with-param name="classCodeSystem" select="'???'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
    </xsl:call-template>
</pre>
  </xsl:template>


  <xsl:template name="section-entry-E_Plan_of_Care_Activity_Encounter" match="n1:encounter[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.40']" mode="section-entry">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="index" select="'@@@index'"/>
    <xsl:param name="target" select="concat($source, '_planOfCareActivityEncounter', $index)"/>
    # <a href="#E_Plan_of_Care_Activity_Encounter">Plan of Care Activity Encounter</a><xsl:value-of select="$newline"/>

    <pre><xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="../@typeCode"/>
    </xsl:call-template><xsl:value-of select="$newline"/>

<xsl:call-template name="Act">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Act'"/>
  <xsl:with-param name="classCode" select="@classCode"/><xsl:with-param name="classCodeSystem" select="'???'"/>
  <xsl:with-param name="moodCode"  select="@moodCode"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
    </xsl:call-template>
</pre>
  </xsl:template>


  <xsl:template name="section-entry-E_Advance_Directive_Observation" match="n1:observation[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.48']" mode="section-entry">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="index" select="'@@@index'"/>
    <xsl:param name="target" select="concat($source, '_advanceDirectiveObservation', $index)"/>
    # <a href="#E_Advance_Directive_Observation">Advance Directive Observation</a><xsl:value-of select="$newline"/>
  </xsl:template>


  <xsl:template name="section-entry-E_Smoking_Status_Observation" match="n1:observation[n1:templateId/@root='2.16.840.1.113883.10.20.22.4.78']" mode="section-entry">
    <xsl:param name="source" select="'@@@source'"/>
    <xsl:param name="index" select="'@@@index'"/>
    <xsl:param name="target" select="concat($source, '_smokingStatusObservation', $index)"/>
    # <a href="#E_Smoking_Status_Observation">Smoking Status Observation</a><xsl:value-of select="$newline"/>

    <pre><xsl:call-template name="ActRelationship">
      <xsl:with-param name="source" select="$source"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="code" select="../@typeCode"/><!-- '@@x_ActRelationshipEntry' -->
    </xsl:call-template><xsl:value-of select="$newline"/>

<!-- <xsl:value-of select="$target"/> a rim:Act ; -->
<xsl:call-template name="Observation">
  <xsl:with-param name="node" select="$target"/><xsl:with-param name="finalType" select="'rim:Act'"/>
  <xsl:with-param name="classCode" select="@classCode"/><!-- '@@x_ActClassDocumentEntryAct' --><xsl:with-param name="classCodeSystem" select="'???'"/>
  <xsl:with-param name="moodCode"  select="'EVN'"/><xsl:with-param name="moodCodeSystem"  select="'2.16.840.1.113883.5.1001'"/>
  <!-- xsl:with-param name="code"  select="'???'"/><xsl:with-param name="codeSystem"  select="'???'"/ -->
  <!-- @@x_ActRelationshipEntryRelationship 2.16.840.1.113883.5.1002 -->
    </xsl:call-template></pre>
  </xsl:template>


  <xsl:template name="section-entry-error" match="*" mode="section-entry">
    <xsl:if test="$output='text'">
      [ err:unmatchedText """
    </xsl:if>
      <pre class="error"><xsl:apply-templates select="." mode="copy" /></pre>
    <xsl:if test="$output='text'">
      """ ] .
    </xsl:if>
  </xsl:template>


  <xsl:template name="copy-element" match="*" mode="copy">
    <xsl:text>&lt;</xsl:text><xsl:value-of select="name()"/><xsl:apply-templates select="@*" mode="copy-attr"/><xsl:text>&gt;</xsl:text>
    <xsl:copy>
      <xsl:apply-templates select="node()" mode="copy" />
    </xsl:copy>
    <xsl:text>&lt;/</xsl:text><xsl:value-of select="name()"/><xsl:text>&gt;</xsl:text>
  </xsl:template>
  <xsl:template name="copy-attr" match="@*" mode="copy-attr">
    <xsl:text> </xsl:text><xsl:value-of select="name()"/><xsl:text>=</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="."/><xsl:text>"</xsl:text>
  </xsl:template>

	<!-- top level section title -->
  <xsl:template name="old-section-title">
    <xsl:param name="title"/>
    <xsl:choose>
      <xsl:when test="count(/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component[n1:section]) &gt; 1">
	<h3>
	  <xsl:if test="$output='text'"># </xsl:if>
	  <a name="{generate-id($title)}" href="#toc">
	    <xsl:value-of select="$title"/>
	  </a>
	</h3>
      </xsl:when>
      <xsl:otherwise>
	<h3>
	  <xsl:if test="$output='text'"># </xsl:if>
	  <xsl:value-of select="$title"/>
	</h3>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- section author -->
  <xsl:template name="section-author">
    <xsl:if test="count(n1:author)&gt;0">
      <div style="margin-left : 2em;">
	<b>
	  <xsl:text>Section Author: </xsl:text>
	</b>
	<xsl:for-each select="n1:author/n1:assignedAuthor">
	  <xsl:choose>
	    <xsl:when test="n1:assignedPerson/n1:name">
	      <xsl:call-template name="show-name">
		<xsl:with-param name="name" select="n1:assignedPerson/n1:name"/>
	      </xsl:call-template>
	      <xsl:if test="n1:representedOrganization">
		<xsl:text>, </xsl:text>
		<xsl:call-template name="show-name">
		  <xsl:with-param name="name" select="n1:representedOrganization/n1:name"/>
		</xsl:call-template>
	      </xsl:if>
	    </xsl:when>
	    <xsl:when test="n1:assignedAuthoringDevice/n1:softwareName">
	      <xsl:value-of select="n1:assignedAuthoringDevice/n1:softwareName"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:for-each select="n1:id">
		<xsl:call-template name="show-id"/>
		<br/>
	      </xsl:for-each>
	    </xsl:otherwise>
	  </xsl:choose>
	</xsl:for-each>
	<br/>
      </div>
    </xsl:if>
  </xsl:template>

	<!-- top-level section Text   -->
	<xsl:template name="old-section-text">
		<div>
			<xsl:apply-templates select="n1:text"/>
		</div>
	</xsl:template>

	<!-- nested component/section -->
	<xsl:template name="nestedSection">
		<xsl:param name="margin"/>
		<h4 style="margin-left : {$margin}em;">
			<xsl:value-of select="n1:title"/>
		</h4>
		<div style="margin-left : {$margin}em;">
			<xsl:apply-templates select="n1:text"/>
		</div>
		<xsl:for-each select="n1:component/n1:section">
			<xsl:call-template name="nestedSection">
				<xsl:with-param name="margin" select="2*$margin"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<!--   paragraph  -->
	<xsl:template match="n1:paragraph">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<!--   pre format  -->
	<xsl:template match="n1:pre">
		<pre>
			<xsl:apply-templates/>
		</pre>
	</xsl:template>
	<!--   Content w/ deleted text is hidden -->
	<xsl:template match="n1:content[@revised='delete']"/>
	<!--   content  -->
	<xsl:template match="n1:content">
		<xsl:apply-templates/>
	</xsl:template>
	<!-- line break -->
	<xsl:template match="n1:br">
		<xsl:element name="br">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<!--   list  -->
	<xsl:template match="n1:list">
		<xsl:if test="n1:caption">
			<p>
				<b>
					<xsl:apply-templates select="n1:caption"/>
				</b>
			</p>
		</xsl:if>
		<ul>
			<xsl:for-each select="n1:item">
				<li>
					<xsl:apply-templates/>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<xsl:template match="n1:list[@listType='ordered']">
		<xsl:if test="n1:caption">
			<span style="font-weight:bold; ">
				<xsl:apply-templates select="n1:caption"/>
			</span>
		</xsl:if>
		<ol>
			<xsl:for-each select="n1:item">
				<li>
					<xsl:apply-templates/>
				</li>
			</xsl:for-each>
		</ol>
	</xsl:template>
	<!--   caption  -->
	<xsl:template match="n1:caption">
		<xsl:apply-templates/>
		<xsl:text>: </xsl:text>
	</xsl:template>
	<!--  Tables   -->
	<xsl:template match="n1:table/@*|n1:thead/@*|n1:tfoot/@*|n1:tbody/@*|n1:colgroup/@*|n1:col/@*|n1:tr/@*|n1:th/@*|n1:td/@*">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="n1:table">
		<table class="narr_table">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	<xsl:template match="n1:thead">
		<thead>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</thead>
	</xsl:template>
	<xsl:template match="n1:tfoot">
		<tfoot>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tfoot>
	</xsl:template>
	<xsl:template match="n1:tbody">
		<tbody>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tbody>
	</xsl:template>
	<xsl:template match="n1:colgroup">
		<colgroup>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</colgroup>
	</xsl:template>
	<xsl:template match="n1:col">
		<col>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</col>
	</xsl:template>
	<xsl:template match="n1:tr">
		<tr class="narr_tr">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tr>
	</xsl:template>
	<xsl:template match="n1:th">
		<th class="narr_th">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</th>
	</xsl:template>
	<xsl:template match="n1:td">
		<td>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	<xsl:template match="n1:table/n1:caption">
		<span style="font-weight:bold; ">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!--   RenderMultiMedia 
    this currently only handles GIF's and JPEG's.  It could, however,
    be extended by including other image MIME types in the predicate
    and/or by generating <object> or <applet> tag with the correct
    params depending on the media type  @ID  =$imageRef  referencedObject
    -->
	<xsl:template match="n1:renderMultiMedia">
		<xsl:variable name="imageRef" select="@referencedObject"/>
		<xsl:choose>
			<xsl:when test="//n1:regionOfInterest[@ID=$imageRef]">
				<!-- Here is where the Region of Interest image referencing goes -->
				<xsl:if test="//n1:regionOfInterest[@ID=$imageRef]//n1:observationMedia/n1:value[@mediaType='image/gif' or
 @mediaType='image/jpeg']">
					<br clear="all"/>
					<xsl:element name="img">
						<xsl:attribute name="src"><xsl:value-of select="//n1:regionOfInterest[@ID=$imageRef]//n1:observationMedia/n1:value/n1:reference/@value"/></xsl:attribute>
					</xsl:element>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<!-- Here is where the direct MultiMedia image referencing goes -->
				<xsl:if test="//n1:observationMedia[@ID=$imageRef]/n1:value[@mediaType='image/gif' or @mediaType='image/jpeg']">
					<br clear="all"/>
					<xsl:element name="img">
						<xsl:attribute name="src"><xsl:value-of select="//n1:observationMedia[@ID=$imageRef]/n1:value/n1:reference/@value"/></xsl:attribute>
					</xsl:element>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--    Stylecode processing   
    Supports Bold, Underline and Italics display
    -->
	<xsl:template match="//n1:*[@styleCode]">
		<xsl:if test="@styleCode='Bold'">
			<xsl:element name="b">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="@styleCode='Italics'">
			<xsl:element name="i">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="@styleCode='Underline'">
			<xsl:element name="u">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="contains(@styleCode,'Bold') and contains(@styleCode,'Italics') and not (contains(@styleCode, 'Underline'))">
			<xsl:element name="b">
				<xsl:element name="i">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		<xsl:if test="contains(@styleCode,'Bold') and contains(@styleCode,'Underline') and not (contains(@styleCode, 'Italics'))">
			<xsl:element name="b">
				<xsl:element name="u">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		<xsl:if test="contains(@styleCode,'Italics') and contains(@styleCode,'Underline') and not (contains(@styleCode, 'Bold'))">
			<xsl:element name="i">
				<xsl:element name="u">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		<xsl:if test="contains(@styleCode,'Italics') and contains(@styleCode,'Underline') and contains(@styleCode, 'Bold')">
			<xsl:element name="b">
				<xsl:element name="i">
					<xsl:element name="u">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		<xsl:if test="not (contains(@styleCode,'Italics') or contains(@styleCode,'Underline') or contains(@styleCode, 'Bold'))">
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<!--    Superscript or Subscript   -->
	<xsl:template match="n1:sup">
		<xsl:element name="sup">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="n1:sub">
		<xsl:element name="sub">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<!-- show-signature -->
	<xsl:template name="show-sig">
		<xsl:param name="sig"/>
		<xsl:choose>
			<xsl:when test="$sig/@code =&apos;S&apos;">
				<xsl:text>signed</xsl:text>
			</xsl:when>
			<xsl:when test="$sig/@code=&apos;I&apos;">
				<xsl:text>intended</xsl:text>
			</xsl:when>
			<xsl:when test="$sig/@code=&apos;X&apos;">
				<xsl:text>signature required</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!--  show-id -->
	<xsl:template name="show-id">
		<xsl:param name="id"/>
		<xsl:choose>
			<xsl:when test="not($id)">
				<xsl:if test="not(@nullFlavor)">
					<xsl:if test="@extension">
						<xsl:value-of select="@extension"/>
					</xsl:if>
					<xsl:text> </xsl:text>
					<xsl:value-of select="@root"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not($id/@nullFlavor)">
					<xsl:if test="$id/@extension">
						<xsl:value-of select="$id/@extension"/>
					</xsl:if>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$id/@root"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- show-name  -->
	<xsl:template name="show-name">
		<xsl:param name="name"/>
		<xsl:choose>
			<xsl:when test="$name/n1:family">
				<xsl:if test="$name/n1:prefix">
					<xsl:value-of select="$name/n1:prefix"/>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:value-of select="$name/n1:given"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$name/n1:family"/>
				<xsl:if test="$name/n1:suffix">
					<xsl:text>, </xsl:text>
					<xsl:value-of select="$name/n1:suffix"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$name"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- show-gender  -->
	<xsl:template name="show-gender">
		<xsl:choose>
			<xsl:when test="@code   = &apos;M&apos;">
				<xsl:text>Male</xsl:text>
			</xsl:when>
			<xsl:when test="@code  = &apos;F&apos;">
				<xsl:text>Female</xsl:text>
			</xsl:when>
			<xsl:when test="@code  = &apos;U&apos;">
				<xsl:text>Undifferentiated</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- show-language  -->
	<xsl:template name="show-language">
		<xsl:choose>
			<xsl:when test="@code   = &apos;eng&apos;">
				<xsl:text>English</xsl:text>
			</xsl:when>
			<xsl:when test="@code   = &apos;spa&apos;">
				<xsl:text>Spanish</xsl:text>
			</xsl:when>
			<xsl:when test="@code   = &apos;en&apos;">
				<xsl:text>English</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="@code"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- show-race-ethnicity  -->
	<xsl:template name="show-race-ethnicity">
		<xsl:choose>
			<xsl:when test="@displayName">
				<xsl:value-of select="@displayName"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="@code"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- show-contactInfo -->
	<xsl:template name="show-contactInfo">
		<xsl:param name="contact"/>
		<xsl:call-template name="show-address">
			<xsl:with-param name="address" select="$contact/n1:addr"/>
		</xsl:call-template>
		<xsl:call-template name="show-telecom">
			<xsl:with-param name="telecom" select="$contact/n1:telecom"/>
		</xsl:call-template>
	</xsl:template>
	<!-- show-address -->
	<xsl:template name="show-address">
		<xsl:param name="address"/>
		<xsl:choose>
			<xsl:when test="$address">
				<xsl:if test="$address/@use">
					<xsl:text> </xsl:text>
					<xsl:call-template name="translateTelecomCode">
						<xsl:with-param name="code" select="$address/@use"/>
					</xsl:call-template>
					<xsl:text>:</xsl:text>
					<br/>
				</xsl:if>
				<xsl:for-each select="$address/n1:streetAddressLine">
					<xsl:value-of select="."/>
					<br/>
				</xsl:for-each>
				<xsl:if test="$address/n1:streetName">
					<xsl:value-of select="$address/n1:streetName"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$address/n1:houseNumber"/>
					<br/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:city)>0">
					<xsl:value-of select="$address/n1:city"/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:state)>0">
					<xsl:text>,&#160;</xsl:text>
					<xsl:value-of select="$address/n1:state"/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:postalCode)>0">
					<xsl:text>&#160;</xsl:text>
					<xsl:value-of select="$address/n1:postalCode"/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:country)>0">
					<xsl:text>,&#160;</xsl:text>
					<xsl:value-of select="$address/n1:country"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>address not available</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<br/>
	</xsl:template>
	<!-- show-telecom -->
	<xsl:template name="show-telecom">
		<xsl:param name="telecom"/>
		<xsl:choose>
			<xsl:when test="$telecom">
				<xsl:variable name="type" select="substring-before($telecom/@value, ':')"/>
				<xsl:variable name="value" select="substring-after($telecom/@value, ':')"/>
				<xsl:if test="$type">
					<xsl:call-template name="translateTelecomCode">
						<xsl:with-param name="code" select="$type"/>
					</xsl:call-template>
					<xsl:if test="@use">
						<xsl:text> (</xsl:text>
						<xsl:call-template name="translateTelecomCode">
							<xsl:with-param name="code" select="@use"/>
						</xsl:call-template>
						<xsl:text>)</xsl:text>
					</xsl:if>
					<xsl:text>: </xsl:text>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$value"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Telecom information not available</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<br/>
	</xsl:template>
	<!-- show-recipientType -->
	<xsl:template name="show-recipientType">
		<xsl:param name="typeCode"/>
		<xsl:choose>
			<xsl:when test="$typeCode='PRCP'">Primary Recipient:</xsl:when>
			<xsl:when test="$typeCode='TRC'">Secondary Recipient:</xsl:when>
			<xsl:otherwise>Recipient:</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Convert Telecom URL to display text -->
	<xsl:template name="translateTelecomCode">
		<xsl:param name="code"/>
		<!--xsl:value-of select="document('voc.xml')/systems/system[@root=$code/@codeSystem]/code[@value=$code/@code]/@displayName"/-->
		<!--xsl:value-of select="document('codes.xml')/*/code[@code=$code]/@display"/-->
		<xsl:choose>
			<!-- lookup table Telecom URI -->
			<xsl:when test="$code='tel'">
				<xsl:text>Tel</xsl:text>
			</xsl:when>
			<xsl:when test="$code='fax'">
				<xsl:text>Fax</xsl:text>
			</xsl:when>
			<xsl:when test="$code='http'">
				<xsl:text>Web</xsl:text>
			</xsl:when>
			<xsl:when test="$code='mailto'">
				<xsl:text>Mail</xsl:text>
			</xsl:when>
			<xsl:when test="$code='H'">
				<xsl:text>Home</xsl:text>
			</xsl:when>
			<xsl:when test="$code='HV'">
				<xsl:text>Vacation Home</xsl:text>
			</xsl:when>
			<xsl:when test="$code='HP'">
				<xsl:text>Pirmary Home</xsl:text>
			</xsl:when>
			<xsl:when test="$code='WP'">
				<xsl:text>Work Place</xsl:text>
			</xsl:when>
			<xsl:when test="$code='PUB'">
				<xsl:text>Pub</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>{$code='</xsl:text>
				<xsl:value-of select="$code"/>
				<xsl:text>'?}</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- convert RoleClassAssociative code to display text -->
	<xsl:template name="translateRoleAssoCode">
		<xsl:param name="classCode"/>
		<xsl:param name="code"/>
		<xsl:choose>
			<xsl:when test="$classCode='AFFL'">
				<xsl:text>affiliate</xsl:text>
			</xsl:when>
			<xsl:when test="$classCode='AGNT'">
				<xsl:text>agent</xsl:text>
			</xsl:when>
			<xsl:when test="$classCode='ASSIGNED'">
				<xsl:text>assigned entity</xsl:text>
			</xsl:when>
			<xsl:when test="$classCode='COMPAR'">
				<xsl:text>commissioning party</xsl:text>
			</xsl:when>
			<xsl:when test="$classCode='CON'">
				<xsl:text>contact</xsl:text>
			</xsl:when>
			<xsl:when test="$classCode='ECON'">
				<xsl:text>emergency contact</xsl:text>
			</xsl:when>
			<xsl:when test="$classCode='NOK'">
				<xsl:text>next of kin</xsl:text>
			</xsl:when>
			<xsl:when test="$classCode='SGNOFF'">
				<xsl:text>signing authority</xsl:text>
			</xsl:when>
			<xsl:when test="$classCode='GUARD'">
				<xsl:text>guardian</xsl:text>
			</xsl:when>
			<xsl:when test="$classCode='GUAR'">
				<xsl:text>guardian</xsl:text>
			</xsl:when>
			<xsl:when test="$classCode='CIT'">
				<xsl:text>citizen</xsl:text>
			</xsl:when>
			<xsl:when test="$classCode='COVPTY'">
				<xsl:text>covered party</xsl:text>
			</xsl:when>
			<xsl:when test="$classCode='PRS'">
				<xsl:text>personal relationship</xsl:text>
			</xsl:when>
			<xsl:when test="$classCode='CAREGIVER'">
				<xsl:text>care giver</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>{$classCode='</xsl:text>
				<xsl:value-of select="$classCode"/>
				<xsl:text>'?}</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="($code/@code) and ($code/@codeSystem='2.16.840.1.113883.5.111')">
			<xsl:text> </xsl:text>
			<xsl:choose>
				<xsl:when test="$code/@code='FTH'">
					<xsl:text>(Father)</xsl:text>
				</xsl:when>
				<xsl:when test="$code/@code='MTH'">
					<xsl:text>(Mother)</xsl:text>
				</xsl:when>
				<xsl:when test="$code/@code='NPRN'">
					<xsl:text>(Natural parent)</xsl:text>
				</xsl:when>
				<xsl:when test="$code/@code='STPPRN'">
					<xsl:text>(Step parent)</xsl:text>
				</xsl:when>
				<xsl:when test="$code/@code='SONC'">
					<xsl:text>(Son)</xsl:text>
				</xsl:when>
				<xsl:when test="$code/@code='DAUC'">
					<xsl:text>(Daughter)</xsl:text>
				</xsl:when>
				<xsl:when test="$code/@code='CHILD'">
					<xsl:text>(Child)</xsl:text>
				</xsl:when>
				<xsl:when test="$code/@code='EXT'">
					<xsl:text>(Extended family member)</xsl:text>
				</xsl:when>
				<xsl:when test="$code/@code='NBOR'">
					<xsl:text>(Neighbor)</xsl:text>
				</xsl:when>
				<xsl:when test="$code/@code='SIGOTHR'">
					<xsl:text>(Significant other)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>{$code/@code='</xsl:text>
					<xsl:value-of select="$code/@code"/>
					<xsl:text>'?}</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!-- show time -->
	<xsl:template name="show-time">
		<xsl:param name="datetime"/>
		<xsl:choose>
			<xsl:when test="not($datetime)">
				<xsl:call-template name="formatDateTime">
					<xsl:with-param name="date" select="@value"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="formatDateTime">
					<xsl:with-param name="date" select="$datetime/@value"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
  <!-- paticipant facility and date -->
  <xsl:template name="facilityAndDates">
    <table class="header_table">
      <tbody>
	<!-- facility id -->
	<tr>
	  <td width="20%" bgcolor="#3399ff">
	    <span class="td_label">
	      <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
	      <xsl:text>Facility ID</xsl:text>
	    </span>
	  </td>
	  <td colspan="3">
	    <xsl:choose>
	      <xsl:when test="count(/n1:ClinicalDocument/n1:participant
			      [@typeCode='LOC'][@contextControlCode='OP']
			      /n1:associatedEntity[@classCode='SDLOC']/n1:id)&gt;0">
		<!-- change context node -->
		<xsl:for-each select="/n1:ClinicalDocument/n1:participant
                                      [@typeCode='LOC'][@contextControlCode='OP']
                                      /n1:associatedEntity[@classCode='SDLOC']/n1:id">
		  <xsl:call-template name="show-id"/>
		  <!-- change context node again, for the code -->
		  <xsl:for-each select="../n1:code">
		    <xsl:text> (</xsl:text>
		    <xsl:call-template name="show-code">
		      <xsl:with-param name="code" select="."/>
		    </xsl:call-template>
		    <xsl:text>)</xsl:text>
		  </xsl:for-each>
		</xsl:for-each>
	      </xsl:when>
	      <xsl:otherwise>
		Not available
	      </xsl:otherwise>
	    </xsl:choose>
	  </td>
	</tr>
	<!-- Period reported -->
	<tr>
	  <td width="20%" bgcolor="#3399ff">
	    <span class="td_label">
	      <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
	      <xsl:text>First day of period reported</xsl:text>
	    </span>
	  </td>
	  <td colspan="3">
	    <xsl:call-template name="show-time">
	      <xsl:with-param name="datetime" select="/n1:ClinicalDocument/n1:documentationOf
						      /n1:serviceEvent/n1:effectiveTime/n1:low"/>
	    </xsl:call-template>
	  </td>
	</tr>
	<tr>
	  <td width="20%" bgcolor="#3399ff">
	    <span class="td_label">
	      <xsl:if test="$output='text'"><xsl:value-of select="concat($newline, '# ')"/></xsl:if>
	      <xsl:text>Last day of period reported</xsl:text>
	    </span>
	  </td>
	  <td colspan="3">
	    <xsl:call-template name="show-time">
	      <xsl:with-param name="datetime" select="/n1:ClinicalDocument/n1:documentationOf
						      /n1:serviceEvent/n1:effectiveTime/n1:high"/>
	    </xsl:call-template>
	  </td>
	</tr>
      </tbody>
    </table>
    <xsl:if test="$output='text'"><xsl:value-of select="$newline"/></xsl:if>
  </xsl:template>
	<!-- show assignedEntity -->
	<xsl:template name="show-assignedEntity">
		<xsl:param name="asgnEntity"/>
		<xsl:choose>
			<xsl:when test="$asgnEntity/n1:assignedPerson/n1:name">
				<xsl:call-template name="show-name">
					<xsl:with-param name="name" select="$asgnEntity/n1:assignedPerson/n1:name"/>
				</xsl:call-template>
				<xsl:if test="$asgnEntity/n1:representedOrganization/n1:name">
					<xsl:text> of </xsl:text>
					<xsl:value-of select="$asgnEntity/n1:representedOrganization/n1:name"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$asgnEntity/n1:representedOrganization">
				<xsl:value-of select="$asgnEntity/n1:representedOrganization/n1:name"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="$asgnEntity/n1:id">
					<xsl:call-template name="show-id"/>
					<xsl:choose>
						<xsl:when test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<br/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- show relatedEntity -->
	<xsl:template name="show-relatedEntity">
		<xsl:param name="relatedEntity"/>
		<xsl:choose>
			<xsl:when test="$relatedEntity/n1:relatedPerson/n1:name">
				<xsl:call-template name="show-name">
					<xsl:with-param name="name" select="$relatedEntity/n1:relatedPerson/n1:name"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- show associatedEntity -->
	<xsl:template name="show-associatedEntity">
		<xsl:param name="assoEntity"/>
		<xsl:choose>
			<xsl:when test="$assoEntity/n1:associatedPerson">
				<xsl:for-each select="$assoEntity/n1:associatedPerson/n1:name">
					<xsl:call-template name="show-name">
						<xsl:with-param name="name" select="."/>
					</xsl:call-template>
					<br/>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$assoEntity/n1:scopingOrganization">
				<xsl:for-each select="$assoEntity/n1:scopingOrganization">
					<xsl:if test="n1:name">
						<xsl:call-template name="show-name">
							<xsl:with-param name="name" select="n1:name"/>
						</xsl:call-template>
						<br/>
					</xsl:if>
					<xsl:if test="n1:standardIndustryClassCode">
						<xsl:value-of select="n1:standardIndustryClassCode/@displayName"/>
						<xsl:text> code:</xsl:text>
						<xsl:value-of select="n1:standardIndustryClassCode/@code"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$assoEntity/n1:code">
				<xsl:call-template name="show-code">
					<xsl:with-param name="code" select="$assoEntity/n1:code"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$assoEntity/n1:id">
				<xsl:value-of select="$assoEntity/n1:id/@extension"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$assoEntity/n1:id/@root"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- show code 
    if originalText present, return it, otherwise, check and return attribute: display name
    -->
	<xsl:template name="show-code">
		<xsl:param name="code"/>
		<xsl:variable name="this-codeSystem">
			<xsl:value-of select="$code/@codeSystem"/>
		</xsl:variable>
		<xsl:variable name="this-code">
			<xsl:value-of select="$code/@code"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$code/n1:originalText">
				<xsl:value-of select="$code/n1:originalText"/>
			</xsl:when>
			<xsl:when test="$code/@displayName">
				<xsl:value-of select="$code/@displayName"/>
			</xsl:when>
			<!--
      <xsl:when test="$the-valuesets/*/voc:system[@root=$this-codeSystem]/voc:code[@value=$this-code]/@displayName">
        <xsl:value-of select="$the-valuesets/*/voc:system[@root=$this-codeSystem]/voc:code[@value=$this-code]/@displayName"/>
      </xsl:when>
      -->
			<xsl:otherwise>
				<xsl:value-of select="$this-code"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- show classCode -->
	<xsl:template name="show-actClassCode">
		<xsl:param name="clsCode"/>
		<xsl:choose>
			<xsl:when test=" $clsCode = 'ACT' ">
				<xsl:text>healthcare service</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'ACCM' ">
				<xsl:text>accommodation</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'ACCT' ">
				<xsl:text>account</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'ACSN' ">
				<xsl:text>accession</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'ADJUD' ">
				<xsl:text>financial adjudication</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'CONS' ">
				<xsl:text>consent</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'CONTREG' ">
				<xsl:text>container registration</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'CTTEVENT' ">
				<xsl:text>clinical trial timepoint event</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'DISPACT' ">
				<xsl:text>disciplinary action</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'ENC' ">
				<xsl:text>encounter</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'INC' ">
				<xsl:text>incident</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'INFRM' ">
				<xsl:text>inform</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'INVE' ">
				<xsl:text>invoice element</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'LIST' ">
				<xsl:text>working list</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'MPROT' ">
				<xsl:text>monitoring program</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'PCPR' ">
				<xsl:text>care provision</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'PROC' ">
				<xsl:text>procedure</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'REG' ">
				<xsl:text>registration</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'REV' ">
				<xsl:text>review</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'SBADM' ">
				<xsl:text>substance administration</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'SPCTRT' ">
				<xsl:text>specimen treatment</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'SUBST' ">
				<xsl:text>substitution</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'TRNS' ">
				<xsl:text>transportation</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'VERIF' ">
				<xsl:text>verification</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'XACT' ">
				<xsl:text>financial transaction</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- show participationType -->
	<xsl:template name="show-participationType">
		<xsl:param name="ptype"/>
		<xsl:choose>
			<xsl:when test=" $ptype='PPRF' ">
				<xsl:text>primary performer</xsl:text>
			</xsl:when>
			<xsl:when test=" $ptype='PRF' ">
				<xsl:text>performer</xsl:text>
			</xsl:when>
			<xsl:when test=" $ptype='VRF' ">
				<xsl:text>verifier</xsl:text>
			</xsl:when>
			<xsl:when test=" $ptype='SPRF' ">
				<xsl:text>secondary performer</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- show participationFunction -->
	<xsl:template name="show-participationFunction">
		<xsl:param name="pFunction"/>
		<xsl:choose>
			<!-- From the HL7 v3 ParticipationFunction code system -->
			<xsl:when test=" $pFunction = 'ADMPHYS' ">
				<xsl:text>(admitting physician)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'ANEST' ">
				<xsl:text>(anesthesist)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'ANRS' ">
				<xsl:text>(anesthesia nurse)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'ATTPHYS' ">
				<xsl:text>(attending physician)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'DISPHYS' ">
				<xsl:text>(discharging physician)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'FASST' ">
				<xsl:text>(first assistant surgeon)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'MDWF' ">
				<xsl:text>(midwife)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'NASST' ">
				<xsl:text>(nurse assistant)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'PCP' ">
				<xsl:text>(primary care physician)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'PRISURG' ">
				<xsl:text>(primary surgeon)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'RNDPHYS' ">
				<xsl:text>(rounding physician)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'SASST' ">
				<xsl:text>(second assistant surgeon)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'SNRS' ">
				<xsl:text>(scrub nurse)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'TASST' ">
				<xsl:text>(third assistant)</xsl:text>
			</xsl:when>
			<!-- From the HL7 v2 Provider Role code system (2.16.840.1.113883.12.443) which is used by HITSP -->
			<xsl:when test=" $pFunction = 'CP' ">
				<xsl:text>(consulting provider)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'PP' ">
				<xsl:text>(primary care provider)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'RP' ">
				<xsl:text>(referring provider)</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'MP' ">
				<xsl:text>(medical home provider)</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="formatDateTime">
		<xsl:param name="date"/>
		<!-- month -->
		<xsl:variable name="month" select="substring ($date, 5, 2)"/>
		<xsl:choose>
			<xsl:when test="$month='01'">
				<xsl:text>January </xsl:text>
			</xsl:when>
			<xsl:when test="$month='02'">
				<xsl:text>February </xsl:text>
			</xsl:when>
			<xsl:when test="$month='03'">
				<xsl:text>March </xsl:text>
			</xsl:when>
			<xsl:when test="$month='04'">
				<xsl:text>April </xsl:text>
			</xsl:when>
			<xsl:when test="$month='05'">
				<xsl:text>May </xsl:text>
			</xsl:when>
			<xsl:when test="$month='06'">
				<xsl:text>June </xsl:text>
			</xsl:when>
			<xsl:when test="$month='07'">
				<xsl:text>July </xsl:text>
			</xsl:when>
			<xsl:when test="$month='08'">
				<xsl:text>August </xsl:text>
			</xsl:when>
			<xsl:when test="$month='09'">
				<xsl:text>September </xsl:text>
			</xsl:when>
			<xsl:when test="$month='10'">
				<xsl:text>October </xsl:text>
			</xsl:when>
			<xsl:when test="$month='11'">
				<xsl:text>November </xsl:text>
			</xsl:when>
			<xsl:when test="$month='12'">
				<xsl:text>December </xsl:text>
			</xsl:when>
		</xsl:choose>
		<!-- day -->
		<xsl:choose>
			<xsl:when test='substring ($date, 7, 1)="0"'>
				<xsl:value-of select="substring ($date, 8, 1)"/>
				<xsl:text>, </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="substring ($date, 7, 2)"/>
				<xsl:text>, </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<!-- year -->
		<xsl:value-of select="substring ($date, 1, 4)"/>
		<!-- time and US timezone -->
		<xsl:if test="string-length($date) > 8">
			<xsl:text>, </xsl:text>
			<!-- time -->
			<xsl:variable name="time">
				<xsl:value-of select="substring($date,9,6)"/>
			</xsl:variable>
			<xsl:variable name="hh">
				<xsl:value-of select="substring($time,1,2)"/>
			</xsl:variable>
			<xsl:variable name="mm">
				<xsl:value-of select="substring($time,3,2)"/>
			</xsl:variable>
			<xsl:variable name="ss">
				<xsl:value-of select="substring($time,5,2)"/>
			</xsl:variable>
			<xsl:if test="string-length($hh)&gt;1">
				<xsl:value-of select="$hh"/>
				<xsl:if test="string-length($mm)&gt;1 and not(contains($mm,'-')) and not (contains($mm,'+'))">
					<xsl:text>:</xsl:text>
					<xsl:value-of select="$mm"/>
					<xsl:if test="string-length($ss)&gt;1 and not(contains($ss,'-')) and not (contains($ss,'+'))">
						<xsl:text>:</xsl:text>
						<xsl:value-of select="$ss"/>
					</xsl:if>
				</xsl:if>
			</xsl:if>
			<!-- time zone -->
			<xsl:variable name="tzon">
				<xsl:choose>
					<xsl:when test="contains($date,'+')">
						<xsl:text>+</xsl:text>
						<xsl:value-of select="substring-after($date, '+')"/>
					</xsl:when>
					<xsl:when test="contains($date,'-')">
						<xsl:text>-</xsl:text>
						<xsl:value-of select="substring-after($date, '-')"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<!-- reference: http://www.timeanddate.com/library/abbreviations/timezones/na/ -->
				<xsl:when test="$tzon = '-0500' ">
					<xsl:text>, EST</xsl:text>
				</xsl:when>
				<xsl:when test="$tzon = '-0600' ">
					<xsl:text>, CST</xsl:text>
				</xsl:when>
				<xsl:when test="$tzon = '-0700' ">
					<xsl:text>, MST</xsl:text>
				</xsl:when>
				<xsl:when test="$tzon = '-0800' ">
					<xsl:text>, PST</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$tzon"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!-- convert to lower case -->
	<xsl:template name="caseDown">
		<xsl:param name="data"/>
		<xsl:if test="$data">
			<xsl:value-of select="translate($data, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
		</xsl:if>
	</xsl:template>
	<!-- convert to upper case -->
	<xsl:template name="caseUp">
		<xsl:param name="data"/>
		<xsl:if test="$data">
			<xsl:value-of select="translate($data,'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
		</xsl:if>
	</xsl:template>
	<!-- convert first character to upper case -->
	<xsl:template name="firstCharCaseUp">
		<xsl:param name="data"/>
		<xsl:if test="$data">
			<xsl:call-template name="caseUp">
				<xsl:with-param name="data" select="substring($data,1,1)"/>
			</xsl:call-template>
			<xsl:value-of select="substring($data,2)"/>
		</xsl:if>
	</xsl:template>
	<!-- show-noneFlavor -->
	<xsl:template name="show-noneFlavor">
		<xsl:param name="nf"/>
		<xsl:choose>
			<xsl:when test=" $nf = 'NI' ">
				<xsl:text>no information</xsl:text>
			</xsl:when>
			<xsl:when test=" $nf = 'INV' ">
				<xsl:text>invalid</xsl:text>
			</xsl:when>
			<xsl:when test=" $nf = 'MSK' ">
				<xsl:text>masked</xsl:text>
			</xsl:when>
			<xsl:when test=" $nf = 'NA' ">
				<xsl:text>not applicable</xsl:text>
			</xsl:when>
			<xsl:when test=" $nf = 'UNK' ">
				<xsl:text>unknown</xsl:text>
			</xsl:when>
			<xsl:when test=" $nf = 'OTH' ">
				<xsl:text>other</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

  <xsl:template name="addPrefixes">
    <div class="machine" style="font-size:small"><pre># generated by CCDA-to-Turtle.xsl <xsl:value-of select="$now"/>
@prefix dt: &lt;http://hl7.org/owl/datatypes/uv#&gt; .
@prefix hl7: &lt;http://hl7.org/owl/metadata#&gt; .
@prefix rim: &lt;http://hl7.org/owl/rim#&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix err: &lt;tag:eric@w3.org/2013/err&gt; .

</pre></div>
  </xsl:template>

	<xsl:template name="addCSS">
		<style type="text/css">
			<xsl:text>
body {
  background-color: #FFFFFF;
  font-family: Verdana, Tahoma, sans-serif;
  font-size: 11px;
}

h1 {
  font-size: 12pt;
  font-weight: bold;
}

h2 {
  font-size: 11pt;
  font-weight: bold;
}

h3 {
  font-size: 10pt;
  font-weight: bold;
}

h4 {
  font-size: 8pt;
  font-weight: bold;
}

div {
  width: 80%;
}

table {
  line-height: 10pt;
  width: 80%;
}

tr {
  background-color: #ccccff;
}

td {
  padding: 0.1cm 0.2cm;
  vertical-align: top;
}

.h1center {
  font-size: 12pt;
  font-weight: bold;
  text-align: center;
  width: 80%;
}

.header_table{
  border: 1pt inset #00008b;
}

.narr_table {
  width: 100%;
}

.narr_tr {
  background-color: #ffffcc;
}

.narr_th {
  background-color: #ffd700;
}

.td_label{
  font-weight: bold;
  color: white;
}
.machine {
  border: .5ex solid #aaaaff;
}
.error {
  background-color: red;
}

/* eye-popping RMIM colors */
.Act                       { background-color: #ff7f7f }
.ActRelationship           { background-color: #ffbaba }
.ActRelationship a:visited { background-color: #efaaaa; }
.ActRelationship a:hover   { background-color: #ffcaca; }
.Entity                    { background-color: #7fff7f }
.Role                      { background-color: #ffff7f }
.Role            a:visited { background-color: #eeee6f; }
.Role            a:hover   { background-color: #ffffbf; }
.Participation             { background-color: #7fffff }
.Participation   a:visited { background-color: #6fefef; }
.Participation   a:hover   { background-color: #afffff; }
.anchor { font-weight:bold; }

          </xsl:text>
		</style>
	</xsl:template>
</xsl:stylesheet>
