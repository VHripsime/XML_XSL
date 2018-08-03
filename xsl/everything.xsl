<?xml version="1.0" encoding="UTF-8"?>
<!-- In this task we create tables and put into about computer parameters, 
		Network equipment and Peripherals -->
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
				<h1>Computers</h1>
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

				<h1>Network equipment</h1>
				<table border="1">
					<tr bgcolor="aqua">
						<th style="text-align:left">#</th>
						<th style="text-align:left">Name</th>
						<th style="text-align:left">Equipment type</th>
						<th style="text-align:left">Port number</th>
						<th style="text-align:left">IP address</th>
						<th style="text-align:left">Location</th>
					</tr>

					<xsl:apply-templates select="//hub | // commutator | //router">
						<xsl:sort select="type"></xsl:sort>
					</xsl:apply-templates>

				</table>

				<h1>Peripherals</h1>
				<table border="1">
					<tr bgcolor="aqua">
						<th style="text-align:left">#</th>
						<th style="text-align:left">Name</th>
						<th style="text-align:left">Type</th>
						<th style="text-align:left">Location</th>
					</tr>
					<xsl:apply-templates select="//printer| //scanner | //copier">
						<xsl:sort select="location"></xsl:sort>
					</xsl:apply-templates>
				</table>
			</body>
		</html>
	</xsl:template>
<!--  Computers -->
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
				<xsl:for-each select="software/node()">
					<p>
						<xsl:value-of select="@type" />
						/
						<xsl:value-of select="." />
						/
						<xsl:for-each select="servicepacks/node()">
							<xsl:choose>
								<xsl:when test="@type">
									<xsl:value-of select="@name" />
									/
									<xsl:value-of select="@type" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@name" />
								</xsl:otherwise>
							</xsl:choose>

						</xsl:for-each>
					</p>
				</xsl:for-each>
			</td>
		</tr>

	</xsl:template>
<!--  Network -->
	<xsl:template match="hub | commutator | router">
		<tr>
			<td>
				<xsl:value-of select="position()" />
			</td>

			<td>
				<xsl:value-of select="type" />
			</td>

			<td>
				<xsl:value-of select="name()" />
			</td>
			<xsl:choose>

				<xsl:when test="port">
					<td>
						<xsl:value-of select="port" />
					</td>
				</xsl:when>

				<xsl:otherwise>
					<td></td>
				</xsl:otherwise>

			</xsl:choose>

			<xsl:choose>
				<xsl:when test="ip">
					<td>
						<xsl:value-of select="ip" />
					</td>
				</xsl:when>

				<xsl:otherwise>
					<td>N/A</td>
				</xsl:otherwise>

			</xsl:choose>
			<td>
				<xsl:value-of select="location" />
			</td>
		</tr>
	</xsl:template>

<!-- Peripherals -->
	<xsl:template match="printer| scanner | copier">

		<tr>
			<td>
				<xsl:value-of select="position()" />
			</td>

			<xsl:choose>

				<xsl:when test="@networkname">
					<td>
						<xsl:value-of select="@networkname" />
					</td>
				</xsl:when>

				<xsl:otherwise>
					<td>N/A</td>
				</xsl:otherwise>

			</xsl:choose>

			<td>
				<xsl:value-of select="type" />
			</td>

			<td>
				<xsl:value-of select="location" />
			</td>

		</tr>
	</xsl:template>
</xsl:stylesheet>