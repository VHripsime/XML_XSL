<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="equipment">

		<html>
			<head>
				<titel> Network</titel>
			</head>
			<body>

				<table border="1">
					<tr bgcolor="#9acd32">
						<th> #</th>
						<th>Name</th>
						<th>Equipment type</th>
						<th>Port Number</th>
						<th>IP address</th>
						<th>Location</th>
					</tr>
					<!-- <tr>
						<td>1</td>
						<td><xsl:valoe-of select="network/commutators/commutator/type"/></td>
						<td>commutator</td>
						<td><xsl:valoe-of select="network/commutators/commutator/port"/></td>
						<td><xsl:valoe-of select="network/commutators/commutator/ip"/></td>
						<td><xsl:valoe-of select="network/commutators/commutator/location"/></td>
					</tr>  -->


				</table>
			</body>

		</html>
	</xsl:template>

 	<!-- <xsl:template match="network">
		<td>1</td>
		<td>
			<xsl:value-of select="hubs/hub/type" />
		</td>
		<td>hub</td>
		<td>
			<xsl:value-of select="port" />
		</td>
		<td>
			<xsl:value-of select="ip" />
		</td>
		<td>
			<xsl:value-of select="location" />
		</td>
	</xsl:template> 
 -->


</xsl:stylesheet> 