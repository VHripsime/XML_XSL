<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<xsl:apply-templates select="equipment" />
			</body>
		</html>
	</xsl:template>

	<xsl:variable name="processorTypes" as="element()*">
		<Item>Pentium2</Item>
		<Item>Pentium3</Item>
		<Item>Other</Item>
	</xsl:variable>


	<xsl:template match='equipment'>
		<table border='1' cellpadding="4">
			<tr>
				<th>#</th>
				<th>Processor type</th>
				<th>Amount of computers</th>
			</tr>

			<xsl:for-each select="computers/computer">
				<tr>
					<td>
						<!-- <xsl:number value="position()" /> -->
						<xsl:value-of select='$processorTypes[0]' />
					</td>
					<td>
						<xsl:value-of select='$processorTypes[1]' />
					</td>
					<td>
						
						<xsl:value-of select='$processorTypes[2]' />
					</td>
				</tr>
			</xsl:for-each>

		</table>
	</xsl:template>


	<xsl:template match='hardware'>
		<xsl:param name="processor" />
		<xsl:value-of select="count(cpu[@type=$processor])" />
	</xsl:template>

</xsl:stylesheet>