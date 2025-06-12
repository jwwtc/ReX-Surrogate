run("8-bit");

setAutoThreshold("Default no-reset");
setThreshold(70, 140, "raw");

setOption("BlackBackground", false);

run("Convert to Mask");
