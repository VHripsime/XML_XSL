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
  
  
  </body>
  </html>
</xsl:template>

<xsl:template match="computer/*/*">
     <tr>
    <td><xsl:number format="1"/></td>
    <td><xsl:value-of select="@networkname"/></td>
    <td><xsl:value-of select="@type"/></td>
    <td><xsl:value-of select=""/></td>
    <td><xsl:value-of select="ip"/></td>
    </tr>
    </xsl:template>
<xsl:template match="network/*/*">
    <tr>
    <td><xsl:number format="1"/></td>
    <td><xsl:value-of select="type"/></td>
    <td><xsl:value-of select="name(.)"/></td>
    <td><xsl:value-of select="port"/></td>
    <td><xsl:value-of select="ip"/></td>
    <td><xsl:value-of select="location"/></td>
    </tr>
    
</xsl:template>


</xsl:stylesheet>



