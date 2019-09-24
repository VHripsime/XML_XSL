<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
 <html>
  <body>
  <h2>Compters</h2>     
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>#2</th>
      <th>Name</th>
      <th>Type</th>
      <th>Hardware</th>
      <th>Software</th>
    </tr>
     <xsl:apply-templates select="equipment/computers"/>
  </table>
  
  
  <h2>Networks</h2>     
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>#2</th>
      <th>Name</th>
      <th>Equipment type</th>
      <th>Port number</th>
      <th>IP address</th>
      <th>Location</th>
    </tr>
    <xsl:apply-templates select="equipment/network"/> 
  </table>
 
 <h2>Peripherals</h2>     
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>#2</th>
      <th>Name</th>
      <th>Type</th>
      <th>Location</th>
    </tr>
     <xsl:apply-templates select="equipment/peripherals"/>
  </table> 
  
  </body>
  </html>
</xsl:template>

  <xsl:template match="computer">
    <tr>
      <td><xsl:number format="1"/></td>
      <td><xsl:value-of select="@networkname"/></td>
      <td><xsl:value-of select="@type"/></td>
      <td><xsl:value-of select="hardware/cpu/@type"/><br/>
        <xsl:value-of select="hardware/ram/@type"/><br/>
        <xsl:value-of select="hardware/soundcard"/><br/>
        <xsl:value-of select="hardware/storage/@space"/><br/>
        <xsl:for-each select="hardware/drives/drive"> 
        <xsl:value-of select="@type"/><span>/</span>
        </xsl:for-each></td>
      <td><xsl:for-each select="software/item">
        <xsl:value-of select="title"/><br/></xsl:for-each></td>     
    </tr>
  </xsl:template>
  
<xsl:template match="network/*/*">
    <tr>
      <td><xsl:number format="1"/></td>
      <td><xsl:value-of select="type"/></td>
      <td><xsl:value-of select="name(.)"/></td>
      <td><xsl:value-of select="port"/></td>     
      <td>
        <xsl:choose>
          <xsl:when test="ip != ' '">
            <p><xsl:value-of select="ip"/></p>
          </xsl:when>
          <xsl:otherwise>
            <p>N/A</p>
          </xsl:otherwise>
        </xsl:choose>
      </td>      
      <td><xsl:value-of select="location"/></td>
    </tr>    
</xsl:template>

<xsl:template match="peripherals/*/*">
  <tr>
    <td><xsl:number format="1"/></td>
    <td>
      <xsl:choose>
        <xsl:when test="@networkname != ' '">
          <p><xsl:value-of select="@networkname"/></p>
        </xsl:when>
        <xsl:otherwise>
          <p>N/A</p>
        </xsl:otherwise>
      </xsl:choose>
    </td>
    <td><xsl:value-of select="type"/></td>
    <td><xsl:value-of select="location"/></td>  
  </tr> 
</xsl:template>

</xsl:stylesheet>



