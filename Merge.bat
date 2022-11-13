@echo off
del "Compiled.trigger"
for /r "C:\Users\Michael\Documents\GitHub\SCRGaiasTragedy\Triggers" %%a in (*.txt) do type "%%a" >>"Compiled.trigger"

::fart Compiled.trigger "Original Text" "New Text"
