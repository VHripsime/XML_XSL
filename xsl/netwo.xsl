<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<h2>Network equipment</h2>

				<table border="1" cellspacing="0" cellpadding="2">
					<tr bgcolor="#DCDCDC">
						<th>#</th>
						<th>Name</th>
						<th>Type</th>
						<th>Port number</th>
						<th>IP address</th>
						<th>Location</th>
					</tr>

					<xsl:apply-templates />

				</table>
			</body>
		</html>
	</xsl:template>


	<xsl:template match='equipment'>
		<xsl:for-each select="network/*/*">
			<tr>
				<td>
					<xsl:value-of select="position()" />
				</td>
				
				<td>
					<xsl:value-of select="type" />
				</td>
				
				<td>
					<xsl:value-of select="name()" />
				</td>
				
				<td>
					<xsl:value-of select="port" />
				</td>
				
				<td>
					<xsl:choose>
						<xsl:when test="ip">
							<xsl:value-of select="ip" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>N/A</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				
				<td>
					<xsl:value-of select="location" />
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>


</xsl:stylesheet>

