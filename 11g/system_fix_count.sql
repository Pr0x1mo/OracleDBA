-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Provides information about system fixes per version.
-- Requirements : Access to the V$ views.
-- Call Syntax  : @system_fix_count
-- Last Modified: 30/11/2011
-- -----------------------------------------------------------------------------------
SELECT optimizer_feature_enable,
       COUNT(*)
FROM   v$system_fix_control
GROUP BY optimizer_feature_enable
ORDER BY optimizer_feature_enable;
