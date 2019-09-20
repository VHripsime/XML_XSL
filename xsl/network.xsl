<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<table align="center" border="1"
					font-family="arial, sans-serif;" border-collapse="collapse;"
					width="50%;" height="50%;">
					<tr bgcolor="#9acd32">

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

				<xsl:choose>

					<xsl:when test="ip">
						<xsl:value-of select="ip" />
					</xsl:when>

					<xsl:otherwise>
						<p>N/A</p>
					</xsl:otherwise>

				</xsl:choose>

			</td>

			<td>
				<xsl:value-of select="location" />
			</td>

		</tr>

	</xsl:template>

</xsl:stylesheet>
