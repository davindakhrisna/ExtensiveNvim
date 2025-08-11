return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
___                        ___                       ___
 ,u$$$$$$Ii:.               ,u$$$$$$Ii:.              ,u$$$$$$Ii:.
 ,$$$SS$$S$SSIi:.           ,$$$SS$$S$SSIi:.          ,$$$SS$$S$SSIi:.
 j$7`"^`$$$`'"`?ii.         j$7`"^`$$$`'"`?ii.        j$7`"^`$$$`'"`?ii.
 .i7     d`k     `Si.       .i7     d`k     `Si.      .i7     d`k     `Si.
 :?.  _,J' `L,._  Si:       :?.  _,J' `L,._  Si:      :?.  _,J' `L,._  Si:
 dj$$$7i$S$S$Iii$$i:;       dj$$$7i$S$S$Iii$$i:;      dj$$$7i$S$S$Iii$$i:;
.?"` `$:*`'^":?`^'"".      .?"` `$:*`'^":?`^'"".     .?"` `$:*`'^":?`^'"".
 L j  ?`     .\  i  :       L j  ?`     .\  i  :      L j  ?`     .\  i  :
 ? $  "       "  S  ?       ? $  "       "  S  ?      ? $  "       "  S  ?
 `:$i            $ .'       `:$i            $ .'      `:$i            $ .'
  ?$/,       .\jI '          ?$/,       .\jI '         ?$/,       .\jI '
 i$k,_:|i[.\,J?:            i$k,_:|i[.\,J?:           i$k,_:|i[.\,J?:
 `4ISS$$$$SIi:;'            `4ISS$$$$SIi:;'           `4ISS$$$$SIi:;'
 `4S$$$$$SI:"               `4S$$$$$SI:"              `4S$$$$$SI:"
   ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
      opts.theme = "doom"
    end,
  },
}
