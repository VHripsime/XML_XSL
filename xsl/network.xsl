<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">

		<html>
			<head>
				<h1>Trials</h1>
			</head>
			<body>
				<table border='2'>
					<tr>
						<xsl:apply-templates />
					</tr>
				</table>

			</body>
		</html>

	</xsl:template>


	<xsl:template match="computer">
		<td>
			<xsl:value-of select="software/title" />
		</td>
	</xsl:template>
</xsl:stylesheet>