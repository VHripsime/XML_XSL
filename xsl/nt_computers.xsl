<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
    <body>
      <h2>NT_Computers</h2>
      <xsl:for-each select="equipment/computers/computer">
      
        <xsl:if test="software/item[@type='os']/title = 'Windows NT Server 4.0'">
          <ul>
          
            <li>
              <p>Name:<xsl:value-of select="@networkname"/></p>
            </li>
            
            <li>
              <p>OS: <xsl:value-of select="software/item/title"/></p>
            </li>
            
            <li>
              <xsl:for-each select="software/item/servicepacks/servicepack">
                <xsl:choose>
                <xsl:when test="servicepack = ''">
                  <p>Not installed</p>
                </xsl:when>
                <xsl:otherwise>
                  <p>Service pack installed: <xsl:value-of select="@name"/></p>
                </xsl:otherwise>
              </xsl:choose>
              </xsl:for-each>  
            </li>
            
            <li>
              <xsl:for-each select="hardware/drives/drive">
                <xsl:choose>
                <xsl:when test="@type != 'cd'">
                  <p>NO</p>
                </xsl:when>
                <xsl:otherwise>
                  <p>YES</p>
                </xsl:otherwise>
              </xsl:choose>
              </xsl:for-each>     
            </li>
          
          </ul>
        </xsl:if> 
          </xsl:for-each> 
    </body>
  </html>

</xsl:template>
</xsl:stylesheet>