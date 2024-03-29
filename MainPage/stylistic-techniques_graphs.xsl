<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="all-songs" as="element()+"
        select="collection('../songs/?recurse=yes;select=*.xml')//song"/>
    <xsl:variable name="barWidth" as="xs:integer" select="20"/>
    <xsl:variable name = "yScale" as="xs:integer" select = "4"/>
    <xsl:variable name="xPos" as="xs:integer" select = "40"/>
    <xsl:variable name = "yPos" as = "xs:integer" select = "-40"/>
    <xsl:variable name="barHeight" as = "xs:integer" select = "40"/>
    <xsl:template name="xsl:initial-template">
        <!-- setting global variables -->
        <svg viewBox="-140 -350 1250 500" width="100%">
            <rect x = "-170" y = "-340" width = "1280" height = "520" fill="#3e3d3e" />
            <!-- Setting the background -->
            <line x1="0" x2="0" y1="0" y2="-{70 * $yScale}" stroke="white" stroke-linecap="square"/>
            <line x1="0" x2="1060" y1="0" y2="0" stroke="white" stroke-linecap="square"/>
            <text x="520" y="60" fill = "white" font-size = "18px" font-family="arial" text-anchor = "middle">Stylistic Techniques</text>
            <text x="520" y="-300" fill = "white" font-size = "18px" font-family="arial" text-anchor = "middle" >Occurences of Stylistic Technqiues in "Ready to Die"</text>
            <text x="-60" y="-140" text-anchor="middle" writing-mode="tb"
                font-size="18px" font-family = "arial" fill = "white"># of Times Present in the Album</text>
            <line x1 = "0" x2 = "1060" y1 = "{$yPos}" y2 = "{$yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <line x1 = "0" x2 = "1060" y1 = "{2 * $yPos}" y2 = "{2 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{$yPos}" fill = "white" font-family ="arial">10</text>
            <line x1 = "0" x2 = "1060" y1 = "{3 * $yPos}" y2 = "{3 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{2 * $yPos}" fill = "white" font-family = "arial">20</text>
            <line x1 = "0" x2 = "1060" y1 = "{4 * $yPos}" y2 = "{4 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{3 * $yPos}" fill = "white" font-family = "arial">30</text>
            <line x1 = "0" x2 = "1060" y1 = "{5 * $yPos}" y2 = "{5 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{4 * $yPos}" fill = "white" font-family = "arial">40</text>
            <line x1 = "0" x2 = "1060" y1 = "{6 * $yPos}" y2 = "{6 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{5 * $yPos}" fill = "white" font-family = "arial">50</text>
            <line x1 = "0" x2 = "1060" y1 = "{7 * $yPos}" y2 = "{7 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{6 * $yPos}" fill = "white" font-family = "arial">60</text>
            <text x = "-20" y = "{7 * $yPos}" fill = "white" font-family = "arial">70</text>

           
            <!-- X and Y axis; dotted lines; label values for dotted lines and x and y axis -->
            
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
            
            
            <rect x="{$xPos}" y="-{$collo * $yScale}" width="{$barWidth}" height="{$collo * $yScale}" fill="#ba2828"/>
            <text x="{10 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Allusion</text>
            <rect x="{120 + $xPos} " y="-{$repetition * $yScale}" width="{$barWidth}" height="{$repetition * $yScale}" fill="#ba2828"/>
            <text x="{130 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Repetition</text>
            <rect x="{230 + $xPos} " y="-{$collo * $yScale}" width="{$barWidth}" height="{$collo * $yScale}" fill="#ba2828"/>
            <text x="{240 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Colloquialism</text>
            <rect x="{340 + $xPos} " y="-{$metaphor * $yScale}" width="{$barWidth}" height="{$metaphor * $yScale}" fill="#ba2828"/>
            <text x="{350 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Metaphor</text>
            <rect x="{450 + $xPos} " y="-{$similie * $yScale}" width="{$barWidth}" height="{$similie * $yScale}" fill="#ba2828"/>
            <text x="{460 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Similie</text>
            <rect x="{560 + $xPos} " y="-{$hyperbole * $yScale}" width="{$barWidth}" height="{$hyperbole * $yScale}" fill="#ba2828"/>
            <text x="{570 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Hyperbole</text>
            <rect x="{670 + $xPos} " y="-{$imagery * $yScale}" width="{$barWidth}" height="{$imagery * $yScale}" fill="#ba2828"/>
            <text x="{680 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Imagery</text>
            <rect x="{780 + $xPos} " y="-{$doubleEntendre * $yScale}" width="{$barWidth}" height="{$doubleEntendre * $yScale}" fill="#ba2828"/>
            <text x="{790 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Double-Entendre</text>
            <rect x="{890 + $xPos} " y="-{$dialogue * $yScale}" width="{$barWidth}" height="{$dialogue * $yScale}" fill="#ba2828"/>
            <text x="{900 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Dialogue</text>
            <rect x="{1000 + $xPos} " y="-{$onomatopoeia * $yScale}" width="{$barWidth}" height="{$onomatopoeia * $yScale}" fill = "#ba2828"/>
            <text x="{1010 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Onomatopoeia</text>/>
        </svg>
    </xsl:template>
</xsl:stylesheet>

    
