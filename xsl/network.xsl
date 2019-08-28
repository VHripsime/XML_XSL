<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<table border="1">
					<tr bgcolor="#ac5353">
						<th>Number</th>
						<th>Name</th>
						<th>Equipment type</th>
						<th>Port number</th>
						<th>IP address</th>
						<th>Location</th>
					</tr>
					<xsl:apply-templates select="equipment/network" />
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="network/*/*">
 
		<tr>
			<td>
				<xsl:number format="1" />
			</td>
			
		
			<td>
				<xsl:value-of select="type" />
			</td>
		    
			<td>
				<xsl:value-of select="name(.)" />
			</td>
			<td>
				<xsl:value-of select="port" />
			</td>
			
			<xsl:choose>
				<xsl:when test="//ip">
					<td>
						<xsl:value-of select="ip" />
					</td>
				</xsl:when>
				<xsl:otherwise>
					<td>N/A</td>
				</xsl:otherwise>
			</xsl:choose>
			<td>
				<xsl:value-of select="location" />
			</td>
			
		</tr>
		
	</xsl:template>



</xsl:stylesheet>

	



