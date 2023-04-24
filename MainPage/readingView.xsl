<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:big="http://big.obdurodon.org" xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all" version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <!-- ================================================================ -->
    <!-- Stylesheet variables                                             -->
    <!-- ================================================================ -->
    <xsl:variable name="all-songs" as="document-node()+"
        select="collection('../songs/?select=*.xml')"/>
    <!-- ================================================================ -->
    <!-- Functions kk                                                       -->
    <!-- ================================================================ -->
    <xsl:function name="big:string-spaces" as="xs:string">
        <!-- ============================================================ -->
        <!-- Remove space characters and collapse into single string      -->
        <!-- ============================================================ -->
        <xsl:param name="input" as="xs:string"/>
        <xsl:value-of select="translate($input, ' ', '')"/>
    </xsl:function>
    <xsl:function name="big:capitalize-initial" as="xs:string">
        <!-- ============================================================ -->
        <!-- Uppercase first letter of string                             -->
        <!-- ============================================================ -->
        <xsl:param name="input" as="xs:string"/>
        <xsl:value-of select="substring($input, 1, 1) => upper-case() || substring($input, 2)"/>
    </xsl:function>
    <!-- ================================================================ -->
    <!-- Templates                                                        -->
    <!-- ================================================================ -->
    <xsl:template name="xsl:initial-template">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="index.css"/>
                <script src="readingView.js"/>
                <title>Reading View</title>
            </head>
            <body id="rv">
                <h2>Songs</h2>
                <div id="content">
                    <nav>
                        <ul>
                            <xsl:apply-templates select="$all-songs" mode="list">
                                <xsl:sort select="base-uri()"/>
                            </xsl:apply-templates>
                        </ul>
                    </nav>
                    <main>
                        <xsl:apply-templates select="$all-songs">
                            <xsl:sort select="base-uri()"/>
                        </xsl:apply-templates>
                    </main>
                </div>
            </body>
        </html>
    </xsl:template>
    <!-- ================================================================ -->
    <!-- Mode "list"                                                      -->
    <!--                                                                  -->
    <!-- Prepend "title_" to title with spaces stripped to create @id     -->
    <!-- ================================================================ -->
    <xsl:template match="song" mode="list">
        <li id="title_{big:string-spaces(title)}">
            <xsl:apply-templates select="title" mode="list"/>
        </li>
    </xsl:template>
    <!-- ================================================================ -->
    <!-- No mode                                                          -->
    <!-- ================================================================ -->
    <xsl:template match="song">
        <section class="song" id="{big:string-spaces(title)}">
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    <xsl:template match="title">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    <xsl:template match="song/*[not(self::title)]">
        <!-- Will not process song/title because of template precedence -->
        <section>
            <h4>
                <xsl:value-of select="name() => big:capitalize-initial()"/>
                <xsl:text> (theme: </xsl:text>
                <xsl:value-of select="@theme"/>
                <xsl:text>)</xsl:text>
            </h4>
            <xsl:apply-templates select="line"/>
        </section>
    </xsl:template>
    <xsl:template match="line">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="style">
        <span class="style tooltip">
            <xsl:apply-templates/>
            <span class="display">
                <xsl:text>style: </xsl:text>
                <xsl:value-of select="@type"/>
            </span>
        </span>
    </xsl:template>
    <xsl:template match="adlib">
        <xsl:text> (</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>) </xsl:text>
    </xsl:template>
    <xsl:template match="line/*[not(self::adlib or self::style)]">        
        <span class="theme tooltip">
            <xsl:apply-templates/>
            <span class="display">
                <xsl:text>theme: </xsl:text>
                <xsl:value-of select="name(.)"/>
            </span>
        </span>
    </xsl:template>

</xsl:stylesheet>
