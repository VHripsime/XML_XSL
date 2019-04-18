<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


	<xsl:template match="/">
		<html>
			<body>
				<xsl:apply-templates select="equipment" />
			</body>
		</html>
	</xsl:template>


	<xsl:template match="equipment">
		<table border='1'>
			<tr>
				<th>AAA</th>
				<th>BBB</th>
				<th>CCC</th>
			</tr>						
					
			<xsl:apply-templates select="network" />
					
		</table>
	</xsl:template>


	<xsl:template match="network" name='repeat'>
		<xsl:param name="start" select="1" />
		<xsl:param name="end" select="3" />

		<tr>
			<td><xsl:number value="position()" /></td>
			<td>B</td>
			<td>C</td>
		</tr>

		<xsl:if test="$end &gt; $start">
			<xsl:call-template name="repeat">
				<xsl:with-param name="start" select="$start + 1" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>