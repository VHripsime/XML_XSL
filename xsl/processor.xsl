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


	<xsl:variable name="processorTypes">
		<item>Pentium2</item>
		<item>Pentium3</item>
		<item>Other</item>
	</xsl:variable>

	<xsl:param name="elements"
		select="document('')/*/xsl:variable[@name='processorTypes']/*" />

	<xsl:template match='equipment'>
		<table border='1'>
			<tr>
				<th>###</th>
				<th>Processor type</th>
				<th>Amount of computers</th>
			</tr>

			<!-- <xsl:apply-templates select="computers" /> -->

			<xsl:apply-templates select='computers' />

		</table>
	</xsl:template>


	<xsl:template match='computers' name="completeInfo">

		<!-- <xsl:param name="elementsLength" select="count($elements)" /> -->

		<tr>
			<td>
				<xsl:number name="current" value="position()" />
			</td>
			<td>
				<xsl:value-of select="$elements[$current]" />
			</td>
			<td>
				index:	<xsl:value-of select="$current" />
				<!-- <xsl:apply-templates select="computer"> <xsl:with-param name="processor" 
					select="$elements[$index]" /> </xsl:apply-templates> -->
			</td>
		</tr>

	</xsl:template>


	<xsl:template match='computer' name="single">
		<xsl:param name="index" select="0" />
		<tr>
			<td>
				<xsl:number name="current" value="position()" />
			</td>
			<td>
				<xsl:value-of select="$elements[$index]" />
			</td>
			<td>
				index:
				<xsl:value-of select="$current" />
				<!-- <xsl:apply-templates select="computer"> <xsl:with-param name="processor" 
					select="$elements[$index]" /> </xsl:apply-templates> -->
			</td>
		</tr>
	</xsl:template>

	<xsl:template match='hardware'>
		<xsl:param name="processor" />
		<xsl:value-of select="count(cpu[@type=$processor])" />
	</xsl:template>

</xsl:stylesheet>