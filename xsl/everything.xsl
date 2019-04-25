<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="network.xsl" />

	<xsl:template match="/">

		<html>
			<head>
				<title>Everything</title>
			</head>
			<body>

				<xsl:apply-templates select="equipment/computers" />

				<xsl:apply-imports />

				<xsl:apply-templates select="equipment/peripherals" />
					
			</body>
		</html>
	</xsl:template>


	<xsl:template match="computers">
		<h4>Computers</h4>
		<table border="1">
			<tr bgcolor="#1D79E7">

				<th>#</th>
				<th>Name</th>
				<th>Type</th>
				<th>Hardware</th>
				<th>Software</th>
			</tr>
			<xsl:apply-templates select="computer" />
		</table>
	</xsl:template>

	<xsl:template match="computer">

		<tr>
			<td>
				<xsl:value-of select="position()" />
			</td>
			<td>
				<xsl:value-of select="@networkname" />
			</td>
			<td>
				<xsl:value-of select="@type" />
			</td>
			<td>
				<xsl:apply-templates select="hardware" />
			</td>
			<td>
				<br />
				<xsl:apply-templates select="software" />
			</td>

		</tr>
	</xsl:template>

	<xsl:template match="hardware">

		<br />
		<xsl:value-of select="cpu/@type" />
		<br />
		<xsl:value-of select="cpu/@mhzclock" />
		<br />
		<xsl:value-of select="ram/@amount" />
		<br />
		<xsl:value-of select="ram/@type" />
		<br />
		<xsl:value-of select="storage/@space" />
		<xsl:apply-templates select="drives/drive" />
		<br />

	</xsl:template>

	<xsl:template match="drive">
		<br />
		<xsl:value-of select="@type" />
		&#160;
		<xsl:value-of select="@formfactor" />
		&#160;
		<xsl:value-of select="@size" />
	</xsl:template>

	<xsl:template match="software/*">
		<xsl:value-of select="@type" />
		<br />
		<xsl:value-of select="title" />
	</xsl:template>

	<xsl:template match="peripherals">
		<h4> Peripherals</h4>
		<table border="1">

			<tr bgcolor="#1D79E7">
				<th>#</th>
				<th>Name</th>
				<th>Type</th>
				<th>Location</th>
			</tr>

			<xsl:apply-templates select="./*/*" />
		</table>
	</xsl:template>

	<xsl:template match="printer | scanner | copier">
		<tr>
			<td>
				<xsl:value-of select="position()" />
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

</xsl:stylesheet>