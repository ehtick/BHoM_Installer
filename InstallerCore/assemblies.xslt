<xsl:stylesheet version="1.0"
            xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
            xmlns:msxsl="urn:schemas-microsoft-com:xslt"
            exclude-result-prefixes="msxsl"
            xmlns:wix="http://schemas.microsoft.com/wix/2006/wi"
            xmlns:my="my:my">

  <xsl:output method="xml" indent="yes" />

  <xsl:strip-space elements="*"/>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match='wix:Wix/wix:Fragment/wix:ComponentGroup/wix:Component[@Directory="ASSEMBLIESDIR"]/wix:File'>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="wix:CopyFile">
        <xsl:attribute name="Id">
          <xsl:text>CpyDYNC_</xsl:text>
          <xsl:value-of select="generate-id()"/>
        </xsl:attribute>
        <xsl:attribute name="DestinationDirectory">
          <xsl:text>DYNCBHOMDIR</xsl:text>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="wix:CopyFile">
        <xsl:attribute name="Id">
          <xsl:text>CpyDYNR_</xsl:text>
          <xsl:value-of select="generate-id()"/>
        </xsl:attribute>
        <xsl:attribute name="DestinationDirectory">
          <xsl:text>DYNRBHOMDIR</xsl:text>
        </xsl:attribute>
      </xsl:element>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
