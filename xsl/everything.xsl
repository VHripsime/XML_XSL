<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<h1>Network</h1>
				<table border="1">
					<tr bgcolor="aqua">
						<th style="text-align:left">#</th>
						<th style="text-align:left">Name</th>
						<th style="text-align:left">Type</th>
						<th style="text-align:left">Hardware</th>
						<th style="text-align:left">Software</th>
					</tr>
					<xsl:apply-templates select="//computer" />
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="computer">
		<tr>
			<td>
				<xsl:value-of select="position()"/>
			</td>

			<td>
				<xsl:value-of select="@networkname"/>
			</td>
			<td>
				<xsl:value-of select="@type"/>
			</td>
			<td>
				<xsl:value-of select="/hardware/@*"/>
			</td>
		</tr>

	</xsl:template>
</xsl:stylesheet>