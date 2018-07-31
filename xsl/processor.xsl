<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<table border="1">
					<tr bgcolor="aqua">
						<th style="text-align:left">#</th>
						<th style="text-align:left">Processor type</th>
						<th style="text-align:left">Amount of computers</th>
					</tr>

					<xsl:apply-templates select="// hardware" />
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="hardware">

		<xsl:for-each select="//hardware[@cup = 'Pentium2']">

			<tr>
				<td>
					<xsl:value-of select="position()" />
				</td>
				<td>
					<xsl:value-of select="@type"/>
				</td>
				
			</tr>
		</xsl:for-each>



	</xsl:template>
</xsl:stylesheet>						