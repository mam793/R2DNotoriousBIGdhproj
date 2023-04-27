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
    <xsl:variable name="barHeight" as = "xs:integer" select = "40"/>
    <xsl:template name="xsl:initial-template">
        <!-- setting global variables -->
        <svg viewBox="-100 -300 1100 400" width="100%">
            <rect x = "-100" y = "-300" width = "1200" height = "400" fill="#3e3d3e" />
            <!-- Setting the background -->
            <line x1="0" x2="0" y1="0" y2="-{70 * $yScale}" stroke="white" stroke-linecap="square"/>
            <line x1="0" x2="1050" y1="0" y2="0" stroke="white" stroke-linecap="square"/>
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
            
            
            <!-- X and Y axis; dotted lines; label values for dotted lines and x and y axis -->
            
            <xsl:variable name = "repetitionsex" as = "xs:integer" select = "count($all-songs//sex/style[@type = 'repetition'])"/>
            <xsl:variable name = "collosex" as = "xs:integer" select = "count($all-songs//sex/style[@type = 'collo'])"/>
            <xsl:variable name = "metaphorsex" as = "xs:integer" select = "count($all-songs//sex/style[@type = 'metaphor'])"/>
            <xsl:variable name = "hyperbolesex" as = "xs:integer" select = "count($all-songs//sex/style[@type = 'hyperbole'])"/>
            <xsl:variable name = "imagerysex" as = "xs:integer" select = "count($all-songs//sex/style[@type = 'imagrey'])"/>
            <xsl:variable name = "double-entendresex" as = "xs:integer" select = "count($all-songs//sex/style[@type = 'double-entendre'])"/>
            <xsl:variable name = "dialoguesex" as = "xs:integer" select = "count($all-songs//sex/style[@type = 'dialogue'])"/>
            <xsl:variable name = "onomatopoeiasex" as = "xs:integer" select = "count($all-songs//sex/style[@type = 'onomatopoeia'])"/>
            <xsl:variable name = "allusionsex" as = "xs:integer" select = "count($all-songs//sex/style[@type = 'allusion'])"/>
            
            
            <rect x="{$xPos}" y="-{$repetitionsex * $yScale}" width="{$barWidth}" height="{$repetitionsex * $yScale}" fill="white"/>
            <rect x="{$xPos}" y="-{($repetitionsex * $yScale) + ($metaphorsex * $yScale)}" width="{$barWidth}" height="{$metaphorsex * $yScale}" fill="red"/>
            <!-- Not present in markup -->
            <rect x="{$xPos}" y="-{($metaphorsex * $yScale) + ($imagerysex * $yScale)}" width="{$barWidth}" height="{$imagerysex * $yScale}" fill="blue"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos}" y = "-{($repetitionsex * $yScale) + ($allusionsex * $yScale)}" width = "{$barWidth}" height = "{$allusionsex * $yScale}" fill = "blue"/>
            <rect x = "{$xPos}" y = "-{$collosex * $yScale}" width = "{$barWidth}" height = "{$collosex * $yScale}" fill = "green"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos}" y = "-{($allusionsex * $yScale) + ($hyperbolesex * $yScale)}" width = "{$barWidth}" height = "{$hyperbolesex* $yScale}" fill = "orange"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos}" y = "-{($allusionsex * $yScale) + ($imagerysex * $yScale)}" width = "{$barWidth}" height = "{$imagerysex* $yScale}" fill = "orange"/>
            <rect x = "{$xPos}" y = "-{($allusionsex * $yScale) + ($double-entendresex * $yScale)}" width = "{$barWidth}" height = "{$double-entendresex* $yScale}" fill = "orange"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos}" y = "-{($allusionsex * $yScale) + ($onomatopoeiasex * $yScale)}" width = "{$barWidth}" height = "{$onomatopoeiasex* $yScale}" fill = "orange"/>
            <!-- Not present in markup -->
            <text x="{10 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial">Sex</text>
            <!-- Stylistic Techniques Comparison Sex -->
            
            <xsl:variable name = "repetitionviolence" as = "xs:integer" select = "count($all-songs//violence/style[@type = 'repetition'])"/>
            <xsl:variable name = "colloviolence" as = "xs:integer" select = "count($all-songs//violence/style[@type = 'collo'])"/>
            <xsl:variable name = "metaphorviolence" as = "xs:integer" select = "count($all-songs//violence/style[@type = 'metaphor'])"/>
            <xsl:variable name = "hyperboleviolence" as = "xs:integer" select = "count($all-songs//violence/style[@type = 'hyperbole'])"/>
            <xsl:variable name = "imageryviolence" as = "xs:integer" select = "count($all-songs//violence/style[@type = 'imagrey'])"/>
            <xsl:variable name = "double-entendreviolence" as = "xs:integer" select = "count($all-songs//violence/style[@type = 'double-entendre'])"/>
            <xsl:variable name = "dialogueviolence" as = "xs:integer" select = "count($all-songs//violence/style[@type = 'dialogue'])"/>
            <xsl:variable name = "onomatopoeiaviolence" as = "xs:integer" select = "count($all-songs//violence/style[@type = 'onomatopoeia'])"/>
            <xsl:variable name = "allusionviolence" as = "xs:integer" select = "count($all-songs//violence/style[@type = 'allusion'])"/>
           
            <rect x = "{$xPos}" y = "-{$repetitionviolence * $yScale}" width = "{$barWidth}" height = "{$repetitionviolence * $yScale}" fill = "white"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 60}" y = "-{$colloviolence * $yScale}" width = "{$barWidth}" height = "{$colloviolence * $yScale}" fill = "red"/>
            <rect x = "{$xPos}" y = "-{($colloviolence * $yScale) + ($metaphorviolence)}" width = "{$barWidth}" height = "{$metaphorviolence * $yScale}" fill = "red"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 60}" y = "={($colloviolence * $yScale) + ($hyperboleviolence * $yScale)}" width="{$barWidth}" height = "{$hyperboleviolence * $yScale}"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 60}" y = "={($colloviolence * $yScale) + ($imagerysex * $yScale)}" width="{$barWidth}" height = "{$imagerysex * $yScale}"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 60}" y = "={($colloviolence * $yScale) + ($double-entendreviolence * $yScale)}" width="{$barWidth}" height = "{$double-entendreviolence * $yScale}"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 6}" y = "{($colloviolence * $yScale) + ($dialogueviolence * $yScale)}" width="{$barWidth}" height = "{$dialogueviolence * $yScale}"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 60}" y = "={($colloviolence * $yScale) + ($onomatopoeiaviolence * $yScale)}" width="{$barWidth}" height = "{$onomatopoeiaviolence * $yScale}"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 60}" y = "-{($colloviolence * $yScale) + ($allusionviolence * $yScale)}" width="{$barWidth}" height = "{$allusionviolence * $yScale}" fill = "white"/>
            <text x="{20 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial">Violence</text>
            <!-- Stylistic Techniques Comparison Violence -->
            
            
            <xsl:variable name = "repetitiondrugs" as = "xs:integer" select = "count($all-songs//drugs/style[@type = 'repetition'])"/>
            <xsl:variable name = "collodrugs" as = "xs:integer" select = "count($all-songs//drugs/style[@type = 'collo'])"/>
            <xsl:variable name = "metaphordrugs" as = "xs:integer" select = "count($all-songs//drugs/style[@type = 'metaphor'])"/>
            <xsl:variable name = "hyperboledrugs" as = "xs:integer" select = "count($all-songs//drugs/style[@type = 'hyperbole'])"/>
            <xsl:variable name = "imagerydrugs" as = "xs:integer" select = "count($all-songs//drugs/style[@type = 'imagrey'])"/>
            <xsl:variable name = "double-entendredrugs" as = "xs:integer" select = "count($all-songs//drugs/style[@type = 'double-entendre'])"/>
            <xsl:variable name = "dialoguedrugs" as = "xs:integer" select = "count($all-songs//drugs/style[@type = 'dialogue'])"/>
            <xsl:variable name = "onomatopoeiadrugs" as = "xs:integer" select = "count($all-songs//drugs/style[@type = 'onomatopoeia'])"/>
            <xsl:variable name = "allusiondrugs" as = "xs:integer" select = "count($all-songs//drugs/style[@type = 'allusion'])"/>
            
            <rect x = "{$xPos + 120}" y = "-{$repetitiondrugs * $yScale}" width = "{$barWidth}" height = "{$repetitiondrugs * $yScale}"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 120}" y = "-{$collodrugs * $yScale}" width = "{$barWidth}" height = "{$collodrugs * $yScale}" fill = "red"/>
            <rect x = "{$xPos + 120}" y = "-{($collodrugs * $yScale) + ($metaphordrugs * $yScale)}" width = "{$barWidth}" height = "{$metaphordrugs * $yScale}" fill = "red"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 120}" y = "-{($collodrugs * $yScale) + ($hyperboledrugs * $yScale)}" width = "{$barWidth}" height = "{$hyperboledrugs * $yScale}" fill = "red"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 120}" y = "-{($collodrugs * $yScale) + ($imagerydrugs * $yScale)}" width = "{$barWidth}" height = "{$imagerydrugs * $yScale}" fill = "red"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 120}" y = "-{($collodrugs * $yScale) + ($double-entendredrugs * $yScale)}" width = "{$barWidth}" height = "{$double-entendredrugs * $yScale}" fill = "red"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 120}" y = "-{($collodrugs * $yScale) + ($dialoguedrugs * $yScale)}" width = "{$barWidth}" height = "{$dialoguedrugs * $yScale}" fill = "red"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 120}" y = "-{($collodrugs * $yScale) + ($onomatopoeiadrugs * $yScale)}" width = "{$barWidth}" height = "{$onomatopoeiadrugs * $yScale}" fill = "red"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 120}" y = "-{($collodrugs * $yScale) + ($allusiondrugs * $yScale)}" width = "{$barWidth}" height = "{$allusiondrugs * $yScale}" fill = "red"/>
            <!-- Not present in markup -->
            <text x="{30 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial">Drugs</text>
            <!-- Stylistic Techniques Comparison Drugs --> 
            
            <xsl:variable name = "repetitionfamily" as = "xs:integer" select = "count($all-songs//family/style[@type = 'repetition'])"/>
            <xsl:variable name = "collofamily" as = "xs:integer" select = "count($all-songs//family/style[@type = 'collo'])"/>
            <xsl:variable name = "metaphorfamily" as = "xs:integer" select = "count($all-songs//family/style[@type = 'metaphor'])"/>
            <xsl:variable name = "hyperbolefamily" as = "xs:integer" select = "count($all-songs//family/style[@type = 'hyperbole'])"/>
            <xsl:variable name = "imageryfamily" as = "xs:integer" select = "count($all-songs//family/style[@type = 'imagrey'])"/>
            <xsl:variable name = "double-entendrefamily" as = "xs:integer" select = "count($all-songs//family/style[@type = 'double-entendre'])"/>
            <xsl:variable name = "dialoguefamily" as = "xs:integer" select = "count($all-songs//family/style[@type = 'dialogue'])"/>
            <xsl:variable name = "onomatopoeiafamily" as = "xs:integer" select = "count($all-songs//familu/style[@type = 'onomatopoeia'])"/>
            <xsl:variable name = "allusionfamily" as = "xs:integer" select = "count($all-songs//family/style[@type = 'allusion'])"/>
            
            <rect x = "{$xPos + 180}" y = "-{$repetitionfamily * $yScale}" width = "$barWidth" height = "{$repetitionfamily * $yScale}"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 180}" y = "-{$collofamily * $yScale}" width = "$barWidth" height = "{$collofamily * $yScale}" fill = "red"/>
            <rect x = "{$xPos + 180}" y = "-{($collofamily * $yScale) + ($metaphorfamily * $yScale)}" width = "{$barWidth}" height = "{$metaphorfamily * $yScale}" fill = "red"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 180}" y = "-{($collofamily * $yScale) + ($hyperbolefamily * $yScale)}" width = "{$barWidth}" height = "{$hyperbolefamily * $yScale}" fill = "red"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 180}" y = "-{($collofamily * $yScale) + ($imageryfamily * $yScale)}" width = "{$barWidth}" height = "{$imageryfamily * $yScale}" fill = "red"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 180}" y = "-{($collofamily * $yScale) + ($double-entendrefamily * $yScale)}" width = "{$barWidth}" height = "{$double-entendrefamily * $yScale}" fill = "red"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 180}" y = "-{($collofamily * $yScale) + ($dialoguefamily * $yScale)}" width = "{$barWidth}" height = "{$dialoguefamily * $yScale}" fill = "red"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 180}" y = "-{($collofamily * $yScale) + ($onomatopoeiafamily * $yScale)}" width = "{$barWidth}" height = "{$onomatopoeiafamily * $yScale}" fill = "red"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 180}" y = "-{($collofamily * $yScale) + ($allusionfamily * $yScale)}" width = "{$barWidth}" height = "{$allusionfamily * $yScale}" fill = "red"/>
            <!-- Not present in markup --> 
            <text x="{40 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial">Family</text>
            <!-- Stylistic Techniques Comaprison Family -->
                
            <xsl:variable name = "repetitionreflection" as = "xs:integer" select = "count($all-songs//reflection/style[@type = 'repetition'])"/>
            <xsl:variable name = "colloreflection" as = "xs:integer" select = "count($all-songs//reflection/style[@type = 'collo'])"/>
            <xsl:variable name = "metaphorreflection" as = "xs:integer" select = "count($all-songs//reflection/style[@type = 'metaphor'])"/>
            <xsl:variable name = "hyperbolereflection" as = "xs:integer" select = "count($all-songs//reflection/style[@type = 'hyperbole'])"/>
            <xsl:variable name = "imageryreflection" as = "xs:integer" select = "count($all-songs//reflection/style[@type = 'imagrey'])"/>
            <xsl:variable name = "double-entendrereflection" as = "xs:integer" select = "count($all-songs//reflection/style[@type = 'double-entendre'])"/>
            <xsl:variable name = "dialoguereflection" as = "xs:integer" select = "count($all-songs//reflection/style[@type = 'dialogue'])"/>
            <xsl:variable name = "onomatopoeiareflection" as = "xs:integer" select = "count($all-songs//reflection/style[@type = 'onomatopoeia'])"/>
            <xsl:variable name = "allusionreflection" as = "xs:integer" select = "count($all-songs//reflection/style[@type = 'allusion'])"/>
            
            <rect x = "{$xPos + 240}" y = "-{$repetitionreflection * $yScale}" width = "{$barWidth}" height = "{$repetitionreflection * $yScale}"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 240}" y = "-{$colloreflection * $yScale}" width = "{$barWidth}" height = "{$colloreflection * $yScale}" fill = "red"/>
            <rect x = "{$xPos + 240}" y = "-{($colloreflection * $yScale) + ($metaphorreflection * $yScale)}" width = "{$barWidth}" height = "{$metaphorreflection * $yScale}" fill = "white"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 240}" y = "-{($colloreflection * $yScale) + ($hyperbolereflection * $yScale)}" width = "{$barWidth}" height = "{$hyperbolereflection * $yScale}" fill = "white"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 240}" y = "-{($colloreflection * $yScale) + ($imageryreflection * $yScale)}" width = "{$barWidth}" height = "{$imageryreflection * $yScale}" fill = "white"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 240}" y = "-{($colloreflection * $yScale) + ($double-entendrereflection * $yScale)}" width = "{$barWidth}" height = "{$double-entendrereflection * $yScale}" fill = "white"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 240}" y = "-{($colloreflection * $yScale) + ($dialoguereflection * $yScale)}" width = "{$barWidth}" height = "{$dialoguereflection * $yScale}" fill = "white"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 240}" y = "-{($colloreflection * $yScale) + ($onomatopoeiareflection * $yScale)}" width = "{$barWidth}" height = "{$onomatopoeiareflection * $yScale}" fill = "white"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 240}" y = "-{($colloreflection * $yScale) + ($allusionreflection * $yScale)}" width = "{$barWidth}" height = "{$allusionreflection * $yScale}" fill = "white"/>
            <!-- Not present in markup --> 
            <text x="{40 + $xPos}" y="14" fill="white" text-anchor = "middle" font-family = "arial">Reflection</text>
            <!-- Stylistic Techniques Comparison Reflection --> 
            
            <xsl:variable name = "repetitionrrelationships" as = "xs:integer" select = "count($all-songs//relationships/style[@type = 'repetition'])"/>
            <xsl:variable name = "collorelationship" as = "xs:integer" select = "count($all-songs//relationships/style[@type = 'collo'])"/>
            <xsl:variable name = "metaphorelationship" as = "xs:integer" select = "count($all-songs//relationships/style[@type = 'metaphor'])"/>
            <xsl:variable name = "hyperbolerelationship" as = "xs:integer" select = "count($all-songs//relationships/style[@type = 'hyperbole'])"/>
            <xsl:variable name = "imageryrelationship" as = "xs:integer" select = "count($all-songs//relationships/style[@type = 'imagrey'])"/>
            <xsl:variable name = "double-entendrerelationship" as = "xs:integer" select = "count($all-songs//relationships/style[@type = 'double-entendre'])"/>
            <xsl:variable name = "dialoguerelationship" as = "xs:integer" select = "count($all-songs//relationships/style[@type = 'dialogue'])"/>
            <xsl:variable name = "onomatopoeiarelationship" as = "xs:integer" select = "count($all-songs//relationships/style[@type = 'onomatopoeia'])"/>
            <xsl:variable name = "allusionrelationships" as = "xs:integer" select = "count($all-songs//relationships/style[@type = 'allusion'])"/>
            
            <rect x = "{$xPos + 300}" y = "-{$repetitionrrelationships * $yScale}" width = "{$barWidth}" height = "{$repetitionrrelationships * $yScale}"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 300}" y = "-{$collorelationship * $yScale}" width = "{$barWidth}" height = "{$collorelationship * $yScale}" fill = "red"/>
            <rect x = "{$xPos + 300}" y = "-{($collorelationship * $yScale) + ($metaphorelationship * $yScale)}" width = "{$barWidth}" height = "{$metaphorelationship * $yScale}" fill = "red"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 300}" y = "-{($collorelationship * $yScale) + ($hyperbolerelationship * $yScale)}" width = "{$barWidth}" height = "{$hyperbolerelationship * $yScale}" fill = "red"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 300}" y = "-{($collorelationship * $yScale) + ($imageryrelationship * $yScale)}" width = "{$barWidth}" height = "{$imageryrelationship * $yScale}" fill = "red"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 300}" y = "-{($collorelationship * $yScale) + ($double-entendrerelationship * $yScale)}" width = "{$barWidth}" height = "{$double-entendrerelationship * $yScale}" fill = "red"/>
            <!-- Not present in markup -->
            <rect x = "{$xPos + 300}" y = "-{($collorelationship * $yScale) + ($dialoguerelationship * $yScale)}" width = "{$barWidth}" height = "{$dialoguerelationship * $yScale}" fill = "red"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 300}" y = "-{($collorelationship * $yScale) + ($onomatopoeiarelationship * $yScale)}" width = "{$barWidth}" height = "{$onomatopoeiarelationship * $yScale}" fill = "red"/>
            <!-- Not present in markup --> 
            <rect x = "{$xPos + 300}" y = "-{($collorelationship * $yScale) + ($allusionrelationships * $yScale)}" width = "{$barWidth}" height = "{$allusionrelationships * $yScale}" fill = "red"/>
            <!-- Not present in markup --> 
            
            
        </svg>
    </xsl:template>
</xsl:stylesheet>


