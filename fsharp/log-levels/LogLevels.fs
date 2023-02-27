module LogLevels

let message (logLine: string): string = 
    let breakpoint = logLine.IndexOf(":") + 1
    logLine[breakpoint..].Trim()
  
let logLevel(logLine: string): string = 
    let breakpoint = logLine.IndexOf(":") - 1
    logLine[..breakpoint].TrimStart('[').TrimEnd(']').ToLower()

let reformat(logLine: string): string = 
    message logLine + " (" + logLevel logLine + ")"