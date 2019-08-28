<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<table border="1" font-family="arial, sans-serif;"
					border-collapse="collapse;" width="100%;" height="50%;">
					<tr bgcolor="#9acd32">
						<th>#</th>
						<th>Name</th>
						<th>Equipment type</th>
						<th>Port number
						</th>
						<th>IP address</th>
						<th>Location</th>
					</tr>


					<xsl:apply-templates />
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="equipment">
		<xsl:apply-templates select="network" />
	</xsl:template>

	<xsl:template match="network/*/*">
		<xsl:number /> 
		<tr>
			<td>
				<xsl:value-of select="type" />
			</td>
			<td>
				<xsl:value-of select="name(.)" />
			</td>
			<td>
				<xsl:value-of select="port" />
			</td>
			<td>
				<xsl:value-of select="ip" />
			</td>
			<td>
				<xsl:value-of select="location" />
			</td>
		</tr>
	</xsl:template>

</xsl:stylesheet>
