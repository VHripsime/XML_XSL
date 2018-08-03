<?xml version="1.0" encoding="UTF-8"?>
<!-- In this task we create table and put into about Network equipment -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<h1>Network equipment</h1>
				<table border="1">
					<tr bgcolor="aqua">
						<th style="text-align:left">#</th>
						<th style="text-align:left">Name</th>
						<th style="text-align:left">Equipment type</th>
						<th style="text-align:left">Port number</th>
						<th style="text-align:left">IP address</th>
						<th style="text-align:left">Location</th>
					</tr>

					<xsl:apply-templates select="//hub | // commutator | //router">
						<xsl:sort select="type"></xsl:sort>
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
				<xsl:value-of select="name()" />
			</td>
			<xsl:choose>

				<xsl:when test="port">
					<td>
						<xsl:value-of select="port" />
					</td>
				</xsl:when>

				<xsl:otherwise>
					<td></td>
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



