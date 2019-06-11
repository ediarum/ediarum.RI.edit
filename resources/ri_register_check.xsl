<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:telota="http://www.telota.de"
    xmlns:saxon="http://saxon.sf.net/" exclude-result-prefixes="saxon"
    version="2.0">
    
    <xsl:template match="Stufe0|Stufe1|Stufe2|Stufe3|Stufe4|Stufe5">
        <xsl:choose>
            <xsl:when test="matches(@currentuser, $ri_register_responsibles)">
                <xsl:element name="{name()}">
                    <xsl:attribute name="checked">
                        <xsl:text>yes</xsl:text>
                    </xsl:attribute>
                    <xsl:copy-of select="@*[name()!='currentuser'][name()!='checked']|node()" />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:copy-of select="@*[name()!='currentuser']|node()" />
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
</xsl:stylesheet>
