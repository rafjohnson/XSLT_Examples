<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <xsl:for-each select="Disability">
      <xsl:choose>
        <xsl:when test="position()=1">
          <xsl:value-of select="."/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="preceding-sibling::Disability/Name=./Name">
            <xsl:value-of select="."/>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose> test="position()>1">
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
