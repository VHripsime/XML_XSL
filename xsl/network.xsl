<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- <xsl:import href=""/> -->
<xsl:template match="/">
  <html>
  <body>
  <h2>Network equipment</h2>
  
    <table border = "1">   
               <tr bgcolor = "#DCDCDC">   
                  <th>#</th>   
                  <th>Name</th>   
                  <th>Type</th>   
                  <th>Port number</th>   
                  <th>IP address</th> 
                  <th>Location</th>  
               </tr>   
  
  <xsl:apply-templates select='network'/>
     
</table>
</body>
</html>

</xsl:template>



<xsl:template match="network">
  <tr>
    <!-- <td><xsl:apply-templates select="Number"/></td> -->
    
    <td>1</td>
    <td><xsl:value-of select="hubs/hub/type"/></td>
    <td>hub</td>
    <td><xsl:value-of select="hubs/hub/port"/></td>
    <td>N/A</td>
    <td><xsl:value-of select="location"/></td>
  </tr>  
</xsl:template>




<xsl:template match="type">
   <td> <xsl:apply-templates /> </td>
</xsl:template>




<!-- <xsl:template match="type">
 <td>  
   <xsl:value-of select="."/>   
 </td>
</xsl:template> -->


<xsl:template match="hubs">
 <td>
   <xsl:apply-templates />
   </td>
</xsl:template>


<xsl:template match="Type">
 <td>
   <xsl:value-of select="."/>
  </td>
</xsl:template>



<xsl:template match="Port_number">
 <td>
   <xsl:value-of select="."/>
 </td>
</xsl:template>
 


<xsl:template match="IP_address">
 <td>
   <xsl:value-of select="."/>
 </td>
</xsl:template>



<xsl:template match="Location">
 <td>
   <xsl:value-of select="."/>
  </td> 
</xsl:template>

</xsl:stylesheet>