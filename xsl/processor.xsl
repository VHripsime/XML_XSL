<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>

				<h2>Processors</h2>
				<table border='1' cellpadding="4">
					<tr bgcolor="#ebf5fb">
						<th width='19px'>#</th>
						<th>Processor type</th>
						<th width='100px'>Amount of computers</th>
					</tr>

					<xsl:apply-templates select="equipment/computers" />

				</table>
			</body>
		</html>
	</xsl:template>


	<xsl:template match="computers">
		<xsl:for-each select="$elements">

			<xsl:call-template name="typeAndQuantity">
				<xsl:with-param name="index" select="position()" />
			</xsl:call-template>

		</xsl:for-each>
	</xsl:template>


	<xsl:template name="typeAndQuantity">
		<xsl:param name="index" />
		<tr>
			<td align="center">
				<xsl:number value="position()" />
			</td>
			<td>
				<xsl:value-of select="$elements[$index]/@name" />
			</td>
			<td align="center">
				<xsl:value-of select="count(//*/*/hardware/cpu[@type=$elements[$index]])" />
			</td>
		</tr>
	</xsl:template>


	<xsl:param name="elements" select="document('')/*/xsl:variable[@name='processors']/*" />

	<xsl:variable name="processors">
		<item name="Pentium 2">Pentium2</item>
		<item name="Pentium 3">Pentium3</item>
		<item name="Other types">Pentium4</item>
	</xsl:variable>

</xsl:stylesheet>