<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="network.xsl" />

	<xsl:template match='/'>
		<html>
			<body>

				<xsl:apply-imports />
				<br />
				<xsl:apply-templates select="equipment/peripherals" />
				<br />
				<xsl:apply-templates select="equipment/computers" />

			</body>
		</html>
	</xsl:template>


	<xsl:template match='peripherals'>
		<h2>Peripherals</h2>
		<table border='1' cellpadding="8">

			<tr bgcolor="#d4e6f1">
				<th align="center">#</th>
				<th>Name</th>
				<th>Type</th>
				<th>Location</th>
			</tr>

			<xsl:apply-templates select='./*/*' />

		</table>
	</xsl:template>


	<xsl:template match="printer | scanner | copier">
		<tr>
			<td align="center">
				<xsl:number value="position()" />
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="@networkname">
						<xsl:value-of select="@networkname" />
					</xsl:when>
					<xsl:otherwise>
						N/A
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:value-of select="type" />
			</td>
			<td>
				<xsl:value-of select="location" />
			</td>
		</tr>
	</xsl:template>


	<xsl:template match="computers">
		<h2>Computers</h2>
		<table border='1' cellpadding="6">

			<tr bgcolor="#5499c7">
				<th align="center">#</th>
				<th>Name</th>
				<th>Type</th>
				<th>Hardware</th>
				<th>Software</th>
			</tr>

			<xsl:apply-templates select='./*' />

		</table>
	</xsl:template>


	<xsl:template match="computer">
		<tr>
			<td align="center">
				<xsl:number value="position()" />
			</td>
			<td>
				<xsl:value-of select="@networkname" />
			</td>
			<td>
				<xsl:value-of select="@type" />
			</td>
			<td>
				<xsl:apply-templates select='hardware/*' />
			</td>
			<td valign="top">
				<xsl:apply-templates select='software/*' />
			</td>
		</tr>
	</xsl:template>


	<xsl:template match="hardware/*">
		<b>	<xsl:value-of select="name()" /> </b>
		<br />
		
		<xsl:choose>		
			
			<xsl:when test="@*">				
				<xsl:apply-templates select="@*" />
				<hr />
			</xsl:when>

			<xsl:when test="./*">
				<xsl:apply-templates select="drive" />
			</xsl:when>

			<xsl:otherwise>
				<xsl:value-of select="." />
				<br /> <hr />
			</xsl:otherwise>
		
		</xsl:choose>
	</xsl:template>


	<xsl:template match="software/*">
		<b>	<xsl:value-of select="@type" />	</b>
		<br />
		<xsl:value-of select="title" />
		<br /> <hr />
	</xsl:template>


	<xsl:template match="@*">
		<xsl:value-of select="name()" />
		-
		<xsl:value-of select="." />,
	</xsl:template>


	<xsl:template match="drive">
		<xsl:apply-templates select="@*" />
		<br />
	</xsl:template>


</xsl:stylesheet>