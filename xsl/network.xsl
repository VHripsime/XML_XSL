<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="templates/networkTemplate.xsl"/>

	<xsl:template match="/">
		<html>
			<body>
				<xsl:apply-templates select="equipment"/>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>