<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>Network equipment</h2>
  <xsl:apply-templates/>
  


<table border="1">

<xsl:template match="head">
  <tr>
    <td><xsl:apply-templates select="Number"/></td>
    <td><xsl:apply-templates select="Name"/></td>
    <td><xsl:apply-templates select="Type"/></td>
    <td><xsl:apply-templates select="Port number"/></td>
    <td><xsl:apply-templates select="IP address"/></td>
    <td><xsl:apply-templates select="Location"/></td>
  </tr>  
</xsl:template>


<xsl:template match="Number">
 <td>  
   <xsl:value-of select="."/>
 </td>
</xsl:template>


<xsl:template match="Name">
 <td>
   <xsl:value-of select="."/>
   </td>
</xsl:template>


<xsl:template match="Type">
 <td>
   <xsl:value-of select="."/>
  </td>
</xsl:template>



<xsl:template match="Port number">
 <td>
   <xsl:value-of select="."/>
 </td>
</xsl:template>
 


<xsl:template match="IP address">
 <td>
   <xsl:value-of select="."/>
 </td>
</xsl:template>



<xsl:template match="Location">
 <td>
   <xsl:value-of select="."/>
  </td> 
</xsl:template>


</table>

</body>
</html>

</xsl:template>

</xsl:stylesheet>