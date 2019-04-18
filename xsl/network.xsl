<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">

		<html>
			<head>
				<title> Network</title>
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

                  <xsl:apply-templates></xsl:apply-templates>
				</table>
			</body>
		</html>
	</xsl:template>
	
	
	<xsl:template match="equipment">

		<xsl:for-each select="network/*/*">
		<xsl:sort select="port"/>
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
					<xsl:value-of select="ip" />
				</td>

				<td>
					<xsl:value-of select="location" />
				</td>

			</tr>

		</xsl:for-each>


	</xsl:template>



</xsl:stylesheet> 