<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:variable name="all-songs" as="document-node()+" select="collection('/C:/Users/raini/Documents/Pitt/spring 22-23/comp methods/R2DNotoriousBIGdhproj/songs/?select=*.xml')"/>
    <xsl:template name="xsl:initial-template">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="index.css"/>
                <title>Reading View</title>
            </head>
            <body>
                <h2>Songs</h2>
                <div class = "row">
                    <div class = "sidenav">
                        <ol class = "song-list">
                            <xsl:apply-templates select="$all-songs" mode = "list"/>
                        </ol>
                    </div>
                    <div class = "main">
                        <xsl:apply-templates select="$all-songs"/>
                    </div>
                </div>
                
                <!-- code credit goes to W3Schools -->
                <script>
                    function myFunction(id) {
                        var x = document.getElementById(id);
                        if (x.style.display === "none") {
                        x.style.display = "block";
                        } else {
                        x.style.display = "none";
                        }
                    }
                </script>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="song" mode = "list">
        <li onclick="myFunction('{title}')">
            <a href="#"><xsl:value-of select="title"/></a>
        </li>
    </xsl:template>
    
    <xsl:template match="song">
        <section id = "{title}">
            <h3 class = "rv"><xsl:value-of select="title"/></h3>
            <xsl:apply-templates select="child::*[position() &gt; 1]"/>
        </section>
        
    </xsl:template>
    
    <xsl:template match = "song/child::*[position() &gt; 1]">
        <section id = "{name(.)}">
            <h4 class = "rv"><xsl:value-of select="name(.)"/> (theme: <xsl:value-of select="@theme"/>)</h4>
            <xsl:apply-templates select="line"/>
        </section>
    </xsl:template>
    
    <xsl:template match="line">
        <p class = "rv"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match = "style">
        <span id = "style" class = "tooltip"><xsl:apply-templates/><span class = "display">style: <xsl:value-of select="@type"/></span></span>
    </xsl:template>
    
    <xsl:template match = "adlib">
        (<xsl:value-of select="."/>)
    </xsl:template>
    
    <xsl:template match = "line/child::*[not(self::adlib) and not(self::style)]">
        <span id = "theme" class = "tooltip"><xsl:apply-templates/><span class = "display">theme: <xsl:value-of select="name(.)"/></span></span>
    </xsl:template>
    
</xsl:stylesheet>