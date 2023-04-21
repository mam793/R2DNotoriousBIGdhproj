<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="all-songs" as="element()+"
        select="collection('../songs/?recurse=yes;select=*.xml')//song"/>
    <xsl:variable name="barWidth" as="xs:integer" select="20"/>
    <xsl:variable name = "yScale" as="xs:integer" select = "4"/>
    <xsl:variable name="xPos" as="xs:integer" select = "20"/>
    <xsl:variable name = "yPos" as = "xs:integer" select = "-40"/>
    <xsl:variable name="barHeight" as = "xs:integer" select = "2"/>
    <xsl:variable name = "X" as = "xs:integer" select = "0"
    <xsl:template name="xsl:initial-template">
        <!-- setting global variables -->
        <svg viewBox="-100 -300 1100 400" width="100%">
            <rect x = "-100" y = "-300" width = "1200" height = "400" fill="#3e3d3e" />
            <!-- Setting the background -->
            <line x1="0" x2="0" y1="0" y2="-{70 * $yScale}" stroke="white" stroke-linecap="square"/>
            <text x="375" y="60" fill = "white" font-size = "18px" font-family="arial">Themes</text>
            <text x="375" y="-350" fill = "white" font-size = "18px" font-family="arial" text-anchor = "middle">Occurences of Themes in "Ready to Die"</text>
            <text x="-60" y="-120" text-anchor="middle" writing-mode="tb"
                font-size="18px" font-family = "arial" fill = "white"># of Times Present in the Album</text>
            <line x1 = "0" x2 = "1050" y1 = "{$yPos}" y2 = "{$yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <line x1 = "0" x2 = "1050" y1 = "{2 * $yPos}" y2 = "{2 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{$yPos}" fill = "white" font-family ="arial">10</text>
            <line x1 = "0" x2 = "1050" y1 = "{3 * $yPos}" y2 = "{3 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{2 * $yPos}" fill = "white" font-family = "arial">20</text>
            <line x1 = "0" x2 = "1050" y1 = "{4 * $yPos}" y2 = "{4 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{3 * $yPos}" fill = "white" font-family = "arial">30</text>
            <line x1 = "0" x2 = "1050" y1 = "{5 * $yPos}" y2 = "{5 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{4 * $yPos}" fill = "white" font-family = "arial">40</text>
            <line x1 = "0" x2 = "1050" y1 = "{6 * $yPos}" y2 = "{6 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{5 * $yPos}" fill = "white" font-family = "arial">50</text>
            <line x1 = "0" x2 = "1050" y1 = "{7 * $yPos}" y2 = "{7 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{6 * $yPos}" fill = "white" font-family = "arial">60</text>
            <text x = "-20" y = "{7 * $yPos}" fill = "white" font-family = "arial">70</text>
            
            
            <xsl:variable name="allusion" as="xs:integer" select="count($all-songs//style[@type = 'allusion'])"/>
            <xsl:variable name="repetition" as="xs:integer" select="count($all-songs//style[@type = 'repetition'])"/>
            <xsl:variable name="collo" as="xs:integer" select="count($all-songs//style[@type = 'collo'])"/>
            <xsl:variable name="metaphor" as="xs:integer" select="count($all-songs//style[@type = 'metaphor'])"/>
            <xsl:variable name="similie" as="xs:integer" select="count($all-songs//style[@style = 'similie'])"/>
            <xsl:variable name="hyperbole" as="xs:integer" select="count($all-songs//style[@type = 'hyperbole'])"/>
            <xsl:variable name="imagery" as="xs:integer" select="count($all-songs//style[@type = 'imagery'])"/>
            <xsl:variable name="doubleEntendre" as="xs:integer" select="count($all-songs//style[@type = 'doubleEntendre'])"/>
            <xsl:variable name="onomatopoeia" as="xs:integer" select="count($all-songs//style[@type = 'onomatopoeia'])"/>
            <xsl:variable name="dialogue" as="xs:integer" select="count($all-songs//style[@type = 'dialogue'])"/>
            
            
            
            
            
           <rect x="{$X}" y="-{$xPos}" width="{$allusion * $yScale}" height="{$barHeight * 2}" fill="#ba2828"/>