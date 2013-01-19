# I Like Turtles

This repo is for [ComputerCraft](http://www.computercraft.info/) scripts, mainly for those wanting to
automate activities with the highly-useful turtles. They will contain
scripts found online or authored by people here. Credit will be given
where needed, and all licenses will be followed properly.

The goal here is to have a central place for useful scripts. Enjoy!

## Getting Started

To get started, you will need the downloader script, iliketurtles.lua,
on your turtle, computer, floppy, etc. Since you can't just copy and
paste code into a ComputerCraft device without it screwing up
formatting, you can either type it by hand (ugh), or type a shorter bit
of code to download the downloader.

Open your turtle, and get to a lua prompt like this:

    lua

Next you will download the downloader script:

    r = http.get("https://raw.github.com/bratta/iliketurtles/master/iliketurtles.lua").readAll()
    f = fs.open("iliketurtles", "w")
    f.write(r)
    f.close()

Exit lua:

    exit()

Now you can use the iliketurtles script to download other scripts in
this repository. For example, to download the flatarea.lua script, type this
in on your turtle:

    iliketurtles flatarea

Then you're done!
    
