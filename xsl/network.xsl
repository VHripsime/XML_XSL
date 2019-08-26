<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="equipment/network/hubs">
		<html>
			<body>
				<h2>My CD Collection</h2>
				<table border="1">
					<tr bgcolor="#9acd32">
						<th>Name</th>
						<th>Equipment type</th>
						<th>Port number
						</th>
						<th>IP address</th>
						<th>Location</th>
					</tr>
					<tr>
						<td>
							<xsl:apply-templates />
						</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="type">
		<xsl:value-of select="." />
	</xsl:template>

</xsl:stylesheet>
