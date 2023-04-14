<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
  version="3.0">
  <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
    indent="yes"/>
  <xsl:variable name="all-songs" as="document-node()+" select="collection('songs/?select=*.xml')"/>
  <xsl:template name="xsl:initial-template">
    <html>
      <head>
        <title>Sample output</title>
      </head>
      <body>
        <h1>All songs</h1>
        <ol>
          <xsl:apply-templates select="$all-songs"/>
        </ol>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="song">
    <xsl:message select="position()"/>
    <li><xsl:value-of select="title"/></li>
  </xsl:template>
</xsl:stylesheet>
