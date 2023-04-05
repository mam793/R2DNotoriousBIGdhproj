<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" 
        include-content-type="no" indent="yes"/>
    <xsl:template match = "/">
        <html>
            <head>
                <title>Reading View</title>
            </head>
            <body>
                <link rel="stylesheet" type="text/css" href="index.css"/>
                <h1>Songs</h1>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>