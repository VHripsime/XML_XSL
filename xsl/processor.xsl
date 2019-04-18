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
	<xsl:param name="elementsLength" select="$elements" />
	<xsl:param name="startIndex" select="1" />
	<xsl:param name="nextIndex" select="10" />

	<xsl:template match='equipment'>
		<table border='1'>
			<tr>
				<th>#</th>
				<th>Processor type</th>
				<th>Amount of computers</th>
			</tr>

			<tr>
				<td>
					<xsl:number value="position()" />
				</td>
				<td>
					length
				</td>
				<td>
					<xsl:value-of select="$elementsLength" />
					<!-- <xsl:apply-templates select="computers"> <xsl:with-param name="processor" 
						select="$elements[1]" /> </xsl:apply-templates> -->
				</td>
			</tr>

			<!-- <tr> <td> <xsl:number value="position()" /> </td> <td> <xsl:value-of 
				select="$elements[2]" /> </td> <td> <xsl:apply-templates select="computers"> 
				<xsl:with-param name="processor" select="$elements[2]" /> </xsl:apply-templates> 
				</td> </tr> -->
		</table>
	</xsl:template>


	<xsl:template match='computers'>
		<xsl:param name="processor" />
		<xsl:value-of
			select="count(computer/hardware/cpu[@type=$processor])" />
	</xsl:template>


	<!-- <xsl:template name="repeatable"> <xsl:param name="index" select="1" 
		/> <xsl:param name="total" select="10" /> Do something <xsl:if test="not($index 
		= $total)"> <xsl:call-template name="repeatable"> <xsl:with-param name="index" 
		select="$index + 1" /> </xsl:call-template> </xsl:if> </xsl:template> -->

</xsl:stylesheet>