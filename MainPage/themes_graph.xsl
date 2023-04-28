<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="all-songs" as="element()+"
        select="collection('../songs/?recurse=yes;select=*.xml')//song"/>
    <xsl:variable name="barWidth" as="xs:integer" select="20"/>
    <xsl:variable name = "yScale" as="xs:integer" select = "4"/>
    <xsl:variable name="xPos" as="xs:integer" select = "30"/>
    <xsl:variable name = "yPos" as = "xs:integer" select = "-30"/>
    <xsl:template name="xsl:initial-template">
     <!-- setting global variables -->
        <svg viewBox="-150 -350 1250 500" width="100%">
        <rect x = "-150" y = "-320" width = "1250" height = "410" fill="#3e3d3e" />
        <!-- Setting the background -->
            <line x1="0" x2="1050" y1="0" y2="0" stroke="white" stroke-linecap="square"/>
            <text x="520" y="60" fill = "white" font-size = "18px" font-family="arial" text-anchor = "middle">Themes</text>
            <text x="520" y="-270" fill = "white" font-size = "18px" font-family="arial" text-anchor = "middle">Occurences of Themes in "Ready to Die"</text>
            <text x="-60" y="-120" text-anchor="middle" writing-mode="tb"
                font-size="18px" font-family = "arial" fill = "white"># of Times Present in the Album</text>
            <line x1="0" x2="0" y1="0" y2="-{60 * $yScale}" stroke="white" stroke-linecap="square"/>
            <line x1 = "0" x2 = "1050" y1 = "{$yPos}" y2 = "{$yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{$yPos}" fill = "white" font-family ="arial">10</text>
            <line x1 = "0" x2 = "1050" y1 = "{2 * $yPos}" y2 = "{2 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{2 * $yPos}" fill = "white" font-family = "arial">20</text>
            <line x1 = "0" x2 = "1050" y1 = "{3 * $yPos}" y2 = "{3 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{3 * $yPos}" fill = "white" font-family = "arial">30</text>
            <line x1 = "0" x2 = "1050" y1 = "{4 * $yPos}" y2 = "{4 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{4 * $yPos}" fill = "white" font-family = "arial">40</text>
            <line x1 = "0" x2 = "1050" y1 = "{5 * $yPos}" y2 = "{5 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{5 * $yPos}" fill = "white" font-family = "arial">50</text>
            <line x1 = "0" x2 = "1050" y1 = "{6 * $yPos}" y2 = "{6 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{6 * $yPos}" fill = "white" font-family = "arial">60</text>
            <line x1 = "0" x2 = "1050" y1 = "{7 * $yPos}" y2 = "{7 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{7 * $yPos}" fill = "white" font-family = "arial">70</text>
            <line x1 = "0" x2 = "1050" y1 = "{8 * $yPos}" y2 = "{8 * $yPos}" stroke-dasharray="8 4" stroke = "gray"/>
            <text x = "-20" y = "{8 * $yPos}" fill = "white" font-family = "arial">80</text>
            <!-- X and Y axis; dotted lines; label values for dotted lines and x and y axis -->

            <xsl:variable name="violence" as="xs:integer" select="count($all-songs//violence)"/>
            <xsl:variable name="drugs" as="xs:integer" select="count($all-songs//drugs)"/>
            <xsl:variable name="family" as="xs:integer" select="count($all-songs//family)"/>
            <xsl:variable name="reflection" as="xs:integer" select="count($all-songs//reflection)"/>
            <xsl:variable name="sex" as="xs:integer" select="count($all-songs//sex)"/>
            <xsl:variable name="relationships" as="xs:integer" select="count($all-songs//relationships)"/>
            <xsl:variable name="money" as="xs:integer" select="count($all-songs//money)"/>
            <xsl:variable name="home" as="xs:integer" select="count($all-songs//home)"/>


            <rect x="{0 + $xPos}" y="-{$sex * $yScale}" width="{$barWidth}" height="{$sex * $yScale}" fill="#ba2828"/>
            <text x="{10 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Sex</text>
            <rect x="{130 + $xPos} " y="-{$violence * $yScale}" width="{$barWidth}" height="{$violence * $yScale}" fill="#ba2828"/>
            <text x="{140 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Violence</text>
            <rect x="{260 + $xPos} " y="-{$drugs * $yScale}" width="{$barWidth}" height="{$drugs * $yScale}" fill="#ba2828"/>
            <text x="{270 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Drugs</text>
            <rect x="{390 + $xPos} " y="-{$family * $yScale}" width="{$barWidth}" height="{$family * $yScale}" fill="#ba2828"/>
            <text x="{400 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Family</text>
            <rect x="{520 + $xPos} " y="-{$reflection * $yScale}" width="{$barWidth}" height="{$reflection * $yScale}" fill="#ba2828"/>
            <text x="{530 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Reflection</text>
            <rect x="{650 + $xPos} " y="-{$relationships * $yScale}" width="{$barWidth}" height="{$relationships * $yScale}" fill="#ba2828"/>
            <text x="{660 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Relationships</text>
            <rect x="{780 + $xPos} " y="-{$money * $yScale}" width="{$barWidth}" height="{$money * $yScale}" fill="#ba2828"/>
            <text x="{790 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Money</text>
            <rect x="{910 + $xPos} " y="-{$home * $yScale}" width="{$barWidth}" height="{$home * $yScale}" fill="#ba2828"/>
            <text x="{920 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial" font-size = "16px" font-weight="bold">Home</text>
        </svg>
    </xsl:template>
</xsl:stylesheet>
