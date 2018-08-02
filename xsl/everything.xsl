<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<style>
					h5{
					color: red;
					}

				</style>
				<h1>Everything</h1>
				<table border="1">
					<tr bgcolor="aqua">
						<th style="text-align:left">#</th>
						<th style="text-align:left">Name</th>
						<th style="text-align:left">Type</th>
						<th style="text-align:left">Hardware</th>
						<th style="text-align:left">Software</th>
					</tr>
					<xsl:apply-templates select="//computer" />
				</table>
			</body>
		</html>
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
				<h5>Computer:</h5>
				<xsl:value-of select="hardware/cpu/@type" />
				\
				<xsl:value-of select="hardware/cpu/@mhzclock" />

				<h5>Ram:</h5>
				<xsl:value-of select="hardware/ram/@amount" />
				\
				<xsl:value-of select="hardware/ram/@type" />

				<xsl:if test="hardware/soundcard">
					<h5>Soundcard:</h5>
					<xsl:value-of select="hardware/soundcard" />
				</xsl:if>
				<xsl:if test="//drive">
					<h5>drives:</h5>
					<xsl:if test="hardware/drives/drive/@type = 'floppy'">

						<xsl:value-of select="hardware/drives/drive/@type" />
						\

						<xsl:value-of select="hardware/drives/drive/@formfactor" />
						\


						<xsl:value-of select="hardware/drives/drive/@size" />
						<br />

					</xsl:if>
				</xsl:if>
				<xsl:if test="hardware/drives/drive/@type = 'cd'">
					<xsl:value-of select="hardware/drives/drive[@type = 'cd']/@type" />
					<br />
				</xsl:if>
				<xsl:if test="hardware/drives/drive/@type = 'tape'">
					<xsl:value-of select="hardware/drives/drive[@type = 'tape']/@type" />
					/
				</xsl:if>
				<xsl:if test="hardware/drives/drive/@size = '10G'">
					<xsl:value-of select="hardware/drives/drive[@size = '10G']/@size" />
					/
				</xsl:if>
			</td>


			<td>
				<xsl:template match="software" />

				<xsl:value-of select="@type" />
				<br />
				<xsl:value-of select="." />
				<br />


				<xsl:template match="servicepack" />
				<xsl:choose>
					<xsl:when test="@type">
						<xsl:value-of select="@name" />
						<xsl:value-of select="@type" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="@name" />
					</xsl:otherwise>
				</xsl:choose>


			</td>
		</tr>

	</xsl:template>
</xsl:stylesheet>