<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>

				<h2>Processors</h2>

				<table border="1" cellspacing="0" cellpadding="2">
					<tr bgcolor="#DCDCDC">
						<th>#</th>
						<th>Processor type</th>
						<th>Amount of computers</th>
					</tr>

					<xsl:apply-templates
						select="equipment/computers" />
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="computers">
		<tr>
			<td>1</td>
			<td>Pentuim2</td>
			<td>
				<xsl:value-of
					select="count(.//cpu[@type = 'Pentium2'])" />
			</td>
		</tr>

		<tr>
			<td>2</td>
			<td>Pentuim3</td>
			<td>
				<xsl:value-of
					select="count(.//cpu[@type = 'Pentium3'])" />
			</td>
		</tr>

		<tr>
			<td>3</td>
			<td>Other types</td>
			<td>
				<xsl:value-of
					select="count(.//cpu[@type != 'Pentium2' and @type !='Pentium3'])" />
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>










