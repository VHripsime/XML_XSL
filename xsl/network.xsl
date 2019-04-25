<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">

		<html>
			<head>
				<title> Network</title>
			</head>
			<body>
				<h4> Network</h4>
				<table border="1">
					<tr bgcolor="#9acd32">
						<th> #</th>
						<th>Name</th>
						<th>Equipment type</th>
						<th>Port Number</th>
						<th>IP address</th>
						<th>Location</th>
					</tr>

					<xsl:apply-templates select="equipment/network" />
				</table>
			</body>
		</html>
	</xsl:template>


	<xsl:template match="network">
		<xsl:apply-templates select="./*/*">
			<xsl:sort select="type" />

		</xsl:apply-templates>

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

			<td>
				<xsl:value-of select="port" />
			</td>

			<td>
				<xsl:choose>
					<xsl:when test="ip !='' ">
						<xsl:value-of select="ip" />
					</xsl:when>

					<xsl:otherwise>
						N/A
					</xsl:otherwise>

				</xsl:choose>

			</td>

			<td>
				<xsl:value-of select="location" />
			</td>

		</tr>

	</xsl:template>

</xsl:stylesheet> 