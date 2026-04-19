@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TS Calendar Date'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CALENDARDATE
  as select from I_CalendarDate
{
  key CalendarDate              as CalendarDate,
      CalendarYear              as CalendarYear,
      CalendarMonth             as CalendarMonth,
      CalendarDay               as CalendarDay,

      case
      when CalendarMonth = '01' then
       concat_with_space(
           (concat(concat_with_space('Jan', CalendarDay, 1), ',')),
           CalendarYear, 1
      )
      when CalendarMonth = '02' then
       concat_with_space(
           (concat(concat_with_space('Feb', CalendarDay, 1), ',')),
           CalendarYear, 1
      )
            when CalendarMonth = '03' then
       concat_with_space(
           (concat(concat_with_space('Mar', CalendarDay, 1), ',')),
           CalendarYear, 1
      )
            when CalendarMonth = '04' then
       concat_with_space(
           (concat(concat_with_space('Apr', CalendarDay, 1), ',')),
           CalendarYear, 1
      )
            when CalendarMonth = '05' then
       concat_with_space(
           (concat(concat_with_space('May', CalendarDay, 1), ',')),
           CalendarYear, 1
      )
            when CalendarMonth = '06' then
       concat_with_space(
           (concat(concat_with_space('Jun', CalendarDay, 1), ',')),
           CalendarYear, 1
      )
            when CalendarMonth = '07' then
       concat_with_space(
           (concat(concat_with_space('Jul', CalendarDay, 1), ',')),
           CalendarYear, 1
      )
            when CalendarMonth = '08' then
       concat_with_space(
           (concat(concat_with_space('Aug', CalendarDay, 1), ',')),
           CalendarYear, 1
      )
            when CalendarMonth = '09' then
       concat_with_space(
           (concat(concat_with_space('Sep', CalendarDay, 1), ',')),
           CalendarYear, 1
      )
            when CalendarMonth = '10' then
       concat_with_space(
           (concat(concat_with_space('Oct', CalendarDay, 1), ',')),
           CalendarYear, 1
      )
            when CalendarMonth = '11' then
       concat_with_space(
           (concat(concat_with_space('Nov', CalendarDay, 1), ',')),
           CalendarYear, 1
      )
                  when CalendarMonth = '12' then
       concat_with_space(
           (concat(concat_with_space('Dec', CalendarDay, 1), ',')),
           CalendarYear, 1
      )
      end                       as DatewithMonthName,


      case
      when WeekDay = '6' then
      dats_add_days(FirstDayOfWeekDate, +5, 'INITIAL')
      when WeekDay = '7' then
      dats_add_days(FirstDayOfWeekDate, +5, 'INITIAL')
      else
      dats_add_days(FirstDayOfWeekDate, -2, 'INITIAL')
      end                       as FirstDayOfWeekDate,

      case
      when WeekDay = '6' then
      dats_add_days(FirstDayOfWeekDate, +11, 'INITIAL')
      when WeekDay = '7' then
      dats_add_days(FirstDayOfWeekDate, +11, 'INITIAL')
      else
      dats_add_days(FirstDayOfWeekDate, +4, 'INITIAL')
      end                       as LastDayofWeekDate,

      cast( ( case
      when WeekDay = '6' then
      dats_add_days(FirstDayOfWeekDate, +5, 'INITIAL')
      when WeekDay = '7' then
      dats_add_days(FirstDayOfWeekDate, +5, 'INITIAL')
      else
      dats_add_days(FirstDayOfWeekDate, -2, 'INITIAL')
      end ) as abap.char( 8 ) ) as YearWeek,

      CalendarQuarter,
      CalendarWeek,

      YearMonth,
      YearQuarter,

      WeekDay,

      FirstDayOfMonthDate,
      CalendarDayOfYear,
      YearDay,

      /* Associations */
      _CalendarMonth,
      _CalendarQuarter,
      _CalendarYear,
      _WeekDay,
      _YearMonth

} //where CalendarDate > '20240101' 
where CalendarDate between dats_add_months( $session.system_date, -12, 'INITIAL' ) and dats_add_months( $session.system_date, +1, 'INITIAL' )
