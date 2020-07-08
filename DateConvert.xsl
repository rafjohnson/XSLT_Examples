  <xsl:template name="DateConvert">
    <xsl:param name="InputFormat"/>
    <!--Current Options: ddMMMyyyy, yyyyMMdd,MM/dd/yyyy, yyyy-MM-dd, yyyy-MM-dd hh:mm:ss-->
    <xsl:param name="OutputFormat"/>
    <!--Current Options: yyyyMMdd, yyyyMMddhhmm , MM/dd/yyyy, yyyyMMddhhmmss-->
    <xsl:param name="InputDateString"/>


    <!--Input = ddMMyyyy-->
    <xsl:choose>
      <xsl:when test="$InputFormat = 'ddMMMyyyy'">
        <!--Fill Date Parts-->
        <xsl:variable name="year" select="substring($InputDateString,6,4)"/>
        <xsl:variable name="month">
          <xsl:variable name="month_upper">
            <xsl:call-template name="toUpper">
              <xsl:with-param name="string" select="substring($InputDateString,3,3)"/>
            </xsl:call-template>
          </xsl:variable>

          <xsl:choose>
            <xsl:when test="$month_upper='JAN'">
              <xsl:value-of select="'01'"/>
            </xsl:when>
            <xsl:when test="$month_upper='FEB'">
              <xsl:value-of select="'02'"/>
            </xsl:when>
            <xsl:when test="$month_upper='MAR'">
              <xsl:value-of select="'03'"/>
            </xsl:when>
            <xsl:when test="$month_upper='APR'">
              <xsl:value-of select="'04'"/>
            </xsl:when>
            <xsl:when test="$month_upper='MAY'">
              <xsl:value-of select="'05'"/>
            </xsl:when>
            <xsl:when test="$month_upper='JUN'">
              <xsl:value-of select="'06'"/>
            </xsl:when>
            <xsl:when test="$month_upper='JUL'">
              <xsl:value-of select="'07'"/>
            </xsl:when>
            <xsl:when test="$month_upper='AUG'">
              <xsl:value-of select="'08'"/>
            </xsl:when>
            <xsl:when test="$month_upper='SEP'">
              <xsl:value-of select="'09'"/>
            </xsl:when>
            <xsl:when test="$month_upper='OCT'">
              <xsl:value-of select="'10'"/>
            </xsl:when>
            <xsl:when test="$month_upper='NOV'">
              <xsl:value-of select="'11'"/>
            </xsl:when>
            <xsl:when test="$month_upper='DEC'">
              <xsl:value-of select="'12'"/>
            </xsl:when>

          </xsl:choose>
        </xsl:variable>

        <xsl:variable name="day" select="substring($InputDateString,1,2)"/>

        <!--Output formats-->
        <xsl:choose>
          <xsl:when test="$OutputFormat = 'yyyyMMdd'">
            <xsl:value-of select="concat($year,$month,$day)"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'yyyyMMddhhmm'">
            <xsl:value-of select="concat($year,$month,$day,'00','00')"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'MM/dd/yyyy'">
            <xsl:value-of select="concat($month,'/',$day,'/',$year)"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'yyyyMMddhhmmss'">
            <xsl:value-of select="concat($year,$month,$day,'00','00','00')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="''"/>
          </xsl:otherwise>
        </xsl:choose>

      </xsl:when>
      <!--End Input = ddMMyyyy-->


      <!--Input = yyyyMMdd-->
      <xsl:when test="$InputFormat = 'yyyyMMdd'">
        <!--Input Variables-->
        <xsl:variable name="year">
          <xsl:value-of select="substring($InputDateString,1,4)"/>
        </xsl:variable>
        <xsl:variable name="month">
          <xsl:value-of select ="substring($InputDateString,5,2)"/>
        </xsl:variable>
        <xsl:variable name="day">
          <xsl:value-of select="substring($InputDateString,7,2)"/>
        </xsl:variable>

        <!--Output Formats-->
        <xsl:choose>
          <xsl:when test="$OutputFormat = 'yyyyMMdd'">
            <xsl:value-of select="concat($year,$month,$day)"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'yyyyMMddhhmm'">
            <xsl:value-of select="concat($year,$month,$day,'00','00')"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'MM/dd/yyyy'">
            <xsl:value-of select="concat($month,'/',$day,'/',$year)"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'yyyyMMddhhmmss'">
            <xsl:value-of select="concat($year,$month,$day,'00','00','00')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="''"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <!--End Input = yyyyMMdd-->

      <!--Input format: yyyy-MM-dd-->
      <xsl:when test="$InputFormat='yyyy-MM-dd'">

        <xsl:variable name="year" select="substring(concat('0000',(substring-before($InputDateString,'-'))),string-length(substring-before($InputDateString,'-'))+1,4)"/>
        <xsl:variable name="month" select ="substring(concat('00',(substring-before(substring-after($InputDateString,'-'), '-'))),string-length(substring-before(substring-after($InputDateString,'-'), '-'))+1,2)"/>
        <xsl:variable name ="day">
          <xsl:call-template name="substring-after-last">
            <xsl:with-param name="string" select="$InputDateString"/>
            <xsl:with-param name="delimiter" select="'-'"/>
          </xsl:call-template>
        </xsl:variable>

        <!--Output Formats-->
        <xsl:choose>
          <xsl:when test="$OutputFormat = 'yyyyMMdd'">
            <xsl:value-of select="concat($year,$month,$day)"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'yyyyMMddhhmm'">
            <xsl:value-of select="concat($year,$month,$day,'00','00')"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'MM/dd/yyyy'">
            <xsl:value-of select="concat($month,'/',$day,'/',$year)"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'yyyyMMddhhmmss'">
            <xsl:value-of select="concat($year,$month,$day,'00','00','00')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="''"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <!--End Input format: yyyy-MM-dd-->


      <!--Input Format: MM/dd/yyyy-->
      <xsl:when test="$InputFormat='MM/dd/yyyy'">

        <xsl:variable name="month" select="substring(concat('00',(substring-before($InputDateString,'/'))),string-length(substring-before($InputDateString,'/'))+1,2)"/>
        <xsl:variable name="day" select ="substring(concat('00',(substring-before(substring-after($InputDateString,'/'), '/'))),string-length(substring-before(substring-after($InputDateString,'/'), '/'))+1,2)"/>
        <xsl:variable name ="year">
          <xsl:call-template name="substring-after-last">
            <xsl:with-param name="string" select="$InputDateString"/>
            <xsl:with-param name="delimiter" select="'/'"/>
          </xsl:call-template>
        </xsl:variable>

        <!--Output formats-->
        <xsl:choose>
          <xsl:when test="$OutputFormat = 'yyyyMMdd'">
            <xsl:value-of select="concat($year,$month,$day)"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'yyyyMMddhhmm'">
            <xsl:value-of select="concat($year,$month,$day,'00','00')"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'MM/dd/yyyy'">
            <xsl:value-of select="concat($month,'/',$day,'/',$year)"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'yyyyMMddhhmmss'">
            <xsl:value-of select="concat($year,$month,$day,'00','00','00')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="''"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <!--End Input Format: MM/dd/yyyy-->

      <!--Input Format: yyyy-MM-dd HH:mm:ss (24Hr format)-->
      <xsl:when test="$InputFormat = 'yyyy-MM-dd HH:mm:ss'">

        <xsl:variable name="datePart">
          <xsl:value-of select="substring-before($InputDateString,' ')"/>
        </xsl:variable>

        <xsl:variable name="timePart">
          <xsl:value-of select="substring-after($InputDateString,' ')"/>
        </xsl:variable>

        <xsl:variable name="year" select="substring(concat('0000',(substring-before($datePart,'-'))),string-length(substring-before($datePart,'-'))+1,4)"/>
        <xsl:variable name="month" select ="substring(concat('00',(substring-before(substring-after($datePart,'-'), '-'))),string-length(substring-before(substring-after($datePart,'-'), '-'))+1,2)"/>
        <xsl:variable name ="day">
          <xsl:call-template name="substring-after-last">
            <xsl:with-param name="string" select="$datePart"/>
            <xsl:with-param name="delimiter" select="'-'"/>
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="hour" select="substring(concat('00',(substring-before($timePart,':'))),string-length(substring-before($timePart,':'))+1,2)"/>
        <xsl:variable name="minute" select="substring(concat('00',(substring-before(substring-after($timePart,':'), ':'))),string-length(substring-before(substring-after($timePart,':'), ':'))+1,2)"/>
        <xsl:variable name="second">
          <xsl:call-template name="substring-after-last">
            <xsl:with-param name="string" select="$timePart"/>
            <xsl:with-param name="delimiter" select="':'"/>
          </xsl:call-template>
        </xsl:variable>

        <!--Output formats-->
        <xsl:choose>
          <xsl:when test="$OutputFormat = 'yyyyMMdd'">
            <xsl:value-of select="concat($year,$month,$day)"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'yyyyMMddhhmm'">
            <xsl:value-of select="concat($year,$month,$day,$hour,$minute)"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'MM/dd/yyyy'">
            <xsl:value-of select="concat($month,'/',$day,'/',$year)"/>
          </xsl:when>
          <xsl:when test="$OutputFormat = 'yyyyMMddhhmmss'">
            <xsl:value-of select="concat($year,$month,$day,$hour,$minute,$second)"/>
          </xsl:when>

          <xsl:otherwise>
            <xsl:value-of select="''"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>

      <!--If Input format doesn't match anything-->
      <xsl:otherwise>
        <xsl:variable name="empty"/>
        <xsl:value-of select="$empty"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
