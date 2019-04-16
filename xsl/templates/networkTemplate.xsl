<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="equipment">

        <table border='1' cellpadding="4">
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Equipment type</th>
                <th>Port number</th>
                <th>IP address</th>
                <th>Location</th>
            </tr>

            <xsl:for-each select="network/*/*">
                <xsl:sort select="type" />
                <tr>
                    <td>
                        <xsl:number value="position()" />
                    </td>
                    <td>
                        <xsl:value-of select="type" />
                    </td>
                    <td>
                        <xsl:value-of select="name()" />
                    </td>
                    <td align="center">
                        <xsl:value-of select="port" />
                    </td>
                    
                    <xsl:choose>                       
                        <xsl:when test="ip">
                            <td> <xsl:value-of select="ip" /> </td>
                        </xsl:when>
                        <xsl:otherwise>
                            <td align="center"> N/A </td>                      
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <td>
                        <xsl:value-of select="location" />
                    </td>
                </tr>
            </xsl:for-each>

        </table>
    </xsl:template>
       

</xsl:stylesheet>