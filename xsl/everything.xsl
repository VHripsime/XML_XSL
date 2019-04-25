<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="network.xsl" />

	<xsl:template match="/">
		<html>
			<body>
				<h2>Computers</h2>
				<table border="1" cellspacing="0" cellpadding="2">
					<tr bgcolor="#DCDCDC">
						<th>#</th>
						<th>Name</th>
						<th>Type</th>
						<th>Hardware</th>
						<th>Software</th>
					</tr>
					<xsl:apply-templates
						select="equipment/computers/computer" />

				</table>
				<br />

				<xsl:apply-imports />


				<h2>Peripherals</h2>
				<table border="1" cellspacing="0" cellpadding="2">
					<tr bgcolor="#DCDCDC">
						<th>#</th>
						<th>Name</th>
						<th>Type</th>
						<th>Location</th>
					</tr>

					<xsl:apply-templates
						select="equipment/peripherals/*/*" />

				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match='computer'>
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
				<p>
					<xsl:value-of select="hardware/cpu/@type" />
					&#160;
					<xsl:value-of select="hardware/cpu/@mhzclock" />
				</p>
				<p>
					<xsl:value-of select="hardware/ram/@amount" />
					&#160;
					<xsl:value-of select="hardware/ram/@type" />
				</p>
				<p>
					<xsl:value-of select="hardware/soundcard" />
				</p>
				<p>
					<xsl:value-of select="hardware/storage/@space" />
				</p>

				<p>
					<xsl:apply-templates select="*/drives" />
				</p>

			</td>

			<td>
				<p>
					<xsl:apply-templates select="software" />
				</p>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match='hardware/drives/drive'>
		<p>
			<xsl:value-of select="@type" />
			&#160;
			<xsl:value-of select="@formfactor" />
			&#160;
			<xsl:value-of select="@size" />
		</p>
	</xsl:template>

	<xsl:template match='*/item'>
		<p>
			<xsl:value-of select="@type" />
			&#160;
			<xsl:value-of select="vendor" />
			&#160;
			<xsl:value-of select="title" />
			&#160;
			<xsl:value-of select="version" />
		</p>
	</xsl:template>


	<xsl:template match='peripherals/*/*'>
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