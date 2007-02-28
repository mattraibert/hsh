import HSH
import Text.Printf
import System.Log.Logger
import System.Log.Handler.Syslog

main = 
 do s <- openlog "test" [PID] USER DEBUG
    updateGlobalLogger rootLoggerName (addHandler s . setLevel DEBUG)
    --run $ ("ls", ["-l"]) -|-  countLines -|- ("grep", ["hs$"])
    --run $ (id::(String -> String)) -|- ("wc", ["-l"]) -|- countLines -|- ("grep", ["1"])
    run $ countLines -|- countLines
    --run $ ("ls", ["-l"]) -|- ("wc", ["-l"])

countLines :: [String] -> [String]
countLines = zipWith (\i line -> printf "%-5d %s" i line) [(1::Int)..]

:m HSH HSH.ShellEquivs System.Log.Logger
updateGlobalLogger rootLoggerName (setLevel DEBUG)
runS $ "ls -l" -|- wcL
