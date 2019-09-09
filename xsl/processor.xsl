<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<table align="center" border="1"
					font-family="arial, sans-serif;" border-collapse="collapse;"
					width="50%;" height="50%;">
					<tr bgcolor="#9acd32">

						<th>#</th>
						<th>Processor type</th>
						<th>Amount of computers</th>
					</tr>
					<tr>
						<td>1</td>
						<td>
							Pentium2
						</td>
						<td>
							<xsl:value-of
								select="count(//cpu[@type='Pentium2'])" />
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td>
							Pentium3
						</td>
						<td>
							<xsl:value-of
								select="count(//cpu[@type='Pentium3'])" />
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td>Other Types</td>
						<td>
							<xsl:value-of
								select="count(//cpu[(@type!='Pentium2') and (@type!='Pentium3')])" />
						</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>