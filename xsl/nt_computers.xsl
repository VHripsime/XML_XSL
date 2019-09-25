<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
    <body>
      <h2>NT_Computers</h2>
   <xsl:apply-templates select="equipment/computers"/>
      
         </body>
  </html>
    </xsl:template>
     
       <xsl:template match="computer">
      
        <xsl:if test="software/item[@type='os']/title = 'Windows NT Server 4.0'">
       <ul>
          
            <li>
              <p>Name:<xsl:value-of select="@networkname"/></p>
            </li>
            
            <li>
              <p>OS: <xsl:value-of select="software/item/title"/></p>
            </li>
            
            
             <li>
              <xsl:apply-templates select="software"/>                
            </li>
            
            <li>             
              <p>CDROM drive: <xsl:apply-templates select="hardware/drives"/></p>               
            </li>
          
          </ul>
            </xsl:if>
      </xsl:template>
       
    <xsl:template match="item">
      <xsl:if test="@type = 'os'">
        <xsl:apply-templates select="servicepacks"/>
      </xsl:if>
            </xsl:template>
    
    <xsl:template match="drive">
       <xsl:if test="@type = 'cd'">YES</xsl:if> 
     
              <!-- <xsl:choose>
                <xsl:when test="drive/@type != 'cd'">
                  <p>CDROM drive: NO</p>
                </xsl:when>
                <xsl:otherwise>
                  <p>CDROM drive: YES</p>
                </xsl:otherwise>
              </xsl:choose> -->
    </xsl:template>
    
    <xsl:template match="servicepack">
      <xsl:choose>
                <xsl:when test="@name = ''">
                  <p>Not installed</p>
                </xsl:when>
                <xsl:otherwise>
                  <p>Service pack installed: <xsl:value-of select="@name"/></p>
                </xsl:otherwise>
        </xsl:choose>
      
    </xsl:template>
   
</xsl:stylesheet>



              
              
              
              
    