@echo off
title kdyMC 2.0 - Sunucu Konsolu
chcp 65001 > nul

echo ======================================================================
echo   [kdyMC 2.0] Sunucu Baslatiliyor... (10 GB RAM - Aikar + SIMD)
echo ======================================================================

set JAVA_EXEC=java
if exist "C:\Program Files\Android\openjdk\jdk-21.0.8\bin\java.exe" (
    set "JAVA_EXEC=C:\Program Files\Android\openjdk\jdk-21.0.8\bin\java.exe"
)

set JVM_FLAGS=-Xms10G -Xmx10G --add-modules=jdk.incubator.vector
set GC_FLAGS=-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1
set OTHER_FLAGS="-Dusing.aikars.flags=https://mcflags.emc.gs" "-Daikars.new.flags=true" "-Dpaper.disableChannelLimit=true" -Dfile.encoding=UTF-8 -Duser.language=en -Duser.country=US

"%JAVA_EXEC%" %JVM_FLAGS% %GC_FLAGS% %OTHER_FLAGS% -jar purpur-1.21.1-2329.jar --nogui

echo.
echo ======================================================================
echo   [kdyMC 2.0] Sunucu kapandi. Yeniden baslatmak icin bir tusa basin...
echo ======================================================================
pause
