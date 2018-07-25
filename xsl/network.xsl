<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<table border="1" cellspacing="0" cellpadding="2">
					<tr>
						<th>Name</th>
						<th>Equipment type</th>
						<th>Port number</th>
						<th>IP address</th>
						<th>Locationx</th>
					</tr>
					
					<xsl:apply-templates select="equipment/network//hub | //commutator | //router">
						<xsl:sort select="type" />
					</xsl:apply-templates>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="hub | //commutator | //router">
		<tr>
			<xsl:apply-templates select="type" />
		</tr>
	</xsl:template>

</xsl:stylesheet>