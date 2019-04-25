<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>

				<h2>Networks</h2>
				<table border='1' cellpadding="4">

					<tr bgcolor=" #f4d03f ">
						<th width="30px" align="center">#</th>
						<th>Name</th>
						<th>Equipment type</th>
						<th>Port number</th>
						<th>IP address</th>
						<th width="80px">Location</th>
					</tr>

					<xsl:apply-templates select="equipment/network" />
				</table>

			</body>
		</html>
	</xsl:template>


	<xsl:template match='network'>
		<xsl:apply-templates select='./*/*'>
			<xsl:sort select="type" />
		</xsl:apply-templates>
	</xsl:template>


	<xsl:template match='hub | commutator | router'>
		<tr>
			<td align="center">
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
			<td align="center">
				<xsl:call-template name="ipInfo" />
			</td>
			<td align="center">
				<xsl:value-of select="location" />
			</td>
		</tr>
	</xsl:template>


	<xsl:template name="ipInfo">
		<xsl:choose>
			<xsl:when test="ip">
				<xsl:value-of select="ip" />
			</xsl:when>

			<xsl:otherwise>
				N/A
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>