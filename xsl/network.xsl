<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


	<xsl:template match="/">
		<html>
			<head>
			</head>
			<body>

				<xsl:apply-templates />

			</body>
		</html>
	</xsl:template>


	<xsl:template match="equipment">
		<table border='1'>
			<tr>
				<th>#</th>
				<th>Name</th>
				<th>Equipment type</th>
				<th>Port number</th>
				<th>IP address</th>
				<th>Location</th>
			</tr>
                     
			<xsl:for-each select="network/hubs/hub">
				<tr>
					<td>
						<xsl:number />
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
						<xsl:value-of select="ip" />
					</td>
					<td>
						<xsl:value-of select="location" />
					</td>
				</tr>
			</xsl:for-each>

			<xsl:for-each select="network/commutators/commutator">
				<tr>
					<td>
						<xsl:number />
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
						<xsl:value-of select="ip" />
					</td>
					<td>
						<xsl:value-of select="location" />
					</td>
				</tr>
			</xsl:for-each>

			<xsl:for-each select="network/routers/router">
				<tr>
					<td>
						<xsl:number />
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
						<xsl:value-of select="ip" />
					</td>
					<td>
						<xsl:value-of select="location" />
					</td>
				</tr>
			</xsl:for-each>


		</table>
	</xsl:template>

</xsl:stylesheet>