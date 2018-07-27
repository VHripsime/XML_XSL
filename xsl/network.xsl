<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<table border="1" cellspacing="0" cellpadding="2">
					<tr>
						<th>#</th>
						<th>Name</th>
						<th>Equipment type</th>
						<th>Port number</th>
						<th>IP address</th>
						<th>Location</th>

					</tr>
					<xsl:apply-templates
						select="equipment/network//hub | //commutator | //router">
						<xsl:sort select="type" />
					</xsl:apply-templates>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="hub | commutator | router">
		<tr>
			<td>
				<xsl:value-of select="position()" />
			</td>
			<td>
				<xsl:value-of select="type" />
			</td>
			<td>
				<xsl:value-of select="name()"/>
			</td>

			<xsl:choose>
				<xsl:when test="port">
					<td>
						<xsl:value-of select="port" />
					</td>
				</xsl:when>
				<xsl:otherwise>
					<td>
						<br />
					</td>
				</xsl:otherwise>
			</xsl:choose>

			<xsl:choose>
				<xsl:when test="ip">
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