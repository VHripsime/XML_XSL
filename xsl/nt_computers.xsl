<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h2>NT_computers</h2>
          <xsl:apply-templates select="equipment/computers/computer">
          <xsl:template match="computer/*/*"/>
          <xsl:if test="software/item[@type='os']/title = 'Windows NT Server 4.0'">
            <ul>
              <li>
                <p>Name: <xsl:value-of select="@networkname"/></p>
                
                <p>OS: <xsl:value-of select="software/item/title"/></p>
                <xsl:apply-templates select="software/item/servicepacks/servicepack"/>
                <xsl:choose>
                  <xsl:when test="@name = ''">
                    <p>not installed:</p>
                  </xsl:when>
                  <xsl:otherwise>
                    <p>Service pack installed: <xsl:value-of 
                        select="software/item/servicepacks/servicepack/@name"/></p>
                  </xsl:otherwise>
                </xsl:choose>
                
                <p> CD:
                <xsl:for-each select="hardware/drivers/driver">
                <p><xsl:value-of select="@type"/></p>
                <!-- <xsl:choose>
                  <xsl:when test="@type != 'cd'">
                    <span>NO</span>
                  </xsl:when>
                  <xsl:otherwise>                 
                    <p>CD:<span>YES</span></p>
                  </xsl:otherwise>
                </xsl:choose>  -->
                </xsl:for-each> 
                </p>
                                
              </li>
            </ul>
          </xsl:if>
          </xsl:apply-templates>
      </body> 
    </html>
  </xsl:template>
</xsl:stylesheet>