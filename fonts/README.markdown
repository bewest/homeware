
# Try a bunch of fonts.

[![solarized font test](https://github.com/bewest/homeware/raw/master/fonts/font-test-2012-09-22.png)](#fonts)\

# Fonts

`TL;DR` They all have problems.  `5` vs `S` seems best in andiva.  I
prefer inconsolata's `0` with the slash, but I hate the comma and
single quote glyphs.  I like Monospace, but the five versus S seems
worst here somehow.

* `asterisk` should be centered
* `iI1liIl1!` should be disctinct, especially `1l`
* `6` and `9`, `5` and `S`, `3` and `8` should be disctinct.
* curly brackets `{ like these }` should be large and match other
  brackets: `({[<^>]})`
* dashes should be nice and long, but not too thick, and not quite
  touching.
* single quotes `'` should be vertical and squarish
* commas `,` should look distinct from both single quotes `'` and
  ticks and periods `.`.
* mono-spaced of course, so that columns line up nicely.

Here's a quick test:
```
Font test: O0oO0Oo0O 0123456789 A453EJI1l db qp $%*&
({[<##l^@1'>]}) AOK 123.456.789.0 ---- ,,, ||.1il1Iil1jJ dbdbcqdb,pqqgpqp
({[<1l**XXX>]}) N0T l2E,AS6.736.O ---- ''' ||1il1Iil1jJ dbdbcqdb.pqqgpqp,
```

## solarized dejavu

[![dejavu-16](https://github.com/bewest/homeware/raw/master/fonts/font-dejavu-16.png)](#solarized dejavu)

```
WM_CLASS(STRING) = "xterm", "SolarBlue"
WM_COMMAND(STRING) = { "/usr/bin/xterm", "-class", "SolarBlue", "-fa", "dejavu-16" }
```

Nice to read generally.  `1` and `l` are not terrible.  Asterisk is
not centered, and dash is quite short.

## solarized Monospace

[![monospace-16](https://github.com/bewest/homeware/raw/master/fonts/font-monospace-16.png)](#solarized Monospace)

```
WM_CLASS(STRING) = "xterm", "SolarBlue"
WM_COMMAND(STRING) = { "/usr/bin/xterm", "-class", "SolarBlue", "-fa", "Monospace", "-fs", "16" }
```

I like this comma the best.  Dislike `5` vs `S` most here.  The dashes
are a little too short here, IMO.  Also dislike the asterisk.

## solarized andiva

[![andiva-16](https://github.com/bewest/homeware/raw/master/fonts/font-andiva-16.png)](#solarized andiva)

```
WM_CLASS(STRING) = "xterm", "SolarBlue"
WM_COMMAND(STRING) = { "/usr/bin/xterm", "-class", "SolarBlue", "-fa", "andiva-16" }
```
Also dislike the asterisk.  This one kind of pops in a desirable way,
if only the asterisk was centered, and the zero had a slash, I'd be
happy.  The dashes should be a bit longer and thinner too.

## solarized Inconsolata

[![inconsolata-16](https://github.com/bewest/homeware/raw/master/fonts/font-inconsolata-16.png)](#solarized Inconsolata)

```
WM_CLASS(STRING) = "xterm", "SolarBlue"
WM_COMMAND(STRING) = { "/usr/bin/xterm", "-class", "SolarBlue", "-fa", "Inconsolata", "-fs", "16" }
```
A little lighter than the other fonts, allowing slightly more display
of text.  Love the `asterisk` character.
I like the `J`, but am not sure how I feel about the `g`.  I love the
`asterisk` and the `zero`, but hate the `comma` and `single quote`.
It's very difficult to make out `1` vs `l` in this font.

