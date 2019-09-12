<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
 <html>
  <body>
  <h2>Computers</h2>     
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>#2</th>
      <th>Name</th>
      <th>type</th>
      <th>Hardware</th>
      <th>Software</th>
    </tr>
    <xsl:apply-templates select="equipment/computers"/>
  </table>
  <h2>Network equipment</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>#2</th>
      <th>Name</th>
      <th> type</th>
      <th>Port number</th>
      <th>IP address</th>
      <th>Location</th>
    </tr>
    <xsl:apply-templates select="equipment/network">
    </xsl:apply-templates> 
  </table>
  </body>
  </html>
</xsl:template>
<xsl:template match="computer">
    <tr>
    <td><xsl:number format="1"/></td>
    <td><xsl:value-of select="type"/></td>
    </tr>
    
</xsl:template>
</xsl:stylesheet>
