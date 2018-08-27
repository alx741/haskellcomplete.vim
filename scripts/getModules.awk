BEGIN { reachedModules = 0; }
// { if (reachedModules) print $0; }
/Modules:/ { reachedModules = 1; }
