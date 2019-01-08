<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:telota="http://www.telota.de"
    xmlns:saxon="http://saxon.sf.net/" exclude-result-prefixes="saxon"
    version="2.0">
    
    <xsl:variable name="ri_register_responsibles">
        |dumont|manz|rübsamen|weber|
    </xsl:variable>
    
    <xsl:template match="Stufe0|Stufe1|Stufe2|Stufe3|Stufe4|Stufe5">
        <!-- Liest Attribute aus übergebener Stufe aus --> 
        <xsl:variable name="section"><xsl:value-of select="./substring-after(@section, 'register_')" /></xsl:variable><!-- Abteilungsordner, z.B. "013" -->
        <xsl:variable name="letter"><xsl:value-of select="./@letter" /></xsl:variable><!-- Buchstabe, d.h. Dateiname -->
        <!-- Setzt Attributwerte als Parameter und fragt online nach neuer ID -->
        <xsl:variable name="path">https://exist.regesta-imperii.de/ediarum/routinen/ri_register_newID.xql?section=<xsl:value-of select="$section" />&amp;letter=<xsl:value-of select="$letter" /></xsl:variable>

        <xsl:variable name="keyvalue"><xsl:value-of select="document($path)//newID/text()"/></xsl:variable>

        <xsl:copy>
            <xsl:attribute name="id">
                <xsl:value-of select="$keyvalue" />
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="matches(@cruser, $ri_register_responsibles)">
                    <xsl:attribute name="checked">
                        <xsl:text>yes</xsl:text>
                    </xsl:attribute>
                    <xsl:copy-of select="@cruser" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="checked">
                        <xsl:text>no</xsl:text>
                    </xsl:attribute>
                    <xsl:copy-of select="@cruser" />
                </xsl:otherwise>
            </xsl:choose>

            <xsl:element name="Inhalt"></xsl:element>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
